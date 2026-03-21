import React from "react";
import { User, Briefcase } from "lucide-react";
import { CustomSelect } from "../CustomSelect";

interface GeneralInfoTabProps {
    formData: any;
    setFormData: (data: any) => void;
    jobs: any[];
    structures: any[];
}

export const GeneralInfoTab: React.FC<GeneralInfoTabProps> = ({ formData, setFormData, jobs, structures }) => {
    return (
        <div className="space-y-4">
            <h4 className="font-bold text-gray-800 dark:text-white flex items-center gap-2">
                <User size={18} className="text-teal-500" /> المعلومات الأساسية
            </h4>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6 bg-white dark:bg-slate-800 p-6 rounded-2xl border border-gray-100 dark:border-slate-700">
                <div className="space-y-6 flex flex-col">
                    <div className="space-y-2">
                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300">الاسم بالكامل <span className="text-rose-500">*</span></label>
                        <input 
                            type="text" 
                            className="w-full px-4 py-2.5 bg-white dark:bg-slate-900 text-gray-900 dark:text-white border-2 border-gray-200 dark:border-slate-700 rounded-xl focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10 outline-none transition-all placeholder:text-gray-400"
                            value={formData.name || ""}
                            onChange={(e) => setFormData({...formData, name: e.target.value})}
                            required
                        />
                    </div>

                    <div className="space-y-2">
                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300">البريد الإلكتروني <span className="text-rose-500">*</span></label>
                        <input 
                            type="email" 
                            className="w-full px-4 py-2.5 bg-white dark:bg-slate-900 text-gray-900 dark:text-white border-2 border-gray-200 dark:border-slate-700 rounded-xl focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10 outline-none transition-all placeholder:text-gray-400 font-mono text-left"
                            value={formData.email || ""}
                            onChange={(e) => setFormData({...formData, email: e.target.value})}
                            required
                            dir="ltr"
                        />
                    </div>

                    <div className="space-y-2">
                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300">رقم الجوال</label>
                        <input 
                            type="text" 
                            className="w-full px-4 py-2.5 bg-white dark:bg-slate-900 text-gray-900 dark:text-white border-2 border-gray-200 dark:border-slate-700 rounded-xl focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10 outline-none transition-all placeholder:text-gray-400 font-mono text-left"
                            value={formData.mobile_number || ""}
                            onChange={(e) => setFormData({...formData, mobile_number: e.target.value})}
                            dir="ltr"
                        />
                    </div>
                </div>

                <div className="space-y-6 flex flex-col">
                    <div className="space-y-2">
                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300">الرقم الوظيفي</label>
                        <input 
                            type="text" 
                            className="w-full px-4 py-2.5 bg-white dark:bg-slate-900 text-gray-900 dark:text-white border-2 border-gray-200 dark:border-slate-700 rounded-xl focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10 outline-none transition-all placeholder:text-gray-400 font-mono text-left"
                            value={formData.job_number || ""}
                            onChange={(e) => setFormData({...formData, job_number: e.target.value})}
                            dir="ltr"
                        />
                    </div>

                    <div className="space-y-2">
                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300 flex items-center gap-1">
                            <Briefcase size={14} className="text-indigo-400" />
                            القسم الوظيفي (الهيكل التنظيمي)
                        </label>
                        <CustomSelect 
                            options={structures.map(s => ({ value: s.id, label: s.name || s.id }))}
                            value={formData.department_id}
                            onChange={(val: any) => setFormData({ ...formData, department_id: val })}
                            placeholder="اختر القسم"
                        />
                    </div>

                    <div className="space-y-2">
                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300 flex items-center gap-1">
                            <Briefcase size={14} className="text-emerald-400" />
                            المُسمى الوظيفي الأساسي
                        </label>
                        <CustomSelect 
                            options={jobs.map(j => ({ value: j.id, label: j.job_title || j.id }))}
                            value={formData.primary_job_id}
                            onChange={(val: any) => setFormData({ ...formData, primary_job_id: val })}
                            placeholder="اختر الوظيفة الأساسية"
                        />
                    </div>
                </div>
            </div>
        </div>
    );
};
