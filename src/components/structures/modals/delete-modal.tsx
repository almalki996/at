import React from "react";
import { Trash2 } from "lucide-react";
import { StructureNode } from "../types";

export interface StructureDeleteModalProps {
    isOpen: boolean;
    onClose: () => void;
    nodeToDelete: StructureNode | null;
    onConfirm: () => void;
}

export const StructureDeleteModal = ({ isOpen, onClose, nodeToDelete, onConfirm }: StructureDeleteModalProps) => {
    if (!isOpen || !nodeToDelete) return null;

    return (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
            <div className="absolute inset-0 bg-slate-900/60 backdrop-blur-sm transition-opacity" onClick={onClose}></div>
            <div className="relative bg-white dark:bg-slate-900 rounded-3xl shadow-2xl w-full max-w-md p-8 animate-in fade-in zoom-in-95 duration-200 border border-white/20 dark:border-slate-800 transition-colors">
                <div className="w-14 h-14 rounded-full bg-red-50 dark:bg-red-500/10 flex items-center justify-center mb-5 border border-red-100 dark:border-red-500/20">
                    <Trash2 className="text-red-600 dark:text-red-400" size={28} />
                </div>
                <h2 className="text-2xl font-black text-gray-900 dark:text-white mb-2">تأكيد الحذف</h2>
                <div className="text-gray-600 dark:text-slate-300 mb-8 font-medium leading-relaxed">
                    هل أنت متأكد من رغبتك في حذف <span className="font-bold text-indigo-700 dark:text-indigo-400">"{nodeToDelete.name || 'بدون اسم'}"</span>؟ 
                    <span className="text-sm font-bold text-red-500 mt-3 bg-red-50 dark:bg-red-900/20 p-3 rounded-lg block border border-red-100 dark:border-red-900/50">
                        ⚠️ سيتم حذفه هو وكافة الأقسام الفرعية التابعة له نهائياً ولن تتمكن من الاسترجاع.
                    </span>
                </div>
                <div className="flex gap-3 pt-2">
                    <button 
                        onClick={onConfirm} 
                        className="flex-1 bg-red-600 text-white font-bold py-3.5 px-4 rounded-xl hover:bg-red-700 hover:shadow-lg hover:shadow-red-600/20 transition-all active:scale-95"
                    >
                        نعم، احذف نهائياً
                    </button>
                    <button 
                        onClick={onClose} 
                        className="flex-1 bg-white dark:bg-slate-800 text-gray-700 dark:text-slate-300 font-bold py-3.5 px-4 rounded-xl border-2 border-gray-100 dark:border-slate-700 hover:bg-gray-50 dark:hover:bg-slate-700 transition-all active:scale-95"
                    >
                        إلغاء الأمر
                    </button>
                </div>
            </div>
        </div>
    );
};
