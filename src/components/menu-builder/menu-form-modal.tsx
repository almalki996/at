"use client";

import React, { useEffect, useState } from "react";
import { useForm } from "@refinedev/react-hook-form";
import { Controller } from "react-hook-form";
import { X, Link as LinkIcon, Folder, Save, Ban, Edit, Plus, LayoutGrid, Lock } from "lucide-react";
import * as LucideIcons from "lucide-react";
import { useSelect } from "@refinedev/core";

const POPULAR_ICONS = [
    "Home", "Users", "Settings", "FileText", "LayoutGrid", "Box", "Briefcase", "Folder",
    "Calendar", "Bell", "MessageSquare", "Star", "Heart", "Globe", "Award", "BookOpen",
    "Database", "HardDrive", "Server", "Cpu", "Activity", "BarChart", "PieChart", "TrendingUp",
    "Monitor", "Smartphone", "Tablet", "Laptop", "Printer", "Camera", "Video", "Mic",
    "CheckCircle", "AlertCircle", "HelpCircle", "Info", "Search", "ZoomIn", "Shield", "Lock",
    "Map", "MapPin", "Navigation", "Compass", "Target", "Crosshair", "Flag", "Bookmark",
    "Mail", "Send", "Inbox", "Phone", "Headphones", "Radio", "Music", "Play"
];

const RenderIcon = ({ name, size = 20 }: { name: string, size?: number }) => {
    const Icon = (LucideIcons as any)[name];
    if (!Icon) return <LayoutGrid size={size} />;
    return <Icon size={size} />;
};

export interface MenuItemData {
    id: string | number;
    parent_id?: number | null;
    title: string;
    url_path?: string | null;
    sort_order?: number;
    icon?: string;
}

export interface MenuFormModalProps {
    isOpen: boolean;
    onClose: () => void;
    onSuccess: () => void;
    editId?: string | number;
    initialParentId?: string | number;
}

type MenuFormContentProps = Omit<MenuFormModalProps, 'isOpen'>;

const MenuFormContent: React.FC<MenuFormContentProps> = ({ onClose, onSuccess, editId, initialParentId }) => {
    const [menuType, setMenuType] = useState<"link" | "group">("link");

    const {
        refineCore: { onFinish, formLoading, query: queryResult }, // Renamed query to queryResult to avoid conflict with the diff's usage
        register,
        handleSubmit,
        formState: { errors },
        setValue,
        control, // Added control
        reset, // Added reset
    } = useForm<MenuItemData>({
        refineCoreProps: {
            resource: "menu_items",
            action: editId ? "edit" : "create",
            id: editId,
            redirect: false,
            successNotification: () => {
                return {
                    message: "تم تحديث القائمة بنجاح",
                    description: "تم ترتيب وحفظ وتحديث البيانات الخاصة بالعنصر.",
                    type: "success"
                };
            },
            errorNotification: () => {
                return {
                    message: "ملاحظة: حدث خطأ أثناء الحفظ",
                    description: "قد يكون هناك ترتيب معقد مماثل، يرجى المحاولة مرة أخرى.",
                    type: "error"
                };
            },
            onMutationSuccess: () => {
                if (typeof onSuccess === 'function') onSuccess();
                if (typeof onClose === 'function') onClose();
            }
        },
    });

    const { options: menuOptions } = useSelect({
        resource: "menu_items",
        optionLabel: "title",
        optionValue: "id",
    });

    useEffect(() => {
        if (!editId && initialParentId) {
            setValue("parent_id", String(initialParentId));
        }
    }, [editId, initialParentId, setValue]);

    useEffect(() => {
        if (queryResult?.data?.data) {
            // eslint-disable-next-line react-hooks/set-state-in-effect
            setMenuType(queryResult.data.data.url_path ? "link" : "group");
        }
    }, [queryResult?.data?.data]);

    useEffect(() => {
        if (editId && queryResult?.data?.data) {
            const item = queryResult.data.data;
            const parentIdRaw = (item as any).parent_id;
            reset({
                ...item,
                parent_id: parentIdRaw === 0 || parentIdRaw === "0" ? null : Number(parentIdRaw?.id || parentIdRaw),
                icon: item.icon || "",
                sort_order: (item.sort_order !== undefined && item.sort_order !== null && String(item.sort_order).trim() !== "") ? Math.max(1, Number(item.sort_order) + 1) : ""
            });
        }
    }, [editId, queryResult?.data, reset]);

    const onSubmit = (data: any) => {
        const hasSortVal = data.sort_order !== undefined && data.sort_order !== null && String(data.sort_order).trim() !== "";
        const sortOrderInput = hasSortVal ? Number(data.sort_order) : undefined;
        const sortOrderPayload = sortOrderInput !== undefined ? Math.max(0, sortOrderInput - 1) : 0;
        
        const payload = {
            ...data,
            url_path: menuType === "group" ? null : data.url_path,
            parent_id: data.parent_id ? Number(data.parent_id) : null,
            sort_order: sortOrderPayload
        };
        onFinish(payload);
    };

    return (
        <form onSubmit={handleSubmit(onSubmit)} className="flex flex-col h-full">
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-x-8 gap-y-6">
                
                {/* العمود الأيمن المتضمن الخيارات الهامة */}
                <div className="space-y-6">
                    <div className="bg-gray-50/80 dark:bg-slate-800 p-1.5 rounded-xl flex gap-1.5 border border-gray-100/80 dark:border-slate-700 shadow-inner">
                        <button 
                            type="button"
                            onClick={() => setMenuType("link")}
                            className={`flex-1 flex items-center justify-center gap-2 py-3 text-sm font-bold rounded-lg transition-all duration-300 ${menuType === "link" ? "bg-white dark:bg-slate-700 text-indigo-700 dark:text-indigo-400 shadow-sm border-gray-200 dark:border-slate-600" : "text-gray-500 dark:text-gray-400 hover:text-gray-800 dark:hover:text-gray-200 hover:bg-gray-100/50 dark:hover:bg-slate-700/50"}`}
                        >
                            <LinkIcon size={18} /> رابط صفحة
                        </button>
                        <button 
                            type="button"
                            onClick={() => setMenuType("group")}
                            className={`flex-1 flex items-center justify-center gap-2 py-3 text-sm font-bold rounded-lg transition-all duration-300 ${menuType === "group" ? "bg-white dark:bg-slate-700 text-emerald-700 dark:text-emerald-400 shadow-sm border-gray-200 dark:border-slate-600" : "text-gray-500 dark:text-gray-400 hover:text-gray-800 dark:hover:text-gray-200 hover:bg-gray-100/50 dark:hover:bg-slate-700/50"}`}
                        >
                            <Folder size={18} /> تصنيف مجمّع (بدون رابط)
                        </button>
                    </div>

                    <div className="space-y-1.5">
                        <label className="block text-sm font-bold text-gray-700 dark:text-slate-300">
                            {menuType === "link" ? "الاسم المعروض (Title)" : "اسم التصنيف المجمّع"}
                        </label>
                        <input 
                            {...register("title", { required: "العنوان مطلوب" })} 
                            className="w-full border border-gray-200 dark:border-slate-700/60 bg-gray-50/50 dark:bg-slate-800/80 rounded-xl px-4 py-3 focus:bg-white dark:focus:bg-slate-800 focus:ring-4 focus:ring-indigo-500/10 focus:border-indigo-400 dark:focus:border-indigo-500 outline-none transition-all placeholder-gray-400 dark:placeholder-slate-500 font-medium text-gray-900 dark:text-white" 
                            placeholder="مثال: الرئيسية، من نحن، خدماتنا..." 
                        />
                        {errors.title && <span className="text-red-500 text-xs font-semibold mt-1 flex items-center gap-1"><Ban size={12}/>{String(errors.title.message)}</span>}
                    </div>

                    <div className="space-y-1.5 animate-in fade-in slide-in-from-top-2 duration-300">
                        <label className="block text-sm font-bold text-gray-700 dark:text-slate-300">الترتيب المعروض (Sort Order)</label>
                        <input 
                            type="number"
                            {...register("sort_order")} 
                            className="w-full border border-gray-200 dark:border-slate-700/60 bg-gray-50/50 dark:bg-slate-800/80 rounded-xl px-4 py-3 focus:bg-white dark:focus:bg-slate-800 focus:ring-4 focus:ring-indigo-500/10 focus:border-indigo-400 dark:focus:border-indigo-500 outline-none transition-all placeholder-gray-400 dark:placeholder-slate-500 font-medium text-gray-900 dark:text-white" 
                            placeholder="سيتم تحديده تلقائياً إذا تُرك فارغاً..." 
                        />
                        <p className="text-xs text-gray-500 dark:text-slate-400 mt-1 font-medium">أدخل رقم الترتيب بشكل مباشر إذا أردت استبدال السحب الدقيق. (مثال: 3 لتثبيته ثالثاً)</p>
                    </div>

                    {menuType === "link" && (
                        <div className="space-y-1.5 animate-in fade-in slide-in-from-top-2 duration-300">
                            <label className="block text-sm font-bold text-gray-700 dark:text-slate-300">رابط المسار (URL Path)</label>
                            <div className="relative">
                                <div className="absolute inset-y-0 right-0 pl-3 flex items-center pointer-events-none pr-4">
                                    <span className="text-gray-400 dark:text-slate-500 sm:text-sm">/</span>
                                </div>
                                <input 
                                    {...register("url_path", { required: "مسار الرابط مطلوب للروابط" })} 
                                    className="w-full border border-gray-200 dark:border-slate-700/60 bg-gray-50/50 dark:bg-slate-800/80 rounded-xl px-4 py-3 placeholder:text-right text-left focus:bg-white dark:focus:bg-slate-800 focus:ring-4 focus:ring-indigo-500/10 focus:border-indigo-400 dark:focus:border-indigo-500 outline-none transition-all font-mono text-sm text-gray-900 dark:text-white" 
                                    dir="ltr"
                                    placeholder="dashboard/analytics" 
                                />
                            </div>
                            {errors.url_path && <span className="text-red-500 text-xs font-semibold mt-1 flex items-center gap-1"><Ban size={12}/>{String(errors.url_path.message)}</span>}
                        </div>
                    )}

                    <div className="space-y-1.5">
                        <label className="block text-sm font-bold text-gray-700 dark:text-slate-300">العنصر الأب (Parent Menu)</label>
                        <select 
                            {...register("parent_id")} 
                            className={`w-full border rounded-xl px-4 py-3 outline-none transition-all font-medium appearance-none text-gray-900 dark:text-white ${
                                !!initialParentId && !editId 
                                ? "bg-gray-100 dark:bg-slate-800 border-gray-200 dark:border-slate-700 opacity-80 cursor-not-allowed pointer-events-none"
                                : "border-gray-200 dark:border-slate-700/60 bg-gray-50/50 dark:bg-slate-800/80 focus:bg-white dark:focus:bg-slate-800 focus:ring-4 focus:ring-indigo-500/10 focus:border-indigo-400 dark:focus:border-indigo-500 cursor-pointer"
                            }`}
                            style={{ backgroundImage: `url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e")`, backgroundPosition: 'left 1rem center', backgroundRepeat: 'no-repeat', backgroundSize: '1.5em 1.5em', paddingLeft: '2.5rem' }}
                            tabIndex={!!initialParentId && !editId ? -1 : 0}
                        >
                            <option value="" className="text-gray-500 dark:text-slate-400">-- بدون أب (عنصر رئيسي مستقل) --</option>
                            {menuOptions?.map((option) => (
                                <option key={option.value} value={option.value} className="text-gray-900 dark:text-white font-medium">{option.label}</option>
                            ))}
                        </select>
                        {!!initialParentId && !editId ? (
                            <p className="text-xs text-indigo-600 dark:text-indigo-400 mt-2 font-bold flex items-center gap-1.5 bg-indigo-50 dark:bg-indigo-500/10 p-2 rounded-lg border border-indigo-100 dark:border-indigo-500/20">
                                <Lock size={14} className="min-w-fit flex-shrink-0" /> تم قفل الخيار لضمان إدراج العنصر تحت الأب المختار مباشرة.
                            </p>
                        ) : (
                            <p className="text-xs text-gray-500 dark:text-slate-400 mt-1.5 font-medium">حدد التصنيف الذي يندرج تحته هذا العنصر لإنشاء قوائم فرعية.</p>
                        )}
                    </div>
                </div>

                {/* العمود الأيسر المتضمن لاختيار الأيقونة */}
                <div className="space-y-4">
                    <label className="block text-sm font-bold text-gray-700 dark:text-slate-300">أيقونة القائمة (اختياري)</label>
                    
                    <Controller
                        name="icon"
                        control={control}
                        render={({ field }: any) => (
                            <div className="space-y-4 h-full flex flex-col">
                                <input 
                                    {...field}
                                    value={field.value || ""}
                                    className="w-full bg-gray-50/50 dark:bg-slate-800/80 border border-gray-200 dark:border-slate-700/60 rounded-xl px-4 py-3 focus:bg-white dark:focus:bg-slate-800 focus:outline-none focus:ring-4 focus:ring-indigo-500/10 focus:border-indigo-400 dark:focus:border-indigo-500 transition-all text-sm font-medium text-gray-900 dark:text-white placeholder-gray-400 dark:placeholder-slate-500" 
                                    placeholder="مثال: Home, Users, Settings (أسماء الأيقونات)"
                                />
                                
                                <div className="bg-gray-50/80 dark:bg-slate-800 rounded-xl p-4 border border-gray-100 dark:border-slate-700 flex-1 overflow-y-auto w-full min-h-[220px]">
                                    <p className="text-xs text-gray-500 dark:text-slate-400 font-bold mb-3">اختر أيقونة من القائمة المتوفرة بالنقر عليها:</p>
                                    <div className="grid grid-cols-6 sm:grid-cols-6 lg:grid-cols-7 gap-2">
                                        {POPULAR_ICONS.map((iconName) => {
                                            const isSelected = field.value === iconName;
                                            return (
                                                <button
                                                    key={iconName}
                                                    type="button"
                                                    onClick={() => field.onChange(iconName)}
                                                    className={`p-2 flex items-center justify-center rounded-lg transition-all ${
                                                        isSelected 
                                                        ? 'bg-indigo-600 dark:bg-indigo-500 text-white shadow-md scale-105 ring-2 ring-indigo-200 dark:ring-indigo-500/30' 
                                                        : 'bg-white dark:bg-slate-700/50 text-gray-600 dark:text-slate-300 border border-gray-200 dark:border-slate-600 hover:bg-indigo-50 dark:hover:bg-slate-700 hover:text-indigo-600 dark:hover:text-indigo-400 hover:border-indigo-200 dark:hover:border-slate-500 shadow-sm'
                                                    }`}
                                                    title={iconName}
                                                >
                                                    <RenderIcon name={iconName} size={18} />
                                                </button>
                                            );
                                        })}
                                    </div>
                                </div>
                            </div>
                        )}
                    />
                </div>
            </div>

            <div className="pt-6 mt-6 flex gap-3 border-t border-gray-100 dark:border-slate-700 justify-end">
                <button 
                    type="button" 
                    onClick={onClose} 
                    className="flex-1 lg:flex-none lg:w-32 bg-white dark:bg-slate-800 border border-gray-200 dark:border-slate-700 text-gray-700 dark:text-slate-300 px-4 py-3 rounded-xl hover:bg-gray-50 dark:hover:bg-slate-700 transition-all font-bold shadow-sm"
                >
                    إلغاء
                </button>
                <button 
                    type="submit" 
                    disabled={formLoading} 
                    className="flex-[2] lg:flex-none lg:w-64 flex items-center justify-center gap-2 bg-indigo-600 text-white px-4 py-3 rounded-xl hover:bg-indigo-700 hover:shadow-lg hover:shadow-indigo-600/20 transition-all font-bold disabled:opacity-70 disabled:cursor-not-allowed shadow-sm"
                >
                    <Save size={18} /> {formLoading ? "جاري الحفظ..." : "حفظ التغييرات"}
                </button>
            </div>
        </form>
    );
};

export const MenuFormModal: React.FC<MenuFormModalProps> = ({ isOpen, onClose, onSuccess, editId, initialParentId }) => {
    if (!isOpen) return null;

    return (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 sm:p-0">
            {/* Backdrop Blur */}
            <div className="absolute inset-0 bg-slate-900/40 backdrop-blur-md transition-opacity duration-300" onClick={onClose}></div>
            
            {/* Modal Content */}
            <div className="relative bg-white dark:bg-slate-900 rounded-3xl shadow-2xl w-full max-w-4xl p-7 sm:p-8 animate-in fade-in zoom-in-95 duration-300 ease-out border border-white/20 dark:border-slate-800 transition-colors">
                <div className="flex justify-between items-center mb-6">
                    <div className="flex items-center gap-3">
                        <div className="w-10 h-10 rounded-full bg-indigo-50 dark:bg-indigo-500/10 flex items-center justify-center">
                            {editId ? <Edit size={20} className="text-indigo-600 dark:text-indigo-400"/> : <Plus size={20} className="text-indigo-600 dark:text-indigo-400"/>}
                        </div>
                        <h2 className="text-2xl font-black text-gray-800 dark:text-white tracking-tight">
                            {editId ? "تعديل العنصر" : "إضافة عنصر جديد"}
                        </h2>
                    </div>
                    <button onClick={onClose} className="text-gray-400 hover:text-red-500 hover:bg-red-50 dark:hover:bg-red-500/10 p-2 rounded-full transition-colors focus:outline-none">
                        <X size={22} />
                    </button>
                </div>
                
                <p className="text-sm text-gray-500 dark:text-slate-400 mb-8 leading-relaxed font-medium">قم بتعبئة البيانات أدناه لتعريف القائمة وتحديد مكانها بدقة ضمن هيكل الموقع.</p>
                
                <MenuFormContent 
                    onClose={onClose} 
                    onSuccess={onSuccess} 
                    editId={editId} 
                    initialParentId={initialParentId} 
                />
            </div>
        </div>
    );
};
