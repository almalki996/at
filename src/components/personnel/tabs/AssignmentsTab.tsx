import React from "react";
import { Briefcase, Plus, Edit, Trash2, Paperclip } from "lucide-react";
import { getPreviewUrl } from "../utils";

interface AssignmentsTabProps {
    assignmentsList: any[];
    itemToEdit: any;
    structuresMap: Map<string | number, any>;
    onAddAssignment: () => void;
    onEditAssignment: (ass: any) => void;
    onDeleteAssignment: (ass: any) => void;
    onPreview: (url: string) => void;
}

export const AssignmentsTab: React.FC<AssignmentsTabProps> = ({
    assignmentsList,
    itemToEdit,
    structuresMap,
    onAddAssignment,
    onEditAssignment,
    onDeleteAssignment,
    onPreview
}) => {
    const getStatusBadge = (effectiveTo: string | null | undefined) => {
        if (!effectiveTo) return <span className="bg-emerald-50 dark:bg-emerald-900/30 text-emerald-600 dark:text-emerald-400 px-2.5 py-1 rounded-lg text-xs font-bold ring-1 ring-emerald-600/20">مستمر</span>;
        const toDate = new Date(effectiveTo);
        const today = new Date();
        today.setHours(0, 0, 0, 0); // Ignore time
        if (toDate < today) {
            return <span className="bg-rose-50 dark:bg-rose-900/30 text-rose-600 dark:text-rose-400 px-2.5 py-1 rounded-lg text-xs font-bold ring-1 ring-rose-600/20">منتهي</span>;
        }
        return <span className="bg-teal-50 dark:bg-teal-900/30 text-teal-600 dark:text-teal-400 px-2.5 py-1 rounded-lg text-xs font-bold ring-1 ring-teal-600/20">ساري</span>;
    };

    return (
        <div className="space-y-4">
            <div className="flex items-center justify-between">
                <h4 className="font-bold text-gray-800 dark:text-white flex items-center gap-2">
                    <Briefcase size={18} className="text-teal-500" /> إدارة سجل التكليفات
                </h4>
                <button 
                    type="button"
                    onClick={onAddAssignment} 
                    className="flex items-center gap-2 px-3 py-1.5 bg-teal-50 hover:bg-teal-100 dark:bg-teal-900/30 dark:hover:bg-teal-900/50 text-teal-700 dark:text-teal-400 rounded-lg text-sm font-bold transition-colors"
                >
                    <Plus size={16} /> إضافة تكليف
                </button>
            </div>
            <div className="overflow-x-auto rounded-lg border border-gray-100 dark:border-slate-700 bg-white dark:bg-slate-800">
                <table className="w-full text-sm text-right">
                    <thead className="bg-gray-50 dark:bg-slate-700/50 text-gray-600 dark:text-slate-300 font-medium border-b border-gray-200 dark:border-slate-700">
                        <tr>
                            <th className="px-4 py-3 border-r border-gray-200/50 dark:border-slate-700/50">الموضوع</th>
                            <th className="px-4 py-3 border-r border-gray-200/50 dark:border-slate-700/50">القسم الوظيفي</th>
                            <th className="px-4 py-3 border-r border-gray-200/50 dark:border-slate-700/50 w-28 text-center">تاريخ النهاية</th>
                            <th className="px-4 py-3 border-r border-gray-200/50 dark:border-slate-700/50 w-20 text-center">الحالة</th>
                            <th className="px-4 py-3 border-r border-gray-200/50 dark:border-slate-700/50 w-16 text-center">المرفقات</th>
                            <th className="px-4 py-3 border-r border-gray-200/50 dark:border-slate-700/50 w-24 text-center">الإجراء</th>
                        </tr>
                    </thead>
                    <tbody className="divide-y divide-gray-100 dark:divide-slate-700/50">
                        {assignmentsList.filter(a => a.personnel_id === itemToEdit.id).length > 0 ? (
                            assignmentsList.filter(a => a.personnel_id === itemToEdit.id).map(ass => (
                                <tr key={ass.id} className="hover:bg-gray-50/50 dark:hover:bg-slate-700/30 text-gray-700 dark:text-slate-300">
                                    <td className="px-4 py-3 font-medium border-r border-gray-100/50 dark:border-slate-700/30">{ass.subject}</td>
                                    <td className="px-4 py-3 border-r border-gray-100/50 dark:border-slate-700/30">{structuresMap?.get(typeof ass.department_id === 'object' ? ass.department_id?.id : ass.department_id)?.name || "غير محدد"}</td>
                                    <td className="px-4 py-3 border-r border-gray-100/50 dark:border-slate-700/30 text-center font-medium" dir="ltr">{ass.effective_to ? new Date(ass.effective_to).toLocaleDateString("ar-SA") : "-"}</td>
                                    <td className="px-4 py-3 border-r border-gray-100/50 dark:border-slate-700/30 text-center">
                                        {getStatusBadge(ass.effective_to)}
                                    </td>
                                    <td className="px-4 py-3 border-r border-gray-100/50 dark:border-slate-700/30 text-center">
                                        {ass.attachment ? (
                                            <button 
                                                type="button" 
                                                onClick={() => onPreview(getPreviewUrl(ass.attachment)!)} 
                                                className="inline-flex items-center justify-center p-1.5 text-indigo-600 hover:text-indigo-800 bg-indigo-50 hover:bg-indigo-100 dark:bg-indigo-900/30 dark:hover:bg-indigo-900/50 dark:text-indigo-400 rounded-lg transition-colors" 
                                                title="عرض المرفق"
                                            >
                                                <Paperclip size={16} />
                                            </button>
                                        ) : (
                                            <span className="text-gray-300 dark:text-slate-600">-</span>
                                        )}
                                    </td>
                                    <td className="px-4 py-3 border-r border-gray-100/50 dark:border-slate-700/30">
                                        <div className="flex justify-center gap-2">
                                            <button 
                                                type="button" 
                                                onClick={() => onEditAssignment(ass)} 
                                                className="text-gray-400 hover:text-teal-500 bg-gray-50 dark:bg-slate-800 hover:bg-teal-50 dark:hover:bg-teal-900/30 p-1.5 rounded-lg border border-gray-100 dark:border-slate-700 transition-colors" 
                                                title="تعديل"
                                            >
                                                <Edit size={14} />
                                            </button>
                                            <button 
                                                type="button" 
                                                onClick={() => onDeleteAssignment(ass)} 
                                                className="text-gray-400 hover:text-rose-500 bg-gray-50 dark:bg-slate-800 hover:bg-rose-50 dark:hover:bg-rose-900/30 p-1.5 rounded-lg border border-gray-100 dark:border-slate-700 transition-colors" 
                                                title="حذف"
                                            >
                                                <Trash2 size={14} />
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            ))
                        ) : (
                            <tr>
                                <td colSpan={5} className="px-4 py-8 text-center text-gray-500 dark:text-slate-400">لا يوجد سجلات تكليف</td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>
        </div>
    );
};
