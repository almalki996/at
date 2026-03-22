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
    CheckCircle
} from "lucide-react";
import toast from "react-hot-toast";

interface Department {
    id: string | number;
    structure_id: string | number;
    designation: string | number;
    job_type: string | number;
    employee_job: string | number;
    job_status: string;
    sort_order: number;
}

const CustomSelect = ({ 
    options, 
    value, 
    onChange, 
    placeholder, 
    disabled = false, 
    renderOption,
    renderValue
}: any) => {
    const [isOpen, setIsOpen] = React.useState(false);
    const ref = React.useRef<HTMLDivElement>(null);
    React.useEffect(() => {
        const handleClick = (e: MouseEvent) => {
            if (ref.current && !ref.current.contains(e.target as Node)) setIsOpen(false);
        };
        document.addEventListener("mousedown", handleClick);
        return () => document.removeEventListener("mousedown", handleClick);
    }, []);

    const selected = options.find((o: any) => o.value === value) || null;

    return (
        <div className="relative" ref={ref}>
            <button
                type="button"
                className={`w-full flex items-center justify-between px-4 py-3 bg-white dark:bg-slate-900 border ${isOpen ? 'border-teal-500 ring-4 ring-teal-500/10' : 'border-gray-200 dark:border-slate-700'} rounded-xl text-sm transition-all focus:outline-none ${disabled ? 'opacity-50 cursor-not-allowed bg-gray-50 dark:bg-slate-800/50' : 'hover:border-teal-400 dark:hover:border-teal-600'}`}
                onClick={() => !disabled && setIsOpen(!isOpen)}
            >
                <div className="flex-1 text-right text-gray-700 dark:text-gray-200 truncate">
                    {selected ? (renderValue ? renderValue(selected) : selected.label) : <span className="text-gray-400 dark:text-slate-500">{placeholder}</span>}
                </div>
                <ChevronDown size={18} className={`text-gray-400 transition-transform duration-200 ${isOpen ? 'rotate-180 text-teal-500' : ''}`} />
            </button>
            
            {isOpen && (
                <div className="absolute z-[60] w-full mt-2 bg-white dark:bg-slate-800 border border-gray-100 dark:border-slate-700 rounded-xl shadow-xl max-h-60 overflow-y-auto py-2 custom-scrollbar animate-in fade-in slide-in-from-top-2">
                    {options.length === 0 ? (
                        <div className="px-4 py-3 text-sm text-center text-gray-500 dark:text-slate-400">لا توجد خيارات</div>
                    ) : (
                        options.map((opt: any) => (
                            <button
                                key={opt.value}
                                type="button"
                                className={`w-full text-right px-4 py-2.5 text-sm transition-colors flex items-center justify-between
                                    ${value === opt.value 
                                        ? 'bg-teal-50 dark:bg-teal-900/20 text-teal-700 dark:text-teal-400 font-bold' 
                                        : 'text-gray-700 dark:text-slate-300 hover:bg-gray-50 dark:hover:bg-slate-700/50'}`}
                                onClick={() => { onChange(opt.value); setIsOpen(false); }}
                            >
                                <div className="flex-1 truncate text-right">
                                    {renderOption ? renderOption(opt) : opt.label}
                                </div>
                                {value === opt.value && <Check size={16} className="text-teal-600 dark:text-teal-400 ml-2 shrink-0" />}
                            </button>
                        ))
                    )}
                </div>
            )}
        </div>
    );
};

export default function DepartmentsPage() {
    const [searchQuery, setSearchQuery] = useState("");
    const [isModalOpen, setIsModalOpen] = useState(false);
    const [isPreviewOpen, setIsPreviewOpen] = useState(false);
    const [isBulkDeleteModalOpen, setIsBulkDeleteModalOpen] = useState(false);
    const [formData, setFormData] = useState<Partial<Department>>({});
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [keepOpen, setKeepOpen] = useState(false);
    const [itemToEdit, setItemToEdit] = useState<Department | null>(null);
    const [itemToPreview, setItemToPreview] = useState<Department | null>(null);
    const [itemToDelete, setItemToDelete] = useState<Department | null>(null);
    const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false);
    const [selectedIds, setSelectedIds] = useState<Set<string | number>>(new Set());

    // --- Queries ---
    const { query: departmentsQuery } = useList({
        resource: "Departments",
        // @ts-ignore
        pagination: { current: 1, pageSize: 500 },
        // @ts-ignore
        sorters: [{ field: "sort_order", order: "asc" }, { field: "id", order: "desc" }]
    });

    const { query: structuresQuery } = useList({
        resource: "Structures",
        // @ts-ignore
        pagination: { current: 1, pageSize: 500 },
        // @ts-ignore
        sorters: [{ field: "sort_order", order: "asc" }]
    });

    const { query: designationsQuery } = useList({
        resource: "designations",
        // @ts-ignore
        pagination: { current: 1, pageSize: 500 },
        // @ts-ignore
        sorters: [{ field: "sort_order", order: "asc" }]
    });

    const { query: jobTypesQuery } = useList({
        resource: "job_types",
        // @ts-ignore
        pagination: { current: 1, pageSize: 500 },
        // @ts-ignore
        sorters: [{ field: "sort_order", order: "asc" }]
    });

    const { query: employeesQuery } = useList({
        resource: "Employees",
        // @ts-ignore
        pagination: { current: 1, pageSize: 500 },
        // @ts-ignore
        sorters: [{ field: "sort_order", order: "asc" }]
    });

    // Extract Data
    const listData = departmentsQuery?.data?.data as unknown as Department[] || [];
    const isLoading = departmentsQuery?.isLoading;
    const refetch = departmentsQuery?.refetch;

    const structures = useMemo(() => (structuresQuery?.data?.data as unknown as any[]) || [], [structuresQuery?.data?.data]);
    const designations = useMemo(() => (designationsQuery?.data?.data as unknown as any[]) || [], [designationsQuery?.data?.data]);
    const jobTypes = useMemo(() => (jobTypesQuery?.data?.data as unknown as any[]) || [], [jobTypesQuery?.data?.data]);
    const employees = useMemo(() => (employeesQuery?.data?.data as unknown as any[]) || [], [employeesQuery?.data?.data]);

    // Data Maps for quick lookup
    const structuresMap = useMemo(() => new Map(structures.map(x => [x.id, x])), [structures]);
    const designationsMap = useMemo(() => new Map(designations.map(x => [x.id, x])), [designations]);
    const jobTypesMap = useMemo(() => new Map(jobTypes.map(x => [x.id, x])), [jobTypes]);
    const employeesMap = useMemo(() => new Map(employees.map(x => [x.id, x])), [employees]);

    // Mutations
    const { mutate: createRecord } = useCreate();
    const { mutate: updateRecord } = useUpdate();
    const { mutate: deleteRecord } = useDelete();
    const { mutate: deleteMany } = useDeleteMany();

    // Filter Items
    const filteredItems = useMemo(() => {
        if (!searchQuery.trim()) return listData;
        const lowerQuery = searchQuery.toLowerCase();
        return listData.filter((item: any) => {
            const structureName = structuresMap.get(item.structure_id)?.name?.toLowerCase() || "";
            const employeeTitle = employeesMap.get(item.employee_job)?.job_title?.toLowerCase() || "";
            return structureName.includes(lowerQuery) || employeeTitle.includes(lowerQuery);
        });
    }, [listData, searchQuery, structuresMap, employeesMap]);

    // Derived filtered employees for the dropdown based on selected designation
    const selectedDesignationEmployees = useMemo(() => {
        if (!formData.designation) return employees;
        return employees.filter(e => e.designation === formData.designation || e.designation?.id === formData.designation);
    }, [employees, formData.designation]);

    // Selection Handlers
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

    const { mutate: updateMany } = useUpdateMany();

    const handleBulkStatusUpdate = (status: string) => {
        updateMany({
            resource: "Departments",
            ids: Array.from(selectedIds),
            values: { job_status: status },
            successNotification: false,
            errorNotification: false
        }, {
            onSuccess: () => {
                toast.success(`تم تغيير حالة ${selectedIds.size} وظيفة إلى ${status}`);
                setSelectedIds(new Set());
                setIsBulkDeleteModalOpen(false);
                refetch?.();
            },
            onError: (error) => toast.error(error.message || "حدث خطأ أثناء التحديث")
        });
    };

    const confirmBulkDelete = () => {
        setIsSubmitting(true);
        deleteMany({
            resource: "Departments",
            ids: Array.from(selectedIds),
            successNotification: false,
            errorNotification: false
        }, {
            onSuccess: () => {
                toast.success(`تم حذف ${selectedIds.size} وظيفة بنجاح`);
                setSelectedIds(new Set());
                setIsBulkDeleteModalOpen(false);
                refetch?.();
            },
            onError: (error) => {
                toast.error(error.message || "حدث خطأ أثناء الحذف");
                setIsBulkDeleteModalOpen(false);
            },
            onSettled: () => setIsSubmitting(false)
        });
    };

    const structureOptions = structures.map(s => ({ value: s.id, label: s.name || s.id, isActive: s.is_active !== false }));
    const designationOptions = designations.map(d => ({ value: d.id, label: d.name || d.id }));
    const jobTypeOptions = jobTypes.map(j => ({ value: j.id, label: j.name || j.id }));
    const employeeOptions = selectedDesignationEmployees.map(e => ({ value: e.id, label: e.job_title || e.id }));

    const statusOptions = [
        { value: 'شاغرة', label: 'شاغرة', colorClass: 'bg-emerald-100 text-emerald-800 dark:bg-emerald-900/40 dark:text-emerald-400', dotClass: 'bg-emerald-500' },
        { value: 'مشغولة', label: 'مشغولة', colorClass: 'bg-rose-100 text-rose-800 dark:bg-rose-900/40 dark:text-rose-400', dotClass: 'bg-rose-500' },
        { value: 'مجمدة', label: 'مجمدة', colorClass: 'bg-slate-200 text-slate-800 dark:bg-slate-800 dark:text-slate-300', dotClass: 'bg-slate-500' },
    ];

    const renderStatusOption = (opt: any) => (
        <div className="flex items-center gap-2">
            <span className={`w-2 h-2 rounded-full ${opt.dotClass}`} />
            <span>{opt.label}</span>
        </div>
    );

    const renderStatusValue = (opt: any) => (
        <span className={`inline-flex items-center gap-1.5 px-2.5 py-1 rounded-md text-xs font-bold leading-none ${opt.colorClass}`}>
            <span className={`w-1.5 h-1.5 rounded-full ${opt.dotClass}`} />
            {opt.label}
        </span>
    );

    const renderStructureOption = (opt: any) => (
        <div className="flex items-center justify-between w-full">
            <span>{opt.label}</span>
            {!opt.isActive && (
                <span className="text-[10px] bg-rose-100 text-rose-700 dark:bg-rose-900/40 dark:text-rose-400 px-2 py-0.5 rounded-md font-bold shrink-0">
                    موقوف
                </span>
            )}
        </div>
    );

    // Actions
    const handleAdd = () => {
        setItemToEdit(null);
        setFormData({
            sort_order: 0,
            job_status: "شاغرة",
            structure_id: structures.length > 0 ? structures[0].id : "",
            designation: designations.length > 0 ? designations[0].id : "",
            job_type: jobTypes.length > 0 ? jobTypes[0].id : "",
            employee_job: ""
        });
        setIsModalOpen(true);
    };

    const handleEdit = (item: Department) => {
        setItemToEdit(item);
        
        // Handle relations which might be returned as objects from API
        const extractId = (val: any) => {
            if (val && typeof val === 'object' && val.id) return val.id;
            return val;
        };

        setFormData({
            ...item,
            structure_id: extractId(item.structure_id),
            designation: extractId(item.designation),
            job_type: extractId(item.job_type),
            employee_job: extractId(item.employee_job),
        });
        setIsModalOpen(true);
    };

    const handlePreview = (item: Department) => {
        setItemToPreview(item);
        setIsPreviewOpen(true);
    };

    const handleDelete = (item: Department) => {
        setItemToDelete(item);
        setIsDeleteModalOpen(true);
    };

    const confirmDelete = () => {
        if (!itemToDelete) return;
        setIsSubmitting(true);
        deleteRecord({ 
            resource: "Departments", 
            id: itemToDelete.id,
            successNotification: false,
            errorNotification: false
        }, {
            onSuccess: () => {
                toast.success("تم الحذف بنجاح");
                setIsDeleteModalOpen(false);
                setItemToDelete(null);
                refetch?.();
            },
            onError: (error) => toast.error(error.message || "حدث خطأ أثناء الحذف"),
            onSettled: () => setIsSubmitting(false)
        });
    };

    const handleSave = async () => {
        if (!formData.structure_id || !formData.designation || !formData.employee_job) {
            toast.error("يرجى تعبئة الحقول الأساسية");
            return;
        }

        setIsSubmitting(true);
        const payload = { ...formData };

        if (itemToEdit) {
            updateRecord({
                resource: "Departments",
                id: itemToEdit.id,
                values: payload,
                successNotification: false,
                errorNotification: false
            }, {
                onSuccess: () => {
                    toast.success("تم التعديل بنجاح");
                    if (!keepOpen) setIsModalOpen(false);
                    refetch?.();
                },
                onError: (error) => toast.error(error.message || "حدث خطأ أثناء التعديل"),
                onSettled: () => setIsSubmitting(false)
            });
        } else {
            createRecord({
                resource: "Departments",
                values: payload,
                successNotification: false,
                errorNotification: false
            }, {
                onSuccess: () => {
                    toast.success("تمت الإضافة بنجاح");
                    if (!keepOpen) {
                        setIsModalOpen(false);
                    } else {
                        // Reset form but keep defaults
                        setFormData({
                            sort_order: (payload.sort_order || 0) + 1,
                            job_status: "شاغرة",
                            structure_id: payload.structure_id,
                            designation: payload.designation,
                            job_type: payload.job_type,
                            employee_job: ""
                        });
                    }
                    refetch?.();
                },
                onError: (error) => toast.error(error.message || "حدث خطأ أثناء الإضافة"),
                onSettled: () => setIsSubmitting(false)
            });
        }
    };

    return (
        <div className="p-6 max-w-[1600px] mx-auto space-y-6">
            {/* Header */}
            <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-800 p-6 flex flex-col md:flex-row justify-between items-center gap-4 transition-colors duration-200 relative overflow-hidden">
                
                {/* Default Header */}
                <div className={`w-full flex flex-col md:flex-row justify-between items-center gap-4 transition-all duration-300 ${selectedIds.size > 0 ? 'opacity-0 -translate-y-4 pointer-events-none absolute' : 'opacity-100 translate-y-0'}`}>
                    <div className="flex items-center gap-3 w-full md:w-auto">
                        <div className="w-12 h-12 shrink-0 rounded-xl bg-teal-50 dark:bg-teal-900/30 flex items-center justify-center text-teal-600 dark:text-teal-400">
                            <Briefcase size={24} />
                        </div>
                        <div>
                            <h1 className="text-2xl font-bold text-gray-800 dark:text-white">بناء الوظائف</h1>
                            <p className="text-sm text-gray-500 dark:text-gray-400 mt-1">
                                استعراض وإدارة ربط الوظائف بالهيكل التنظيمي.
                            </p>
                        </div>
                    </div>

                    <div className="flex flex-col sm:flex-row items-center gap-4 w-full md:w-auto shrink-0">
                        {/* Search */}
                        <div className="relative w-full sm:w-64">
                            <input
                                type="text"
                                placeholder="بحث..."
                                value={searchQuery}
                                onChange={(e) => setSearchQuery(e.target.value)}
                                className="w-full pl-10 pr-4 py-2.5 bg-gray-50 dark:bg-slate-800 border border-gray-200 dark:border-slate-700 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-teal-500/20 focus:border-teal-500 text-right dark:text-white transition-all duration-200"
                            />
                            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" size={18} />
                        </div>

                        <button
                            onClick={handleAdd}
                            className="flex items-center justify-center gap-2 px-6 py-2.5 bg-teal-600 hover:bg-teal-700 text-white rounded-xl text-sm font-medium transition-colors w-full sm:w-auto shadow-sm shadow-teal-600/20"
                        >
                            <Plus size={18} />
                            إضافة وظيفة جديدة
                        </button>
                    </div>
                </div>

                {/* Bulk Actions Toolbar Overlay */}
                <div className={`flex flex-col md:flex-row justify-between items-center gap-4 transition-all duration-300 absolute inset-0 bg-teal-50/95 dark:bg-teal-900/40 backdrop-blur-sm p-4 sm:p-6 ${selectedIds.size > 0 ? 'opacity-100 translate-y-0 relative' : 'opacity-0 translate-y-4 pointer-events-none'}`}>
                    <div className="flex items-center gap-3 text-teal-800 dark:text-teal-200 font-bold shrink-0">
                        <CheckCircle size={24} className="text-teal-600 dark:text-teal-400 hidden sm:block" />
                        <span>تم تحديد {selectedIds.size}</span>
                    </div>
                    <div className="flex flex-wrap justify-center md:justify-end items-center gap-2 sm:gap-3 w-full md:w-auto">
                        <div className="flex flex-wrap items-center justify-center gap-1 sm:gap-2 p-1 bg-white dark:bg-slate-800 rounded-xl shadow-sm border border-teal-100 dark:border-teal-900/50">
                            <button
                                onClick={() => handleBulkStatusUpdate("شاغرة")}
                                className="px-3 py-1.5 text-xs font-bold bg-emerald-50 text-emerald-700 hover:bg-emerald-100 dark:bg-emerald-900/20 dark:text-emerald-300 dark:hover:bg-emerald-800/40 rounded-lg transition-colors"
                            >
                                تحويل لشاغرة
                            </button>
                            <button
                                onClick={() => handleBulkStatusUpdate("مشغولة")}
                                className="px-3 py-1.5 text-xs font-bold bg-rose-50 text-rose-700 hover:bg-rose-100 dark:bg-rose-900/20 dark:text-rose-300 dark:hover:bg-rose-800/40 rounded-lg transition-colors"
                            >
                                تحويل لمشغولة
                            </button>
                            <button
                                onClick={() => handleBulkStatusUpdate("مجمدة")}
                                className="px-3 py-1.5 text-xs font-bold bg-slate-100 text-slate-700 hover:bg-slate-200 dark:bg-slate-800 dark:text-slate-300 dark:hover:bg-slate-700 rounded-lg transition-colors"
                            >
                                تجميد
                            </button>
                        </div>
                        
                        <div className="w-px h-8 bg-teal-200 dark:bg-teal-800/50 mx-1"></div>
                        
                        <button
                            onClick={() => setIsBulkDeleteModalOpen(true)}
                            className="flex items-center gap-2 px-4 py-2 text-sm font-bold text-rose-600 bg-white hover:bg-rose-50 dark:bg-slate-800 dark:hover:bg-rose-900/30 rounded-xl transition-all shadow-sm border border-rose-100 dark:border-rose-900/30"
                        >
                            <Trash2 size={16} />
                            حذف المحدد
                        </button>
                        <button
                            onClick={() => setSelectedIds(new Set())}
                            className="p-2 text-teal-600 hover:bg-teal-100 dark:text-teal-400 dark:hover:bg-teal-900/50 rounded-xl transition-colors"
                            title="إلغاء التحديد"
                        >
                            <X size={20} />
                        </button>
                    </div>
                </div>
            </div>

            {/* Table */}
            <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-800 overflow-hidden transition-colors duration-200">
                <div className="overflow-x-auto min-h-[400px]">
                    <table className="w-full text-right text-sm">
                        <thead className="bg-teal-600 text-white font-medium whitespace-nowrap">
                            <tr>
                                <th scope="col" className="px-6 py-4 w-12 text-center">
                                    <input 
                                        type="checkbox" 
                                        className="w-4 h-4 rounded text-teal-800 focus:ring-teal-500 bg-white border-none cursor-pointer"
                                        checked={selectedIds.size > 0 && selectedIds.size === filteredItems.length}
                                        onChange={handleSelectAll}
                                        aria-label="تحديد الكل"
                                        title="تحديد الكل"
                                    />
                                </th>
                                <th scope="col" className="px-6 py-4 text-center w-16">م</th>
                                <th scope="col" className="px-6 py-4">الكادر الوظيفي</th>
                                <th scope="col" className="px-6 py-4">مسمى الوظيفة</th>
                                <th scope="col" className="px-6 py-4">نوع الوظيفة</th>
                                <th scope="col" className="px-6 py-4">اسم القسم</th>
                                <th scope="col" className="px-6 py-4">الوصف الوظيفي</th>
                                <th scope="col" className="px-6 py-4 text-center">الإجراءات</th>
                            </tr>
                        </thead>
                        <tbody className="divide-y divide-gray-100 dark:divide-slate-800/50">
                            {isLoading ? (
                                <tr>
                                    <td colSpan={8} className="px-6 py-12 text-center">
                                        <div className="flex flex-col items-center justify-center text-gray-400 dark:text-slate-500">
                                            <div className="w-8 h-8 border-4 border-teal-500/30 border-t-teal-500 rounded-full animate-spin mb-4" />
                                            جاري تحميل السجلات...
                                        </div>
                                    </td>
                                </tr>
                            ) : filteredItems.length === 0 ? (
                                <tr>
                                    <td colSpan={8} className="px-6 py-12 text-center">
                                        <div className="flex flex-col items-center justify-center text-gray-400 dark:text-slate-500">
                                            <div className="w-16 h-16 bg-gray-50 dark:bg-slate-800 rounded-full flex items-center justify-center mb-4">
                                                <Briefcase size={28} className="text-gray-300 dark:text-slate-600" />
                                            </div>
                                            لا توجد بيانات مضافة.
                                        </div>
                                    </td>
                                </tr>
                            ) : (
                                filteredItems.map((item, index) => {
                                    // Extract IDs if relations populated
                                    const designationId = typeof item.designation === 'object' ? (item.designation as any)?.id : item.designation;
                                    const empId = typeof item.employee_job === 'object' ? (item.employee_job as any)?.id : item.employee_job;
                                    const typeId = typeof item.job_type === 'object' ? (item.job_type as any)?.id : item.job_type;
                                    const structId = typeof item.structure_id === 'object' ? (item.structure_id as any)?.id : item.structure_id;

                                    const empData = employeesMap.get(empId);

                                    return (
                                    <tr 
                                        key={item.id} 
                                        className={`hover:bg-gray-50/50 dark:hover:bg-slate-800/50 transition-colors ${selectedIds.has(item.id) ? 'bg-teal-50/50 dark:bg-teal-900/10' : ''}`}
                                    >
                                        <td className="px-6 py-3 border-l border-gray-100 dark:border-slate-800/50 text-center">
                                            <input 
                                                type="checkbox" 
                                                className="w-4 h-4 rounded text-teal-600 focus:ring-teal-500 border-gray-300 dark:border-slate-600 cursor-pointer"
                                                checked={selectedIds.has(item.id)}
                                                onChange={() => handleSelectOne(item.id)}
                                            />
                                        </td>
                                        <td className="px-6 py-3 border-l border-gray-100 dark:border-slate-800/50 text-center font-medium text-gray-500 dark:text-slate-400">
                                            {index + 1}
                                        </td>
                                        <td className="px-6 py-3 border-l border-gray-100 dark:border-slate-800/50 text-gray-700 dark:text-slate-300">
                                            {designationsMap.get(designationId)?.name || designationId}
                                        </td>
                                        <td className="px-6 py-3 border-l border-gray-100 dark:border-slate-800/50 text-gray-700 dark:text-slate-300 font-medium">
                                            {empData?.job_title || empId}
                                        </td>
                                        <td className="px-6 py-3 border-l border-gray-100 dark:border-slate-800/50 text-gray-700 dark:text-slate-300">
                                            {jobTypesMap.get(typeId)?.name || typeId}
                                        </td>
                                        <td className="px-6 py-3 border-l border-gray-100 dark:border-slate-800/50 font-bold text-teal-700 dark:text-teal-400">
                                            <div className="flex items-center gap-2">
                                                <span>{structuresMap.get(structId)?.name || structId}</span>
                                                {structuresMap.get(structId)?.is_active === false && (
                                                    <span className="text-[10px] bg-rose-100 text-rose-700 dark:bg-rose-900/40 dark:text-rose-400 px-2 py-0.5 rounded-md font-bold shrink-0">
                                                        موقوف
                                                    </span>
                                                )}
                                            </div>
                                        </td>
                                        <td className="px-6 py-3 border-l border-gray-100 dark:border-slate-800/50 text-gray-500 dark:text-slate-400 text-xs">
                                            <div className="line-clamp-2 max-w-xs leading-relaxed" title={empData?.job_description || "لا يوجد وصف"}>
                                                {empData?.job_description || "لا يوجد وصف"}
                                            </div>
                                        </td>
                                        <td className="px-6 py-3">
                                            <div className="flex items-center justify-center gap-2">
                                                <button
                                                    onClick={() => handlePreview(item)}
                                                    className="p-1.5 text-blue-600 hover:bg-blue-50 dark:text-blue-400 dark:hover:bg-blue-900/30 rounded-lg transition-colors"
                                                    title="معاينة"
                                                >
                                                    <Eye size={16} />
                                                </button>
                                                <button
                                                    onClick={() => handleEdit(item)}
                                                    className="p-1.5 text-teal-600 hover:bg-teal-50 dark:text-teal-400 dark:hover:bg-teal-900/30 rounded-lg transition-colors"
                                                    title="تعديل"
                                                >
                                                    <Edit size={16} />
                                                </button>
                                                <button
                                                    onClick={() => handleDelete(item)}
                                                    className="p-1.5 text-rose-500 hover:bg-rose-50 dark:text-rose-400 dark:hover:bg-rose-900/30 rounded-lg transition-colors"
                                                    title="حذف"
                                                >
                                                    <Trash2 size={16} />
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    );
                                })
                            )}
                        </tbody>
                    </table>
                </div>
            </div>

            {/* Bulk Delete Modal */}
            {isBulkDeleteModalOpen && (
                <div 
                    className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/50 backdrop-blur-sm animate-in fade-in duration-200"
                    onClick={(e) => {
                        if (e.target === e.currentTarget) setIsBulkDeleteModalOpen(false);
                    }}
                >
                    <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-xl w-full max-w-md overflow-hidden border border-gray-100 dark:border-slate-800 animate-in zoom-in-95 duration-200">
                        <div className="bg-rose-50 dark:bg-rose-900/20 p-6 flex flex-col items-center justify-center text-center">
                            <div className="w-16 h-16 bg-rose-100 dark:bg-rose-900/50 rounded-full flex items-center justify-center mb-4">
                                <AlertCircle size={32} className="text-rose-600 dark:text-rose-400" />
                            </div>
                            <h3 className="text-xl font-bold text-gray-900 dark:text-white mb-2">تأكيد الحذف الجماعي</h3>
                            <p className="text-gray-600 dark:text-rose-200/70">
                                هل أنت متأكد من حذف <span className="font-bold text-rose-600 dark:text-rose-400">{selectedIds.size}</span> عناصر بشكل نهائي؟ لا يمكن التراجع عن هذا الإجراء.
                            </p>
                        </div>
                        <div className="p-4 bg-gray-50 dark:bg-slate-800/50 flex items-center justify-end gap-3 border-t border-gray-100 dark:border-slate-800">
                            <button
                                onClick={() => setIsBulkDeleteModalOpen(false)}
                                disabled={isSubmitting}
                                className="px-5 py-2.5 text-sm font-medium text-gray-700 dark:text-gray-300 hover:bg-white dark:hover:bg-slate-800 rounded-xl transition-all shadow-sm border border-gray-200 dark:border-slate-700 disabled:opacity-50"
                            >
                                إلغاء
                            </button>
                            <button
                                onClick={confirmBulkDelete}
                                disabled={isSubmitting}
                                className="flex items-center gap-2 px-5 py-2.5 text-sm font-medium text-white bg-rose-600 hover:bg-rose-700 rounded-xl transition-all shadow-sm shadow-rose-600/20 disabled:opacity-50"
                            >
                                {isSubmitting ? <div className="w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin" /> : null}
                                نعم، احذفها
                            </button>
                        </div>
                    </div>
                </div>
            )}

            {/* Delete Single Item Modal */}
            {isDeleteModalOpen && itemToDelete && (
                <div 
                    className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/50 backdrop-blur-sm animate-in fade-in duration-200"
                    onClick={(e) => {
                        if (e.target === e.currentTarget) setIsDeleteModalOpen(false);
                    }}
                >
                    <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-xl w-full max-w-md overflow-hidden border border-gray-100 dark:border-slate-800 animate-in zoom-in-95 duration-200">
                        <div className="bg-rose-50 dark:bg-rose-900/20 p-6 flex flex-col items-center justify-center text-center">
                            <div className="w-16 h-16 bg-rose-100 dark:bg-rose-900/50 rounded-full flex items-center justify-center mb-4">
                                <AlertCircle size={32} className="text-rose-600 dark:text-rose-400" />
                            </div>
                            <h3 className="text-xl font-bold text-gray-900 dark:text-white mb-2">تأكيد الحذف</h3>
                            <p className="text-gray-600 dark:text-rose-200/70">
                                هل أنت متأكد من حذف هذه الوظيفة بشكل نهائي؟ لا يمكن التراجع عن هذا الإجراء.
                            </p>
                        </div>
                        <div className="p-4 bg-gray-50 dark:bg-slate-800/50 flex items-center justify-end gap-3 border-t border-gray-100 dark:border-slate-800">
                            <button
                                onClick={() => setIsDeleteModalOpen(false)}
                                disabled={isSubmitting}
                                className="px-5 py-2.5 text-sm font-medium text-gray-700 dark:text-gray-300 hover:bg-white dark:hover:bg-slate-800 rounded-xl transition-all shadow-sm border border-gray-200 dark:border-slate-700 disabled:opacity-50"
                            >
                                إلغاء
                            </button>
                            <button
                                onClick={confirmDelete}
                                disabled={isSubmitting}
                                className="flex items-center gap-2 px-5 py-2.5 text-sm font-medium text-white bg-rose-600 hover:bg-rose-700 rounded-xl transition-all shadow-sm shadow-rose-600/20 disabled:opacity-50"
                            >
                                {isSubmitting ? <div className="w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin" /> : null}
                                نعم، احذفها
                            </button>
                        </div>
                    </div>
                </div>
            )}

            {/* Add/Edit Modal */}
            {isModalOpen && (
                <div 
                    className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/50 backdrop-blur-sm animate-in fade-in duration-200"
                    onClick={(e) => {
                        if (e.target === e.currentTarget) setIsModalOpen(false);
                    }}
                >
                    <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-xl w-full max-w-3xl overflow-hidden border border-gray-100 dark:border-slate-800 flex flex-col max-h-[90vh]">
                        {/* Modal Header */}
                        <div className="px-6 py-4 border-b border-gray-100 dark:border-slate-800 flex items-center justify-between bg-gray-50/50 dark:bg-slate-800/50">
                            <h2 className="text-xl font-bold text-gray-800 dark:text-white flex items-center gap-2">
                                <Briefcase className="text-teal-600 dark:text-teal-400" size={20} />
                                {itemToEdit ? "تعديل الوظيفة" : "إضافة وظيفة جديدة"}
                            </h2>
                            <button
                                onClick={() => setIsModalOpen(false)}
                                className="p-2 text-gray-400 hover:text-gray-600 dark:hover:text-gray-300 hover:bg-gray-100 dark:hover:bg-slate-800 rounded-xl transition-colors"
                            >
                                <X size={20} />
                            </button>
                        </div>

                        {/* Modal Body */}
                        <div className="p-6 overflow-y-auto custom-scrollbar bg-gray-50/30 dark:bg-slate-900/50">
                            <div className="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6">
                                
                                {/* Right Column (in RTL) */}
                                <div className="space-y-6">
                                    {/* اسم القسم */}
                                    <div className="space-y-2">
                                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300">اسم القسم</label>
                                        <CustomSelect 
                                            options={structureOptions}
                                            value={formData.structure_id}
                                            onChange={(val: any) => setFormData({ ...formData, structure_id: val })}
                                            placeholder="اختر القسم (جهة الارتباط)"
                                            renderOption={renderStructureOption}
                                        />
                                    </div>

                                    {/* الكادر الوظيفي */}
                                    <div className="space-y-2">
                                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300">الكادر الوظيفي</label>
                                        <CustomSelect 
                                            options={designationOptions}
                                            value={formData.designation}
                                            onChange={(val: any) => setFormData({ ...formData, designation: val, employee_job: "" })}
                                            placeholder="اختر الكادر الوظيفي"
                                        />
                                    </div>

                                    {/* نوع الوظيفة */}
                                    <div className="space-y-2">
                                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300">نوع الوظيفة</label>
                                        <CustomSelect 
                                            options={jobTypeOptions}
                                            value={formData.job_type}
                                            onChange={(val: any) => setFormData({ ...formData, job_type: val })}
                                            placeholder="اختر نوع الوظيفة"
                                        />
                                    </div>
                                </div>

                                {/* Left Column (in RTL) */}
                                <div className="space-y-6">
                                    {/* حالة الوظيفة */}
                                    <div className="space-y-2">
                                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300">حالة الوظيفة</label>
                                        <CustomSelect 
                                            options={statusOptions}
                                            value={formData.job_status || "شاغرة"}
                                            onChange={(val: any) => setFormData({ ...formData, job_status: val })}
                                            placeholder="اختر الحالة"
                                            renderOption={renderStatusOption}
                                            renderValue={renderStatusValue}
                                        />
                                    </div>

                                    {/* مسمى الوظيفة */}
                                    <div className="space-y-2">
                                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300 flex justify-between">
                                            مسمى الوظيفة
                                            <span className="text-[10px] font-normal text-gray-400">* تتغير الخيارات حسب الكادر المختار</span>
                                        </label>
                                        <CustomSelect 
                                            options={employeeOptions}
                                            value={formData.employee_job}
                                            onChange={(val: any) => setFormData({ ...formData, employee_job: val })}
                                            placeholder={selectedDesignationEmployees.length > 0 ? "اختر مسمى الوظيفة" : "لا يوجد مسميات في الكادر المحدد"}
                                            disabled={!formData.designation || selectedDesignationEmployees.length === 0}
                                        />
                                    </div>
                                </div>

                            </div>
                        </div>

                        {/* Modal Footer */}
                        <div className="px-6 py-4 border-t border-gray-100 dark:border-slate-800 bg-white dark:bg-slate-900 flex items-center justify-between mt-auto">
                            
                            <div className="flex items-center gap-3">
                                <button
                                    onClick={handleSave}
                                    disabled={isSubmitting}
                                    className="flex items-center justify-center gap-2 px-8 py-2.5 bg-teal-600 hover:bg-teal-700 text-white rounded-xl text-sm font-bold transition-all disabled:opacity-50 shadow-sm shadow-teal-600/20"
                                >
                                    {isSubmitting ? (
                                        <div className="w-5 h-5 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                                    ) : (
                                        <Save size={18} />
                                    )}
                                    حفظ
                                </button>

                                <button
                                    onClick={() => setIsModalOpen(false)}
                                    disabled={isSubmitting}
                                    className="px-8 py-2.5 text-sm font-bold text-rose-600 bg-rose-50 dark:bg-rose-900/10 hover:bg-rose-100 dark:hover:bg-rose-900/30 rounded-xl transition-all disabled:opacity-50"
                                >
                                    إغلاق
                                </button>
                            </div>

                            {!itemToEdit && (
                                <label className="flex items-center gap-3 cursor-pointer group">
                                    <span className="text-sm font-medium text-gray-500 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-gray-200 transition-colors">
                                        إبقاء النافذة مفتوحة
                                    </span>
                                    <div className={`w-5 h-5 rounded border ${keepOpen ? 'bg-teal-600 border-teal-600' : 'border-gray-300 dark:border-slate-600 bg-gray-50 dark:bg-slate-800'} flex items-center justify-center transition-all`}>
                                        {keepOpen && <Check size={14} className="text-white shrink-0" />}
                                    </div>
                                    <input 
                                        type="checkbox" 
                                        className="sr-only"
                                        checked={keepOpen}
                                        onChange={(e) => setKeepOpen(e.target.checked)}
                                    />
                                </label>
                            )}
                        </div>
                    </div>
                </div>
            )}

            {/* Preview Document Modal */}
            {isPreviewOpen && itemToPreview && (
                <div 
                    className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/50 backdrop-blur-sm animate-in fade-in duration-200"
                    onClick={(e) => {
                        if (e.target === e.currentTarget) setIsPreviewOpen(false);
                    }}
                >
                    <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-xl w-full max-w-lg overflow-hidden border border-gray-100 dark:border-slate-800 flex flex-col">
                        <div className="flex items-center justify-between p-4 border-b border-gray-100 dark:border-slate-800 bg-gray-50/50 dark:bg-slate-800/50">
                            <h3 className="font-bold text-gray-800 dark:text-white flex items-center gap-2">
                                <ListChecks className="text-teal-600 dark:text-teal-400" size={20} />
                                تفاصيل ومواصفات الوظيفة
                            </h3>
                            <button
                                onClick={() => setIsPreviewOpen(false)}
                                className="p-2 text-gray-400 hover:text-gray-600 dark:hover:text-gray-300 hover:bg-gray-100 dark:hover:bg-slate-800 rounded-xl transition-colors"
                            >
                                <X size={20} />
                            </button>
                        </div>
                        
                        <div className="p-6 space-y-6">
                            {/* Department info */}
                            <div className="bg-teal-50 dark:bg-teal-900/10 rounded-xl p-4 border border-teal-100 dark:border-teal-900/30 flex items-center gap-4">
                                <div className="w-12 h-12 rounded-lg bg-white dark:bg-slate-800 shadow-sm flex items-center justify-center text-teal-600 dark:text-teal-400 border border-teal-50 dark:border-teal-900/50">
                                    <Briefcase size={22} />
                                </div>
                                <div>
                                    <p className="text-sm text-gray-500 dark:text-gray-400 mb-0.5">القسم المربوط</p>
                                    <p className="font-bold text-lg text-gray-900 dark:text-white">
                                        {structuresMap.get(
                                            typeof itemToPreview.structure_id === 'object' ? (itemToPreview.structure_id as any)?.id : itemToPreview.structure_id
                                        )?.name || itemToPreview.structure_id}
                                    </p>
                                </div>
                            </div>
                            
                            <div className="grid grid-cols-2 gap-4">
                                <div className="bg-gray-50 dark:bg-slate-800/50 rounded-xl p-4 border border-gray-100 dark:border-slate-700/50">
                                    <p className="text-xs text-gray-500 dark:text-gray-400 mb-1">حالة الوظيفة</p>
                                    <div className="flex justify-start">
                                        <span className={`px-2.5 py-1 text-xs font-medium rounded-md flex items-center gap-1.5
                                            ${itemToPreview.job_status === 'شاغرة' ? 'bg-amber-100 text-amber-800 dark:bg-amber-900/40 dark:text-amber-300' : ''}
                                            ${itemToPreview.job_status === 'مشغولة' ? 'bg-emerald-100 text-emerald-800 dark:bg-emerald-900/40 dark:text-emerald-300' : ''}
                                            ${itemToPreview.job_status === 'مجمدة' ? 'bg-indigo-100 text-indigo-800 dark:bg-indigo-900/40 dark:text-indigo-300' : ''}
                                            ${!['شاغرة', 'مشغولة', 'مجمدة'].includes(itemToPreview.job_status) ? 'bg-gray-200 text-gray-700 dark:bg-gray-800 dark:text-gray-300' : ''}
                                        `}>
                                            <span className={`w-1.5 h-1.5 rounded-full 
                                                ${itemToPreview.job_status === 'شاغرة' ? 'bg-amber-500' : ''}
                                                ${itemToPreview.job_status === 'مشغولة' ? 'bg-emerald-500' : ''}
                                                ${itemToPreview.job_status === 'مجمدة' ? 'bg-indigo-500' : ''}
                                                ${!['شاغرة', 'مشغولة', 'مجمدة'].includes(itemToPreview.job_status) ? 'bg-gray-500' : ''}
                                            `} />
                                            {itemToPreview.job_status || "غير محدد"}
                                        </span>
                                    </div>
                                </div>
                                <div className="bg-gray-50 dark:bg-slate-800/50 rounded-xl p-4 border border-gray-100 dark:border-slate-700/50">
                                    <p className="text-xs text-gray-500 dark:text-gray-400 mb-1">نوع الوظيفة</p>
                                    <p className="font-medium text-gray-900 dark:text-white truncate">
                                        {jobTypesMap.get(typeof itemToPreview.job_type === 'object' ? (itemToPreview.job_type as any)?.id : itemToPreview.job_type)?.name || itemToPreview.job_type}
                                    </p>
                                </div>
                                <div className="bg-gray-50 dark:bg-slate-800/50 rounded-xl p-4 border border-gray-100 dark:border-slate-700/50 col-span-2">
                                    <p className="text-xs text-gray-500 dark:text-gray-400 mb-1">مسمى الوظيفة (المرتبط)</p>
                                    <p className="font-medium text-gray-900 dark:text-white">
                                        {employeesMap.get(typeof itemToPreview.employee_job === 'object' ? (itemToPreview.employee_job as any)?.id : itemToPreview.employee_job)?.job_title || itemToPreview.employee_job}
                                    </p>
                                </div>
                            </div>
                            
                            <div>
                                <p className="text-sm font-bold text-gray-800 dark:text-white mb-2">الوصف الوظيفي (موروث من المسمى)</p>
                                <div className="bg-white dark:bg-slate-900 border border-gray-200 dark:border-slate-700 rounded-xl p-4 text-sm text-gray-600 dark:text-gray-300 leading-relaxed max-h-48 overflow-y-auto custom-scrollbar shadow-inner">
                                    {employeesMap.get(typeof itemToPreview.employee_job === 'object' ? (itemToPreview.employee_job as any)?.id : itemToPreview.employee_job)?.job_description || (
                                        <span className="text-gray-400 italic">لا يوجد وصف وظيفي مدرج لهذا المسمى.</span>
                                    )}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            )}

        </div>
    );
}
