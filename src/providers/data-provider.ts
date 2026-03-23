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
    return config;
});

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
  (error) => {
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
