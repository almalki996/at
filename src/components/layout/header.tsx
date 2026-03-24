"use client";

import React, { useState, useEffect } from "react";
import axios from "axios";
import { CalendarDays, Clock, ArrowLeftRight, Sun, Moon, Menu } from "lucide-react";
import { useTheme } from "next-themes";

export const Header = ({ setMobileSidebarOpen }: { setMobileSidebarOpen: React.Dispatch<React.SetStateAction<boolean>> }) => {
    const [siteSettings, setSiteSettings] = useState<{site_name?: string, site_description?: string, logo?: string}>({});
    const [time, setTime] = useState<Date>(new Date());
    const [isHijri, setIsHijri] = useState<boolean>(true);
    const { theme, setTheme } = useTheme();
    const [mounted, setMounted] = useState(false);

    useEffect(() => {
        // eslint-disable-next-line react-hooks/set-state-in-effect
        setMounted(true);
    }, []);

    useEffect(() => {
        const fetchSettings = async () => {
            try {
                const u = (process.env.NEXT_PUBLIC_DIRECTUS_URL || "http://127.0.0.1:8055").replace(/\/items\/?$/, '').replace(/\/$/, '');
                const token = typeof window !== "undefined" ? localStorage.getItem("directus_token") : null;
                const res = await axios.get(`${u}/items/site_settings`, {
                    headers: token ? { Authorization: `Bearer ${token}` } : {}
                });
                if (res.data?.data) {
                    setSiteSettings(res.data.data);
                }
            } catch (err) {
                console.error("Header couldn't load settings:", err);
            }
        };
        fetchSettings();
    }, []);

    useEffect(() => {
        const timer = setInterval(() => setTime(new Date()), 1000);
        return () => clearInterval(timer);
    }, []);

    const baseUrlStr = (process.env.NEXT_PUBLIC_DIRECTUS_URL || "http://127.0.0.1:8055").replace(/\/items\/?$/, '').replace(/\/$/, '');
    const token = typeof window !== "undefined" ? localStorage.getItem("directus_token") : null;

    const formattedTime = time.toLocaleTimeString("ar-SA", { hour: '2-digit', minute: '2-digit', second: '2-digit' });
    const formattedDate = new Intl.DateTimeFormat(isHijri ? "ar-SA-u-ca-islamic" : "ar-SA", { 
        weekday: 'long', 
        year: 'numeric', 
        month: 'long', 
        day: 'numeric' 
    }).format(time);

    return (
        <header className="bg-white/80 dark:bg-slate-900/80 backdrop-blur-md border-b border-gray-200 dark:border-slate-800 shadow-sm h-20 px-6 flex items-center justify-between sticky top-0 z-10 shrink-0 transition-colors duration-300">
            {/* Branding Container */}
            <div className="flex items-center gap-4">
                <button 
                    onClick={() => setMobileSidebarOpen(true)}
                    className="lg:hidden flex items-center justify-center w-11 h-11 text-gray-500 hover:text-indigo-600 dark:text-gray-400 dark:hover:text-indigo-400 rounded-xl bg-gray-50 dark:bg-slate-800 border border-gray-200 dark:border-slate-700 transition-colors shadow-sm"
                    title="فتح القائمة الجانبية"
                >
                    <Menu size={22} />
                </button>
                <div className="flex flex-col">
                    {siteSettings.site_name && (
                        <h1 className="text-[19px] font-black text-indigo-900 dark:text-indigo-100 tracking-tight">{siteSettings.site_name}</h1>
                    )}
                    {siteSettings.site_description && (
                        <span className="hidden sm:inline text-xs text-indigo-500 dark:text-indigo-400 font-bold opacity-80 mt-0.5">{siteSettings.site_description}</span>
                    )}
                </div>
            </div>

            {/* Live Clock & Theme Toggles widget */}
            <div className="flex items-center gap-3 sm:gap-6">
                <div className="hidden lg:flex items-center gap-5 bg-indigo-50/60 dark:bg-slate-800/50 border border-indigo-100/50 dark:border-slate-700/50 px-5 py-2.5 rounded-2xl shadow-inner transition-colors duration-300">
                    <div className="flex items-center gap-2 text-indigo-700/80 dark:text-indigo-300/80 font-bold text-[13px]">
                        <Clock size={16} className="text-indigo-400 dark:text-indigo-500" />
                        <span className="w-16 tracking-widest text-center" dir="ltr" suppressHydrationWarning>{mounted ? formattedTime : "--:--:--"}</span>
                    </div>
                    <div className="w-px h-5 bg-indigo-200/60 dark:bg-slate-600/60"></div>
                    <div className="flex items-center gap-2 text-indigo-700 dark:text-indigo-200 font-extrabold text-sm">
                        <CalendarDays size={16} className="text-indigo-400 dark:text-indigo-400" />
                        <span suppressHydrationWarning>{mounted ? formattedDate : "..."}</span>
                    </div>
                </div>

                <div className="flex items-center gap-2">
                    {mounted && (
                        <button 
                            onClick={() => setTheme(theme === 'dark' ? 'light' : 'dark')}
                            className="flex items-center justify-center bg-white dark:bg-slate-800 border-2 border-gray-100 dark:border-slate-700 text-gray-500 dark:text-amber-400 w-11 h-11 rounded-xl hover:bg-gray-50 dark:hover:bg-slate-700 transition-all shadow-sm"
                            title={theme === 'dark' ? "تفعيل الوضع الفاتح" : "تفعيل الوضع الليلي"}
                        >
                            {theme === 'dark' ? <Sun size={18} /> : <Moon size={18} />}
                        </button>
                    )}

                    <button 
                        onClick={() => setIsHijri(!isHijri)}
                        className="flex items-center justify-center gap-2 sm:gap-2.5 bg-white dark:bg-slate-800 border-2 border-indigo-100 dark:border-indigo-900/50 text-indigo-700 dark:text-indigo-300 px-3 sm:px-4 py-2 sm:py-2.5 rounded-xl hover:bg-indigo-600 dark:hover:bg-indigo-500 hover:text-white dark:hover:text-white hover:border-indigo-600 dark:hover:border-indigo-500 hover:shadow-lg hover:shadow-indigo-600/20 transition-all font-bold text-sm h-11"
                        title="التبديل بين الهجري والميلادي"
                    >
                        <ArrowLeftRight size={15} />
                        <span className="hidden sm:inline">{isHijri ? "إلى الميلادي" : "إلى الهجري"}</span>
                    </button>
                </div>
            </div>
        </header>
    );
};
