import React from "react";
import { StructureNode } from "../types";

export const PrintView = ({ tree }: { tree: StructureNode[] }) => {
    if (!tree || tree.length === 0) {
        return (
            <div className="flex justify-center items-center h-full text-gray-400">
                <span className="font-bold text-lg text-gray-500">لا يوجد هيكل لعرضه</span>
            </div>
        );
    }

    const renderPrintNode = (node: StructureNode, level: number = 0) => {
        return (
            <React.Fragment key={node.id}>
                <tr className="border-b border-gray-200 dark:border-slate-800 break-inside-avoid">
                    <td className="py-3 px-4 text-sm font-bold text-gray-900 dark:text-white align-top">
                        <div style={{ paddingRight: `${level * 1.5}rem` }} className="flex items-start gap-2">
                            {level > 0 && <span className="text-gray-400 dark:text-slate-500">↳</span>}
                            <span>{node.name || 'بدون اسم'}</span>
                        </div>
                    </td>
                    <td className="py-3 px-4 whitespace-nowrap text-sm font-mono text-gray-600 dark:text-slate-400 align-top">
                        {node.code || '-'}
                    </td>
                    <td className="py-3 px-4 text-sm text-gray-600 dark:text-slate-400 align-top max-w-sm">
                        {node.description || '-'}
                    </td>
                    <td className="py-3 px-4 whitespace-nowrap text-sm align-top">
                        {node.is_active ? (
                            <span className="text-emerald-600 dark:text-emerald-400 font-bold">مفعل</span>
                        ) : (
                            <span className="text-rose-600 dark:text-rose-400 font-bold">موقوف</span>
                        )}
                    </td>
                </tr>
                {node.children?.map(child => renderPrintNode(child, level + 1))}
            </React.Fragment>
        );
    };

    return (
        <div id="printable-area" className="w-full bg-white dark:bg-slate-900 print:bg-white print:text-black">
            <style dangerouslySetInnerHTML={{__html: `
                @media print {
                    /* Hide Sidebar and Header naturally */
                    aside, header {
                        display: none !important;
                    }
                    /* Reset paddings for main layout wrappers so it expands to 100% */
                    body, html, main, .refine-layout {
                        padding: 0 !important;
                        margin: 0 !important;
                        background: white !important;
                    }
                    /* Ensure table wraps nicely */
                    table {
                        width: 100% !important;
                    }
                }
            `}} />
            
            <div className="hidden print:block mb-10 text-center">
                <h1 className="text-3xl font-black mb-3 border-b-2 border-gray-900 pb-4 inline-block">دليل الهيكل التنظيمي</h1>
                <div className="flex justify-between items-center text-sm font-bold text-gray-600 mt-2">
                    <span>المؤسسة العامة للتدريب التقني والمهني</span>
                    <span>تاريخ الإصدار: {new Date().toLocaleDateString('ar-SA')}</span>
                </div>
            </div>
            
            <div className="overflow-x-auto custom-scrollbar">
                <table className="min-w-full text-right border-2 border-gray-200 dark:border-slate-700 print:border-gray-900">
                    <thead className="bg-gray-100 dark:bg-slate-800 print:bg-gray-100 border-b-2 border-gray-200 dark:border-slate-700 print:border-gray-900">
                        <tr>
                            <th className="py-4 px-4 text-sm font-black text-gray-900 dark:text-white print:text-black w-[40%]">القسم / الإدارة</th>
                            <th className="py-4 px-4 text-sm font-black text-gray-900 dark:text-white print:text-black">رمز الكود</th>
                            <th className="py-4 px-4 text-sm font-black text-gray-900 dark:text-white print:text-black w-[40%]">الوصف</th>
                            <th className="py-4 px-4 text-sm font-black text-gray-900 dark:text-white print:text-black">الحالة</th>
                        </tr>
                    </thead>
                    <tbody>
                        {tree.map(rootNode => renderPrintNode(rootNode, 0))}
                    </tbody>
                </table>
            </div>
            
            <div className="hidden print:block mt-10 text-center text-xs text-gray-500 font-medium">
                تم استخراج هذا التقرير آلياً من نظام أتمتة الخطط الاستراتيجية (Sofoit).
            </div>
        </div>
    );
};
