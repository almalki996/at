import React from "react";
import { Trash2 } from "lucide-react";

interface DeleteConfirmationModalProps {
    isOpen: boolean;
    onClose: () => void;
    onConfirm: () => void;
    title: string;
    message: React.ReactNode;
    isSubmitting: boolean;
}

export const DeleteConfirmationModal: React.FC<DeleteConfirmationModalProps> = ({ 
    isOpen, 
    onClose, 
    onConfirm, 
    title, 
    message, 
    isSubmitting 
}) => {
    if (!isOpen) return null;

    return (
        <div 
            className="fixed inset-0 z-[200] flex items-center justify-center p-4 bg-slate-900/50 backdrop-blur-sm animate-in fade-in duration-200" 
            onClick={(e) => { 
                if (e.target === e.currentTarget && !isSubmitting) onClose(); 
            }}
        >
            <div className="bg-white dark:bg-slate-900 rounded-xl shadow-xl w-full max-w-sm flex flex-col overflow-hidden animate-in zoom-in-95 duration-200 border border-slate-200 dark:border-slate-800">
                <div className="p-6 text-center space-y-4">
                    <div className="w-16 h-16 bg-rose-100 dark:bg-rose-900/30 text-rose-600 rounded-full flex items-center justify-center mx-auto mb-4">
                        <Trash2 size={28} />
                    </div>
                    <h3 className="text-xl font-bold text-gray-900 dark:text-white">{title}</h3>
                    <div className="text-sm text-gray-500 dark:text-slate-400">
                        {message}
                    </div>
                </div>
                <div className="px-6 py-4 bg-gray-50 dark:bg-slate-800/80 border-t border-gray-100 dark:border-slate-800 flex items-center justify-center gap-3">
                    <button 
                        onClick={onConfirm} 
                        disabled={isSubmitting} 
                        className="flex-1 px-4 py-2.5 bg-rose-600 hover:bg-rose-700 text-white rounded-xl text-sm font-bold transition-colors disabled:opacity-50"
                    >
                        {isSubmitting ? "جاري الحذف..." : "حذف"}
                    </button>
                    <button 
                        onClick={() => !isSubmitting && onClose()} 
                        disabled={isSubmitting} 
                        className="flex-1 px-4 py-2.5 bg-slate-200 hover:bg-slate-300 dark:bg-slate-700 dark:hover:bg-slate-600 text-slate-700 dark:text-white rounded-xl text-sm font-bold transition-colors disabled:opacity-50"
                    >
                        إلغاء
                    </button>
                </div>
            </div>
        </div>
    );
};
