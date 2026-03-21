"use client";

import React from "react";
import { SortableTree, MenuItemData } from "@/components/menu-builder/sortable-tree";
import { useList } from "@refinedev/core";
import { Plus, Maximize, Minimize, Settings2 } from "lucide-react";
import { MenuFormModal } from "@/components/menu-builder/menu-form-modal";

export default function MenuBuilderPage() {
    const { query } = useList({
        resource: "menu_items",
        pagination: { current: 1, pageSize: 100 } as any,
        sorters: [{ field: "sort_order", order: "asc" }] as any
    });
    
    const items = (query?.data?.data as MenuItemData[]) || [];
    const isLoading = query?.isLoading;
    const refetch = query?.refetch;

    const [isExpandedAll, setIsExpandedAll] = React.useState(true);
    const [modalState, setModalState] = React.useState<{ isOpen: boolean; editId?: string | number; parentId?: string | number }>({ isOpen: false });

    const openCreateModal = (parentId?: string | number) => setModalState({ isOpen: true, parentId });
    const openEditModal = (editId: string | number) => setModalState({ isOpen: true, editId });
    const closeModal = () => setModalState({ isOpen: false });

    return (
        <div className="w-full h-full">
            <div className="bg-white dark:bg-slate-900 rounded-3xl shadow-sm border border-gray-100 dark:border-slate-800 overflow-hidden transition-colors duration-300">
                <div className="bg-gradient-to-l from-indigo-50/50 dark:from-indigo-950/20 to-white dark:to-slate-900 px-8 py-8 border-b border-gray-100 dark:border-slate-800">
                    <div className="flex flex-col md:flex-row md:justify-between md:items-center gap-6">
                        <div className="flex items-center gap-5">
                            <div className="w-16 h-16 bg-gradient-to-br from-indigo-500 to-indigo-700 rounded-2xl flex items-center justify-center shadow-lg shadow-indigo-600/30 text-white">
                                <Settings2 size={32} />
                            </div>
                            <div>
                                <h1 className="text-3xl font-black text-gray-900 dark:text-white tracking-tight">هيكلة القائمة</h1>
                                <p className="text-gray-500 dark:text-slate-400 mt-1 sm:mt-2 text-sm max-w-lg leading-relaxed font-semibold">سحب وإفلات لترتيب القوائم وبناء شجرة متداخلة لتسهيل تصفح النظام على المستخدمين وإدارة الروابط.</p>
                            </div>
                        </div>
                        <div className="flex flex-wrap gap-3">
                            <button 
                                onClick={() => setIsExpandedAll(true)}
                                className="flex items-center gap-2 px-4 py-2.5 bg-white dark:bg-slate-800 border border-gray-200 dark:border-slate-700 text-gray-700 dark:text-gray-300 font-bold rounded-xl hover:bg-gray-50 dark:hover:bg-slate-700 hover:border-gray-300 transition-all shadow-sm text-sm"
                            >
                                <Maximize size={16} className="text-indigo-500 dark:text-indigo-400" /> فتح الكل
                            </button>
                            <button 
                                onClick={() => setIsExpandedAll(false)}
                                className="flex items-center gap-2 px-4 py-2.5 bg-white dark:bg-slate-800 border border-gray-200 dark:border-slate-700 text-gray-700 dark:text-gray-300 font-bold rounded-xl hover:bg-gray-50 dark:hover:bg-slate-700 hover:border-gray-300 transition-all shadow-sm text-sm"
                            >
                                <Minimize size={16} className="text-gray-400 dark:text-gray-500" /> طي الكل
                            </button>
                            <button 
                                onClick={() => openCreateModal()}
                                className="flex items-center gap-2 px-5 py-2.5 bg-indigo-600 text-white font-bold rounded-xl hover:bg-indigo-700 hover:shadow-lg hover:shadow-indigo-600/20 transition-all shadow-sm text-sm"
                            >
                                <Plus size={18} /> عنصر رئيسي جديد
                            </button>
                        </div>
                    </div>
                </div>

                <div className="p-8 bg-gray-50/30 dark:bg-slate-900/50 min-h-[400px]">
                    {isLoading ? (
                        <div className="flex flex-col items-center justify-center py-20 gap-4">
                            <div className="w-12 h-12 border-4 border-indigo-100 border-t-indigo-600 rounded-full animate-spin"></div>
                            <div className="text-gray-500 font-bold text-sm">جاري جلب القائمة...</div>
                        </div>
                    ) : (
                        <SortableTree 
                            items={items} 
                            isExpandedAll={isExpandedAll} 
                            onRefresh={refetch}
                            onEdit={openEditModal}
                            onCreateChild={openCreateModal}
                        />
                    )}
                </div>
            </div>

            <MenuFormModal 
                isOpen={modalState.isOpen} 
                onClose={closeModal} 
                onSuccess={refetch} 
                editId={modalState.editId} 
                initialParentId={modalState.parentId} 
            />
        </div>
    );
}
