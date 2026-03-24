"use client";

import React, { use } from "react";
import { useTable, useDelete, useNavigation } from "@refinedev/core";
import { useDirectusSchema, getTranslation } from "@/hooks/use-directus-schema";
import { Plus, Edit, Trash2, Database, AlertCircle, ChevronLeft, ChevronRight } from "lucide-react";
import StructuresTreePage from "@/components/structures/structures-tree-page";

export default function GenericList({ params }: { params: Promise<{ resource: string }> }) {
    const { resource: resourceName } = use(params);

    if (resourceName.toLowerCase() === "structures") {
        return <StructuresTreePage />;
    }
    const { mutate: deleteRecord } = useDelete();
    
    const tableState = useTable({
        resource: resourceName,
        pagination: { current: 1, pageSize: 15 } as any,
        meta: { fields: ['*', '*.*'] }
    }) as any;
    
    const tableQuery = tableState.tableQuery || tableState.tableQueryResult;
    const current = tableState.current || 1;
    const setCurrent = tableState.setCurrent || (() => {});
    const pageCount = tableState.pageCount || 1;
    const pageSize = tableState.pageSize || 15;
    
    const { fields, collectionMeta, isLoading: isSchemaLoading, error: schemaError } = useDirectusSchema(resourceName);

    const isDataLoading = tableQuery?.isLoading;
    const records = tableQuery?.data?.data || [];

    const localizedTitle = getTranslation(collectionMeta?.translations, resourceName.replace(/_/g, " "));

    const [deleteNodeId, setDeleteNodeId] = React.useState<string | number | null>(null);

    const confirmDelete = (id: string | number) => {
        setDeleteNodeId(id);
    };

    const processDelete = () => {
        if (!deleteNodeId) return;
        deleteRecord({
            resource: resourceName,
            id: deleteNodeId,
            successNotification: () => ({
                message: "تم إتلاف هذا السجل نهائياً",
                description: "قمنا بإزالة البيانات المتعلقة بهذا السجل من النظام بنجاح تام.",
                type: "success"
            }),
            errorNotification: () => ({
                message: "تعذر مسح السجل المختار",
                description: "قد يكون هذا السجل محروساً بصلاحيات مغلقة أو مرتبطاً ببيانات تمنع حذفه.",
                type: "error"
            })
        });
        setDeleteNodeId(null);
    };

    if (isSchemaLoading) {
        return (
            <div className="flex flex-col items-center justify-center p-20 gap-4">
                <div className="w-12 h-12 border-4 border-indigo-100 border-t-indigo-600 rounded-full animate-spin"></div>
                <div className="text-gray-500 font-bold text-sm">جاري قراءة المخطط المعماري...</div>
            </div>
        );
    }

    if (schemaError) {
        return (
            <div className="p-8 max-w-2xl mx-auto">
                <div className="bg-red-50 dark:bg-red-900/20 border border-red-200 dark:border-red-800 p-6 rounded-2xl flex items-start gap-4">
                    <AlertCircle className="text-red-500 shrink-0 mt-1" size={24} />
                    <div>
                        <h3 className="text-red-800 dark:text-red-400 font-black text-lg mb-2">تعذر قراءة خصائص الجدول</h3>
                        <p className="text-red-600 dark:text-red-300 text-sm leading-relaxed">
                            لم نتمكن من العثور على جدول باسم "{resourceName}" أو أن صلاحيات الوصول غير متوفرة. يرجى التأكد من إنشاء الجدول في Directus أولاً.
                        </p>
                    </div>
                </div>
            </div>
        );
    }

    const tableHeaders = fields.filter(f => !f.meta?.hidden && !f.schema?.is_primary_key);

    return (
        <div className="w-full h-full flex flex-col animate-in fade-in zoom-in-95 duration-500 ease-out">
            <div className="bg-white/95 dark:bg-slate-900/95 backdrop-blur-md rounded-3xl shadow-lg shadow-indigo-100/30 dark:shadow-none border border-indigo-50 dark:border-slate-800 overflow-hidden transition-colors duration-300">
                {/* Header Section */}
                <div className="bg-gradient-to-l from-indigo-50/50 dark:from-indigo-950/20 to-transparent px-8 py-8 border-b border-gray-100 dark:border-slate-800">
                    <div className="flex flex-col sm:flex-row sm:justify-between sm:items-center gap-6">
                        <div className="flex items-center gap-5">
                            <div className="w-16 h-16 bg-gradient-to-br from-indigo-500 to-indigo-700 rounded-2xl flex items-center justify-center shadow-lg shadow-indigo-600/30 text-white">
                                <Database size={32} />
                            </div>
                            <div>
                                <h1 className="text-3xl font-black text-gray-900 dark:text-white tracking-tight capitalize">{localizedTitle}</h1>
                                <p className="text-gray-500 dark:text-slate-400 mt-1.5 text-sm font-semibold">استعراض وإدارة السجلات بشكل ديناميكي.</p>
                            </div>
                        </div>
                        <a 
                            href={`/${resourceName}/create`}
                            className="flex items-center gap-2 px-5 py-3 bg-indigo-600 text-white font-bold rounded-xl hover:bg-indigo-700 hover:shadow-lg hover:shadow-indigo-600/20 transition-all shadow-sm text-sm"
                        >
                            <Plus size={18} /> إضافة سجل جديد
                        </a>
                    </div>
                </div>

                {/* Table Content */}
                <div className="p-0 overflow-x-auto">
                    {isDataLoading && records.length === 0 ? (
                        <div className="flex justify-center py-20">
                            <div className="w-8 h-8 border-4 border-indigo-100 border-t-indigo-600 rounded-full animate-spin"></div>
                        </div>
                    ) : records.length === 0 ? (
                        <div className="text-center py-20 px-4">
                            <div className="w-20 h-20 bg-gray-50 dark:bg-slate-800 rounded-full flex items-center justify-center mx-auto mb-4 border border-gray-100 dark:border-slate-700">
                                <Database className="text-gray-400 dark:text-slate-500" size={32} />
                            </div>
                            <h3 className="text-xl font-bold text-gray-800 dark:text-white mb-2">لا توجد سجلات</h3>
                            <p className="text-gray-500 dark:text-slate-400 max-w-md mx-auto">لم يتم إضافة أي بيانات لهذا الجدول بعد. انقر على زر إضافة سجل جديد لبدء التعبئة.</p>
                        </div>
                    ) : (
                        <table className="w-full text-right text-sm">
                            <thead className="bg-gray-50/80 dark:bg-slate-800/80 text-gray-500 dark:text-slate-400 font-extrabold border-b border-gray-100 dark:border-slate-700/60">
                                <tr>
                                    <th className="px-6 py-4 whitespace-nowrap">م.</th>
                                    {tableHeaders.map((field) => (
                                        <th key={field.field} className="px-6 py-4 whitespace-nowrap">
                                            {getTranslation(field.meta?.translations, field.meta?.display || field.field)}
                                        </th>
                                    ))}
                                    <th className="px-6 py-4 whitespace-nowrap w-32 text-left">إجراءات</th>
                                </tr>
                            </thead>
                            <tbody className="divide-y divide-gray-100 dark:divide-slate-800 bg-white dark:bg-slate-900">
                                {records.map((record: any, index: number) => (
                                    <tr key={record.id} className="hover:bg-indigo-50/30 dark:hover:bg-indigo-900/10 transition-colors">
                                        <td className="px-6 py-4 font-mono text-xs text-gray-400 dark:text-slate-500">{(current - 1) * pageSize + index + 1}</td>
                                        
                                        {tableHeaders.map((field) => {
                                            const val = record[field.field];
                                            let displayVal = val;
                                            
                                            // Handle predefined choices (dropdowns)
                                            if (field.meta?.interface === "select-dropdown" || field.meta?.options?.choices) {
                                                const choices = (field.meta?.options?.choices as Array<any>) || [];
                                                const choice = choices.find(c => String(c.value) === String(val));
                                                if (choice) {
                                                    displayVal = (
                                                        <span className="text-gray-700 dark:text-gray-200 font-bold bg-gray-50 dark:bg-slate-800 px-3 py-1.5 rounded-lg border border-gray-200 dark:border-slate-700 shadow-sm text-xs">
                                                            {choice.text || val}
                                                        </span>
                                                    );
                                                }
                                            } else if (field.type === "boolean") {
                                                displayVal = val ? <span className="text-emerald-500 font-bold bg-emerald-50 dark:bg-emerald-500/10 px-2.5 py-1 rounded-md">نعم</span> : <span className="text-rose-500 font-bold bg-rose-50 dark:bg-rose-500/10 px-2.5 py-1 rounded-md">لا</span>;
                                            } else if (field.type === "timestamp" || field.type === "datetime" || field.type === "date") {
                                                displayVal = val ? new Date(val).toLocaleDateString("ar-SA") : <span className="text-gray-300">-</span>;
                                            } else if (typeof val === "object" && val !== null && !Array.isArray(val)) {
                                                const v = val as any;
                                                let relationalName = v.first_name ? `${v.first_name} ${v.last_name || ''}`.trim() : (v.objective_name || v.kpi_name || v.initiative_name || v.mechanism_name || v.vision || v.name || v.title || v.job_title || v.العنوان);
                                                if (!relationalName && v.structure_id !== undefined && v.employee_job !== undefined) {
                                                    const structName = typeof v.structure_id === 'object' ? v.structure_id?.name : '';
                                                    const jobName = typeof v.employee_job === 'object' ? v.employee_job?.job_title : '';
                                                    if (structName || jobName) relationalName = `${structName || 'قسم'} - ${jobName || 'وظيفة'}`;
                                                }
                                                displayVal = <span className="font-bold text-indigo-700 dark:text-indigo-400">
                                                    {relationalName || (v.id ? String(v.id).substring(0,8) + '...' : "مرتبط")}
                                                </span>;
                                            } else if (Array.isArray(val)) {
                                                displayVal = <span className="text-gray-400 text-xs px-2 py-1 bg-gray-50 dark:bg-slate-800 rounded-md">مجموعة ({val.length})</span>;
                                            }

                                            return (
                                                <td key={field.field} className="px-6 py-4 text-gray-800 dark:text-slate-200 font-medium">
                                                    {displayVal === null || displayVal === undefined || displayVal === "" ? <span className="text-gray-300 dark:text-slate-600">-</span> : displayVal}
                                                </td>
                                            );
                                        })}
                                        
                                        <td className="px-6 py-4 whitespace-nowrap">
                                            <div className="flex items-center justify-end gap-2">
                                                <a 
                                                    href={`/${resourceName}/edit/${record.id}`} 
                                                    className="p-2 text-blue-600 dark:text-blue-400 hover:bg-blue-50 dark:hover:bg-blue-900/20 rounded-lg transition-colors border border-transparent hover:border-blue-100 dark:hover:border-blue-800"
                                                >
                                                    <Edit size={16} />
                                                </a>
                                                <button 
                                                    onClick={() => confirmDelete(record.id)}
                                                    className="p-2 text-red-600 dark:text-red-400 hover:bg-red-50 dark:hover:bg-red-900/20 rounded-lg transition-colors border border-transparent hover:border-red-100 dark:hover:border-red-800 cursor-pointer"
                                                >
                                                    <Trash2 size={16} />
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    )}
                </div>

                {/* Pagination */}
                {pageCount > 1 && (
                    <div className="flex items-center justify-center p-6 border-t border-gray-100 dark:border-slate-800 bg-gray-50/50 dark:bg-slate-800/30 gap-1.5">
                        <button 
                            disabled={current === 1}
                            onClick={() => setCurrent(current - 1)}
                            className="p-2 rounded-lg bg-white dark:bg-slate-800 border border-gray-200 dark:border-slate-700 text-gray-600 dark:text-slate-300 hover:bg-gray-50 dark:hover:bg-slate-700 disabled:opacity-50 disabled:cursor-not-allowed transition-all"
                        >
                            <ChevronRight size={18} />
                        </button>
                        
                        <div className="flex items-center gap-1.5 px-4 font-bold text-sm text-gray-700 dark:text-slate-200">
                            الصفحة {current} من {pageCount}
                        </div>
                        
                        <button 
                            disabled={current === pageCount}
                            onClick={() => setCurrent(current + 1)}
                            className="p-2 rounded-lg bg-white dark:bg-slate-800 border border-gray-200 dark:border-slate-700 text-gray-600 dark:text-slate-300 hover:bg-gray-50 dark:hover:bg-slate-700 disabled:opacity-50 disabled:cursor-not-allowed transition-all"
                        >
                            <ChevronLeft size={18} />
                        </button>
                    </div>
                )}
            </div>

            {deleteNodeId && (() => {
                const recordToDelete = records.find((r: any) => String(r.id) === String(deleteNodeId));
                // Infer reasonable display property natively relying on basic English or Arabic column names, plus all phase4 specific names
                const displayName = recordToDelete?.objective_name || recordToDelete?.kpi_name || recordToDelete?.initiative_name || recordToDelete?.mechanism_name || recordToDelete?.vision || recordToDelete?.title || recordToDelete?.name || recordToDelete?.job_title || recordToDelete?.اسم || recordToDelete?.العنوان || `السجل #${String(deleteNodeId).substring(0,8)}...`;
                
                return (
                    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
                        <div className="absolute inset-0 bg-slate-900/40 backdrop-blur-sm transition-opacity" onClick={() => setDeleteNodeId(null)}></div>
                        <div className="relative bg-white dark:bg-slate-900 rounded-3xl shadow-2xl w-full max-w-md p-7 animate-in fade-in zoom-in-95 duration-200 border border-white/20 dark:border-slate-800 transition-colors">
                            <div className="w-12 h-12 rounded-full bg-red-50 dark:bg-red-500/10 flex items-center justify-center mb-5 border border-red-100 dark:border-red-500/20">
                                <Trash2 className="text-red-600 dark:text-red-400" size={24} />
                            </div>
                            <h2 className="text-xl font-black text-gray-900 dark:text-white mb-2">تأكيد حذف السجل</h2>
                            <div className="text-gray-600 dark:text-slate-300 mb-6 font-medium leading-relaxed">
                                هل أنت متأكد من رغبتك في حذف <span className="font-bold text-indigo-700 dark:text-indigo-400">"{displayName}"</span>؟ لا يمكن التراجع عن هذا الإجراء بعد تنفيذه.
                            </div>
                            <div className="flex gap-3 pt-2">
                                <button onClick={processDelete} className="flex-1 bg-red-600 text-white font-bold py-3.5 px-4 rounded-xl hover:bg-red-700 hover:shadow-lg hover:shadow-red-600/20 transition-all">نعم، احذف نهائياً</button>
                                <button onClick={() => setDeleteNodeId(null)} className="flex-1 bg-white dark:bg-slate-800 border border-gray-200 dark:border-slate-700 text-gray-700 dark:text-slate-300 font-bold py-3.5 px-4 rounded-xl hover:bg-gray-50 dark:hover:bg-slate-700 hover:text-gray-900 dark:hover:text-white transition-all shadow-sm">إلغاء الأمر</button>
                            </div>
                        </div>
                    </div>
                );
            })()}
        </div>
    );
}
