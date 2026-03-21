import React from "react";
import { Award, Plus, Edit, Trash2, Paperclip } from "lucide-react";
import { getPreviewUrl } from "../utils";

interface QualificationsTabProps {
    qualificationsList: any[];
    itemToEdit: any;
    onAddQualification: () => void;
    onEditQualification: (qual: any) => void;
    onDeleteQualification: (qual: any) => void;
    onPreview: (url: string) => void;
}

export const QualificationsTab: React.FC<QualificationsTabProps> = ({
    qualificationsList,
    itemToEdit,
    onAddQualification,
    onEditQualification,
    onDeleteQualification,
    onPreview
}) => {
    return (
        <div className="space-y-4">
            <div className="flex items-center justify-between">
                <h4 className="font-bold text-gray-800 dark:text-white flex items-center gap-2">
                    <Award size={18} className="text-blue-500" /> إدارة الدورات والتطوير
                </h4>
                <button 
                    type="button"
                    onClick={onAddQualification} 
                    className="flex items-center gap-2 px-3 py-1.5 bg-blue-50 hover:bg-blue-100 dark:bg-blue-900/30 dark:hover:bg-blue-900/50 text-blue-700 dark:text-blue-400 rounded-lg text-sm font-bold transition-colors"
                >
                    <Plus size={16} /> إضافة دورة
                </button>
            </div>
            
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                {qualificationsList.filter(q => q.personnel_id === itemToEdit.id).length > 0 ? (
                    qualificationsList.filter(q => q.personnel_id === itemToEdit.id).map(qual => (
                        <div key={qual.id} className="flex flex-col p-4 bg-indigo-50/50 dark:bg-indigo-900/10 border border-indigo-100 dark:border-indigo-800/30 rounded-lg relative group">
                            {qual.attachment && (
                                <div className="absolute top-3 left-3">
                                    <button 
                                        type="button" 
                                        onClick={() => onPreview(getPreviewUrl(qual.attachment)!)} 
                                        className="text-indigo-400 hover:text-indigo-600 bg-white dark:bg-slate-800 hover:bg-indigo-50 dark:hover:bg-indigo-900/30 p-1.5 rounded-md shadow-sm border border-gray-100 dark:border-slate-700 transition-colors flex items-center gap-1" 
                                        title="عرض المرفق"
                                    >
                                        <Paperclip size={14} />
                                    </button>
                                </div>
                            )}
                            <div className="font-bold text-indigo-900 dark:text-indigo-300 mb-1 pr-6">{qual.course_name}</div>
                            <div className="text-sm text-indigo-600/70 dark:text-indigo-400/70 font-medium flex items-center gap-1 mb-1">
                                الجهة: <span className="text-slate-700 dark:text-slate-300">{qual.training_entity || "-"}</span>
                            </div>
                            {qual.score && (
                                <div className="text-sm text-indigo-600/70 dark:text-indigo-400/70 font-medium flex items-center gap-1 mb-3">
                                    الدرجة: <span className="text-slate-700 dark:text-slate-300">{qual.score}</span>
                                </div>
                            )}
                            <div className="pt-3 border-t border-indigo-100/50 dark:border-indigo-800/30 mt-auto flex items-center justify-between text-xs text-indigo-500 dark:text-indigo-400 font-mono">
                                <span>من: {qual.start_date ? qual.start_date.split('T')[0] : "-"}</span>
                                <span>إلى: {qual.end_date ? qual.end_date.split('T')[0] : "-"}</span>
                            </div>
                            
                            <div className="absolute top-3 right-3 opacity-0 group-hover:opacity-100 transition-opacity flex items-center gap-1 rtl:right-auto rtl:left-3 mt-10">
                                <button 
                                    type="button"
                                    onClick={() => onEditQualification(qual)} 
                                    className="p-1.5 bg-white dark:bg-slate-800 text-gray-500 hover:text-teal-600 dark:hover:text-teal-400 rounded-md shadow-sm border border-gray-100 dark:border-slate-700" 
                                    title="تعديل"
                                >
                                    <Edit size={14} />
                                </button>
                                <button 
                                    type="button"
                                    onClick={() => onDeleteQualification(qual)} 
                                    className="p-1.5 bg-white dark:bg-slate-800 text-gray-500 hover:text-rose-600 dark:hover:text-rose-400 rounded-md shadow-sm border border-gray-100 dark:border-slate-700" 
                                    title="حذف"
                                >
                                    <Trash2 size={14} />
                                </button>
                            </div>
                        </div>
                    ))
                ) : (
                    <div className="col-span-full py-8 text-center text-gray-500 dark:text-slate-400">لا يوجد دورات مسجلة</div>
                )}
            </div>
        </div>
    );
};
