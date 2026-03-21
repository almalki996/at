import React, { useState, useEffect } from "react";
import { Users, FileText, Briefcase, Award, X, Check } from "lucide-react";
import { useCreate, useUpdate } from "@refinedev/core";
import toast from "react-hot-toast";
import { GeneralInfoTab } from "./tabs/GeneralInfoTab";
import { AssignmentsTab } from "./tabs/AssignmentsTab";
import { QualificationsTab } from "./tabs/QualificationsTab";

interface PersonnelEditModalProps {
    isOpen: boolean;
    onClose: () => void;
    itemToEdit: any;
    onSuccess: () => void;
    jobs: any[];
    assignmentsList: any[];
    qualificationsList: any[];
    structuresMap: Map<string | number, any>;
    onAddAssignment: () => void;
    onEditAssignment: (ass: any) => void;
    onDeleteAssignment: (ass: any) => void;
    onAddQualification: () => void;
    onEditQualification: (qual: any) => void;
    onDeleteQualification: (qual: any) => void;
    onPreview: (url: string) => void;
}

export const PersonnelEditModal: React.FC<PersonnelEditModalProps> = ({
    isOpen,
    onClose,
    itemToEdit,
    onSuccess,
    jobs,
    assignmentsList,
    qualificationsList,
    structuresMap,
    onAddAssignment,
    onEditAssignment,
    onDeleteAssignment,
    onAddQualification,
    onEditQualification,
    onDeleteQualification,
    onPreview
}) => {
    const [editTab, setEditTab] = useState<"general" | "assignments" | "qualifications">("general");
    const [formData, setFormData] = useState<any>({});
    const [isSubmitting, setIsSubmitting] = useState(false);

    const { mutate: createRecord } = useCreate();
    const { mutate: updateRecord } = useUpdate();

    useEffect(() => {
        if (isOpen) {
            setEditTab("general");
            if (itemToEdit) {
                setFormData({ ...itemToEdit });
            } else {
                setFormData({});
            }
        }
    }, [isOpen, itemToEdit]);

    const handleSavePersonnel = () => {
        if (!formData.name || !formData.email) {
            toast.error("يرجى تعبئة الحقول الإلزامية");
            return;
        }

        setIsSubmitting(true);
        const { id, date_created, date_updated, status, user_created, user_updated, ...payload } = formData;
        
        // Ensure strictly required numeric fields or related fields are integers or nulls, etc if needed.
        if (payload.primary_job_id && typeof payload.primary_job_id === 'object') {
            payload.primary_job_id = payload.primary_job_id.id;
        }

        if (itemToEdit) {
            updateRecord({
                resource: "Personnel",
                id: itemToEdit.id,
                values: payload,
                successNotification: false,
                errorNotification: false
            }, {
                onSuccess: () => {
                    toast.success("تم تحديث بيانات الموظف بنجاح🎉");
                    onSuccess();
                    onClose();
                },
                onError: (error) => toast.error(error.message || "حدث خطأ أثناء التحديث")
            });
        } else {
            createRecord({
                resource: "Personnel",
                values: { ...payload, is_active: payload.is_active ?? true },
                successNotification: false,
                errorNotification: false
            }, {
                onSuccess: () => {
                    toast.success("تم إضافة الموظف بنجاح🎉");
                    onSuccess();
                    onClose();
                },
                onError: (error) => toast.error(error.message || "حدث خطأ أثناء الإضافة")
            });
        }
        setIsSubmitting(false);
    };

    if (!isOpen) return null;

    return (
        <div 
            className="fixed inset-0 z-[100] flex items-center justify-center p-4 bg-slate-900/50 backdrop-blur-sm animate-in fade-in duration-200"
            onClick={(e) => {
                if (e.target === e.currentTarget && !isSubmitting) onClose();
            }}
        >
            <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-xl w-full max-w-4xl flex flex-col max-h-[90vh] overflow-hidden border border-gray-100 dark:border-slate-800 animate-in zoom-in-95 duration-200">
                <div className="px-6 py-5 border-b border-gray-100 dark:border-slate-800 bg-white dark:bg-slate-900 flex items-center justify-between shrink-0">
                    <h3 className="text-xl font-black text-gray-800 dark:text-white flex items-center gap-2">
                        <Users size={24} className="text-teal-600 dark:text-teal-400" />
                        {itemToEdit ? "تعديل الموظف" : "إضافة موظف جديد"}
                    </h3>
                    <button 
                        onClick={() => !isSubmitting && onClose()} 
                        className="text-gray-400 hover:text-rose-500 transition-colors bg-gray-50 hover:bg-rose-50 p-2 rounded-xl"
                        disabled={isSubmitting}
                    >
                        <X size={20} />
                    </button>
                </div>

                <div className="p-6 overflow-y-auto custom-scrollbar bg-gray-50/30 dark:bg-slate-900/50 flex flex-col gap-6">
                    <div className="flex bg-gray-100 dark:bg-slate-800/50 p-1 rounded-xl w-fit border border-gray-200 dark:border-slate-700">
                        <button
                            onClick={() => setEditTab("general")}
                            className={`flex items-center gap-2 px-6 py-2.5 rounded-lg text-sm font-bold transition-all ${editTab === "general" ? 'bg-white dark:bg-slate-700 text-teal-600 dark:text-teal-400 shadow-sm' : 'text-gray-500 dark:text-slate-400 hover:text-gray-700 dark:hover:text-slate-200'}`}
                        >
                            <FileText size={16} /> أساسية
                        </button>
                        <button
                            onClick={() => setEditTab("assignments")}
                            className={`flex items-center gap-2 px-6 py-2.5 rounded-lg text-sm font-bold transition-all ${editTab === "assignments" ? 'bg-white dark:bg-slate-700 text-teal-600 dark:text-teal-400 shadow-sm' : 'text-gray-500 dark:text-slate-400 hover:text-gray-700 dark:hover:text-slate-200'}`}
                        >
                            <Briefcase size={16} /> تكليفات
                        </button>
                        <button
                            onClick={() => setEditTab("qualifications")}
                            className={`flex items-center gap-2 px-6 py-2.5 rounded-lg text-sm font-bold transition-all ${editTab === "qualifications" ? 'bg-white dark:bg-slate-700 text-teal-600 dark:text-teal-400 shadow-sm' : 'text-gray-500 dark:text-slate-400 hover:text-gray-700 dark:hover:text-slate-200'}`}
                        >
                            <Award size={16} /> دورات
                        </button>
                    </div>

                    <div className="flex-1 min-h-[400px]">
                        {editTab === "general" && (
                            <GeneralInfoTab 
                                formData={formData} 
                                setFormData={setFormData} 
                                jobs={jobs} 
                                structures={structuresMap ? Array.from(structuresMap.values()) : []}
                            />
                        )}

                        {editTab === "assignments" && (
                            itemToEdit ? (
                                <AssignmentsTab 
                                    assignmentsList={assignmentsList}
                                    itemToEdit={itemToEdit}
                                    structuresMap={structuresMap}
                                    onAddAssignment={onAddAssignment}
                                    onDeleteAssignment={onDeleteAssignment}
                                    onEditAssignment={onEditAssignment}
                                    onPreview={onPreview}
                                />
                            ) : (
                                <div className="flex flex-col items-center justify-center p-12 text-center bg-white dark:bg-slate-800 rounded-2xl border border-gray-200 dark:border-slate-700 h-full">
                                    <div className="w-16 h-16 bg-gray-50 dark:bg-slate-800/50 rounded-full flex items-center justify-center mb-4 border border-gray-100 dark:border-slate-700">
                                        <Briefcase size={28} className="text-gray-400" />
                                    </div>
                                    <h4 className="text-lg font-bold text-gray-800 dark:text-white mb-2">قم بحفظ الموظف أولاً</h4>
                                    <p className="text-sm text-gray-500 dark:text-slate-400 max-w-sm">الرجاء حفظ البيانات الأساسية للموظف الجديد لتتمكن من إضافة وإدارة سجلات التكليفات الخاصة به.</p>
                                </div>
                            )
                        )}

                        {editTab === "qualifications" && (
                            itemToEdit ? (
                                <QualificationsTab 
                                    qualificationsList={qualificationsList}
                                    itemToEdit={itemToEdit}
                                    onAddQualification={onAddQualification}
                                    onEditQualification={onEditQualification}
                                    onDeleteQualification={onDeleteQualification}
                                    onPreview={onPreview}
                                />
                            ) : (
                                <div className="flex flex-col items-center justify-center p-12 text-center bg-white dark:bg-slate-800 rounded-2xl border border-gray-200 dark:border-slate-700 h-full">
                                    <div className="w-16 h-16 bg-gray-50 dark:bg-slate-800/50 rounded-full flex items-center justify-center mb-4 border border-gray-100 dark:border-slate-700">
                                        <Award size={28} className="text-gray-400" />
                                    </div>
                                    <h4 className="text-lg font-bold text-gray-800 dark:text-white mb-2">قم بحفظ الموظف أولاً</h4>
                                    <p className="text-sm text-gray-500 dark:text-slate-400 max-w-sm">الرجاء حفظ البيانات الأساسية للموظف الجديد لتتمكن من إضافة وإدارة الدورات والمؤهلات الخاصة به.</p>
                                </div>
                            )
                        )}
                    </div>
                </div>

                <div className="px-6 py-4 border-t border-gray-100 dark:border-slate-800 bg-white dark:bg-slate-900 flex items-center justify-end shrink-0">
                    <div className="flex items-center gap-3 w-full sm:w-auto">
                        <button
                            onClick={() => !isSubmitting && onClose()}
                            disabled={isSubmitting}
                            className="flex-1 sm:flex-none px-6 py-2.5 text-sm font-bold text-slate-500 hover:text-slate-700 hover:bg-slate-100 dark:hover:bg-slate-800 rounded-xl transition-all disabled:opacity-50"
                        >
                            إلغاء
                        </button>
                        <button
                            onClick={handleSavePersonnel}
                            disabled={isSubmitting}
                            className="flex-1 sm:flex-none flex items-center justify-center gap-2 px-8 py-2.5 bg-teal-500 hover:bg-teal-600 text-white rounded-xl text-sm font-bold shadow-md shadow-teal-500/20 transition-all disabled:opacity-50"
                        >
                            {isSubmitting ? <div className="w-5 h-5 border-2 border-white/30 border-t-white rounded-full animate-spin" /> : <Check size={18} />}
                            حفظ
                        </button>
                    </div>
                </div>
            </div>
        </div>
    );
};
