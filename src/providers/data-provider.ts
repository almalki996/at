import dataProvider from "@refinedev/simple-rest";
import axios from "axios";

const API_URL = process.env.NEXT_PUBLIC_DIRECTUS_URL || "http://localhost:8055/items";

export const axiosInstance = axios.create();

axiosInstance.interceptors.request.use((config) => {
    const token = typeof window !== "undefined" ? localStorage.getItem("directus_token") : null;
    const finalToken = token || process.env.NEXT_PUBLIC_DIRECTUS_TOKEN;
    
    if (finalToken && config.headers) {
        config.headers.Authorization = `Bearer ${finalToken}`;
    }
    
    // Auto-append wildcard relational fields for all GET queries to Directus, 
    // ensuring Refine tables receive populated objects (e.g. employee names) instead of raw IDs
    if (config.method === 'get' && config.url && !config.url.includes('/auth/')) {
        config.params = config.params || {};
        if (!config.params.fields) {
            config.params.fields = '*.*.*,*'; // Directus syntax: Fetch all root fields and up to 2nd-level relational data
        }
    }
    
    return config;
});

let isRefreshing = false;
let failedQueue: any[] = [];

const processQueue = (error: any, token: string | null = null) => {
    failedQueue.forEach(prom => {
        if (error) {
            prom.reject(error);
        } else {
            prom.resolve(token);
        }
    });
    failedQueue = [];
};

axiosInstance.interceptors.response.use(
  (response) => {
    if (response.data && response.data.data !== undefined) {
      return { 
          ...response, 
          data: response.data.data 
      };
    }
    return response;
  },
  async (error) => {
    const originalRequest = error.config;
    
    if (error.response?.status === 401 && !originalRequest._retry) {
      if (isRefreshing) {
          // If a refresh is already in progress, queue this request
          return new Promise((resolve, reject) => {
              failedQueue.push({ resolve, reject });
          }).then(token => {
              originalRequest.headers["Authorization"] = `Bearer ${token}`;
              return axiosInstance(originalRequest);
          }).catch(err => {
              return Promise.reject(err);
          });
      }

      originalRequest._retry = true;
      isRefreshing = true;
      
      try {
        const refreshToken = typeof window !== "undefined" ? localStorage.getItem("refresh_token") : null;
        if (refreshToken) {
          const baseUrl = API_URL.replace(/\/items\/?$/, '').replace(/\/$/, '');
          const res = await axios.post(`${baseUrl}/auth/refresh`, { refresh_token: refreshToken, mode: 'json' });
          
          if (res.data?.data?.access_token) {
            const newAuthToken = res.data.data.access_token;
            if (typeof window !== "undefined") {
               localStorage.setItem("directus_token", newAuthToken);
               if (res.data.data.refresh_token) {
                   localStorage.setItem("refresh_token", res.data.data.refresh_token);
               }
            }
            axiosInstance.defaults.headers.common["Authorization"] = `Bearer ${newAuthToken}`;
            originalRequest.headers["Authorization"] = `Bearer ${newAuthToken}`;
            processQueue(null, newAuthToken);
            isRefreshing = false;
            return axiosInstance(originalRequest);
          }
        }
        
        // If no refresh token or no access token returned
        processQueue(new Error("No token"), null);
        isRefreshing = false;
        if (typeof window !== "undefined") {
            localStorage.removeItem("directus_token");
            localStorage.removeItem("refresh_token");
            window.location.href = "/login";
        }
        return Promise.reject(error);
        
      } catch (refreshError) {
        processQueue(refreshError, null);
        isRefreshing = false;
        
        // Force instant logout to prevent infinite React Query retries hanging the browser
        if (typeof window !== "undefined") {
            localStorage.removeItem("directus_token");
            localStorage.removeItem("refresh_token");
            window.location.href = "/login";
        }
        return Promise.reject(error);
      }
    }
    return Promise.reject(error);
  }
);

const baseProvider = dataProvider(API_URL, axiosInstance);

export const directusDataProvider = {
    ...baseProvider,
    deleteMany: async ({ resource, ids, variables, meta }: any) => {
        const response = await axiosInstance.delete(`/${resource}`, {
            baseURL: API_URL,
            data: ids
        });
        return { data: response.data?.data || [] };
    }
};
