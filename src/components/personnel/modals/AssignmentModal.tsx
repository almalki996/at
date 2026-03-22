import React, { useState, useEffect } from "react";
import { Check, Paperclip, X } from "lucide-react";
import { useForm } from "@refinedev/react-hook-form";
import toast from "react-hot-toast";
import { uploadFile } from "../utils";
import { RelationSelect } from "../../generic/relation-select";
import { DatePickerField } from "../../generic/date-picker";

interface AssignmentModalProps {
    isOpen: boolean;
    onClose: () => void;
    initialData?: any;
    personnelId: string | number;
    structures?: any[];
    jobs?: any[];
    onSuccess: () => void;
}

export const AssignmentModal: React.FC<AssignmentModalProps> = ({ 
    isOpen, 
    onClose, 
    initialData, 
    personnelId, 
    onSuccess 
}) => {
    const [file, setFile] = useState<File | null>(null);
    const [removedAttachment, setRemovedAttachment] = useState(false);
    const [uploadingState, setUploadingState] = useState(false);

    const { 
        register, 
        control,
        handleSubmit, 
        formState: { errors }, 
        reset,
        refineCore: { onFinish, formLoading } 
    } = useForm({
        refineCoreProps: {
            resource: "Employee_Assignments",
            action: initialData ? "edit" : "create",
            id: initialData?.id,
            redirect: false,
            successNotification: false,
            errorNotification: false,
            onMutationSuccess: () => {
                toast.success(initialData ? "تم تعديل التكليف بنجاح" : "تم التكليف بنجاح");
                onSuccess();
                onClose();
            },
            onMutationError: (error) => {
                toast.error(error?.message || "حدث خطأ في قيد التكليف");
            }
        }
    });

    useEffect(() => {
        if (isOpen) {
            setFile(null);
            setRemovedAttachment(false);
            if (initialData) {
                reset({
                    subject: initialData.subject,
                    decision_number: initialData.decision_number,
                    decision_summary: initialData.decision_summary,
                    decision_source: initialData.decision_source,
                    department_id: typeof initialData.department_id === 'object' ? initialData.department_id?.id : initialData.department_id,
                    job_id: typeof initialData.job_id === 'object' ? initialData.job_id?.id : initialData.job_id,
                    decision_date: initialData.decision_date?.split('T')[0] || "",
                    effective_from: initialData.effective_from?.split('T')[0] || "",
                    effective_to: initialData.effective_to?.split('T')[0] || ""
                });
            } else {
                reset({ subject: "", decision_number: "", decision_summary: "", decision_source: "", department_id: "", job_id: "", decision_date: "", effective_from: "", effective_to: "" });
            }
        }
    }, [isOpen, initialData, reset]);

    const onSubmit = async (data: any) => {
        let attachmentId = initialData?.attachment || null;
        if (removedAttachment && !file) {
            attachmentId = null;
        }

        if (file) {
            setUploadingState(true);
            try {
                attachmentId = await uploadFile(file);
            } catch (uploadError: any) {
                toast.error(`حدث خطأ أثناء رفع المرفق: ${uploadError?.message || 'غير معروف'}`);
                setUploadingState(false);
                return; // Stop submittal if upload fails
            }
            setUploadingState(false);
        }

        const sanitizedData = Object.fromEntries(
            Object.entries(data).map(([k, v]) => [k, v === "" ? null : v])
        );

        setUploadingState(true); // Re-use this state to show loading icon during onFinish
        try {
            await onFinish({
                ...sanitizedData,
                personnel_id: personnelId,
                ...(attachmentId && { attachment: attachmentId })
            });
        } finally {
            setUploadingState(false);
        }
    };

    if (!isOpen) return null;
    const isSubmitting = formLoading || uploadingState;

    return (
        <div 
            className="fixed inset-0 z-[120] flex items-center justify-center p-4 bg-slate-900/50 backdrop-blur-sm animate-in fade-in duration-200"
            onClick={(e) => {
                if (e.target === e.currentTarget && !isSubmitting) onClose();
            }}
        >
            <div className="bg-slate-800 dark:bg-slate-900 rounded-2xl shadow-2xl w-full max-w-4xl flex flex-col overflow-hidden animate-in zoom-in-95 duration-200 border border-slate-700/80">
                <div className="px-6 py-5 bg-slate-800 flex items-center justify-between shrink-0">
                    <h3 className="text-xl font-bold text-white flex items-center gap-3">
                        <Paperclip size={20} className="text-teal-400" />
                        {initialData ? "تعديل تكليف موظف" : "تكليف موظف"}
                    </h3>
                    <button onClick={() => !isSubmitting && onClose()} className="text-slate-400 hover:text-white transition-colors">
                        <X size={20} />
                    </button>
                </div>
                
                <form onSubmit={handleSubmit(onSubmit)} className="contents">
                    <div className="p-8 bg-white dark:bg-slate-900 overflow-y-visible">
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 relative">
                            <div className="absolute inset-y-0 left-1/2 w-px bg-gray-100 dark:bg-slate-800/80 hidden md:block"></div>
                            <div className="space-y-6 flex flex-col pr-2">
                                <div className="flex flex-col gap-2">
                                    <label className="text-sm font-bold text-gray-700 dark:text-gray-300">الموضوع <span className="text-red-500">*</span></label>
                                    <input 
                                        type="text"
                                        {...register("subject", { required: true })}
                                        className={`w-full px-4 py-2.5 bg-white dark:bg-slate-900 text-gray-900 dark:text-white border-2 rounded-xl focus:ring-4 outline-none transition-all ${errors.subject ? 'border-red-400 focus:border-red-500 focus:ring-red-500/10' : 'border-gray-200 dark:border-slate-700 focus:border-teal-500 focus:ring-teal-500/10'}`}
                                        placeholder="موضوع التكليف"
                                    />
                                    {errors.subject && <span className="text-red-500 text-xs font-bold">هذا الحقل مطلوب</span>}
                                </div>
                                <div className="flex flex-col gap-2">
                                    <label className="text-sm font-bold text-gray-700 dark:text-gray-300">الرقم</label>
                                    <input 
                                        type="text" 
                                        {...register("decision_number")}
                                        className="w-full px-4 py-2.5 bg-white dark:bg-slate-900 text-gray-900 dark:text-white border-2 border-gray-200 dark:border-slate-700 rounded-xl focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10 outline-none transition-all"
                                    />
                                </div>
                                <div className="flex flex-col gap-2">
                                    <label className="text-sm font-bold text-gray-700 dark:text-gray-300">ملخص القرار</label>
                                    <input 
                                        type="text" 
                                        {...register("decision_summary")}
                                        className="w-full px-4 py-2.5 bg-white dark:bg-slate-900 text-gray-900 dark:text-white border-2 border-gray-200 dark:border-slate-700 rounded-xl focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10 outline-none transition-all"
                                    />
                                </div>
                                <div className="flex flex-col gap-2">
                                    <label className="text-sm font-bold text-gray-700 dark:text-gray-300">مصدر القرار</label>
                                    <input 
                                        type="text" 
                                        {...register("decision_source")}
                                        className="w-full px-4 py-2.5 bg-white dark:bg-slate-900 text-gray-900 dark:text-white border-2 border-gray-200 dark:border-slate-700 rounded-xl focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10 outline-none transition-all"
                                    />
                                </div>
                                <div className="flex flex-col gap-2 relative z-[90]">
                                    <label className="text-sm font-bold text-gray-700 dark:text-gray-300">اسم القسم <span className="text-red-500">*</span></label>
                                    <RelationSelect 
                                        resource="Structures" 
                                        fieldName="department_id" 
                                        control={control} 
                                        required={true} 
                                        placeholder="اختر القسم الموجه إليه" 
                                    />
                                    {errors.department_id && <span className="text-red-500 text-xs font-bold">هذا الحقل مطلوب</span>}
                                </div>
                            </div>

                            <div className="space-y-6 flex flex-col pl-2">
                                <div className="flex flex-col gap-2">
                                    <label className="text-sm font-bold text-gray-700 dark:text-gray-300">التاريخ</label>
                                    <DatePickerField control={control} name="decision_date" placeholder="تاريخ القرار" />
                                </div>
                                <div className="flex w-full gap-4">
                                    <div className="flex-1 flex flex-col gap-2">
                                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300">اعتبار من تاريخ</label>
                                        <DatePickerField control={control} name="effective_from" placeholder="تاريخ البداية" />
                                    </div>
                                    <div className="flex-1 flex flex-col gap-2">
                                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300">إلى تاريخ</label>
                                        <DatePickerField control={control} name="effective_to" placeholder="تاريخ النهاية" />
                                    </div>
                                </div>
                                <div className="flex flex-col gap-2 pt-2 relative z-[80]">
                                    <label className="text-sm font-bold text-gray-700 dark:text-gray-300">اسم الوظيفة المدخلة <span className="text-red-500">*</span></label>
                                    <RelationSelect 
                                        resource="Employees" 
                                        fieldName="job_id" 
                                        control={control} 
                                        required={true} 
                                        placeholder="اختر الوظيفة الصحيحة" 
                                    />
                                    {errors.job_id && <span className="text-red-500 text-xs font-bold">هذا الحقل مطلوب</span>}
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="px-6 py-4 bg-gray-50 dark:bg-slate-800/80 border-t border-gray-100 dark:border-slate-800 flex flex-row-reverse items-center justify-between shrink-0">
                        <div className="flex items-center gap-3">
                            <button
                                type="button"
                                onClick={() => !isSubmitting && onClose()}
                                disabled={isSubmitting}
                                className="px-6 py-2.5 text-sm font-bold text-white bg-rose-600 hover:bg-rose-700 rounded-xl transition-all disabled:opacity-50"
                            >
                                إغلاق
                            </button>
                            <button
                                type="submit"
                                disabled={isSubmitting}
                                className="flex items-center justify-center gap-2 px-6 py-2.5 bg-teal-500 hover:bg-teal-600 text-white rounded-xl text-sm font-bold transition-all disabled:opacity-50 min-w-[100px]"
                            >
                                {isSubmitting ? (
                                    <div className="w-5 h-5 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                                ) : (
                                    <Check size={18} />
                                )}
                                {uploadingState ? "جاري الرفع..." : "حفظ"}
                            </button>
                        </div>
                        <div className="flex items-center justify-center gap-2 flex-1 sm:flex-none">
                            {(file || (initialData?.attachment && !removedAttachment)) && (
                                <button
                                    type="button"
                                    onClick={() => {
                                        setFile(null);
                                        setRemovedAttachment(true);
                                    }}
                                    className="p-2 text-rose-500 bg-rose-50 hover:bg-rose-100 dark:bg-rose-900/30 dark:hover:bg-rose-900/50 rounded-xl transition-colors shrink-0"
                                    title="حذف المرفق"
                                >
                                    <X size={20} />
                                </button>
                            )}
                            <label className="flex items-center justify-center gap-2 px-6 py-2.5 bg-slate-200 dark:bg-slate-700 hover:bg-slate-300 dark:hover:bg-slate-600 text-gray-800 dark:text-white rounded-xl text-sm font-bold transition-colors cursor-pointer border shadow-sm border-transparent hover:border-slate-400 w-full sm:w-auto">
                                <Paperclip size={18} className="rotate-45" />
                                <span className="truncate max-w-[150px]">
                                    {file ? file.name : (initialData?.attachment && !removedAttachment ? "مرفق حالي (تغيير؟)" : "إضافة/تغيير المرفق")}
                                </span>
                                <input type="file" className="hidden" onChange={(e) => {
                                    if (e.target.files?.[0]) {
                                        setFile(e.target.files[0]);
                                        setRemovedAttachment(false);
                                    }
                                }} />
                            </label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    );
};
