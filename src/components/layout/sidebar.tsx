"use client";

import React, { useMemo, useEffect, useState } from "react";
import { useMenu, useList, useLogout } from "@refinedev/core";
import Link from "next/link";
import { ChevronDown, ChevronLeft, Menu, LogOut, Loader2, PanelRightClose, PanelRightOpen, LayoutGrid } from "lucide-react";
import * as LucideIcons from "lucide-react";
import { usePathname } from "next/navigation";
import axios from "axios";

const IconComponent = ({ name, size = 18 }: { name?: string, size?: number }) => {
    if (!name || typeof name !== 'string') return null;
    const Icon = (LucideIcons as any)[name];
    if (!Icon) return <LayoutGrid size={size} />;
    return <Icon size={size} />;
};

const RecursiveMenuItem = ({ item, level, pathname, isCollapsed }: { item: any; level: number; pathname: string; isCollapsed?: boolean }) => {
    const isSelected = item.route === pathname;
    const [isOpen, setIsOpen] = React.useState(isSelected || level === 0);
    const hasChildren = item.children && item.children.length > 0;
    const iconName = item.icon || item.meta?.icon;

    return (
        <li className="flex flex-col">
            <div 
                className={`flex items-center px-4 py-2 hover:bg-indigo-50 dark:hover:bg-slate-800/80 cursor-pointer transition-colors ${isSelected ? 'bg-indigo-100/80 dark:bg-indigo-500/20 text-indigo-700 dark:text-indigo-300 font-bold border-r-4 border-indigo-600 dark:border-indigo-400' : 'text-gray-700 dark:text-gray-300 border-r-4 border-transparent'} ${level > 0 ? "text-sm text-gray-600 dark:text-gray-400" : "text-[15px] font-semibold"} ${isCollapsed ? 'justify-center border-none' : 'justify-between'}`}
                style={{ paddingRight: isCollapsed ? '0' : `${(level + 1) * 1.25}rem` }}
                title={isCollapsed ? item.label : undefined}
                onClick={(e) => {
                    if (isCollapsed && hasChildren) {
                        setIsOpen(!isOpen);
                    }
                }}
            >
                {item.route ? (
                    <Link href={item.route} className={`flex items-center gap-3 ${isCollapsed ? 'justify-center w-full' : 'flex-1'} overflow-hidden relative`}>
                        {iconName && <div className="shrink-0"><IconComponent name={iconName} size={isCollapsed ? 22 : 18} /></div>}
                        {!isCollapsed && <span className="flex-1 truncate block w-full">{item.label}</span>}
                        {isCollapsed && hasChildren && !isOpen && (
                            <div className="absolute top-0 right-0 w-1.5 h-1.5 bg-indigo-500 rounded-full"></div>
                        )}
                    </Link>
                ) : (
                    <div onClick={() => setIsOpen(!isOpen)} className={`flex items-center gap-3 ${isCollapsed ? 'justify-center w-full' : 'flex-1'} overflow-hidden relative`}>
                        {iconName && <div className="shrink-0"><IconComponent name={iconName} size={isCollapsed ? 22 : 18} /></div>}
                        {!isCollapsed && <span className="flex-1 select-none truncate block w-full">{item.label}</span>}
                        {isCollapsed && hasChildren && !isOpen && (
                            <div className="absolute top-0 right-0 w-1.5 h-1.5 bg-indigo-500 rounded-full"></div>
                        )}
                    </div>
                )}
                {!isCollapsed && hasChildren && (
                    <button onClick={(e) => { e.stopPropagation(); setIsOpen(!isOpen); }} className="text-gray-400 hover:text-gray-600 focus:outline-none shrink-0">
                        {isOpen ? <ChevronDown size={16} /> : <ChevronLeft size={16} />}
                    </button>
                )}
            </div>

            {hasChildren && isOpen && (
                <ul className={`flex flex-col ${isCollapsed ? 'bg-gray-50/50 dark:bg-slate-900/50 py-1' : ''}`}>
                    {item.children?.map((child: any) => (
                        <RecursiveMenuItem key={child.key || child.id} item={child} level={level + 1} pathname={pathname} isCollapsed={isCollapsed} />
                    ))}
                </ul>
            )}
        </li>
    );
};

export const Sidebar = () => {
    const pathname = usePathname() || "";
    const [isCollapsed, setIsCollapsed] = useState(false);

    useEffect(() => {
        const handleResize = () => {
            if (window.innerWidth < 1024) {
                setIsCollapsed(true);
            }
        };
        handleResize();
        window.addEventListener('resize', handleResize);
        return () => window.removeEventListener('resize', handleResize);
    }, []);

    const { query } = useList({
        resource: "menu_items",
        pagination: { current: 1, pageSize: 100 } as any,
        sorters: [{ field: "sort_order", order: "asc" }] as any
    });

    const isLoading = query?.isLoading;
    const menuItemsData = query?.data;
    const { mutate: logout } = useLogout();

    const [siteSettings, setSiteSettings] = useState<{site_name?: string, logo?: string}>({});

    useEffect(() => {
        const fetchSettings = async () => {
            try {
                const u = (process.env.NEXT_PUBLIC_DIRECTUS_URL || "http://127.0.0.1:8055").replace(/\/items\/?$/, '').replace(/\/$/, '');
                const token = process.env.NEXT_PUBLIC_DIRECTUS_TOKEN;
                const res = await axios.get(`${u}/items/site_settings`, {
                    headers: token ? { Authorization: `Bearer ${token}` } : {}
                });
                if (res.data?.data) {
                    setSiteSettings(res.data.data);
                }
            } catch (err) {
                console.error("Sidebar couldn't load settings:", err);
            }
        };
        fetchSettings();
    }, []);

    const { menuItems: refineMenuItems } = useMenu();

    const dynamicTree = useMemo(() => {
        if (!menuItemsData || !Array.isArray(menuItemsData.data)) return [];
        const items = menuItemsData.data;

        const map = new Map();
        items.forEach((item: any) => {
            map.set(String(item.id), {
                key: `dynamic-${item.id}`,
                label: item.title,
                route: item.url_path,
                sort_order: item.sort_order || 0,
                icon: item.icon,
                children: []
            });
        });

        const tree: any[] = [];
        items.forEach((item: any) => {
            const node = map.get(String(item.id));
            const pId = typeof item.parent_id === 'object' && item.parent_id !== null ? String(item.parent_id?.id) : item.parent_id ? String(item.parent_id) : null;
            
            if (pId && map.has(pId)) {
                map.get(pId).children.push(node);
            } else {
                tree.push(node);
            }
        });

        map.forEach(node => {
            if (node.children.length > 0) {
                node.children.sort((a: any, b: any) => Number(a.sort_order) - Number(b.sort_order));
            }
        });
        tree.sort((a, b) => Number(a.sort_order) - Number(b.sort_order));
        
        return tree;
    }, [menuItemsData]);

    const baseUrlStr = (process.env.NEXT_PUBLIC_DIRECTUS_URL || "http://127.0.0.1:8055").replace(/\/items\/?$/, '').replace(/\/$/, '');

    return (
        <aside className={`bg-white dark:bg-slate-900 border-l border-gray-200 dark:border-slate-800 h-screen flex flex-col sticky top-0 overflow-y-auto shrink-0 shadow-sm z-20 transition-all duration-300 ${isCollapsed ? 'w-16 sm:w-[75px]' : 'w-64'}`}>
            <div className={`pt-6 pb-4 flex flex-col items-center justify-center border-b border-gray-100 dark:border-slate-800 bg-gray-50/30 dark:bg-slate-900/50 gap-4 relative min-h-[90px] transition-colors duration-300`}>
                <button 
                    onClick={() => setIsCollapsed(!isCollapsed)} 
                    className="absolute top-2 left-2 p-1.5 text-gray-400 dark:text-gray-500 hover:text-indigo-600 dark:hover:text-amber-400 hover:bg-indigo-100 dark:hover:bg-slate-800 rounded-lg transition-colors z-10"
                    title={isCollapsed ? "توسيع القائمة" : "طي القائمة"}
                >
                    {isCollapsed ? <PanelRightOpen size={18} /> : <PanelRightClose size={18} />}
                </button>
                
                {siteSettings.logo ? (
                    <img 
                        src={`${baseUrlStr}/assets/${siteSettings.logo}?access_token=${process.env.NEXT_PUBLIC_DIRECTUS_TOKEN}`} 
                        alt="Site Logo" 
                        className={`object-contain transition-all duration-300 ${isCollapsed ? 'w-8 h-8 sm:w-10 sm:h-10 drop-shadow-sm rounded-lg mt-2' : 'w-4/5 max-w-[150px] max-h-[100px] drop-shadow-md rounded-2xl'}`} 
                    />
                ) : (
                    <div className={`bg-indigo-50 dark:bg-slate-800 border border-indigo-100 dark:border-slate-700 flex items-center justify-center shadow-inner transition-all duration-300 ${isCollapsed ? 'w-8 h-8 sm:w-10 sm:h-10 rounded-xl mt-2' : 'w-24 h-24 rounded-2xl'}`}>
                        <Menu className="text-indigo-400 dark:text-indigo-500" size={isCollapsed ? 20 : 40} />
                    </div>
                )}
            </div>

            <nav className="flex-1 py-4 overflow-x-hidden">
                <ul className="flex flex-col gap-1 w-full">
                    {isLoading ? (
                        <div className="px-6 py-4 text-sm text-gray-400 text-center">جاري التحميل...</div>
                    ) : dynamicTree.length === 0 ? (
                        <div className="px-6 py-4 text-sm text-gray-300 font-medium text-center">لا توجد عناصر بعد.</div>
                    ) : (
                        dynamicTree.map((item) => (
                            <RecursiveMenuItem key={item.key} item={item} level={0} pathname={pathname} isCollapsed={isCollapsed} />
                        ))
                    )}
                    
                    <div className="my-3 mx-4 border-t border-gray-100"></div>

                    {refineMenuItems.map((item) => (
                        <RecursiveMenuItem key={item.key} item={item} level={0} pathname={pathname} isCollapsed={isCollapsed} />
                    ))}
                </ul>
            </nav>

            <div className="p-4 border-t border-gray-100 dark:border-slate-800 bg-gray-50/50 dark:bg-slate-900/50 transition-colors duration-300">
                <button 
                    onClick={() => logout()}
                    className={`flex items-center ${isCollapsed ? 'justify-center border border-gray-200 dark:border-slate-700' : 'gap-3 px-4 border border-transparent hover:border-red-100 dark:hover:border-red-900/50'} w-full py-2.5 hover:bg-red-50 dark:hover:bg-red-950/30 text-red-600 dark:text-red-400 rounded-xl transition-colors font-bold shadow-sm`}
                    title="تسجيل الخروج"
                >
                    <LogOut size={20} className="shrink-0" /> {!isCollapsed && "تسجيل الخروج"}
                </button>
            </div>
        </aside>
    );
};
