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

export const directusDataProvider = dataProvider(API_URL, axiosInstance);
