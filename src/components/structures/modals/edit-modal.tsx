import React from "react";
import { Edit, Save, X, Check } from "lucide-react";
import { StructureNode } from "../types";

export interface StructureEditModalProps {
    isOpen: boolean;
    onClose: () => void;
    formData: Partial<StructureNode>;
    setFormData: (data: Partial<StructureNode>) => void;
    onSave: () => void;
    isSubmitting: boolean;
    availableParents: StructureNode[];
}

export const StructureEditModal = ({
    isOpen,
    onClose,
    formData,
    setFormData,
    onSave,
    isSubmitting,
    availableParents
}: StructureEditModalProps) => {
    if (!isOpen) return null;

    return (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
            <div className="absolute inset-0 bg-slate-900/60 backdrop-blur-sm transition-opacity" onClick={onClose}></div>
            <div className="relative bg-white dark:bg-slate-900 rounded-2xl shadow-2xl w-full max-w-2xl overflow-hidden border border-gray-100 dark:border-slate-800 animate-in fade-in zoom-in duration-200">
                
                {/* Modal Header */}
                <div className="bg-slate-900 dark:bg-slate-950 px-6 py-4 flex items-center justify-between text-white">
                    <h3 className="text-xl font-bold flex items-center gap-2">
                        <Edit size={20} className="text-indigo-400" />
                        {formData.id ? "تعديل القسم" : "إضافة قسم جديد"}
                    </h3>
                    <button onClick={onClose} className="text-gray-400 hover:text-white transition-colors bg-white/10 p-1 rounded-lg">
                        <X size={20} />
                    </button>
                </div>

                {/* Modal Body */}
                <div className="p-8">
                    <div className="grid grid-cols-2 gap-x-8 gap-y-6 RTL-grid">
                        {/* Row 1 */}
                        <div className="flex flex-col gap-2">
                            <label className="text-sm font-bold text-gray-700 dark:text-gray-300">جهة الارتباط</label>
                            <select 
                                className="w-full px-4 py-2.5 text-gray-900 dark:text-white bg-gray-50 dark:bg-slate-800 border-2 border-gray-200 dark:border-slate-700 rounded-xl focus:border-indigo-500 focus:ring-4 focus:ring-indigo-500/10 outline-none transition-all appearance-none disabled:opacity-60 disabled:bg-gray-200 dark:disabled:bg-slate-700 disabled:cursor-not-allowed"
                                value={formData.parent_id as string || ""}
                                onChange={(e) => setFormData({...formData, parent_id: e.target.value})}
                                disabled={!formData.id && formData.parent_id !== undefined && formData.parent_id !== null}
                            >
                                <option value="">-- بدون جهة ارتباط (جذر علوي) --</option>
                                {availableParents.map((p: StructureNode) => (
                                    <option key={p.id} value={p.id as string | number}>{p.name || `كود: ${p.code}`}</option>
                                ))}
                            </select>
                        </div>
                        
                        <div className="flex flex-col gap-2">
                            <label className="text-sm font-bold text-gray-700 dark:text-gray-300">اسم القسم</label>
                            <input 
                                type="text" 
                                className="w-full px-4 py-2.5 bg-white dark:bg-slate-900 text-gray-900 dark:text-white border-2 border-gray-200 dark:border-slate-700 rounded-xl focus:border-indigo-500 focus:ring-4 focus:ring-indigo-500/10 outline-none transition-all placeholder:text-gray-400"
                                value={formData.name || ""}
                                onChange={(e) => setFormData({...formData, name: e.target.value})}
                                placeholder="الكلية التقنية..."
                            />
                        </div>

                        {/* Row 2 */}
                        <div className="flex flex-col gap-2">
                            <label className="text-sm font-bold text-gray-700 dark:text-gray-300">الوصف</label>
                            <div className="flex gap-2">
                                <input 
                                    type="text" 
                                    className="w-full px-4 py-2.5 text-gray-900 dark:text-white bg-white dark:bg-slate-900 border-2 border-gray-200 dark:border-slate-700 rounded-xl focus:border-indigo-500 focus:ring-4 focus:ring-indigo-500/10 outline-none transition-all placeholder:text-gray-400"
                                    value={formData.description || ""}
                                    onChange={(e) => setFormData({...formData, description: e.target.value})}
                                />
                                <div className="w-16 shrink-0 bg-gray-100 flex items-center justify-center rounded-xl font-bold text-gray-500">
                                    {String(formData.description || "").length}
                                </div>
                            </div>
                        </div>

                        <div className="flex flex-col gap-2">
                            <label className="text-sm font-bold text-gray-700 dark:text-gray-300">كود القسم</label>
                            <input 
                                type="text" 
                                className="w-full px-4 py-2.5 text-gray-900 dark:text-white bg-white dark:bg-slate-900 border-2 border-gray-200 dark:border-slate-700 rounded-xl focus:border-indigo-500 focus:ring-4 focus:ring-indigo-500/10 outline-none transition-all font-mono placeholder:text-gray-400 text-left"
                                value={formData.code || ""}
                                onChange={(e) => setFormData({...formData, code: e.target.value})}
                                dir="ltr"
                                placeholder="code 258"
                            />
                        </div>

                        {/* Row 3 */}
                        <div className="flex items-center justify-between border-2 border-gray-100 dark:border-slate-800 p-4 rounded-xl col-span-1">
                            <label className="text-sm font-bold text-gray-700 dark:text-gray-300">مفعل؟</label>
                            <button 
                                type="button" 
                                className={`w-14 h-7 rounded-full transition-colors relative ${formData.is_active ? 'bg-indigo-600' : 'bg-gray-300 dark:bg-slate-700'}`}
                                onClick={() => setFormData({...formData, is_active: !formData.is_active})}
                            >
                                <div className={`shadow-sm w-5 h-5 bg-white rounded-full absolute top-1 transition-all flex items-center justify-center ${formData.is_active ? 'right-8 border-indigo-200' : 'right-1'}`}>
                                    {formData.is_active && <Check size={12} className="text-indigo-600" />}
                                </div>
                            </button>
                        </div>

                        <div className="flex flex-col gap-2">
                            <label className="text-sm font-bold text-gray-700 dark:text-gray-300">رقم الترتيب</label>
                            <div className="flex rounded-xl overflow-hidden border-2 border-gray-200 dark:border-slate-700 focus-within:border-indigo-500 focus-within:ring-4 focus-within:ring-indigo-500/10 transition-all bg-white dark:bg-slate-900">
                                <button 
                                    type="button"
                                    onClick={() => setFormData({...formData, sort_order: (Number(formData.sort_order) || 0) + 1})}
                                    className="w-12 bg-gray-50 dark:bg-slate-800 hover:bg-gray-100 dark:hover:bg-slate-700 text-gray-600 dark:text-gray-400 flex items-center justify-center font-bold text-lg active:bg-gray-200 transition-colors"
                                >
                                    +
                                </button>
                                <div className="w-px bg-gray-200 dark:bg-slate-700"></div>
                                <button 
                                    type="button"
                                    onClick={() => setFormData({...formData, sort_order: Math.max(0, (Number(formData.sort_order) || 0) - 1)})}
                                    className="w-12 bg-gray-50 dark:bg-slate-800 hover:bg-gray-100 dark:hover:bg-slate-700 text-gray-600 dark:text-gray-400 flex items-center justify-center font-bold text-lg active:bg-gray-200 transition-colors"
                                >
                                    -
                                </button>
                                <input 
                                    type="number" 
                                    className="w-full px-4 py-2.5 text-center text-gray-900 dark:text-white font-mono font-bold bg-transparent outline-none m-0"
                                    value={formData.sort_order || 0}
                                    onChange={(e) => setFormData({...formData, sort_order: parseInt(e.target.value) || 0})}
                                    min="0"
                                />
                            </div>
                        </div>

                    </div>
                </div>

                {/* Modal Footer */}
                <div className="bg-gray-50/80 dark:bg-slate-950/50 px-6 py-4 border-t border-gray-100 dark:border-slate-800 flex justify-start gap-3">
                    <button 
                        onClick={onSave}
                        disabled={isSubmitting}
                        className="flex items-center gap-2 px-6 py-2.5 bg-emerald-500 hover:bg-emerald-600 text-white font-bold rounded-xl transition-colors shadow-lg shadow-emerald-500/20 disabled:opacity-70"
                    >
                        {isSubmitting ? (
                            <div className="w-5 h-5 border-2 border-white/30 border-t-white rounded-full animate-spin"></div>
                        ) : (
                            <Save size={18} />
                        )}
                        حفظ
                    </button>
                    <button 
                        onClick={onClose}
                        disabled={isSubmitting}
                        className="flex items-center gap-2 px-6 py-2.5 bg-rose-600 hover:bg-rose-700 text-white font-bold rounded-xl transition-colors shadow-lg shadow-rose-600/20 disabled:opacity-70"
                    >
                        إغلاق
                    </button>
                </div>
            </div>
        </div>
    );
};
