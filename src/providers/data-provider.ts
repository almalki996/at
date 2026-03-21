import dataProvider from "@refinedev/simple-rest";
import axios from "axios";

const API_URL = process.env.NEXT_PUBLIC_DIRECTUS_URL || "http://localhost:8055/items";

const axiosInstance = axios.create({
    headers: {
        Authorization: `Bearer ${process.env.NEXT_PUBLIC_DIRECTUS_TOKEN}`
    }
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
