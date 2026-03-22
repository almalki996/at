"use client";

import React, { Suspense } from "react";
import { Refine } from "@refinedev/core";
import routerProvider from "@refinedev/nextjs-router";
import { directusDataProvider } from "./data-provider";
import { notificationProvider } from "./notification-provider";
import { authProvider } from "./auth-provider";
import { AppLayout } from "@/components/layout";

export function RefineProvider({ children }: { children: React.ReactNode }) {
  return (
    <Suspense fallback={<div className="p-4">Loading application...</div>}>
      <Refine
        routerProvider={routerProvider}
        dataProvider={directusDataProvider}
        notificationProvider={notificationProvider}
        authProvider={authProvider}
        resources={[
          {
              name: "system_settings",
              meta: { label: "إعدادات النظام", icon: "Settings" }
          },
          {
            name: "site_settings",
            list: "/system-settings/settings",
            meta: {
                label: "الإعدادات العامة",
                parent: "system_settings",
                icon: "MonitorCog"
            }
          },
          {
            name: "menu_items", 
            list: "/system-settings/menu-builder",
            meta: {
                label: "بناء القائمة",
                parent: "system_settings",
                icon: "ListTree"
            }
          },
          {
            name: "Employees", 
            list: "/employees",
            meta: {
                label: "المسميات الوظيفية",
                icon: "Briefcase",
                hide: true
            }
          },
          {
            name: "Departments", 
            list: "/departments",
            meta: {
                label: "بناء الوظائف",
                icon: "Layers",
                hide: true
            }
          },
          {
            name: "Personnel",
            list: "/personnel",
            meta: { hide: true }
          },
          {
            name: "Employee_Qualifications",
            meta: { hide: true }
          },
          {
            name: "Employee_Assignments",
            meta: { hide: true }
          },
          /* Removed Categories and Jobs per User request */
        ]}
        options={{
          syncWithLocation: true,
          warnWhenUnsavedChanges: true,
        }}
      >
        <AppLayout>{children}</AppLayout>
      </Refine>
    </Suspense>
  );
}
