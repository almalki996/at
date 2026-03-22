"use client";

import React from "react";
import { Sidebar } from "./sidebar";
import { Header } from "./header";

import { usePathname } from "next/navigation";
import { Authenticated } from "@refinedev/core";

export const AppLayout = ({ children }: { children: React.ReactNode }) => {
    const pathname = usePathname();

    if (pathname === '/login') {
        return (
            <Authenticated key="login" fallback={<>{children}</>}>
                {/* If already authenticated and trying to access login, redirect them away */}
                <div className="h-screen flex items-center justify-center">جاري التوجيه...</div>
            </Authenticated>
        );
    }

    return (
        <Authenticated key="protected">
            <div className="flex min-h-screen flex-row bg-gray-50 dark:bg-slate-950 transition-colors duration-300">
                <Sidebar />
                <div className="flex-1 flex flex-col min-w-0">
                    <Header />
                    <main className="flex-1 p-4 md:p-6 lg:p-8 overflow-auto">
                        {children}
                    </main>
                </div>
            </div>
        </Authenticated>
    );
};
