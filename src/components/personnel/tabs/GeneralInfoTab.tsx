import React from "react";
import { User, Briefcase } from "lucide-react";
import { CustomSelect } from "../CustomSelect";

interface GeneralInfoTabProps {
    formData: any;
    setFormData: (data: any) => void;
    jobs: any[];
    structures: any[];
    departments: any[];
}

export const GeneralInfoTab: React.FC<GeneralInfoTabProps> = ({ formData, setFormData, jobs, structures, departments }) => {
    
    // Find current matched vacancy (if editing an existing employee)
    const currentVacancyId = typeof formData.vacancy_id === 'object' ? formData.vacancy_id?.id : formData.vacancy_id;
    const currentDepId = typeof formData.department_id === 'object' ? formData.department_id?.id : formData.department_id;
    const currentJobId = typeof formData.primary_job_id === 'object' ? formData.primary_job_id?.id : formData.primary_job_id;
    
    // Attempt to locate a matching vacancy in departments list
    const selectedVacancy = departments.find(d => {
        if (currentVacancyId) return d.id === currentVacancyId;
        const dStructId = typeof d.structure_id === 'object' ? d.structure_id?.id : d.structure_id;
        const dJobId = typeof d.employee_job === 'object' ? d.employee_job?.id : d.employee_job;
        return dStructId === currentDepId && dJobId === currentJobId;
    });

    const selectedVacancyId = selectedVacancy?.id || "";

    // Options: Vacant + the currently assigned one
    const vacancyOptions = departments
        .filter(d => d.job_status === 'شاغرة' || d.id === selectedVacancy?.id)
        .map(d => {
            const dStructId = typeof d.structure_id === 'object' ? d.structure_id?.id : d.structure_id;
            const dJobId = typeof d.employee_job === 'object' ? d.employee_job?.id : d.employee_job;
            
            const structName = typeof d.structure_id === 'object' ? d.structure_id?.name : structures.find(s => s.id === d.structure_id)?.name;
            const jobName = typeof d.employee_job === 'object' ? d.employee_job?.job_title : jobs.find(j => j.id === d.employee_job)?.job_title;
            
            return {
                value: d.id,
                label: `${jobName || 'بدون مسمى'} في ${structName || 'بدون قسم'} (رقم الشاغر #${d.id}) ${d.id === selectedVacancy?.id ? '(الحالي)' : ''}`
            };
        });

    const handleVacancyChange = (val: string | number) => {
        const vac = departments.find(d => d.id === val);
        if (vac) {
            const dStructId = typeof vac.structure_id === 'object' ? vac.structure_id?.id : vac.structure_id;
            const dJobId = typeof vac.employee_job === 'object' ? vac.employee_job?.id : vac.employee_job;
            setFormData({
                ...formData,
                vacancy_id: vac.id,
                department_id: dStructId,
                primary_job_id: dJobId
            });
        } else {
            setFormData({
                ...formData,
                vacancy_id: null,
                department_id: null,
                primary_job_id: null
            });
        }
    };
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
                            المنصب / الشاغر الوظيفي
                        </label>
                        <CustomSelect 
                            options={vacancyOptions}
                            value={selectedVacancyId}
                            onChange={handleVacancyChange}
                            placeholder="اختر المنصب الشاغر"
                        />
                        <p className="text-xs text-gray-500 mt-1">
                            يتم عرض المناصب الشاغرة فقط. عند الاختيار، سيتم ربط الموظف بالقسم والمسمى تلقائياً.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    );
};
