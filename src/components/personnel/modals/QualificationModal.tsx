import React, { useState, useEffect } from "react";
import { Check, Paperclip, X } from "lucide-react";
import { useForm } from "@refinedev/react-hook-form";
import toast from "react-hot-toast";
import { uploadFile } from "../utils";
import { DatePickerField } from "../../generic/date-picker";

interface QualificationModalProps {
    isOpen: boolean;
    onClose: () => void;
    initialData?: any;
    personnelId: string | number;
    onSuccess: () => void;
}

export const QualificationModal: React.FC<QualificationModalProps> = ({ isOpen, onClose, initialData, personnelId, onSuccess }) => {
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
            resource: "Employee_Qualifications",
            action: initialData ? "edit" : "create",
            id: initialData?.id,
            redirect: false,
            successNotification: false,
            errorNotification: false,
            onMutationSuccess: () => {
                toast.success(initialData ? "تم التعديل بنجاح" : "تم الإضافة بنجاح");
                onSuccess();
                onClose();
            },
            onMutationError: (error) => {
                toast.error(error?.message || "حدث خطأ في التسجيل");
            }
        }
    });

    useEffect(() => {
        if (isOpen) {
            setFile(null);
            setRemovedAttachment(false);
            if (initialData) {
                reset({
                    course_name: initialData.course_name,
                    training_entity: initialData.training_entity,
                    start_date: initialData.start_date?.split('T')[0] || "",
                    end_date: initialData.end_date?.split('T')[0] || "",
                    score: initialData.score || ""
                });
            } else {
                reset({ course_name: "", training_entity: "", start_date: "", end_date: "", score: "" });
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
            } catch (uploadError) {
                toast.error("حدث خطأ أثناء رفع المرفق");
                setUploadingState(false);
                return; // Stop submittal if upload fails
            }
            setUploadingState(false);
        }

        const sanitizedData = Object.fromEntries(
            Object.entries(data).map(([k, v]) => [k, v === "" ? null : v])
        );
        
        // Ensure score is sent as an integer (Directus bigint type constraint)
        if (sanitizedData.score) {
            const parsedScore = parseInt(sanitizedData.score as string, 10);
            if (isNaN(parsedScore)) {
                toast.error("يجب أن تكون الدرجة / التقدير رقماً صحيحاً فقط.");
                return;
            }
            sanitizedData.score = parsedScore;
        }

        setUploadingState(true); // Show loader for API call
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
            <div className="bg-slate-800 dark:bg-slate-900 rounded-xl shadow-xl w-full max-w-lg flex flex-col overflow-hidden animate-in zoom-in-95 duration-200 border border-slate-700">
                <div className="px-6 py-4 bg-slate-800 flex items-center justify-between shrink-0">
                    <h3 className="text-lg font-bold text-white">تأهيل جديد</h3>
                    <button onClick={() => !isSubmitting && onClose()} className="text-slate-400 hover:text-white transition-colors">
                        <X size={20} />
                    </button>
                </div>
                
                <form onSubmit={handleSubmit(onSubmit)} className="contents">
                    <div className="p-6 bg-white dark:bg-slate-900 overflow-y-auto space-y-4">
                        <div className="flex flex-col gap-2">
                            <label className="text-sm font-bold text-gray-700 dark:text-gray-300">اسم الدورة <span className="text-red-500">*</span></label>
                            <input 
                                type="text"
                                {...register("course_name", { required: true })}
                                className={`w-full px-4 py-2.5 bg-white dark:bg-slate-900 text-gray-900 dark:text-white border-2 rounded-xl focus:ring-4 outline-none transition-all ${errors.course_name ? 'border-red-400 focus:border-red-500 focus:ring-red-500/10' : 'border-gray-200 dark:border-slate-700 focus:border-indigo-500 focus:ring-indigo-500/10'}`}
                            />
                            {errors.course_name && <span className="text-red-500 text-xs font-bold">هذا الحقل مطلوب</span>}
                        </div>
                        <div className="flex flex-col gap-2">
                            <label className="text-sm font-bold text-gray-700 dark:text-gray-300">الجهة المدربة</label>
                            <input 
                                type="text" 
                                {...register("training_entity")}
                                className="w-full px-4 py-2.5 bg-white dark:bg-slate-900 text-gray-900 dark:text-white border-2 border-gray-200 dark:border-slate-700 rounded-xl focus:border-indigo-500 focus:ring-4 focus:ring-indigo-500/10"
                            />
                        </div>
                        <div className="flex flex-col gap-2">
                            <label className="text-sm font-bold text-gray-700 dark:text-gray-300">الدرجة / التقدير (رقمي)</label>
                            <input 
                                type="number" 
                                {...register("score")}
                                className="w-full px-4 py-2.5 bg-white dark:bg-slate-900 text-gray-900 dark:text-white border-2 border-gray-200 dark:border-slate-700 rounded-xl focus:border-indigo-500 focus:ring-4 focus:ring-indigo-500/10"
                            />
                        </div>
                        <div className="flex gap-4">
                            <div className="flex-1 flex flex-col gap-2">
                                <label className="text-sm font-bold text-gray-700 dark:text-gray-300">تاريخ البداية</label>
                                <DatePickerField control={control} name="start_date" placeholder="تاريخ البدء" />
                            </div>
                            <div className="flex-1 flex flex-col gap-2">
                                <label className="text-sm font-bold text-gray-700 dark:text-gray-300">تاريخ النهاية</label>
                                <DatePickerField control={control} name="end_date" placeholder="تاريخ النهاية" />
                            </div>
                        </div>
                    </div>
                    <div className="px-6 py-4 bg-gray-50 dark:bg-slate-800/80 border-t border-gray-100 dark:border-slate-800 flex flex-row-reverse items-center justify-between shrink-0">
                        <div className="flex items-center gap-3">
                            <button type="button" onClick={() => !isSubmitting && onClose()} disabled={isSubmitting} className="px-6 py-2.5 text-sm font-bold text-slate-500 hover:text-slate-700 hover:bg-slate-200 dark:hover:bg-slate-700 rounded-xl transition-all disabled:opacity-50">إلغاء</button>
                            <button type="submit" disabled={isSubmitting} className="flex items-center justify-center gap-2 px-6 py-2.5 bg-indigo-500 hover:bg-indigo-600 text-white rounded-xl text-sm font-bold transition-all disabled:opacity-50 min-w-[100px]">
                                {isSubmitting ? <div className="w-5 h-5 border-2 border-white/30 border-t-white rounded-full animate-spin" /> : <Check size={18} />}
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
                                <input 
                                    type="file" 
                                    className="hidden" 
                                    onChange={(e) => {
                                        if (e.target.files?.[0]) {
                                            setFile(e.target.files[0]);
                                            setRemovedAttachment(false);
                                        }
                                    }} 
                                />
                            </label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    );
};
