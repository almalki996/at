"use client";

import React, { useState, useMemo } from "react";
import { useList, useCreate, useUpdate, useDelete, useDeleteMany } from "@refinedev/core";
import { 
    Plus, 
    Edit, 
    Trash2, 
    Save, 
    X,
    Users,
    Check,
    Search,
    AlertCircle,
    Eye,
    ChevronDown,
    ListChecks
} from "lucide-react";

export interface Designation {
    id: number | string;
    name: string;
    is_active: boolean;
    sort_order: number;
}

const PROPERTY_TYPES = {
    designations: {
        id: "designations",
        label: "الكادر الوظيفي",
        pageTitle: "المسميات (الكوادر الوظيفية)",
        pageSubtitle: "إدارة قائمة المسميات الوظيفية واستخداماتها",
        addBtn: "إضافة الكادر الوظيفي",
        modalAddTitle: "إضافة مركز وظيفي",
        modalEditTitle: "تعديل مركز وظيفي",
        nameLabel: "اسم الكادر الوظيفي",
        namePlaceholder: "مثال: الوظائف الإدارية والفنية",
    },
    job_types: {
        id: "job_types",
        label: "نوع الوظيفة",
        pageTitle: "أنواع الوظائف",
        pageSubtitle: "إدارة أنواع الوظائف (أساسية، تكليف، بند أجور...)",
        addBtn: "إضافة نوع الوظيفة",
        modalAddTitle: "إضافة نوع وظيفة",
        modalEditTitle: "تعديل نوع الوظيفة",
        nameLabel: "اسم نوع الوظيفة",
        namePlaceholder: "مثال: أساسية، تكليف...",
    },
    job_axes: {
        id: "job_axes",
        label: "المحور",
        pageTitle: "المحاور",
        pageSubtitle: "إدارة المحاور",
        addBtn: "إضافة المحور",
        modalAddTitle: "إضافة محور",
        modalEditTitle: "تعديل المحور",
        nameLabel: "اسم المحور",
        namePlaceholder: "مثال: مدرب، كفاءة تشغيل...",
    }
};

type PropertyKey = keyof typeof PROPERTY_TYPES;

export default function DesignationsPage() {
    // State
    const [activeProperty, setActiveProperty] = useState<PropertyKey>("designations");
    const config = PROPERTY_TYPES[activeProperty];
    const resourceName = activeProperty;
    
    const [searchQuery, setSearchQuery] = useState("");
    const [isDropdownOpen, setIsDropdownOpen] = useState(false);
    const [isModalOpen, setIsModalOpen] = useState(false);
    const [isPreviewOpen, setIsPreviewOpen] = useState(false);
    const [isBulkDeleteModalOpen, setIsBulkDeleteModalOpen] = useState(false);
    const [formData, setFormData] = useState<Partial<Designation>>({});
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [keepOpen, setKeepOpen] = useState(false);
    const [itemToDelete, setItemToDelete] = useState<Designation | null>(null);
    const [itemToPreview, setItemToPreview] = useState<Designation | null>(null);
    const [selectedIds, setSelectedIds] = useState<Set<string | number>>(new Set());

    // Fetch Data for currently active property
    const { query } = useList({
        resource: resourceName,
        pagination: { current: 1, pageSize: 500 } as any,
        sorters: [{ field: "sort_order", order: "asc" }, { field: "id", order: "desc" }] as any,
        queryOptions: {
            // Refetch when resource changes
            queryKey: [resourceName, "list"]
        }
    });

    const listData = query?.data;
    const isLoading = query?.isLoading;
    const refetch = query?.refetch;

    // Mutations
    const { mutate: createRecord } = useCreate();
    const { mutate: updateRecord } = useUpdate();
    const { mutate: deleteRecord } = useDelete();
    const { mutate: deleteMany } = useDeleteMany();

    // Derived Data
    const items = useMemo(() => (listData?.data as Designation[]) || [], [listData?.data]);
    
    const filteredItems = useMemo(() => {
        if (!searchQuery.trim()) return items;
        const q = searchQuery.toLowerCase();
        return items.filter(item => item.name && item.name.toLowerCase().includes(q));
    }, [items, searchQuery]);

    // Handlers
    const handleAdd = () => {
        setFormData({
            is_active: true,
            sort_order: 0
        });
        setIsModalOpen(true);
    };

    const handleEdit = (item: Designation) => {
        setFormData({ ...item });
        setIsModalOpen(true);
    };

    const handlePreview = (item: Designation) => {
        setItemToPreview(item);
        setIsPreviewOpen(true);
    };

    const handleDelete = (item: Designation) => {
        setItemToDelete(item);
    };

    const confirmDelete = () => {
        if (!itemToDelete) return;
        deleteRecord({
            resource: resourceName,
            id: itemToDelete.id,
            successNotification: () => ({ message: "تم الحذف بنجاح", type: "success" })
        }, {
            onSuccess: () => {
                const newSelected = new Set(selectedIds);
                newSelected.delete(itemToDelete.id);
                setSelectedIds(newSelected);
                setItemToDelete(null);
                refetch?.();
            }
        });
    };

    const handleSelectAll = (e: React.ChangeEvent<HTMLInputElement>) => {
        if (e.target.checked) {
            setSelectedIds(new Set(filteredItems.map(item => item.id)));
        } else {
            setSelectedIds(new Set());
        }
    };

    const handleSelectOne = (id: string | number) => {
        const newSelected = new Set(selectedIds);
        if (newSelected.has(id)) {
            newSelected.delete(id);
        } else {
            newSelected.add(id);
        }
        setSelectedIds(newSelected);
    };

    const confirmBulkDelete = () => {
        deleteMany({
            resource: resourceName,
            ids: Array.from(selectedIds),
            successNotification: () => ({ message: "تم الحذف الجماعي بنجاح", type: "success" })
        }, {
            onSuccess: () => {
                setSelectedIds(new Set());
                setIsBulkDeleteModalOpen(false);
                refetch?.();
            }
        });
    };

    const handleToggleActive = (item: Designation) => {
        updateRecord({
            resource: resourceName,
            id: item.id,
            values: { is_active: !item.is_active },
            successNotification: () => ({ message: "تم تحديث الحالة بنجاح", type: "success" })
        }, {
            onSuccess: () => refetch?.()
        });
    };

    const handleSave = () => {
        if (!formData.name?.trim()) return;

        setIsSubmitting(true);
        const payload = {
            name: formData.name,
            is_active: formData.is_active ?? true,
            sort_order: Number(formData.sort_order || 0)
        };

        if (formData.id) {
            updateRecord({
                resource: resourceName,
                id: formData.id,
                values: payload,
                successNotification: () => ({ message: "تم التعديل بنجاح", type: "success" })
            }, {
                onSuccess: () => {
                    refetch?.();
                    if (!keepOpen) setIsModalOpen(false);
                    else setFormData({ is_active: true, sort_order: 0 });
                },
                onSettled: () => setIsSubmitting(false)
            });
        } else {
            createRecord({
                resource: resourceName,
                values: payload,
                successNotification: () => ({ message: "تمت الإضافة بنجاح", type: "success" })
            }, {
                onSuccess: () => {
                    // Update search/list if necessary
                    refetch?.();
                    if (!keepOpen) setIsModalOpen(false);
                    else setFormData({ is_active: true, sort_order: 0 });
                },
                onSettled: () => setIsSubmitting(false)
            });
        }
    };

    return (
        <div className="w-full h-[calc(100vh-5rem)] flex flex-col p-4 md:p-6 mx-auto overflow-hidden rtl">
            {/* Top Toolbar matching legacy UI */}
            <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-800 px-6 py-4 mb-5 shrink-0 flex flex-wrap items-center justify-between gap-4">
                <div className="flex items-center gap-4 flex-1">
                    <div className="flex items-center gap-3">
                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300 shrink-0">اختر الخاصية المطلوبة</label>
                        <div className="relative z-50">
                            <button 
                                onClick={() => setIsDropdownOpen(!isDropdownOpen)}
                                className="w-full flex items-center justify-between gap-4 bg-gray-50 dark:bg-slate-800 border-2 border-gray-200 dark:border-slate-700 text-teal-700 dark:text-teal-400 font-bold text-sm rounded-xl focus:ring-4 focus:ring-teal-500/20 focus:border-teal-500 px-4 py-2.5 outline-none cursor-pointer min-w-[180px] transition-all shadow-sm"
                            >
                                <span>{
                                    [
                                        { value: "designations", label: "الكادر الوظيفي" },
                                        { value: "job_types", label: "نوع الوظيفة" },
                                        { value: "job_axes", label: "المحور" }
                                    ].find(opt => opt.value === activeProperty)?.label
                                }</span>
                                <ChevronDown size={18} className={`text-gray-500 transition-transform duration-200 ${isDropdownOpen ? 'rotate-180' : ''}`} />
                            </button>
                            
                            {isDropdownOpen && (
                                <>
                                    <div className="fixed inset-0 z-40" onClick={() => setIsDropdownOpen(false)}></div>
                                    <div className="absolute top-full right-0 mt-2 w-full min-w-[180px] bg-white dark:bg-slate-800 rounded-xl shadow-xl border-2 border-gray-100 dark:border-slate-700/80 overflow-hidden z-50 animate-in fade-in slide-in-from-top-2 duration-200">
                                        <div className="flex flex-col py-1">
                                            {[
                                                { value: "designations", label: "الكادر الوظيفي" },
                                                { value: "job_types", label: "نوع الوظيفة" },
                                                { value: "job_axes", label: "المحور" }
                                            ].map((option) => (
                                                <button
                                                    key={option.value}
                                                    onClick={() => {
                                                        setActiveProperty(option.value as PropertyKey);
                                                        setSearchQuery("");
                                                        setIsDropdownOpen(false);
                                                    }}
                                                    className={`px-4 py-2.5 text-sm font-bold text-right transition-colors flex items-center justify-between outline-none ${activeProperty === option.value ? 'bg-teal-50 dark:bg-teal-900/40 text-teal-700 dark:text-teal-300' : 'text-gray-700 dark:text-slate-300 hover:bg-gray-50 dark:hover:bg-slate-700/50'}`}
                                                >
                                                    {option.label}
                                                    {activeProperty === option.value && <Check size={16} className="text-teal-600 dark:text-teal-400" />}
                                                </button>
                                            ))}
                                        </div>
                                    </div>
                                </>
                            )}
                        </div>
                    </div>
                </div>

                <div className="flex items-center gap-4">
                    {selectedIds.size > 0 && (
                        <button 
                            onClick={() => setIsBulkDeleteModalOpen(true)}
                            className="flex items-center gap-2 px-4 py-2 text-sm font-bold text-rose-700 dark:text-rose-300 bg-rose-100 dark:bg-rose-900/30 hover:bg-rose-200 dark:hover:bg-rose-800/40 rounded-xl transition-all shadow-sm animate-in fade-in"
                        >
                            <Trash2 size={16} />
                            حذف المحدد ({selectedIds.size})
                        </button>
                    )}
                    
                    <div className="relative w-full md:w-56">
                        <div className="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none">
                            <Search size={16} className="text-gray-400" />
                        </div>
                        <input 
                            type="text" 
                            className="w-full bg-gray-50 dark:bg-slate-800 border-2 border-gray-200 dark:border-slate-700 text-gray-900 dark:text-white text-sm rounded-xl focus:ring-teal-500 focus:border-teal-500 block pr-10 p-2.5 transition-all outline-none" 
                            placeholder="بحث..."
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                        />
                    </div>
                    
                    <button 
                        onClick={handleAdd}
                        className="flex items-center gap-2 px-5 py-2.5 text-sm font-bold text-teal-700 dark:text-teal-300 bg-teal-100 dark:bg-teal-900/30 hover:bg-teal-200 dark:hover:bg-teal-800/40 rounded-xl transition-all shadow-sm"
                    >
                        <Plus size={16} />
                        {config.addBtn}
                    </button>
                </div>
            </div>

            {/* Content Section (Table) */}
            <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-800 overflow-hidden flex-1 flex flex-col">
                <div className="overflow-x-auto flex-1">
                    <table className="w-full text-right text-sm text-gray-700 dark:text-gray-300">
                        <thead className="bg-teal-600 dark:bg-teal-800 text-white font-bold sticky top-0 z-10">
                            <tr>
                                <th scope="col" className="px-6 py-4 w-12 text-center">
                                    <input 
                                        type="checkbox" 
                                        className="w-4 h-4 rounded text-teal-600 focus:ring-teal-500 bg-white border-none cursor-pointer"
                                        checked={filteredItems.length > 0 && selectedIds.size === filteredItems.length}
                                        onChange={handleSelectAll}
                                        title="تحديد الكل"
                                    />
                                </th>
                                <th scope="col" className="px-4 py-4 w-12 text-center">م</th>
                                <th scope="col" className="px-6 py-4">{config.label}</th>
                                <th scope="col" className="px-6 py-4 w-32 text-center">الحالة</th>
                                <th scope="col" className="px-6 py-4 w-48 text-center">الإجراءات</th>
                            </tr>
                        </thead>
                        <tbody>
                            {isLoading ? (
                                <tr>
                                    <td colSpan={4} className="px-6 py-12 text-center">
                                        <div className="flex justify-center items-center">
                                            <div className="w-8 h-8 border-4 border-teal-100 border-t-teal-600 rounded-full animate-spin"></div>
                                        </div>
                                    </td>
                                </tr>
                            ) : filteredItems.length === 0 ? (
                                <tr>
                                    <td colSpan={4} className="px-6 py-12 text-center text-gray-400">
                                        لا توجد بيانات مضافة حالياً في "{config.label}".
                                    </td>
                                </tr>
                            ) : (
                                filteredItems.map((item, index) => (
                                    <tr key={item.id} className={`border-b border-gray-50 dark:border-slate-800/50 transition-colors ${selectedIds.has(item.id) ? 'bg-teal-50 dark:bg-teal-900/20' : 'hover:bg-teal-50/50 dark:hover:bg-slate-800/50'}`}>
                                        <td className="px-6 py-3 border-l border-gray-100 dark:border-slate-800/50 text-center">
                                            <input 
                                                type="checkbox" 
                                                className="w-4 h-4 rounded text-teal-600 focus:ring-teal-500 border-gray-300 dark:border-slate-600 cursor-pointer"
                                                checked={selectedIds.has(item.id)}
                                                onChange={() => handleSelectOne(item.id)}
                                            />
                                        </td>
                                        <td className="px-4 py-3 border-l border-gray-100 dark:border-slate-800/50 font-medium text-center">{index + 1}</td>
                                        <td className="px-6 py-3 border-l border-gray-100 dark:border-slate-800/50 font-bold text-teal-900 dark:text-teal-100 text-base">
                                            {item.name}
                                        </td>
                                        <td className="px-6 py-3 border-l border-gray-100 dark:border-slate-800/50">
                                            <div className="flex justify-center flex-col items-center gap-1">
                                                <button 
                                                    onClick={() => handleToggleActive(item)}
                                                    className={`w-11 h-6 rounded-full transition-colors relative flex items-center shrink-0 border border-transparent outline-none ${item.is_active ? 'bg-emerald-500 hover:bg-emerald-600 dark:border-emerald-500/50' : 'bg-gray-300 dark:bg-slate-700 hover:bg-gray-400 dark:hover:bg-slate-600 dark:border-slate-600'}`}
                                                    title={item.is_active ? "إلغاء التفعيل" : "تفعيل"}
                                                >
                                                    <div className={`shadow-sm w-4 h-4 bg-white rounded-full absolute transition-all flex items-center justify-center ${item.is_active ? 'right-6' : 'right-1'}`}>
                                                        {item.is_active && <Check size={10} className="text-emerald-600" />}
                                                    </div>
                                                </button>
                                                <span className={`text-[10px] font-bold ${item.is_active ? 'text-emerald-600 dark:text-emerald-400' : 'text-gray-500'}`}>
                                                    {item.is_active ? 'فعال' : 'غير فعال'}
                                                </span>
                                            </div>
                                        </td>
                                        <td className="px-6 py-3">
                                            <div className="flex items-center justify-center gap-1.5">
                                                <button 
                                                    onClick={() => handlePreview(item)}
                                                    className="p-1.5 text-indigo-600 dark:text-indigo-400 bg-indigo-50 dark:bg-indigo-900/40 rounded-lg hover:bg-indigo-100 dark:hover:bg-indigo-800/60 transition-colors"
                                                    title="تفاصيل السجل"
                                                >
                                                    <Eye size={16} />
                                                </button>
                                                <div className="w-px h-4 bg-gray-200 dark:bg-slate-700 mx-1"></div>
                                                <button 
                                                    onClick={() => handleEdit(item)}
                                                    className="p-1.5 text-blue-600 dark:text-blue-400 bg-blue-50 dark:bg-blue-900/40 rounded-lg hover:bg-blue-100 dark:hover:bg-blue-800/60 transition-colors"
                                                    title="تعديل السجل"
                                                >
                                                    <Edit size={16} />
                                                </button>
                                                <button 
                                                    onClick={() => handleDelete(item)}
                                                    className="p-1.5 text-rose-600 dark:text-rose-400 bg-rose-50 dark:bg-rose-900/40 rounded-lg hover:bg-rose-100 dark:hover:bg-rose-800/60 transition-colors"
                                                    title="حذف السجل"
                                                >
                                                    <Trash2 size={16} />
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                ))
                            )}
                        </tbody>
                    </table>
                </div>
            </div>

            {/* Create/Edit Modal */}
            {isModalOpen && (
                <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
                    <div className="absolute inset-0 bg-slate-900/60 backdrop-blur-sm transition-opacity" onClick={() => !isSubmitting && setIsModalOpen(false)}></div>
                    <div className="relative bg-white dark:bg-slate-900 rounded-3xl shadow-2xl w-full max-w-xl overflow-hidden border border-gray-100 dark:border-slate-800 animate-in fade-in zoom-in-95 duration-200">
                        
                        {/* Modal Header */}
                        <div className="bg-slate-900 dark:bg-slate-950 px-6 py-5 flex items-center justify-between text-white border-b border-slate-800">
                            <h3 className="text-xl font-bold flex items-center gap-2">
                                <Users size={20} className="text-teal-400" />
                                {formData.id ? config.modalEditTitle : config.modalAddTitle}
                            </h3>
                            <button onClick={() => !isSubmitting && setIsModalOpen(false)} className="text-gray-400 hover:text-white transition-colors bg-white/10 p-1.5 rounded-xl outline-none">
                                <X size={20} />
                            </button>
                        </div>

                        {/* Modal Body */}
                        <div className="p-8">
                            <div className="flex flex-col gap-6">
                                <div className="flex flex-col gap-2">
                                    <label className="text-sm font-bold text-gray-700 dark:text-gray-300">{config.nameLabel} <span className="text-rose-500">*</span></label>
                                    <input 
                                        type="text" 
                                        className="w-full px-4 py-3 bg-gray-50 dark:bg-slate-800/50 text-gray-900 dark:text-white border-2 border-gray-200 dark:border-slate-700 rounded-xl focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10 outline-none transition-all placeholder:text-gray-400"
                                        value={formData.name || ""}
                                        onChange={(e) => setFormData({...formData, name: e.target.value})}
                                        placeholder={config.namePlaceholder}
                                        autoFocus
                                    />
                                </div>
                                
                                <div className="flex gap-6">
                                    <div className="flex items-center gap-3 bg-gray-50 dark:bg-slate-800/50 p-4 rounded-xl border-2 border-gray-100 dark:border-slate-700 flex-1">
                                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300 shrink-0">حالة التفعيل</label>
                                        <button 
                                            type="button" 
                                            className={`w-12 h-6 rounded-full transition-colors relative mr-auto ${formData.is_active ? 'bg-teal-500' : 'bg-gray-300 dark:bg-slate-600'}`}
                                            onClick={() => setFormData({...formData, is_active: !formData.is_active})}
                                        >
                                            <div className={`shadow-sm w-4 h-4 bg-white rounded-full absolute top-1 transition-all flex items-center justify-center ${formData.is_active ? 'right-7 border-teal-200' : 'right-1'}`}>
                                            </div>
                                        </button>
                                    </div>
                                    
                                    <div className="flex items-center gap-3 bg-gray-50 dark:bg-slate-800/50 p-4 rounded-xl border-2 border-gray-100 dark:border-slate-700 flex-1">
                                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300 shrink-0">ترتيب العرض</label>
                                        <input 
                                            type="number" 
                                            className="w-full px-2 py-1.5 text-center text-gray-900 dark:text-white bg-white dark:bg-slate-900 border-2 border-gray-200 dark:border-slate-600 rounded-lg outline-none font-mono focus:border-teal-500 transition-colors"
                                            value={formData.sort_order || 0}
                                            onChange={(e) => setFormData({...formData, sort_order: parseInt(e.target.value) || 0})}
                                            min="0"
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>

                        {/* Modal Footer */}
                        <div className="bg-gray-50/80 dark:bg-slate-950/50 px-8 py-5 border-t border-gray-100 dark:border-slate-800 flex justify-between items-center rounded-b-3xl">
                            <div className="flex gap-3">
                                <button 
                                    onClick={handleSave}
                                    disabled={isSubmitting || !formData.name?.trim()}
                                    className="flex items-center gap-2 px-6 py-2.5 bg-teal-500 hover:bg-teal-600 text-white font-bold rounded-xl transition-colors shadow-lg shadow-teal-500/20 disabled:opacity-70 disabled:cursor-not-allowed"
                                >
                                    {isSubmitting ? (
                                        <div className="w-5 h-5 border-2 border-white/30 border-t-white rounded-full animate-spin"></div>
                                    ) : (
                                        <Save size={18} />
                                    )}
                                    حفظ
                                </button>
                                <button 
                                    onClick={() => setIsModalOpen(false)}
                                    disabled={isSubmitting}
                                    className="flex items-center gap-2 px-6 py-2.5 bg-rose-600 hover:bg-rose-700 text-white font-bold rounded-xl transition-colors shadow-lg shadow-rose-600/20 disabled:opacity-70"
                                >
                                    إغلاق
                                </button>
                            </div>

                            <div 
                                className="flex items-center gap-3 cursor-pointer text-sm font-bold text-gray-700 dark:text-gray-300 bg-white dark:bg-slate-900 px-4 py-2.5 border-2 border-gray-200 dark:border-slate-700 rounded-xl hover:border-teal-500 transition-colors select-none"
                                onClick={() => setKeepOpen(!keepOpen)}
                            >
                                ابقاء النافذة مفتوحة
                                <div className={`w-10 h-5 rounded-full transition-colors relative ${keepOpen ? 'bg-teal-500' : 'bg-gray-300 dark:bg-slate-700'}`}>
                                    <div className={`shadow-sm w-3.5 h-3.5 bg-white rounded-full absolute top-[3px] transition-all flex items-center justify-center ${keepOpen ? 'right-[22px]' : 'right-1'}`}>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            )}

            {/* Details (Preview) Modal matching old system design conceptually */}
            {isPreviewOpen && itemToPreview && (
                <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
                    <div className="absolute inset-0 bg-slate-900/40 backdrop-blur-sm transition-opacity" onClick={() => setIsPreviewOpen(false)}></div>
                    <div className="relative bg-[#fbfaf8] dark:bg-slate-900 rounded-xl shadow-2xl w-full max-w-md overflow-hidden animate-in fade-in zoom-in-95 duration-200 border-2 border-[#e6e2d9] dark:border-slate-700">
                        
                        <div className="bg-[#f0ede6] dark:bg-slate-800 px-4 py-3 flex items-center justify-between border-b border-[#e6e2d9] dark:border-slate-700">
                            <h3 className="text-base font-bold text-gray-800 dark:text-gray-200 flex items-center gap-2">
                                <Eye size={16} className="text-teal-600" />
                                التفاصيل
                            </h3>
                            <button onClick={() => setIsPreviewOpen(false)} className="text-gray-500 hover:text-gray-800 dark:hover:text-white transition-colors">
                                <X size={18} />
                            </button>
                        </div>

                        <div className="p-8 text-center text-gray-900 dark:text-white flex flex-col items-center justify-center min-h-[160px]">
                            <h2 className="text-xl font-bold mb-4">التفاصيل</h2>
                            
                            <div className="flex flex-col gap-2 font-bold text-lg mb-8 items-center">
                                <div className="flex gap-2"><span className="text-gray-600 dark:text-gray-400">الرقم التعريفي:</span> <span>{itemToPreview.id}</span></div>
                                <div className="flex gap-2"><span className="text-gray-600 dark:text-gray-400">الأسم:</span> <span>{itemToPreview.name}</span></div>
                                <div className="flex gap-2"><span className="text-gray-600 dark:text-gray-400">الحالة:</span> <span className={itemToPreview.is_active ? "text-emerald-600" : "text-rose-600"}>{itemToPreview.is_active ? "نشط" : "غير نشط"}</span></div>
                            </div>

                            <button 
                                onClick={() => setIsPreviewOpen(false)}
                                className="bg-red-600 hover:bg-red-700 text-white font-bold py-2 px-8 rounded-lg transition-colors shadow-sm"
                            >
                                إغلاق
                            </button>
                        </div>
                    </div>
                </div>
            )}

            {/* Delete Confirmation Modal */}
            {itemToDelete && (
                <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
                    <div className="absolute inset-0 bg-slate-900/60 backdrop-blur-sm transition-opacity" onClick={() => setItemToDelete(null)}></div>
                    <div className="relative bg-white dark:bg-slate-900 rounded-3xl shadow-2xl w-full max-w-md p-8 animate-in fade-in zoom-in-95 duration-200 border border-white/20 dark:border-slate-800 transition-colors">
                        <div className="w-14 h-14 rounded-full bg-rose-50 dark:bg-rose-500/10 flex items-center justify-center mb-5 border border-rose-100 dark:border-rose-500/20">
                            <AlertCircle className="text-rose-600 dark:text-rose-400" size={28} />
                        </div>
                        <h2 className="text-2xl font-black text-gray-900 dark:text-white mb-2">تأكيد الحذف</h2>
                        <div className="text-gray-600 dark:text-slate-300 mb-8 font-medium leading-relaxed">
                            هل أنت متأكد من رغبتك في حذف <span className="font-bold text-teal-700 dark:text-teal-400">"{itemToDelete.name}"</span>؟ 
                            <span className="text-sm font-bold text-rose-500 mt-3 bg-rose-50 dark:bg-rose-900/20 p-3 rounded-lg block border border-rose-100 dark:border-rose-900/50">
                                ⚠️ سيتم حذف هذا السجل نهائياً من {config.pageTitle}.
                            </span>
                        </div>
                        <div className="flex gap-3 pt-2">
                            <button 
                                onClick={confirmDelete} 
                                className="flex-1 bg-rose-600 text-white font-bold py-3.5 px-4 rounded-xl hover:bg-rose-700 hover:shadow-lg hover:shadow-rose-600/20 transition-all active:scale-95"
                            >
                                نعم، احذف
                            </button>
                            <button 
                                onClick={() => setItemToDelete(null)} 
                                className="flex-1 bg-white dark:bg-slate-800 text-gray-700 dark:text-slate-300 font-bold py-3.5 px-4 rounded-xl border-2 border-gray-100 dark:border-slate-700 hover:bg-gray-50 dark:hover:bg-slate-700 transition-all active:scale-95"
                            >
                                تراجع
                            </button>
                        </div>
                    </div>
                </div>
            )}
            {/* Bulk Delete Notification */}
            {isBulkDeleteModalOpen && (
                <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
                    <div className="absolute inset-0 bg-slate-900/60 backdrop-blur-sm transition-opacity" onClick={() => setIsBulkDeleteModalOpen(false)}></div>
                    <div className="relative bg-white dark:bg-slate-900 rounded-3xl shadow-2xl w-full max-w-md p-8 animate-in fade-in zoom-in-95 duration-200 border border-white/20 dark:border-slate-800 transition-colors">
                        <div className="w-14 h-14 rounded-full bg-rose-50 dark:bg-rose-500/10 flex items-center justify-center mb-5 border border-rose-100 dark:border-rose-500/20">
                            <ListChecks className="text-rose-600 dark:text-rose-400" size={28} />
                        </div>
                        <h2 className="text-2xl font-black text-gray-900 dark:text-white mb-2">تأكيد الحذف الجماعي</h2>
                        <div className="text-gray-600 dark:text-slate-300 mb-8 font-medium leading-relaxed">
                            هل أنت متأكد من رغبتك في حذف <span className="font-bold text-rose-600 dark:text-rose-400">({selectedIds.size}) سجلات</span> محددة؟ 
                            <span className="text-sm font-bold text-rose-500 mt-3 bg-rose-50 dark:bg-rose-900/20 p-3 rounded-lg block border border-rose-100 dark:border-rose-900/50">
                                ⚠️ سيتم حذفهم نهائياً ولن تتمكن من الاسترجاع.
                            </span>
                        </div>
                        <div className="flex gap-3 pt-2">
                            <button 
                                onClick={confirmBulkDelete} 
                                className="flex-1 bg-rose-600 text-white font-bold py-3.5 px-4 rounded-xl hover:bg-rose-700 hover:shadow-lg hover:shadow-rose-600/20 transition-all active:scale-95"
                            >
                                نعم، احذف نهائياً
                            </button>
                            <button 
                                onClick={() => setIsBulkDeleteModalOpen(false)} 
                                className="flex-1 bg-white dark:bg-slate-800 text-gray-700 dark:text-slate-300 font-bold py-3.5 px-4 rounded-xl border-2 border-gray-100 dark:border-slate-700 hover:bg-gray-50 dark:hover:bg-slate-700 transition-all active:scale-95"
                            >
                                إلغاء الأمر
                            </button>
                        </div>
                    </div>
                </div>
            )}
        </div>
    );
}
