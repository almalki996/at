import React from "react";
import { FolderTree, GitMerge, Printer } from "lucide-react";

export type ViewMode = 'tree' | 'chart' | 'print';

export interface ViewToggleProps {
    viewMode: ViewMode;
    setViewMode: (mode: ViewMode) => void;
}

export const ViewToggle = ({ viewMode, setViewMode }: ViewToggleProps) => {
    return (
        <div className="flex items-center bg-gray-100/80 dark:bg-slate-800/80 p-1.5 rounded-xl border border-gray-200 dark:border-slate-700 shrink-0">
            <button
                onClick={() => setViewMode('tree')}
                className={`flex items-center gap-1.5 px-4 py-2 text-sm font-bold rounded-lg transition-all ${
                    viewMode === 'tree' 
                    ? 'bg-white dark:bg-slate-700 text-indigo-600 dark:text-indigo-400 shadow-sm' 
                    : 'text-gray-500 hover:text-gray-700 dark:text-slate-400 dark:hover:text-slate-200 hover:bg-gray-200/50 dark:hover:bg-slate-700/50'
                }`}
                title="الشجرة التفاعلية"
            >
                <FolderTree size={16} />
                <span className="hidden sm:inline">شجرة</span>
            </button>
            
            <button
                onClick={() => setViewMode('chart')}
                className={`flex items-center gap-1.5 px-4 py-2 text-sm font-bold rounded-lg transition-all ${
                    viewMode === 'chart' 
                    ? 'bg-white dark:bg-slate-700 text-blue-600 dark:text-blue-400 shadow-sm' 
                    : 'text-gray-500 hover:text-gray-700 dark:text-slate-400 dark:hover:text-slate-200 hover:bg-gray-200/50 dark:hover:bg-slate-700/50'
                }`}
                title="المخطط الرسومي"
            >
                <GitMerge size={16} className="-rotate-90" />
                <span className="hidden sm:inline">مخطط</span>
            </button>

            <button
                onClick={() => setViewMode('print')}
                className={`flex items-center gap-1.5 px-4 py-2 text-sm font-bold rounded-lg transition-all ${
                    viewMode === 'print' 
                    ? 'bg-white dark:bg-slate-700 text-emerald-600 dark:text-emerald-400 shadow-sm' 
                    : 'text-gray-500 hover:text-gray-700 dark:text-slate-400 dark:hover:text-slate-200 hover:bg-gray-200/50 dark:hover:bg-slate-700/50'
                }`}
                title="جدول الطباعة"
            >
                <Printer size={16} />
                <span className="hidden sm:inline">طباعة</span>
            </button>
        </div>
    );
};
