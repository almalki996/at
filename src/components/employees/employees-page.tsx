"use client";

import React, { useState, useMemo } from "react";
import { useList, useCreate, useUpdate, useDelete, useDeleteMany, useUpdateMany } from "@refinedev/core";
import { 
    Plus, 
    Edit, 
    Trash2, 
    Save, 
    X,
    Briefcase,
    Check,
    Search,
    AlertCircle,
    Eye,
    ChevronDown,
    ListChecks,
    Settings2
} from "lucide-react";
import toast from "react-hot-toast";
import { CustomSelect } from "../generic/custom-select";

export interface Employee {
    id: number | string;
    designation: number | string;
    job_title: string;
    job_description: string;
    is_active: boolean;
    sort_order: number;
}

export interface Designation {
    id: number | string;
    name: string;
}

export default function EmployeesPage({ isEmbed = false }: { isEmbed?: boolean }) {
    // State
    const [searchQuery, setSearchQuery] = useState("");
    const [filterStatus, setFilterStatus] = useState<string>("all");
    const [isDropdownOpen, setIsDropdownOpen] = useState(false);
    const [isColumnsMenuOpen, setIsColumnsMenuOpen] = useState(false);
    const [visibleColumns, setVisibleColumns] = useState<Record<string, boolean>>({
        designation: true,
        job_title: true,
        job_description: true,
        status: true
    });

    React.useEffect(() => {
        const handleClickOutside = (event: MouseEvent) => {
            if (!(event.target as Element).closest('.col-menu-btn') && !(event.target as Element).closest('.col-menu-content')) {
                setIsColumnsMenuOpen(false);
            }
        };
        document.addEventListener('mousedown', handleClickOutside);
        return () => document.removeEventListener('mousedown', handleClickOutside);
    }, []);

    const COLUMNS_DEF = [
        { key: "designation", label: "الكادر الوظيفي" },
        { key: "job_title", label: "مسمى الوظيفة" },
        { key: "job_description", label: "الوصف الوظيفي" },
        { key: "status", label: "الحالة" }
    ];
    const [isModalOpen, setIsModalOpen] = useState(false);
    const [isPreviewOpen, setIsPreviewOpen] = useState(false);
    const [isBulkDeleteModalOpen, setIsBulkDeleteModalOpen] = useState(false);
    const [formData, setFormData] = useState<Partial<Employee>>({});
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [keepOpen, setKeepOpen] = useState(false);
    const [itemToDelete, setItemToDelete] = useState<Employee | null>(null);
    const [itemToPreview, setItemToPreview] = useState<Employee | null>(null);
    const [selectedIds, setSelectedIds] = useState<Set<string | number>>(new Set());

    // Fetch Employees
    const { query: employeesQuery } = useList({
        resource: "Employees",
        // @ts-ignore Refine types version mismatch
        pagination: { current: 1, pageSize: 500 },
        // @ts-ignore Refine types version mismatch
        sorters: [
            { field: "sort_order", order: "asc" },
            { field: "id", order: "desc" }
        ],
    });

    const listData = employeesQuery?.data;
    const isLoading = employeesQuery?.isLoading;
    const refetch = employeesQuery?.refetch;

    // Fetch Designations for mapping and dropdown
    const { query: designationsQuery } = useList({
        resource: "designations",
        // @ts-ignore Refine types version mismatch
        pagination: { current: 1, pageSize: 500 },
        // @ts-ignore Refine types version mismatch
        sorters: [{ field: "sort_order", order: "asc" }],
    });

    const designationsData = designationsQuery?.data;
    const isDesignationsLoading = designationsQuery?.isLoading;

    const designations = useMemo(() => (designationsData?.data as unknown as Designation[]) || [], [designationsData?.data]);
    
    // Create a map for quick lookup
    const designationsMap = useMemo(() => {
        const map = new Map<string | number, string>();
        designations.forEach(d => map.set(d.id, d.name));
        return map;
    }, [designations]);

    // Mutations
    const { mutate: createRecord } = useCreate();
    const { mutate: updateRecord } = useUpdate();
    const { mutate: deleteRecord } = useDelete();
    const { mutate: deleteMany } = useDeleteMany();

    // Derived Data
    const items = useMemo(() => (listData?.data as unknown as Employee[]) || [], [listData?.data]);
    
    const filteredItems = useMemo(() => {
        let result = items;
        if (filterStatus !== "all") {
            const isActive = filterStatus === "active";
            result = result.filter(item => item.is_active === isActive);
        }
        if (searchQuery.trim()) {
            const q = searchQuery.toLowerCase();
            result = result.filter(item => 
                (item.job_title && item.job_title.toLowerCase().includes(q)) ||
                (item.job_description && item.job_description.toLowerCase().includes(q)) ||
                (item.designation && designationsMap.get(item.designation)?.toLowerCase().includes(q))
            );
        }
        return result;
    }, [items, searchQuery, designationsMap, filterStatus]);

    // Handlers
    const handleAdd = () => {
        setFormData({
            is_active: true,
            sort_order: 0,
            designation: designations.length > 0 ? designations[0].id : ""
        });
        setIsModalOpen(true);
    };

    const handleEdit = (item: Employee) => {
        setFormData({ ...item });
        setIsModalOpen(true);
    };

    const handlePreview = (item: Employee) => {
        setItemToPreview(item);
        setIsPreviewOpen(true);
    };

    const handleDelete = (item: Employee) => {
        setItemToDelete(item);
    };

    const confirmDelete = () => {
        if (!itemToDelete) return;
        deleteRecord({
            resource: "Employees",
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
            resource: "Employees",
            ids: Array.from(selectedIds),
            successNotification: false,
            errorNotification: false
        }, {
            onSuccess: () => {
                toast.success("تم الحذف الجماعي بنجاح");
                setSelectedIds(new Set());
                setIsBulkDeleteModalOpen(false);
                refetch?.();
            },
            onError: (err) => toast.error(err.message || "حدث خطأ أثناء الحذف")
        });
    };

    const { mutate: updateMany } = useUpdateMany();

    const handleBulkStatusUpdate = (isActive: boolean) => {
        updateMany({
            resource: "Employees",
            ids: Array.from(selectedIds),
            values: { is_active: isActive },
            successNotification: false,
            errorNotification: false
        }, {
            onSuccess: () => {
                toast.success(`تم تغيير حالة ${selectedIds.size} سجل بنجاح`);
                setSelectedIds(new Set());
                refetch?.();
            },
            onError: (err) => toast.error(err.message || "حدث خطأ أثناء التحديث")
        });
    };

    const handleToggleActive = (item: Employee) => {
        updateRecord({
            resource: "Employees",
            id: item.id,
            values: { is_active: !item.is_active },
            successNotification: () => ({ message: "تم تحديث الحالة بنجاح", type: "success" })
        }, {
            onSuccess: () => refetch?.()
        });
    };

    const handleSave = () => {
        if (!formData.job_title?.trim() || !formData.designation) return;

        setIsSubmitting(true);
        const payload = {
            job_title: formData.job_title,
            job_description: formData.job_description || "",
            designation: formData.designation,
            is_active: formData.is_active ?? true,
            sort_order: Number(formData.sort_order || 0)
        };

        if (formData.id) {
            updateRecord({
                resource: "Employees",
                id: formData.id,
                values: payload,
                successNotification: () => ({ message: "تم التعديل بنجاح", type: "success" })
            }, {
                onSuccess: () => {
                    refetch?.();
                    if (!keepOpen) setIsModalOpen(false);
                    else setFormData({ is_active: true, sort_order: 0, designation: payload.designation });
                },
                onSettled: () => setIsSubmitting(false)
            });
        } else {
            createRecord({
                resource: "Employees",
                values: payload,
                successNotification: () => ({ message: "تمت الإضافة بنجاح", type: "success" })
            }, {
                onSuccess: () => {
                    refetch?.();
                    if (!keepOpen) setIsModalOpen(false);
                    else setFormData({ is_active: true, sort_order: 0, designation: payload.designation });
                },
                onSettled: () => setIsSubmitting(false)
            });
        }
    };

    return (
        <div className={`w-full flex flex-col overflow-hidden rtl ${isEmbed ? 'flex-1' : 'h-[calc(100vh-5rem)] p-4 md:p-6 mx-auto'}`}>
            {/* Top Toolbar matching legacy UI */}
            <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-800 px-6 py-4 mb-5 shrink-0 flex flex-wrap items-center justify-between gap-4">
                <div className="flex items-center gap-4 flex-1">
                    <h1 className="text-xl font-black text-teal-800 dark:text-teal-400 flex items-center gap-2">
                        <Briefcase size={22} />
                        المسميات الوظيفية
                    </h1>
                </div>

                <div className="flex items-center gap-4 w-full md:w-auto mt-4 md:mt-0 flex-wrap xl:flex-nowrap justify-between xl:justify-end">
                    <div className="relative w-full sm:w-36 shrink-0 z-30">
                        <CustomSelect
                            value={filterStatus}
                            onChange={(v) => setFilterStatus(v as string)}
                            options={[
                                { value: 'all', label: 'الكل (الحالة)' },
                                { value: 'active', label: 'فعال' },
                                { value: 'inactive', label: 'غير فعال' }
                            ]}
                            className="w-full bg-gray-50 dark:bg-slate-800 border-2 border-gray-200 dark:border-slate-700 text-gray-900 dark:text-gray-300 text-sm rounded-xl hover:border-teal-400 focus:border-teal-500 py-2.5 px-4 outline-none transition-all flex justify-between items-center"
                        />
                    </div>
                    
                    <div className="relative w-full sm:w-56 shrink-0">
                        <div className="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none">
                            <Search size={16} className="text-gray-400" />
                        </div>
                        <input 
                            type="text" 
                            className="w-full bg-gray-50 dark:bg-slate-800 border-2 border-gray-200 dark:border-slate-700 text-gray-900 dark:text-white text-sm rounded-xl focus:border-teal-500 block pr-10 py-2.5 outline-none transition-all placeholder:text-gray-400" 
                            placeholder="بحث..."
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                        />
                    </div>
                    
                    {/* Column Toggle Button */}
                    <div className="relative z-40 shrink-0">
                        <button 
                            onClick={(e) => { e.stopPropagation(); setIsColumnsMenuOpen(!isColumnsMenuOpen); }}
                            className="col-menu-btn flex items-center justify-center gap-2 px-4 py-2.5 bg-white dark:bg-slate-900 border-2 border-gray-200 dark:border-slate-700 hover:bg-gray-50 dark:hover:bg-slate-800 text-gray-700 dark:text-slate-300 rounded-xl text-sm font-bold transition-all w-full md:w-auto outline-none"
                        >
                            <Settings2 size={16} />
                            عرض الأعمدة
                        </button>
                        {isColumnsMenuOpen && (
                            <div className="col-menu-content absolute rtl:right-0 ltr:left-0 mt-2 w-56 bg-white dark:bg-slate-800 rounded-xl shadow-xl z-[100] py-2 border border-gray-200 dark:border-slate-700 animate-in fade-in slide-in-from-top-2" onClick={(e) => e.stopPropagation()}>
                                <div className="px-4 py-2 border-b border-gray-50 dark:border-slate-700/50 mb-2">
                                    <p className="text-xs font-bold text-gray-400">تخصيص أعمدة الجدول</p>
                                </div>
                                <div className="max-h-64 overflow-y-auto px-2 space-y-1 custom-scrollbar">
                                    {COLUMNS_DEF.map(col => (
                                        <label key={col.key} className="flex items-center gap-3 px-2 py-2 hover:bg-gray-50 dark:hover:bg-slate-700/50 rounded-lg cursor-pointer transition-colors group">
                                            <div className="relative flex items-center justify-center shrink-0">
                                                <input 
                                                    type="checkbox" 
                                                    className="hidden" 
                                                    checked={!!visibleColumns[col.key]}
                                                    onChange={() => setVisibleColumns(prev => ({...prev, [col.key]: !prev[col.key]}))}
                                                />
                                                <div className={`w-5 h-5 rounded border flex items-center justify-center transition-colors ${visibleColumns[col.key] ? 'bg-teal-500 border-teal-500' : 'bg-white dark:bg-slate-900 border-gray-300 dark:border-slate-600 group-hover:border-teal-400'}`}>
                                                    {visibleColumns[col.key] && <Check size={14} className="text-white" />}
                                                </div>
                                            </div>
                                            <span className="text-sm font-bold text-gray-700 dark:text-slate-300 select-none truncate">{col.label}</span>
                                        </label>
                                    ))}
                                </div>
                            </div>
                        )}
                    </div>
                    
                    <button 
                        onClick={handleAdd}
                        className="flex items-center justify-center gap-2 px-6 py-2.5 text-sm font-bold text-teal-700 dark:text-teal-300 bg-teal-100 dark:bg-teal-900/30 hover:bg-teal-200 dark:hover:bg-teal-800/40 rounded-xl transition-all shadow-sm w-full sm:w-auto shrink-0"
                    >
                        <Plus size={16} />
                        إضافة مسمى وظيفي
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
                                {visibleColumns.designation && <th scope="col" className="px-6 py-4 w-48">الكادر الوظيفي</th>}
                                {visibleColumns.job_title && <th scope="col" className="px-6 py-4 w-64">مسمى الوظيفة</th>}
                                {visibleColumns.job_description && <th scope="col" className="px-6 py-4 min-w-[300px]">الوصف الوظيفي</th>}
                                {visibleColumns.status && <th scope="col" className="px-6 py-4 w-28 text-center">الحالة</th>}
                                <th scope="col" className="px-6 py-4 w-36 text-center">الإجراءات</th>
                            </tr>
                        </thead>
                        <tbody>
                            {isLoading || isDesignationsLoading ? (
                                <tr>
                                    <td colSpan={7} className="px-6 py-12 text-center">
                                        <div className="flex justify-center items-center">
                                            <div className="w-8 h-8 border-4 border-teal-100 border-t-teal-600 rounded-full animate-spin"></div>
                                        </div>
                                    </td>
                                </tr>
                            ) : filteredItems.length === 0 ? (
                                <tr>
                                    <td colSpan={7} className="px-6 py-12 text-center text-gray-400">
                                        لا توجد بيانات مضافة حالياً.
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
                                        {visibleColumns.designation && (
                                            <td className="px-6 py-3 border-l border-gray-100 dark:border-slate-800/50 font-bold text-gray-800 dark:text-gray-200">
                                                {item.designation ? (designationsMap.get(item.designation) || "غير معروف") : "-"}
                                            </td>
                                        )}
                                        {visibleColumns.job_title && (
                                            <td className="px-6 py-3 border-l border-gray-100 dark:border-slate-800/50 font-bold text-teal-900 dark:text-teal-100 text-base">
                                                {item.job_title}
                                            </td>
                                        )}
                                        {visibleColumns.job_description && (
                                            <td className="px-6 py-3 border-l border-gray-100 dark:border-slate-800/50 text-gray-600 dark:text-gray-400">
                                                {item.job_description ? (
                                                    <div className="line-clamp-2" title={item.job_description}>
                                                        {item.job_description}
                                                    </div>
                                                ) : (
                                                    <span className="text-gray-400 dark:text-gray-600 italic">لا يوجد وصف</span>
                                                )}
                                            </td>
                                        )}
                                        {visibleColumns.status && (
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
                                        )}
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
                                <Briefcase size={20} className="text-teal-400" />
                                {formData.id ? "تعديل مسمى وظيفي" : "إضافة مسمى وظيفي جديد"}
                            </h3>
                            <button onClick={() => !isSubmitting && setIsModalOpen(false)} className="text-gray-400 hover:text-white transition-colors bg-white/10 p-1.5 rounded-xl outline-none">
                                <X size={20} />
                            </button>
                        </div>

                        {/* Modal Body */}
                        <div className="p-8">
                            <div className="flex flex-col gap-5">
                                <div className="flex items-center gap-6">
                                    <label className="text-sm font-bold text-gray-700 dark:text-gray-300 w-32 shrink-0">الكادر الوظيفي <span className="text-rose-500">*</span></label>
                                    <div className="relative flex-1 z-50">
                                        <button 
                                            type="button"
                                            onClick={() => setIsDropdownOpen(!isDropdownOpen)}
                                            className="w-full flex items-center justify-between gap-4 bg-gray-50 dark:bg-slate-800/50 text-gray-900 dark:text-white border-2 border-gray-200 dark:border-slate-700 text-sm rounded-xl focus:ring-4 focus:ring-teal-500/10 focus:border-teal-500 px-4 py-3 outline-none cursor-pointer transition-all placeholder:text-gray-400"
                                        >
                                            <span>
                                                {formData.designation ? designationsMap.get(formData.designation) || "غير معروف" : "اختر الكادر الوظيفي"}
                                            </span>
                                            <ChevronDown size={18} className={`text-gray-500 transition-transform duration-200 ${isDropdownOpen ? 'rotate-180' : ''}`} />
                                        </button>
                                        
                                        {isDropdownOpen && (
                                            <>
                                                <div className="fixed inset-0 z-40" onClick={() => setIsDropdownOpen(false)}></div>
                                                <div className="absolute top-full right-0 mt-2 w-full bg-white dark:bg-slate-800 rounded-xl shadow-xl border-2 border-gray-100 dark:border-slate-700/80 overflow-hidden z-50 animate-in fade-in slide-in-from-top-2 duration-200 max-h-48 overflow-y-auto custom-scrollbar">
                                                    <div className="flex flex-col py-1">
                                                        {designations.map((desig) => (
                                                            <button
                                                                type="button"
                                                                key={desig.id}
                                                                onClick={() => {
                                                                    setFormData({...formData, designation: desig.id});
                                                                    setIsDropdownOpen(false);
                                                                }}
                                                                className={`px-4 py-2.5 text-sm font-bold text-right transition-colors flex items-center justify-between outline-none ${formData.designation === desig.id ? 'bg-teal-50 dark:bg-teal-900/40 text-teal-700 dark:text-teal-300' : 'text-gray-700 dark:text-slate-300 hover:bg-gray-50 dark:hover:bg-slate-700/50'}`}
                                                            >
                                                                {desig.name}
                                                                {formData.designation === desig.id && <Check size={16} className="text-teal-600 dark:text-teal-400" />}
                                                            </button>
                                                        ))}
                                                    </div>
                                                </div>
                                            </>
                                        )}
                                    </div>
                                </div>

                                <div className="flex items-center gap-6">
                                    <label className="text-sm font-bold text-gray-700 dark:text-gray-300 w-32 shrink-0">مسمى الوظيفة <span className="text-rose-500">*</span></label>
                                    <input 
                                        type="text" 
                                        className="flex-1 px-4 py-3 bg-gray-50 dark:bg-slate-800/50 text-gray-900 dark:text-white border-2 border-gray-200 dark:border-slate-700 rounded-xl focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10 outline-none transition-all placeholder:text-gray-400"
                                        value={formData.job_title || ""}
                                        onChange={(e) => setFormData({...formData, job_title: e.target.value})}
                                        placeholder="مثال: منسق قسم، سكرتير..."
                                    />
                                </div>

                                <div className="flex items-start gap-6">
                                    <label className="text-sm font-bold text-gray-700 dark:text-gray-300 w-32 shrink-0 pt-3">الوصف الوظيفي</label>
                                    <textarea 
                                        className="flex-1 px-4 py-3 bg-gray-50 dark:bg-slate-800/50 text-gray-900 dark:text-white border-2 border-gray-200 dark:border-slate-700 rounded-xl focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10 outline-none transition-all placeholder:text-gray-400 resize-none h-24 custom-scrollbar"
                                        value={formData.job_description || ""}
                                        onChange={(e) => setFormData({...formData, job_description: e.target.value})}
                                        placeholder="اكتب وصفاً مختصراً للوظيفة ومهامها..."
                                    ></textarea>
                                </div>
                                
                                <div className="flex gap-6 mt-2">
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
                                    disabled={isSubmitting || !formData.job_title?.trim() || !formData.designation}
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
                            <h2 className="text-xl font-bold mb-4 bg-teal-50 dark:bg-teal-900/30 text-teal-700 dark:text-teal-400 px-4 py-1.5 rounded-lg inline-block border border-teal-100 dark:border-teal-800">
                                {itemToPreview.job_title}
                            </h2>
                            
                            <div className="flex flex-col gap-3 font-bold text-base mb-8 items-start bg-white dark:bg-slate-800/80 p-5 rounded-xl border border-gray-100 dark:border-slate-700 w-full shadow-inner">
                                <div className="flex gap-2 w-full"><span className="text-gray-500 w-28 text-right flex-shrink-0">الرقم التعريفي:</span> <span className="text-right text-gray-900 dark:text-white">{itemToPreview.id}</span></div>
                                <div className="flex gap-2 w-full"><span className="text-gray-500 w-28 text-right flex-shrink-0">الكادر الوظيفي:</span> <span className="text-right text-gray-900 dark:text-white">{designationsMap.get(itemToPreview.designation) || "غير معروف"}</span></div>
                                <div className="flex gap-2 w-full"><span className="text-gray-500 w-28 text-right flex-shrink-0">الوصف الوظيفي:</span> <span className="text-right text-gray-900 dark:text-white font-normal leading-relaxed">{itemToPreview.job_description || "-"}</span></div>
                                <div className="flex gap-2 w-full"><span className="text-gray-500 w-28 text-right flex-shrink-0">الحالة:</span> <span className={itemToPreview.is_active ? "text-emerald-600" : "text-rose-600"}>{itemToPreview.is_active ? "فعال" : "غير فعال"}</span></div>
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
                            هل أنت متأكد من رغبتك في حذف الوظيفة <span className="font-bold text-teal-700 dark:text-teal-400">"{itemToDelete.job_title}"</span>؟ 
                            <span className="text-sm font-bold text-rose-500 mt-3 bg-rose-50 dark:bg-rose-900/20 p-3 rounded-lg block border border-rose-100 dark:border-rose-900/50">
                                ⚠️ سيتم حذف هذا السجل نهائياً.
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
                            هل أنت متأكد من رغبتك في حذف <span className="font-bold text-rose-600 dark:text-rose-400">({selectedIds.size}) وظائف</span> محددة؟ 
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
            {/* Bottom Floating Bulk Actions Bar */}
            {selectedIds.size > 0 && (
                <div className="fixed bottom-0 left-0 right-0 transform flex justify-center z-50 pointer-events-none mb-6 transition-all duration-300 animate-in slide-in-from-bottom-5">
                    <div className="bg-slate-800 dark:bg-slate-900 pointer-events-auto rounded-2xl shadow-2xl p-2 sm:p-3 flex flex-wrap items-center justify-center gap-2 sm:gap-4 border border-slate-700 mx-4 sm:mx-0 max-w-[95vw] shadow-black/50 overflow-x-auto custom-scrollbar">
                        <div className="flex items-center gap-2 text-white font-bold px-2 sm:px-4 text-sm shrink-0">
                            <Check size={18} className="text-teal-400 hidden sm:block shrink-0" />
                            <span className="whitespace-nowrap">تم تحديد {selectedIds.size} وظيفة</span>
                        </div>
                        
                        <div className="h-4 w-px bg-slate-700 hidden sm:block shrink-0"></div>
                        
                        <div className="flex flex-wrap items-center justify-center gap-2 shrink-0">
                            <button
                                onClick={() => handleBulkStatusUpdate(true)}
                                className="px-3 py-1.5 text-xs sm:text-sm font-bold bg-emerald-500/10 text-emerald-400 hover:bg-emerald-500/20 rounded-xl transition-colors whitespace-nowrap"
                            >
                                تفعيل المحدد
                            </button>
                            <button
                                onClick={() => handleBulkStatusUpdate(false)}
                                className="px-3 py-1.5 text-xs sm:text-sm font-bold bg-slate-500/10 text-slate-300 hover:bg-slate-500/30 rounded-xl transition-colors whitespace-nowrap"
                            >
                                إيقاف المحدد
                            </button>
                            
                            <div className="h-4 w-px bg-slate-700 mx-1 shrink-0"></div>
                            
                            <button
                                onClick={() => setIsBulkDeleteModalOpen(true)}
                                className="flex items-center gap-1.5 px-3 py-1.5 text-xs sm:text-sm font-bold text-rose-400 hover:bg-rose-500/10 rounded-xl transition-all whitespace-nowrap"
                            >
                                <Trash2 size={16} /> <span className="hidden sm:inline">حذف المحدد</span>
                            </button>
                            <div className="h-4 w-px bg-slate-700 hidden sm:block mx-1 shrink-0"></div>
                            <button
                                onClick={() => setSelectedIds(new Set())}
                                className="p-2 text-slate-400 hover:text-white hover:bg-slate-700 rounded-xl transition-colors shrink-0"
                                title="إلغاء التحديد"
                            >
                                <X size={20} />
                            </button>
                        </div>
                    </div>
                </div>
            )}
        </div>
    );
}
