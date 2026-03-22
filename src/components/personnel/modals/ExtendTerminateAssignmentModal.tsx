import React, { useState, useEffect } from "react";
import { Copy, Plus, X, Hand, Paperclip, Check } from "lucide-react";
import { useUpdate } from "@refinedev/core";
import toast from "react-hot-toast";
import { uploadFile } from "../utils";

interface ExtendTerminateAssignmentModalProps {
    isOpen: boolean;
    onClose: () => void;
    mode: "extend" | "terminate";
    assignment: any;
    onSuccess: () => void;
}

export const ExtendTerminateAssignmentModal: React.FC<ExtendTerminateAssignmentModalProps> = ({
    isOpen,
    onClose,
    mode,
    assignment,
    onSuccess
}) => {
    const [formData, setFormData] = useState<any>({});
    const [file, setFile] = useState<File | null>(null);
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [uploadingState, setUploadingState] = useState(false);

    const { mutate: updateRecord } = useUpdate();

    useEffect(() => {
        if (isOpen && assignment) {
            setFormData({
                effective_to: mode === "extend" ? "" : assignment.effective_to?.split('T')[0] || ""
            });
            setFile(null);
        }
    }, [isOpen, assignment, mode]);

    const handleSave = async () => {
        if (mode === "extend" && !formData.effective_to) {
            toast.error("يرجى تحديد تاريخ نهاية التمديد");
            return;
        }

        setIsSubmitting(true);
        try {
            let attachmentId = null;
            if (file) {
                setUploadingState(true);
                attachmentId = await uploadFile(file);
                setUploadingState(false);
            }

            const payload: any = {
                effective_to: formData.effective_to === "" ? null : formData.effective_to
            };

            if (attachmentId) payload.attachment = attachmentId;

            updateRecord({
                resource: "Employee_Assignments",
                id: assignment.id,
                values: payload,
                successNotification: false,
                errorNotification: false
            }, {
                onSuccess: () => {
                    toast.success(mode === "extend" ? "تم تمديد التكليف بنجاح" : "تم إنهاء التكليف بنجاح");
                    onSuccess();
                    onClose();
                },
                onError: (error) => toast.error(error.message || "حدث خطأ أثناء حفظ التعديلات")
            });
        } catch (e) {
            setUploadingState(false);
            toast.error("حدث خطأ أثناء رفع المرفق");
        } finally {
            setIsSubmitting(false);
        }
    };

    if (!isOpen || !assignment) return null;

    const isTerminate = mode === "terminate";

    return (
        <div 
            className="fixed inset-0 z-[120] flex items-center justify-center p-4 bg-slate-900/50 backdrop-blur-sm animate-in fade-in duration-200"
            onClick={(e) => {
                if (e.target === e.currentTarget && !isSubmitting) onClose();
            }}
        >
            <div className={`bg-white dark:bg-slate-900 rounded-xl shadow-xl w-full max-w-lg flex flex-col overflow-hidden animate-in zoom-in-95 duration-200 border ${isTerminate ? 'border-rose-200 dark:border-rose-900/50' : 'border-slate-200 dark:border-slate-800'}`}>
                <div className={`px-6 py-4 flex items-center justify-between shrink-0 ${isTerminate ? 'bg-rose-50 dark:bg-rose-900/20' : 'bg-indigo-50 dark:bg-slate-800'}`}>
                    <h3 className={`text-lg font-bold flex items-center gap-2 ${isTerminate ? 'text-rose-700 dark:text-rose-400' : 'text-indigo-700 dark:text-white'}`}>
                        {isTerminate ? <Hand size={20} /> : <Copy size={20} />}
                        {isTerminate ? "إنهاء التكليف" : "تمديد التكليف"}
                    </h3>
                    <button onClick={() => !isSubmitting && onClose()} className={`${isTerminate ? 'text-rose-400 hover:text-rose-600' : 'text-slate-400 hover:text-slate-600 dark:hover:text-white'} transition-colors`}>
                        <X size={20} />
                    </button>
                </div>
                <div className="p-6 overflow-y-auto space-y-4">
                    <div className="bg-slate-50 dark:bg-slate-800/50 p-4 rounded-xl border border-slate-100 dark:border-slate-700">
                        <p className="text-sm text-slate-500 dark:text-slate-400 mb-1">الموضوع</p>
                        <p className="font-bold text-slate-800 dark:text-slate-200">{assignment.subject}</p>
                    </div>

                    <div className="flex flex-col gap-2">
                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300">
                            {isTerminate ? "تاريخ الإنهاء الفعلي" : "تاريخ النهاية الجديد"}
                        </label>
                        <input 
                            type="date" 
                            className={`w-full px-4 py-2.5 bg-white dark:bg-slate-900 text-gray-900 dark:text-white border-2 rounded-xl outline-none transition-all ${isTerminate ? 'border-rose-200 dark:border-rose-900/50 focus:border-rose-500 focus:ring-4 focus:ring-rose-500/10' : 'border-gray-200 dark:border-slate-700 focus:border-indigo-500 focus:ring-4 focus:ring-indigo-500/10'}`}
                            value={formData.effective_to || ""}
                            onChange={(e) => setFormData({...formData, effective_to: e.target.value})}
                            lang="en-US"
                            dir="ltr"
                        />
                        {isTerminate && (
                            <p className="text-xs text-rose-500 mt-1">
                                سيتم تغيير حالة التكليف إلى منتهي بهذا التاريخ.
                            </p>
                        )}
                    </div>
                </div>

                <div className={`px-6 py-4 border-t flex flex-row-reverse items-center justify-between shrink-0 ${isTerminate ? 'bg-rose-50/50 dark:bg-rose-900/10 border-rose-100 dark:border-rose-900/30' : 'bg-gray-50 dark:bg-slate-800/80 border-gray-100 dark:border-slate-800'}`}>
                    <div className="flex items-center gap-3">
                        <button
                            onClick={() => !isSubmitting && onClose()}
                            disabled={isSubmitting || uploadingState}
                            className="px-6 py-2.5 text-sm font-bold text-slate-500 hover:text-slate-700 hover:bg-slate-200 dark:hover:bg-slate-700 rounded-xl transition-all disabled:opacity-50"
                        >
                            إلغاء
                        </button>
                        <button
                            onClick={handleSave}
                            disabled={isSubmitting || uploadingState}
                            className={`flex items-center justify-center gap-2 px-6 py-2.5 text-white rounded-xl text-sm font-bold transition-all disabled:opacity-50 min-w-[100px] ${isTerminate ? 'bg-rose-600 hover:bg-rose-700' : 'bg-indigo-500 hover:bg-indigo-600'}`}
                        >
                            {(isSubmitting || uploadingState) ? (
                                <div className="w-5 h-5 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                            ) : (
                                <Check size={18} />
                            )}
                            {uploadingState ? "جاري الرفع..." : (isTerminate ? "تأكيد الإنهاء" : "تأكيد التمديد")}
                        </button>
                    </div>
                    <label className="flex items-center justify-center gap-2 px-6 py-2.5 bg-slate-300 dark:bg-slate-700 hover:bg-slate-400 dark:hover:bg-slate-600 text-gray-800 dark:text-white rounded-xl text-sm font-medium transition-colors cursor-pointer border border-transparent hover:border-slate-500">
                        <Paperclip size={18} className="rotate-45" />
                        <span className="truncate max-w-[150px]">{file ? file.name : "إضافة قرار"}</span>
                        <input type="file" className="hidden" onChange={(e) => {
                            if (e.target.files?.[0]) setFile(e.target.files[0]);
                        }} />
                    </label>
                </div>
            </div>
        </div>
    );
};
