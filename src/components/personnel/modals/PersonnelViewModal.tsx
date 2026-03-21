import React, { useState } from "react";
import { User, Mail, Shield, Briefcase, ChevronRight, X, FileText, Download, Award, Paperclip } from "lucide-react";
import { getPreviewUrl } from "../utils";

interface PersonnelViewModalProps {
    isOpen: boolean;
    onClose: () => void;
    item: any;
    assignmentsList: any[];
    qualificationsList: any[];
    structuresMap: Map<string | number, any>;
    jobsList: any[];
    onPreview: (url: string) => void;
}

export const PersonnelViewModal: React.FC<PersonnelViewModalProps> = ({
    isOpen,
    onClose,
    item,
    assignmentsList,
    qualificationsList,
    structuresMap,
    jobsList,
    onPreview
}) => {
    const [activeTab, setActiveTab] = useState("general");

    if (!isOpen || !item) return null;

    const departmentName = structuresMap.get(typeof item.department_id === 'object' ? item.department_id?.id : item.department_id)?.name || "غير محدد";
    const primaryJob = item.primary_job_id ? jobsList.find(j => j.id === (typeof item.primary_job_id === 'object' ? item.primary_job_id.id : item.primary_job_id)) : null;

    return (
        <div 
            className="fixed inset-0 z-[100] flex items-center justify-center p-4 lg:p-10 bg-slate-900/60 backdrop-blur-sm animate-in fade-in duration-200"
            onClick={(e) => {
                if (e.target === e.currentTarget) onClose();
            }}
        >
            <div className="bg-slate-50 dark:bg-slate-900 rounded-3xl shadow-2xl w-full max-w-7xl flex flex-col max-h-[90vh] overflow-hidden border border-gray-100 dark:border-slate-800 animate-in zoom-in-95 duration-200">
                <div className="px-8 py-6 border-b border-gray-100 dark:border-slate-800 bg-white dark:bg-slate-900 flex items-center justify-between shrink-0 relative overflow-hidden">
                    <div className="absolute top-0 right-0 w-40 h-40 bg-teal-500/10 rounded-full blur-3xl -translate-y-1/2 translate-x-1/2"></div>
                    <div className="flex justify-between items-center w-full relative z-10">
                        <div className="flex items-center gap-5">
                            <div className="w-16 h-16 bg-teal-50 dark:bg-teal-900/30 text-teal-600 dark:text-teal-400 rounded-2xl flex items-center justify-center shadow-inner">
                                <User size={32} />
                            </div>
                            <div>
                                <h3 className="text-2xl font-black text-gray-800 dark:text-white">
                                    تفاصيل الموظف: {item.name}
                                </h3>
                                <p className="text-base text-gray-500 dark:text-slate-400 mt-1 flex items-center gap-2">
                                    <Briefcase size={16} />
                                    {departmentName}
                                </p>
                            </div>
                        </div>
                        <button 
                            onClick={onClose} 
                            className="text-gray-400 hover:text-rose-500 transition-colors bg-gray-50 dark:bg-slate-800 hover:bg-rose-50 dark:hover:bg-rose-900/30 p-3 rounded-xl shadow-sm border border-gray-100 dark:border-slate-700"
                        >
                            <X size={24} />
                        </button>
                    </div>
                </div>

                {/* TABS HEADER */}
                <div className="px-8 py-0 border-b border-gray-200 dark:border-slate-700/80 bg-white dark:bg-slate-900 flex space-x-10 rtl:space-x-reverse shrink-0">
                    <button 
                        onClick={() => setActiveTab('general')} 
                        className={`py-5 px-3 font-bold text-base border-b-2 transition-colors flex items-center gap-2 ${activeTab === 'general' ? 'border-indigo-500 text-indigo-600 dark:text-indigo-400' : 'border-transparent text-gray-500 hover:text-gray-700 dark:text-slate-400'}`}
                    >
                        <FileText size={18} /> المعلومات الأساسية
                    </button>
                    <button 
                        onClick={() => setActiveTab('assignments')} 
                        className={`py-5 px-3 font-bold text-base border-b-2 transition-colors flex items-center gap-2 ${activeTab === 'assignments' ? 'border-teal-500 text-teal-600 dark:text-teal-400' : 'border-transparent text-gray-500 hover:text-gray-700 dark:text-slate-400'}`}
                    >
                        <Briefcase size={18} /> سجل التكليفات
                    </button>
                    <button 
                        onClick={() => setActiveTab('qualifications')} 
                        className={`py-5 px-3 font-bold text-base border-b-2 transition-colors flex items-center gap-2 ${activeTab === 'qualifications' ? 'border-blue-500 text-blue-600 dark:text-blue-400' : 'border-transparent text-gray-500 hover:text-gray-700 dark:text-slate-400'}`}
                    >
                        <Award size={18} /> الدورات والتطوير
                    </button>
                </div>

                <div className="p-8 overflow-y-auto custom-scrollbar flex-1">
                    {activeTab === 'general' && (
                        <div className="bg-white dark:bg-slate-800 rounded-3xl p-8 shadow-sm border border-gray-100 dark:border-slate-700/50 relative overflow-hidden animate-in fade-in duration-300">
                            <div className="absolute top-0 right-0 w-2 h-full bg-indigo-500 rounded-r-3xl"></div>
                            <h4 className="text-xl font-bold text-gray-800 dark:text-white mb-8 flex items-center gap-2">
                                <FileText size={24} className="text-indigo-500" /> المعلومات الأساسية
                            </h4>
                            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-y-10 gap-x-8">
                                <div className="space-y-2 flex flex-col items-start w-full text-right">
                                    <span className="text-[15px] font-bold text-gray-400 dark:text-slate-500 uppercase tracking-wider">القسم الأساسي</span>
                                    <p className="text-xl font-semibold text-gray-900 dark:text-white w-full">{departmentName}</p>
                                </div>
                                <div className="space-y-2 flex flex-col items-start w-full text-right">
                                    <span className="text-[15px] font-bold text-gray-400 dark:text-slate-500 uppercase tracking-wider">الوظيفة الأساسية</span>
                                    <p className="text-xl font-semibold text-gray-900 dark:text-white w-full">{primaryJob ? primaryJob.job_title : "-"}</p>
                                </div>
                                <div className="space-y-2 flex flex-col items-start w-full text-right">
                                    <span className="text-[15px] font-bold text-gray-400 dark:text-slate-500 uppercase tracking-wider">الرقم الوظيفي</span>
                                    <p className="text-xl font-semibold text-gray-900 dark:text-white font-mono w-full"><span dir="ltr">{item.job_number || "-"}</span></p>
                                </div>
                                <div className="space-y-2 flex flex-col items-start w-full text-right">
                                    <span className="text-[15px] font-bold text-gray-400 dark:text-slate-500 uppercase tracking-wider">البريد الإلكتروني</span>
                                    <p className="text-xl font-semibold text-gray-900 dark:text-white font-mono flex items-center gap-3 w-full justify-start">
                                        <Mail size={18} className="text-gray-400" /> <span dir="ltr">{item.email || "-"}</span>
                                    </p>
                                </div>
                                <div className="space-y-2 flex flex-col items-start w-full text-right">
                                    <span className="text-[15px] font-bold text-gray-400 dark:text-slate-500 uppercase tracking-wider">رقم الجوال</span>
                                    <p className="text-xl font-semibold text-gray-900 dark:text-white font-mono w-full"><span dir="ltr">{item.mobile_number || "-"}</span></p>
                                </div>
                            </div>
                        </div>
                    )}

                    {activeTab === 'assignments' && (
                        <div className="bg-white dark:bg-slate-800 rounded-3xl p-8 shadow-sm border border-gray-100 dark:border-slate-700/50 relative overflow-hidden animate-in fade-in duration-300">
                            <div className="absolute top-0 right-0 w-2 h-full bg-teal-500 rounded-r-3xl"></div>
                            <h4 className="text-xl font-bold text-gray-800 dark:text-white mb-8 flex items-center gap-2">
                                <Briefcase size={24} className="text-teal-500" /> سجل التكليفات
                            </h4>
                            <div className="overflow-x-auto rounded-xl border border-gray-100 dark:border-slate-700">
                                <table className="w-full text-base text-right">
                                    <thead className="bg-gray-50 dark:bg-slate-700/50 text-gray-600 dark:text-slate-300 font-medium whitespace-nowrap">
                                        <tr>
                                            <th className="px-6 py-4 border-b border-gray-100 dark:border-slate-700">الموضوع</th>
                                            <th className="px-6 py-4 border-b border-gray-100 dark:border-slate-700">رقم القرار</th>
                                            <th className="px-6 py-4 border-b border-gray-100 dark:border-slate-700">تاريخ القرار</th>
                                            <th className="px-6 py-4 border-b border-gray-100 dark:border-slate-700">القسم الوظيفي</th>
                                            <th className="px-6 py-4 border-b border-gray-100 dark:border-slate-700">مصدر القرار</th>
                                            <th className="px-6 py-4 border-b border-gray-100 dark:border-slate-700 max-w-[250px]">ملخص القرار</th>
                                            <th className="px-6 py-4 border-b border-gray-100 dark:border-slate-700">تاريخ البداية</th>
                                            <th className="px-6 py-4 border-b border-gray-100 dark:border-slate-700">تاريخ النهاية</th>
                                            <th className="px-6 py-4 border-b border-gray-100 dark:border-slate-700 w-28 text-center">المرفقات</th>
                                        </tr>
                                    </thead>
                                    <tbody className="divide-y divide-gray-100 dark:divide-slate-700 text-gray-700 dark:text-slate-200">
                                        {assignmentsList.filter(a => a.personnel_id === item.id).length > 0 ? (
                                            assignmentsList.filter(a => a.personnel_id === item.id).map(ass => (
                                                <tr key={ass.id} className="hover:bg-gray-50/50 dark:hover:bg-slate-700/30 transition-colors">
                                                    <td className="px-6 py-5 whitespace-nowrap font-bold text-teal-700 dark:text-teal-400">{ass.subject || "-"}</td>
                                                    <td className="px-6 py-5 font-mono text-base whitespace-nowrap text-right" dir="ltr"><span dir="ltr">{ass.decision_number || "-"}</span></td>
                                                    <td className="px-6 py-5 font-mono text-base whitespace-nowrap text-right" dir="ltr"><span dir="ltr">{ass.decision_date ? ass.decision_date.split('T')[0] : "-"}</span></td>
                                                    <td className="px-6 py-5 whitespace-nowrap">{structuresMap.get(typeof ass.department_id === 'object' ? ass.department_id?.id : ass.department_id)?.name || "-"}</td>
                                                    <td className="px-6 py-5 whitespace-nowrap text-base">{ass.decision_source || "-"}</td>
                                                    <td className="px-6 py-5 text-sm text-gray-500 dark:text-gray-400 max-w-[250px] truncate" title={ass.decision_summary}>{ass.decision_summary || "-"}</td>
                                                    <td className="px-6 py-5 font-mono text-base whitespace-nowrap text-right" dir="ltr"><span dir="ltr">{ass.effective_from ? ass.effective_from.split('T')[0] : "-"}</span></td>
                                                    <td className="px-6 py-5 font-mono text-base whitespace-nowrap text-right" dir="ltr"><span dir="ltr">{ass.effective_to ? ass.effective_to.split('T')[0] : "-"}</span></td>
                                                    <td className="px-6 py-5 text-center">
                                                        {ass.attachment ? (
                                                            <button 
                                                                type="button" 
                                                                onClick={() => onPreview(getPreviewUrl(ass.attachment)!)} 
                                                                className="inline-flex items-center justify-center p-2 text-indigo-600 hover:text-indigo-800 bg-indigo-50 hover:bg-indigo-100 dark:bg-indigo-900/30 dark:hover:bg-indigo-900/50 dark:text-indigo-400 rounded-xl transition-colors" 
                                                                title="عرض المرفق"
                                                            >
                                                                <Paperclip size={18} />
                                                            </button>
                                                        ) : (
                                                            <span className="text-gray-300 dark:text-slate-600">-</span>
                                                        )}
                                                    </td>
                                                </tr>
                                            ))
                                        ) : (
                                            <tr>
                                                <td colSpan={9} className="px-6 py-16 text-center text-gray-400 dark:text-slate-500 bg-gray-50/50 dark:bg-slate-800/50 font-medium">
                                                    لا يوجد سجل تكليفات
                                                </td>
                                            </tr>
                                        )}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    )}

                    {activeTab === 'qualifications' && (
                        <div className="bg-white dark:bg-slate-800 rounded-3xl p-8 shadow-sm border border-gray-100 dark:border-slate-700/50 relative overflow-hidden animate-in fade-in duration-300">
                            <div className="absolute top-0 right-0 w-2 h-full bg-blue-500 rounded-r-3xl"></div>
                            <h4 className="text-xl font-bold text-gray-800 dark:text-white mb-8 flex items-center gap-2">
                                <Award size={24} className="text-blue-500" /> الدورات والتطوير
                            </h4>
                            
                            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                                {qualificationsList.filter(q => q.personnel_id === item.id).length > 0 ? (
                                    qualificationsList.filter(q => q.personnel_id === item.id).map(qual => (
                                        <div key={qual.id} className="flex flex-col p-6 bg-indigo-50/50 dark:bg-indigo-900/10 border border-indigo-100 dark:border-indigo-800/30 rounded-2xl relative group hover:border-indigo-200 dark:hover:border-indigo-700/50 transition-colors">
                                            {qual.attachment && (
                                                <div className="absolute top-5 left-5">
                                                    <button 
                                                        type="button" 
                                                        onClick={() => onPreview(getPreviewUrl(qual.attachment)!)} 
                                                        className="text-indigo-500 hover:text-indigo-700 bg-white dark:bg-slate-800 hover:bg-indigo-50 dark:hover:bg-indigo-900/50 p-2.5 rounded-xl shadow-sm border border-indigo-100/50 dark:border-slate-700 transition-colors flex items-center gap-1" 
                                                        title="عرض المرفق"
                                                    >
                                                        <Paperclip size={18} />
                                                    </button>
                                                </div>
                                            )}
                                            <div className="font-extrabold text-xl text-indigo-900 dark:text-indigo-300 mb-3 pr-2">{qual.course_name}</div>
                                            
                                            <div className="space-y-2 mt-2">
                                                <div className="text-base font-medium flex gap-2">
                                                    <span className="text-indigo-400 w-14 shrink-0">الجهة:</span> 
                                                    <span className="text-slate-700 dark:text-slate-300">{qual.training_entity || "-"}</span>
                                                </div>
                                                <div className="text-base font-medium flex gap-2">
                                                    <span className="text-indigo-400 w-14 shrink-0">الدرجة:</span> 
                                                    <span className="text-slate-700 dark:text-slate-300">{(qual.score && qual.score !== "-") ? qual.score : "لا توجد"}</span>
                                                </div>
                                            </div>

                                            <div className="pt-5 border-t border-indigo-100/60 dark:border-indigo-800/40 mt-6 flex items-center justify-between text-base text-indigo-500/80 dark:text-indigo-400 font-mono">
                                                <span className="flex items-center gap-1">من: <strong className="text-indigo-600 dark:text-indigo-300" dir="ltr">{qual.start_date ? qual.start_date.split('T')[0] : "-"}</strong></span>
                                                <span className="flex items-center gap-1">إلى: <strong className="text-indigo-600 dark:text-indigo-300" dir="ltr">{qual.end_date ? qual.end_date.split('T')[0] : "-"}</strong></span>
                                            </div>
                                        </div>
                                    ))
                                ) : (
                                    <div className="col-span-full py-16 text-center text-gray-400 dark:text-slate-500 bg-gray-50/50 dark:bg-slate-800/50 rounded-3xl border border-dashed border-gray-200 dark:border-slate-700 font-medium text-lg">
                                        لا يوجد دورات أو شهادات مسجلة للموظف
                                    </div>
                                )}
                            </div>
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
};
