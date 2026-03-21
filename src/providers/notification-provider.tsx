"use client";

import React from "react";
import { NotificationProvider } from "@refinedev/core";
import toast from "react-hot-toast";
import { CheckCircle, XCircle, Info } from "lucide-react";

export const notificationProvider: NotificationProvider = {
    open: ({ message, description, type, key }) => {
        const toastConfig = {
            id: key,
            position: "bottom-left" as const,
            duration: 4000,
            className: "font-sans",
        };

        const content = (
            <div className="flex flex-col gap-1 text-right" dir="rtl">
                <span className="font-extrabold text-sm text-gray-900">{message}</span>
                {description && <span className="text-xs font-semibold text-gray-500">{description}</span>}
            </div>
        );

        if (type === "success") {
            toast.success(content, {
                ...toastConfig,
                icon: <CheckCircle className="text-emerald-500 shrink-0" size={24} />,
                style: {
                    background: "rgb(236 253 245)",
                    border: "1px solid rgb(167 243 208)",
                    color: "rgb(6 78 59)",
                    padding: "16px",
                    borderRadius: "16px",
                    boxShadow: "0 10px 25px -5px rgba(0, 0, 0, 0.1)",
                    minWidth: "300px",
                }
            });
        } else if (type === "error") {
            toast.error(content, {
                ...toastConfig,
                icon: <XCircle className="text-rose-500 shrink-0" size={24} />,
                style: {
                    background: "rgb(255 241 242)",
                    border: "1px solid rgb(254 205 211)",
                    color: "rgb(136 19 55)",
                    padding: "16px",
                    borderRadius: "16px",
                    boxShadow: "0 10px 25px -5px rgba(0, 0, 0, 0.1)",
                    minWidth: "300px",
                }
            });
        } else {
            toast(content, {
                ...toastConfig,
                icon: <Info className="text-blue-500 shrink-0" size={24} />,
                style: {
                    background: "rgb(239 246 255)",
                    border: "1px solid rgb(191 219 254)",
                    color: "rgb(30 58 138)",
                    padding: "16px",
                    borderRadius: "16px",
                    boxShadow: "0 10px 25px -5px rgba(0, 0, 0, 0.1)",
                    minWidth: "300px",
                }
            });
        }
    },
    close: (key) => {
        toast.dismiss(key);
    },
};
