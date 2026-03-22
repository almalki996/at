"use client";

import React from "react";
import { Calendar as CalendarIcon, X, PlusCircle, ListTodo } from "lucide-react";

interface WelcomeViewProps {
    onCreateNew: () => void;
    onViewExisting: () => void;
}

export default function WelcomeView({ onCreateNew, onViewExisting }: WelcomeViewProps) {
    return (
        <div className="w-full h-[calc(100vh-5rem)] flex items-center justify-center p-4">
            <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-2xl w-full max-w-2xl overflow-hidden border border-gray-100 dark:border-slate-800 flex flex-col items-center justify-center p-12 text-center animate-in fade-in zoom-in-95 duration-300">
                {/* Header Window Bar */}
                <div className="w-full absolute top-0 left-0 right-0 h-10 bg-slate-800 flex items-center justify-between px-4 text-white">
                    <div className="flex gap-2">
                        <div className="w-3 h-3 rounded-full bg-slate-600"></div>
                        <div className="w-3 h-3 rounded-full bg-slate-600"></div>
                    </div>
                    <span className="text-sm font-bold flex items-center gap-2">
                        التقويم الزمني <CalendarIcon size={14} />
                    </span>
                    <button className="text-gray-400 hover:text-white transition-colors">
                        <X size={16} />
                    </button>
                </div>

                {/* Content */}
                <div className="mt-8 flex flex-col items-center gap-6">
                    <div className="w-24 h-24 bg-teal-50 dark:bg-teal-900/40 text-teal-500 rounded-3xl flex items-center justify-center mb-4">
                        <CalendarIcon size={48} />
                    </div>
                    
                    <div>
                        <h2 className="text-3xl font-black text-teal-600 dark:text-teal-400 mb-3">مرحباً بك في التقويم التدريبي</h2>
                        <p className="text-gray-500 dark:text-gray-400 text-lg">يمكنك إنشاء وإدارة التقاويم التدريبية بسهولة</p>
                    </div>

                    <div className="flex flex-col sm:flex-row gap-4 mt-8 w-full sm:w-auto">
                        <button 
                            onClick={onCreateNew}
                            className="flex items-center justify-center gap-2 px-8 py-3.5 bg-teal-500 hover:bg-teal-600 text-white rounded-xl font-bold transition-all shadow-lg shadow-teal-500/30 hover:shadow-teal-500/40 text-lg w-full sm:w-auto"
                        >
                            <PlusCircle size={20} />
                            إنشاء تقويم جديد
                        </button>

                        <button 
                            onClick={onViewExisting}
                            className="flex items-center justify-center gap-2 px-8 py-3.5 bg-white dark:bg-slate-800 text-teal-700 dark:text-teal-400 border-2 border-teal-100 dark:border-teal-900/50 hover:bg-teal-50 dark:hover:bg-teal-900/20 rounded-xl font-bold transition-all text-lg w-full sm:w-auto"
                        >
                            <ListTodo size={20} />
                            عرض التقاويم الموجودة
                        </button>
                    </div>
                </div>
            </div>
        </div>
    );
}
