"use client";

import axios from "axios";

const getBaseUrl = () => {
    return (process.env.NEXT_PUBLIC_DIRECTUS_URL || "http://127.0.0.1:8055").replace(/\/items\/?$/, '').replace(/\/$/, '');
};

export const authProvider = {
  login: async ({ email, password }: { email?: string; password?: string }) => {
    try {
      const url = `${getBaseUrl()}/auth/login`;
      const response = await axios.post(url, { email, password });
      
      const { access_token, refresh_token } = response.data.data;
      
      if (access_token) {
        localStorage.setItem("directus_token", access_token);
        if (refresh_token) {
            localStorage.setItem("refresh_token", refresh_token);
        }
        
        return {
          success: true,
          redirectTo: "/dashboard",
        };
      }
      return {
        success: false,
        error: { name: "Login Error", message: "No token returned" },
      };
    } catch (error: any) {
      return {
        success: false,
        error: {
          name: "خطأ في تسجيل الدخول",
          message: error.response?.data?.errors?.[0]?.message || "البريد الإلكتروني أو كلمة المرور غير صحيحة",
        },
      };
    }
  },
  logout: async () => {
    localStorage.removeItem("directus_token");
    localStorage.removeItem("refresh_token");
    return {
      success: true,
      redirectTo: "/login",
    };
  },
  check: async () => {
    const token = typeof window !== "undefined" ? localStorage.getItem("directus_token") : null;
    const staticToken = process.env.NEXT_PUBLIC_DIRECTUS_TOKEN;
    
    // Allow pass-through if there is a token
    if (token) {
      return { authenticated: true };
    }
    
    // In dev mode, if no directus_token in localStorage but the env var is set, auto-login or pass
    // For security in production, you should demand actual login. 
    // Since we are setting up a real login, we reject if no local directus_token exists.
    return {
      authenticated: false,
      redirectTo: "/login",
      logout: true,
    };
  },
  getPermissions: async () => null,
  getIdentity: async () => {
    const token = typeof window !== "undefined" ? localStorage.getItem("directus_token") : process.env.NEXT_PUBLIC_DIRECTUS_TOKEN;
    if (token) {
      try {
        const url = `${getBaseUrl()}/users/me`;
        const res = await axios.get(url, {
          headers: { Authorization: `Bearer ${token}` }
        });
        return res.data.data;
      } catch (e) {
        return null;
      }
    }
    return null;
  },
  onError: async (error: any) => {
    if (error.response?.status === 401 || error.response?.status === 403) {
      return { logout: true };
    }
    return { error };
  },
};
