"use client";

import React, { useState } from "react";
import { useList, useUpdate, useDelete, useUpdateMany, useDeleteMany } from "@refinedev/core";
import { 
    Users, Plus, Trash2, Edit, Check, X, Search, ChevronDown, 
    MoreVertical, Eye, Download, Shield, Briefcase, Award,
    LogOut, CheckCircle2, XCircle, Copy, FileText, Upload, Settings2, HelpCircle
} from "lucide-react";
import toast from "react-hot-toast";

// Extracted Components
import { PersonnelEditModal } from "./PersonnelEditModal";
import { PersonnelViewModal } from "./modals/PersonnelViewModal";
import { AssignmentModal } from "./modals/AssignmentModal";
import { QualificationModal } from "./modals/QualificationModal";
import { ExtendTerminateAssignmentModal } from "./modals/ExtendTerminateAssignmentModal";
import { DeleteConfirmationModal } from "./modals/DeleteConfirmationModal";
import { PreviewModal } from "./modals/PreviewModal";
import { CustomSelect } from "./CustomSelect";

export default function PersonnelPage() {
    // --- State Management ---
    const [isSubmitting, setIsSubmitting] = useState(false);
    
    // Modals visibility
    const [isEditModalOpen, setIsEditModalOpen] = useState(false);
    const [isViewModalOpen, setIsViewModalOpen] = useState(false);
    const [isAssignmentModalOpen, setIsAssignmentModalOpen] = useState(false);
    const [isQualificationModalOpen, setIsQualificationModalOpen] = useState(false);
    const [extendTerminateModalProps, setExtendTerminateModalProps] = useState<{isOpen: boolean, mode: "extend"|"terminate", assignment: any}>({isOpen: false, mode: "extend", assignment: null});
    
    // Preview Modal
    const [isPreviewOpen, setIsPreviewOpen] = useState(false);
    const [previewUrl, setPreviewUrl] = useState<string | null>(null);

    // Items
    const [itemToEdit, setItemToEdit] = useState<any>(null);
    const [itemToView, setItemToView] = useState<any>(null);
    const [assignmentInitialData, setAssignmentInitialData] = useState<any>(null);
    const [qualificationInitialData, setQualificationInitialData] = useState<any>(null);

    // Deletion targets
    const [personnelToDelete, setPersonnelToDelete] = useState<any>(null);
    const [isBulkDeleteModalOpen, setIsBulkDeleteModalOpen] = useState(false);
    const [assignmentToDelete, setAssignmentToDelete] = useState<any>(null);
    const [qualificationToDelete, setQualificationToDelete] = useState<any>(null);

    // List State
    const [selectedIds, setSelectedIds] = useState<Set<string | number>>(new Set());
    const [filterStatus, setFilterStatus] = useState<"all" | "active" | "inactive">("all");
    const [activeMenuId, setActiveMenuId] = useState<string | number | null>(null);
    const [searchQuery, setSearchQuery] = useState("");

    // Columns Visibility State
    const COLUMNS_DEF = [
        { key: "name", label: "الاسم بالكامل" },
        { key: "email", label: "البريد الإلكتروني" },
        { key: "mobile_number", label: "رقم الجوال" },
        { key: "job_number", label: "الرقم الوظيفي" },
        { key: "department", label: "القسم الأساسي" },
        { key: "primary_job", label: "الوظيفة الأساسية" },
        { key: "assignments", label: "التكليف الحالي" },
        { key: "status", label: "الحالة" },
    ];
    const [visibleColumns, setVisibleColumns] = useState<Record<string, boolean>>({
        name: true,
        email: true,
        mobile_number: true,
        job_number: true,
        department: true,
        primary_job: true,
        assignments: true,
        status: true,
    });
    const [isColumnsMenuOpen, setIsColumnsMenuOpen] = useState(false);

    // --- Data Fetching ---
    const { query: personnelQuery } = useList({
        resource: "Personnel",
        pagination: { pageSize: 500 },
        meta: { fields: ["*", "primary_job_id.*"] }
    });
    const isLoading = personnelQuery.isLoading;
    const refetch = personnelQuery.refetch;
    const data = personnelQuery.data;

    const { query: structuresQuery } = useList({ resource: "Structures", pagination: { pageSize: 500 } });
    const { query: jobsQuery } = useList({ resource: "Employees", pagination: { pageSize: 500 } });
    const { query: departmentsQuery } = useList({ resource: "Departments", pagination: { pageSize: 500 } });
    const { query: assignmentsQuery } = useList({ resource: "Employee_Assignments", pagination: { pageSize: 500 } });
    const { query: qualificationsQuery } = useList({ resource: "Employee_Qualifications", pagination: { pageSize: 500 } });

    const structuresData = structuresQuery.data;
    const jobsData = jobsQuery.data;
    const depsData = departmentsQuery.data;
    const assignmentsData = assignmentsQuery.data;
    const qualificationsData = qualificationsQuery.data;
    const refetchAssignments = assignmentsQuery.refetch;
    const refetchQualifications = qualificationsQuery.refetch;

    const personnelList = data?.data || [];
    const structures = structuresData?.data || [];
    const jobs = jobsData?.data || [];
    const departmentsList = depsData?.data || [];
    const assignmentsList = assignmentsData?.data || [];
    const qualificationsList = qualificationsData?.data || [];

    const { mutate: updateRecord } = useUpdate();
    const { mutate: deleteRecord } = useDelete();
    const { mutate: updateMany } = useUpdateMany();
    const { mutate: deleteMany } = useDeleteMany();

    // Map for quick lookup
    const structuresMap = new Map<string | number, any>(structures.map((s: any) => [s.id, s]));
    const currentAssignmentsMap = new Map<string | number, any>(assignmentsList.filter((a: any) => !a.effective_to).map((a: any) => [a.personnel_id, a]));

    // --- Search & Filter ---
    const filteredList = personnelList.filter(item => {
        const matchesStatus = filterStatus === "all" ? true : filterStatus === "active" ? item.is_active === true : item.is_active === false;
        const searchLower = searchQuery.toLowerCase();
        const matchesSearch = !searchQuery || 
            (item.name || "").toLowerCase().includes(searchLower) ||
            (item.email || "").toLowerCase().includes(searchLower) ||
            (item.job_number || "").toString().includes(searchLower);
        return matchesStatus && matchesSearch;
    });

    // --- Handlers ---
    const handleSelectAll = () => {
        if (selectedIds.size === filteredList.length) setSelectedIds(new Set());
        else setSelectedIds(new Set(filteredList.map(item => item.id as string | number)));
    };

    const toggleSelect = (id: string | number) => {
        const newSelected = new Set(selectedIds);
        if (newSelected.has(id)) newSelected.delete(id);
        else newSelected.add(id);
        setSelectedIds(newSelected);
    };

    const handleBulkStatusChange = async (newStatus: "published" | "draft") => {
        if (selectedIds.size === 0) return;
        setIsSubmitting(true);
        const isActive = newStatus === "published";
        
        updateMany({
            resource: "Personnel",
            ids: Array.from(selectedIds),
            values: { is_active: isActive },
            successNotification: false,
            errorNotification: false
        }, {
            onSuccess: () => {
                toast.success(`تم ${isActive ? "تفعيل" : "تعطيل"} الموظفين المحددين بنجاح 🎉`);
                setSelectedIds(new Set());
                refetch();
            },
            onError: () => toast.error("حدث خطأ في النظام"),
            onSettled: () => setIsSubmitting(false)
        });
    };

    const handleToggleStatus = (item: any, e?: React.MouseEvent) => {
        e?.stopPropagation();
        const isActive = !item.is_active;
        updateRecord({
            resource: "Personnel",
            id: item.id,
            values: { is_active: isActive },
            successNotification: false,
            errorNotification: false
        }, {
            onSuccess: () => {
                toast.success(`تم ${isActive ? "تفعيل" : "إلغاء تفعيل"} الموظف بنجاح`);
                refetch();
            },
            onError: (error) => toast.error(error.message || "حدث خطأ")
        });
    };

    const handleDelete = async () => {
        if (!personnelToDelete) return;
        setIsSubmitting(true);
        
        deleteRecord({
            resource: "Personnel",
            id: personnelToDelete.id,
            successNotification: false,
            errorNotification: false
        }, {
            onSuccess: () => {
                toast.success("تم حذف الموظف بنجاح");
                setPersonnelToDelete(null);
                setSelectedIds(prev => {
                    const next = new Set(prev);
                    next.delete(personnelToDelete.id);
                    return next;
                });
                refetch();
            },
            onError: () => toast.error("حدث خطأ أثناء الحذف، ربما بسبب ارتباط الموظف ببيانات أخرى"),
            onSettled: () => setIsSubmitting(false)
        });
    };

    const handleBulkDelete = async () => {
        if (selectedIds.size === 0) return;
        setIsSubmitting(true);
        
        deleteMany({
            resource: "Personnel",
            ids: Array.from(selectedIds),
            successNotification: false,
            errorNotification: false
        }, {
            onSuccess: () => {
                toast.success("تم حذف الموظفين المحددين بنجاح");
                setSelectedIds(new Set());
                setIsBulkDeleteModalOpen(false);
                refetch();
            },
            onError: () => toast.error("حدث خطأ في النظام"),
            onSettled: () => setIsSubmitting(false)
        });
    };

    const handleDeleteAssignment = () => {
        if (!assignmentToDelete) return;
        setIsSubmitting(true);
        deleteRecord({
            resource: "Employee_Assignments",
            id: assignmentToDelete.id,
            successNotification: false,
            errorNotification: false
        }, {
            onSuccess: () => {
                toast.success("تم حذف التكليف بنجاح");
                setAssignmentToDelete(null);
                refetchAssignments();
            },
            onError: () => toast.error("حدث خطأ أثناء الحذف"),
            onSettled: () => setIsSubmitting(false)
        });
    };

    const handleDeleteQualification = () => {
        if (!qualificationToDelete) return;
        setIsSubmitting(true);
        deleteRecord({
            resource: "Employee_Qualifications",
            id: qualificationToDelete.id,
            successNotification: false,
            errorNotification: false
        }, {
            onSuccess: () => {
                toast.success("تم حذف الدورة بنجاح");
                setQualificationToDelete(null);
                refetchQualifications();
            },
            onError: () => toast.error("حدث خطأ أثناء الحذف"),
            onSettled: () => setIsSubmitting(false)
        });
    };

    const handlePreviewUrl = (url: string) => {
        setPreviewUrl(url);
        setIsPreviewOpen(true);
    };

    // Close menus when clicking outside
    React.useEffect(() => {
        const handleClick = (e: MouseEvent) => {
            const target = e.target as HTMLElement;
            if (!target.closest('.action-menu-btn') && !target.closest('.action-menu-content')) {
                setActiveMenuId(null);
            }
            if (!target.closest('.col-menu-btn') && !target.closest('.col-menu-content')) {
                setIsColumnsMenuOpen(false);
            }
        };
        document.addEventListener("mousedown", handleClick);
        return () => document.removeEventListener("mousedown", handleClick);
    }, []);

    if (isLoading) {
        return (
            <div className="flex items-center justify-center min-h-[400px]">
                <div className="w-8 h-8 border-4 border-teal-500/30 border-t-teal-500 rounded-full animate-spin"></div>
            </div>
        );
    }

    return (
        <div className="bg-[#F0F2F5] dark:bg-slate-900 p-2 sm:p-4 lg:p-6 font-tajawal w-full h-[calc(100vh-64px)] overflow-hidden transition-colors duration-300 flex flex-col">
            <div className="w-full flex-1 flex flex-col space-y-4 animate-in fade-in slide-in-from-bottom-4 duration-500">
                {/* Header Section */}
                <div className="bg-white dark:bg-slate-800 rounded-xl lg:rounded-2xl p-6 shadow-sm border border-gray-100 dark:border-slate-800 flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 transition-all duration-300 shrink-0">
                    <div className="flex items-center gap-4">
                        <div className="w-12 h-12 shrink-0 rounded-xl bg-teal-50 dark:bg-teal-900/30 flex items-center justify-center text-teal-600 dark:text-teal-400">
                            <Users size={24} />
                        </div>
                        <div>
                            <h1 className="text-2xl font-bold text-gray-800 dark:text-white">بيانات الموظفين</h1>
                            <p className="text-sm text-gray-500 dark:text-gray-400 mt-1">
                                إدارة بيانات الموظفين، التكليفات، والدورات التدريبية.
                            </p>
                        </div>
                    </div>

                    <div className="flex items-center gap-3 w-full sm:w-auto rtl:flex-row-reverse">
                        <button 
                            onClick={() => { setItemToEdit(null); setIsEditModalOpen(true); }}
                            className="flex-1 sm:flex-none flex items-center justify-center gap-2 bg-teal-500 hover:bg-teal-600 text-white px-5 py-2.5 rounded-xl font-bold text-sm transition-all shadow-sm shadow-teal-500/20"
                        >
                            <Plus size={18} />
                            إضافة موظف
                        </button>
                    </div>
                </div>

                {/* Actions & Search */}
                <div className="flex flex-col sm:flex-row justify-between items-center gap-4 bg-white dark:bg-slate-800 p-4 rounded-xl shadow-sm border border-gray-100 dark:border-slate-800 shrink-0 w-full transition-all duration-300">
                    <div className="w-full sm:w-auto flex items-center gap-3">
                        <CustomSelect 
                            options={[
                                {value: "all", label: "جميع الموظفين"},
                                {value: "active", label: "الموظفين الفعالين"},
                                {value: "inactive", label: "الموظفين المعطلين"}
                            ]}
                            value={filterStatus}
                            onChange={(val: any) => setFilterStatus(val)}
                            placeholder="اختر الحالة"
                        />
                    </div>

                    <div className="relative w-full sm:w-auto flex-1 max-w-md z-40">
                        <Search size={18} className="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400" />
                        <input 
                            type="text" 
                            placeholder="البحث بالاسم، البريد، أو الرقم..."
                            className="w-full pl-4 pr-11 py-2.5 bg-white dark:bg-slate-900 border-2 border-gray-100 dark:border-slate-800 rounded-xl text-sm focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10 outline-none transition-all dark:text-white placeholder:text-gray-400"
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                        />
                    </div>

                    {/* Column Toggle Button */}
                    <div className="relative z-40">
                        <button 
                            onClick={(e) => { e.stopPropagation(); setIsColumnsMenuOpen(!isColumnsMenuOpen); }}
                            className="col-menu-btn flex items-center justify-center gap-2 px-4 py-2.5 bg-white dark:bg-slate-900 border border-gray-200 dark:border-slate-700 hover:bg-gray-50 dark:hover:bg-slate-800 text-gray-700 dark:text-slate-300 rounded-xl text-sm font-bold transition-all"
                        >
                            <Settings2 size={18} />
                            عرض الأعمدة
                        </button>
                        {isColumnsMenuOpen && (
                            <div className="col-menu-content absolute left-0 mt-2 w-56 bg-white dark:bg-slate-800 rounded-xl shadow-xl z-[100] py-2 border border-gray-200 dark:border-slate-700 animate-in fade-in slide-in-from-top-2" onClick={(e) => e.stopPropagation()}>
                                <div className="px-4 py-2 border-b border-gray-50 dark:border-slate-700/50 mb-2">
                                    <p className="text-xs font-bold text-gray-400">تخصيص أعمدة الجدول</p>
                                </div>
                                <div className="max-h-64 overflow-y-auto px-2 space-y-1 custom-scrollbar">
                                    {COLUMNS_DEF.map(col => (
                                        <label key={col.key} className="flex items-center gap-3 px-2 py-2 hover:bg-gray-50 dark:hover:bg-slate-700/50 rounded-lg cursor-pointer transition-colors group">
                                            <div className="relative flex items-center justify-center">
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
                                            <span className="text-sm font-bold text-gray-700 dark:text-slate-300 select-none">{col.label}</span>
                                        </label>
                                    ))}
                                </div>
                            </div>
                        )}
                    </div>
                </div>

                {/* Main Table */}
                <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-800 transition-all duration-300 relative flex-1 flex flex-col overflow-hidden min-h-0">
                    
                    {/* Floating Bulk Actions Bar */}
                    {selectedIds.size > 0 && (
                        <div className="fixed bottom-10 left-1/2 -translate-x-1/2 z-[9999] animate-in slide-in-from-bottom-5 fade-in duration-300 pointer-events-none w-full max-w-2xl px-4">
                            <div className="bg-slate-900 dark:bg-slate-800 backdrop-blur-xl border border-slate-700/80 shadow-2xl rounded-2xl p-2 sm:p-2.5 flex flex-wrap items-center justify-between pointer-events-auto ring-1 ring-white/10 dark:ring-white/5 gap-2">
                                <div className="flex items-center gap-2 sm:gap-3 pl-2 sm:pl-4 pr-1 sm:pr-2">
                                    <span className="flex items-center justify-center w-6 h-6 rounded-full bg-indigo-500/20 text-indigo-300 text-xs font-bold shrink-0">{selectedIds.size}</span>
                                    <span className="text-sm font-bold text-slate-300 shrink-0 hidden sm:inline">محددة</span>
                                    <div className="w-px h-6 bg-slate-700/50 mx-1 sm:mx-2 hidden sm:block"></div>
                                </div>
                                <div className="flex flex-wrap items-center gap-1 sm:gap-2">
                                    <button onClick={() => handleBulkStatusChange("published")} disabled={isSubmitting} className="px-2 sm:px-4 py-2 text-sm font-bold text-emerald-400 hover:bg-emerald-500/10 rounded-xl transition-colors disabled:opacity-50 flex items-center gap-1 sm:gap-2">
                                        <CheckCircle2 size={16} /> <span className="hidden sm:inline">تفعيل</span>
                                    </button>
                                    <button onClick={() => handleBulkStatusChange("draft")} disabled={isSubmitting} className="px-2 sm:px-4 py-2 text-sm font-bold text-slate-400 hover:text-rose-400 hover:bg-rose-500/10 rounded-xl transition-colors disabled:opacity-50 flex items-center gap-1 sm:gap-2">
                                        <LogOut size={16} className="rotate-180" /> <span className="hidden sm:inline">تعطيل</span>
                                    </button>
                                    <div className="w-px h-6 bg-slate-700/50 mx-1"></div>
                                    <button onClick={() => setIsBulkDeleteModalOpen(true)} disabled={isSubmitting} className="flex items-center gap-1 sm:gap-2 px-2 sm:px-4 py-2 hover:bg-rose-500/10 text-rose-400 rounded-xl text-sm font-bold transition-colors disabled:opacity-50">
                                        <Trash2 size={16} /> <span className="hidden sm:inline">حذف</span>
                                    </button>
                                    <button onClick={() => setSelectedIds(new Set())} className="p-2 text-slate-400 hover:text-white hover:bg-slate-700/50 rounded-xl transition-colors shrink-0 sm:ml-1" title="إلغاء التحديد">
                                        <X size={20} />
                                    </button>
                                </div>
                            </div>
                        </div>
                    )}

                    <div className="overflow-x-auto flex-1 custom-scrollbar w-full relative min-h-0">
                        <table className="min-w-full w-full text-base text-right font-medium">
                            <thead className="bg-[#f8fafc] dark:bg-slate-800/80 text-gray-600 dark:text-slate-300 font-bold border-b border-gray-100 dark:border-slate-800 text-[15px] sticky top-0 z-10 shadow-sm shadow-black/5">
                                <tr className="text-[15px]">
                                    <th className="px-6 py-4 w-12 text-center">
                                        <label className="flex items-center justify-center cursor-pointer">
                                            <input type="checkbox" className="hidden" checked={selectedIds.size === filteredList.length && filteredList.length > 0} onChange={handleSelectAll} />
                                            <div className={`w-5 h-5 rounded border ${selectedIds.size > 0 && selectedIds.size === filteredList.length ? 'bg-indigo-500 border-indigo-500' : 'bg-white dark:bg-slate-900 border-gray-300 dark:border-slate-600'} flex items-center justify-center transition-colors`}>
                                                {selectedIds.size > 0 && <Check size={14} className="text-white" />}
                                            </div>
                                        </label>
                                    </th>
                                    <th className="px-4 py-4 w-12 text-center text-[15px]">#</th>
                                    {visibleColumns.name && <th className="px-4 py-4 text-[15px] whitespace-nowrap">الاسم بالكامل</th>}
                                    {visibleColumns.email && <th className="px-4 py-4 text-[15px] whitespace-nowrap">البريد الإلكتروني</th>}
                                    {visibleColumns.mobile_number && <th className="px-4 py-4 text-[15px] whitespace-nowrap">رقم الجوال</th>}
                                    {visibleColumns.job_number && <th className="px-4 py-4 text-[15px] whitespace-nowrap">الرقم الوظيفي</th>}
                                    {visibleColumns.department && <th className="px-4 py-4 text-[15px] whitespace-nowrap">القسم الأساسي</th>}
                                    {visibleColumns.primary_job && <th className="px-4 py-4 text-[15px] whitespace-nowrap">الوظيفة الأساسية</th>}
                                    {visibleColumns.assignments && <th className="px-4 py-4 text-[15px] whitespace-nowrap">التكليف الحالي</th>}
                                    {visibleColumns.status && <th className="px-4 py-4 text-[15px] whitespace-nowrap">الحالة</th>}
                                    <th className="px-4 py-4 w-24 text-center text-[15px] whitespace-nowrap">الإجراءات</th>
                                </tr>
                            </thead>
                            <tbody className="divide-y divide-gray-100 dark:divide-slate-800/80 text-gray-700 dark:text-slate-200">
                                {filteredList.map((item, index) => {
                                    const currentAss = currentAssignmentsMap.get(item.id as string | number);
                                    const isSelected = selectedIds.has(item.id as string | number);
                                    const primaryJob = item.primary_job_id ? (typeof item.primary_job_id === 'object' ? item.primary_job_id : jobs.find((j:any) => j.id === item.primary_job_id)) : null;
                                    const department = item.department_id ? structuresMap.get(typeof item.department_id === 'object' ? item.department_id.id : item.department_id) : null;
                                    return (
                                        <tr 
                                            key={item.id} 
                                            onClick={() => { setItemToView(item); setIsViewModalOpen(true); }}
                                            className={`group transition-colors duration-200 hover:bg-teal-50/30 dark:hover:bg-slate-800/30 cursor-pointer ${isSelected ? 'bg-indigo-50/30 dark:bg-indigo-900/10' : ''}`}
                                        >
                                            <td className="px-6 py-5 text-center" onClick={(e) => e.stopPropagation()}>
                                                <label className="flex items-center justify-center cursor-pointer">
                                                    <input type="checkbox" className="hidden" checked={isSelected} onChange={() => toggleSelect(item.id as string | number)} />
                                                    <div className={`w-5 h-5 rounded border ${isSelected ? 'bg-indigo-500 border-indigo-500' : 'bg-white dark:bg-slate-900 border-gray-300 dark:border-slate-600'} flex items-center justify-center transition-colors`}>
                                                        {isSelected && <Check size={14} className="text-white" />}
                                                    </div>
                                                </label>
                                            </td>
                                            <td className="px-4 py-5 text-center text-gray-400 font-mono text-[15px]">{index + 1}</td>
                                            
                                            {visibleColumns.name && (
                                                <td className="px-4 py-5" onClick={() => { setItemToView(item); setIsViewModalOpen(true); }}>
                                                    <div className="flex items-center gap-3">
                                                        <div className="w-10 h-10 rounded-full bg-slate-100 dark:bg-slate-800 flex items-center justify-center text-slate-500 font-bold text-base uppercase border border-slate-200 dark:border-slate-700 shrink-0">
                                                            {(item.name?.[0] || "")}
                                                        </div>
                                                        <p className="font-bold text-gray-900 dark:text-white group-hover:text-teal-600 transition-colors uppercase whitespace-nowrap text-[17px]">{item.name}</p>
                                                    </div>
                                                </td>
                                            )}
                                            
                                            {visibleColumns.email && (
                                                <td className="px-4 py-5 max-w-[200px] truncate">
                                                    <p className="text-[15px] text-gray-500 dark:text-slate-400 font-mono truncate" dir="ltr"><span dir="ltr">{item.email || "-"}</span></p>
                                                </td>
                                            )}

                                            {visibleColumns.mobile_number && (
                                                <td className="px-4 py-5 font-mono text-gray-700 dark:text-slate-300 text-[15px] whitespace-nowrap" dir="ltr">
                                                    <span dir="ltr">{item.mobile_number || "-"}</span>
                                                </td>
                                            )}

                                            {visibleColumns.job_number && (
                                                <td className="px-4 py-5 font-mono text-gray-700 dark:text-slate-300 text-[16px]" dir="ltr"><span dir="ltr">{item.job_number || "-"}</span></td>
                                            )}

                                            {visibleColumns.department && (
                                                <td className="px-4 py-5 text-gray-700 dark:text-slate-300 text-[15px] whitespace-nowrap">
                                                    {department ? department.name : <span className="text-gray-400">-</span>}
                                                </td>
                                            )}

                                            {visibleColumns.primary_job && (
                                                <td className="px-4 py-5 text-gray-700 dark:text-slate-300 text-[15px] whitespace-nowrap">
                                                    {primaryJob ? primaryJob.job_title : <span className="text-gray-400">-</span>}
                                                </td>
                                            )}

                                            {visibleColumns.assignments && (
                                                <td className="px-4 py-5 text-gray-600 dark:text-slate-300 whitespace-nowrap">
                                                    {currentAss ? (
                                                        <span className="inline-flex items-center gap-2 border border-teal-100 dark:border-teal-900/30 px-3 py-1.5 rounded-full bg-teal-50 dark:bg-teal-900/20 text-teal-700 dark:text-teal-400 text-[14px] font-bold whitespace-nowrap shadow-sm">
                                                            <Briefcase size={14} />
                                                            {currentAss.subject}
                                                        </span>
                                                    ) : <span className="text-gray-400">-</span>}
                                                </td>
                                            )}

                                            {visibleColumns.status && (
                                                <td className="px-4 py-5" onClick={(e) => handleToggleStatus(item, e)}>
                                                    <span className={`inline-flex items-center gap-1.5 px-3 py-1.5 text-[14px] font-bold rounded-full border transition-all cursor-pointer whitespace-nowrap ${
                                                        item.is_active === true 
                                                            ? "bg-emerald-50 text-emerald-600 border-emerald-100 hover:bg-emerald-100 dark:bg-emerald-900/20 dark:text-emerald-400 dark:border-emerald-800/30" 
                                                            : "bg-gray-100 text-gray-500 border-gray-200 hover:bg-gray-200 dark:bg-slate-800 dark:text-slate-400 dark:border-slate-700"
                                                    }`}>
                                                        {item.is_active === true ? <CheckCircle2 size={16} /> : <XCircle size={16} />}
                                                        {item.is_active === true ? "فعال" : "معطل"}
                                                    </span>
                                                </td>
                                            )}

                                            <td className="px-6 py-5 text-center relative">
                                                <div className="relative inline-block text-right">
                                                    <button
                                                        onClick={(e) => { e.preventDefault(); e.stopPropagation(); setActiveMenuId(activeMenuId === item.id ? null : item.id as string | number); }}
                                                        className="action-menu-btn p-2 text-gray-400 hover:text-gray-600 dark:hover:text-white bg-gray-50 dark:bg-slate-800 hover:bg-gray-100 dark:hover:bg-slate-700 rounded-xl transition-all border border-gray-100 dark:border-slate-700 cursor-pointer"
                                                    >
                                                        <MoreVertical size={20} />
                                                    </button>
                                                    
                                                    {activeMenuId === item.id && (
                                                        <div className="action-menu-content absolute left-8 mt-2 w-56 bg-white dark:bg-slate-800 rounded-2xl shadow-xl z-50 py-2 border border-gray-200 dark:border-slate-700 animate-in fade-in slide-in-from-top-2" onClick={(e) => e.stopPropagation()}>
                                                            <button 
                                                                onClick={() => { setItemToView(item); setIsViewModalOpen(true); setActiveMenuId(null); }}
                                                                className="w-full text-right px-4 py-2.5 text-sm font-bold text-gray-700 dark:text-slate-300 hover:bg-teal-50 dark:hover:bg-slate-700/50 hover:text-teal-600 transition-colors flex items-center gap-2"
                                                            >
                                                                <Eye size={18} className="text-gray-400" /> عرض التفاصيل
                                                            </button>
                                                            <button 
                                                                onClick={() => { setItemToEdit(item); setIsEditModalOpen(true); setActiveMenuId(null); }}
                                                                className="w-full text-right px-4 py-2.5 text-sm font-bold text-gray-700 dark:text-slate-300 hover:bg-teal-50 dark:hover:bg-slate-700/50 hover:text-teal-600 transition-colors flex items-center gap-2"
                                                            >
                                                                <Edit size={18} className="text-gray-400" /> تعديل الموظف
                                                            </button>
                                                            
                                                            <div className="h-px bg-gray-100 dark:bg-slate-700/50 my-1"></div>
                                                            <button 
                                                                onClick={(e) => { handleToggleStatus(item, e); setActiveMenuId(null); }}
                                                                className={`w-full text-right px-4 py-2.5 text-sm font-bold transition-colors flex items-center gap-2 ${
                                                                    item.is_active 
                                                                        ? "text-slate-600 hover:bg-slate-50 dark:text-slate-400 dark:hover:bg-slate-700/50" 
                                                                        : "text-emerald-600 hover:bg-emerald-50 dark:text-emerald-400 dark:hover:bg-emerald-900/30"
                                                                }`}
                                                            >
                                                                {item.is_active ? <LogOut size={18} className="rotate-180" /> : <CheckCircle2 size={18} />}
                                                                {item.is_active ? "إنهاء خدمات الموظف" : "تفعيل الموظف"}
                                                            </button>
                                                            
                                                            {!!currentAss && (
                                                                <>
                                                                    <div className="h-px bg-gray-100 dark:bg-slate-700/50 my-1"></div>
                                                                    <button 
                                                                        onClick={() => { setExtendTerminateModalProps({isOpen: true, mode: "extend", assignment: currentAss}); setActiveMenuId(null); }}
                                                                        className="w-full text-right px-4 py-2.5 text-sm font-bold text-sky-600 hover:bg-sky-50 dark:text-sky-400 dark:hover:bg-sky-900/30 transition-colors flex items-center gap-2"
                                                                    >
                                                                        <Copy size={18} /> تمديد تكليف حالي
                                                                    </button>
                                                                    <button 
                                                                        onClick={() => { setExtendTerminateModalProps({isOpen: true, mode: "terminate", assignment: currentAss}); setActiveMenuId(null); }}
                                                                        className="w-full text-right px-4 py-2.5 text-sm font-bold text-amber-600 hover:bg-amber-50 dark:text-amber-400 dark:hover:bg-amber-900/30 transition-colors flex items-center gap-2"
                                                                    >
                                                                        <LogOut size={18} className="rotate-180 text-amber-500" /> إنهاء التكليف
                                                                    </button>
                                                                </>
                                                            )}

                                                            <div className="h-px bg-gray-100 dark:bg-slate-700/50 my-1"></div>
                                                            <button 
                                                                onClick={() => { setPersonnelToDelete(item); setActiveMenuId(null); }}
                                                                className="w-full text-right px-4 py-2.5 text-sm font-bold text-rose-600 hover:bg-rose-50 dark:text-rose-400 dark:hover:bg-rose-900/30 transition-colors flex items-center gap-2"
                                                            >
                                                                <Trash2 size={18} /> حذف
                                                            </button>
                                                        </div>
                                                    )}
                                                </div>
                                            </td>
                                        </tr>
                                    )
                                })}
                                {filteredList.length === 0 && (
                                    <tr>
                                        <td colSpan={10} className="px-6 py-16 text-center text-gray-500 dark:text-slate-400">
                                            <div className="flex flex-col items-center gap-3">
                                                <div className="w-20 h-20 bg-gray-50 dark:bg-slate-800 rounded-full flex items-center justify-center">
                                                    <Search size={32} className="text-gray-400" />
                                                </div>
                                                <p className="font-bold text-lg">لا توجد نتائج تطابق بحثك</p>
                                            </div>
                                        </td>
                                    </tr>
                                )}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            {/* Render All Separated Modals */}
            <PersonnelEditModal 
                isOpen={isEditModalOpen}
                onClose={() => setIsEditModalOpen(false)}
                itemToEdit={itemToEdit}
                onSuccess={refetch}
                onCreated={(newItem) => setItemToEdit(newItem)}
                jobs={jobs}
                departmentsList={departmentsList}
                assignmentsList={assignmentsList}
                qualificationsList={qualificationsList}
                structuresMap={structuresMap}
                onAddAssignment={() => { setAssignmentInitialData(null); setIsAssignmentModalOpen(true); }}
                onEditAssignment={(ass) => { setAssignmentInitialData(ass); setIsAssignmentModalOpen(true); }}
                onDeleteAssignment={(ass) => setAssignmentToDelete(ass)}
                onAddQualification={() => { setQualificationInitialData(null); setIsQualificationModalOpen(true); }}
                onEditQualification={(qual) => { setQualificationInitialData(qual); setIsQualificationModalOpen(true); }}
                onDeleteQualification={(qual) => setQualificationToDelete(qual)}
                onPreview={handlePreviewUrl}
            />

            <PersonnelViewModal 
                isOpen={isViewModalOpen}
                onClose={() => setIsViewModalOpen(false)}
                item={itemToView}
                assignmentsList={assignmentsList}
                qualificationsList={qualificationsList}
                structuresMap={structuresMap}
                jobsList={jobs}
                departmentsList={departmentsList}
                onPreview={handlePreviewUrl}
            />

            <AssignmentModal 
                isOpen={isAssignmentModalOpen}
                onClose={() => setIsAssignmentModalOpen(false)}
                initialData={assignmentInitialData}
                personnelId={itemToEdit?.id}
                structures={structures}
                jobs={jobs}
                departments={departmentsList}
                onSuccess={() => { refetchAssignments(); refetch(); }}
            />

            <QualificationModal 
                isOpen={isQualificationModalOpen}
                onClose={() => setIsQualificationModalOpen(false)}
                initialData={qualificationInitialData}
                personnelId={itemToEdit?.id}
                onSuccess={() => refetchQualifications()}
            />

            <ExtendTerminateAssignmentModal 
                isOpen={extendTerminateModalProps.isOpen}
                onClose={() => setExtendTerminateModalProps({...extendTerminateModalProps, isOpen: false})}
                mode={extendTerminateModalProps.mode}
                assignment={extendTerminateModalProps.assignment}
                onSuccess={() => { refetchAssignments(); refetch(); }}
            />

            <DeleteConfirmationModal 
                isOpen={!!personnelToDelete}
                onClose={() => setPersonnelToDelete(null)}
                onConfirm={handleDelete}
                title="حذف الموظف"
                message={<>هل أنت متأكد من حذف الموظف (<strong>{personnelToDelete?.name}</strong>)؟</>}
                isSubmitting={isSubmitting}
            />

            <DeleteConfirmationModal 
                isOpen={isBulkDeleteModalOpen}
                onClose={() => setIsBulkDeleteModalOpen(false)}
                onConfirm={handleBulkDelete}
                title="حذف جماعي"
                message={<>هل أنت متأكد من حذف {selectedIds.size} موظفاً؟ هذا الإجراء لا يمكن التراجع عنه.</>}
                isSubmitting={isSubmitting}
            />

            <DeleteConfirmationModal 
                isOpen={!!assignmentToDelete}
                onClose={() => setAssignmentToDelete(null)}
                onConfirm={handleDeleteAssignment}
                title="حذف سجل التكليف"
                message={<>هل أنت متأكد من حذف سجل التكليف (<strong>{assignmentToDelete?.subject}</strong>)؟</>}
                isSubmitting={isSubmitting}
            />

            <DeleteConfirmationModal 
                isOpen={!!qualificationToDelete}
                onClose={() => setQualificationToDelete(null)}
                onConfirm={handleDeleteQualification}
                title="حذف المؤهل/الدورة"
                message={<>هل أنت متأكد من حذف سجل الدورة (<strong>{qualificationToDelete?.course_name}</strong>)؟</>}
                isSubmitting={isSubmitting}
            />

            <PreviewModal 
                isOpen={isPreviewOpen}
                onClose={() => { setIsPreviewOpen(false); setPreviewUrl(null); }}
                previewUrl={previewUrl}
            />
        </div>
    );
}
