"use client";

import { useState } from "react";
import DesignationsPage from "@/components/designations/designations-page";
import EmployeesPage from "@/components/employees/employees-page";
import { Briefcase, Users, Settings2, ShieldQuestion } from "lucide-react";

export default function JobsDirectoryPage() {
    const [activeTab, setActiveTab] = useState("designations");

    const tabs = [
        { id: "designations", label: "الكادر الوظيفي", icon: Users },
        { id: "job_types", label: "نوع الوظيفة", icon: Briefcase },
        { id: "job_axes", label: "المحور", icon: Settings2 },
        { id: "employees", label: "المسميات الوظيفية", icon: Briefcase }
    ];

    return (
        <div className="w-full h-[calc(100vh-5rem)] flex flex-col p-4 md:p-6 mx-auto overflow-hidden rtl">
            {/* Header / Tabs */}
            <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-800 p-2 mb-4 shrink-0 flex items-center gap-2 overflow-x-auto no-scrollbar">
                {tabs.map((tab) => {
                    const isActive = activeTab === tab.id;
                    const Icon = tab.icon;
                    return (
                        <button
                            key={tab.id}
                            onClick={() => setActiveTab(tab.id)}
                            className={`flex items-center gap-2 px-6 py-3 rounded-xl font-bold text-sm transition-all whitespace-nowrap outline-none cursor-pointer ${
                                isActive 
                                    ? 'bg-teal-50 text-teal-700 dark:bg-teal-900/40 dark:text-teal-400 shadow-sm' 
                                    : 'text-gray-600 hover:bg-gray-50 dark:text-slate-400 dark:hover:bg-slate-800/50'
                            }`}
                        >
                            <Icon size={18} className={isActive ? 'text-teal-600 dark:text-teal-400' : 'text-gray-400'} />
                            {tab.label}
                        </button>
                    );
                })}
            </div>

            {/* Content Area */}
            <div className="flex-1 flex flex-col overflow-hidden">
                {activeTab === "employees" ? (
                    <EmployeesPage isEmbed />
                ) : (
                    <DesignationsPage isEmbed defaultProperty={activeTab as any} key={activeTab} />
                )}
            </div>
        </div>
    );
}
