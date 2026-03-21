import React, { useState } from "react";
import { ChevronDown, Check } from "lucide-react";

export const CustomSelect = ({ 
    options, 
    value, 
    onChange, 
    placeholder, 
    disabled = false, 
    renderOption,
    renderValue,
    className
}: any) => {
    const [isOpen, setIsOpen] = useState(false);
    const ref = React.useRef<HTMLDivElement>(null);
    React.useEffect(() => {
        const handleClick = (e: MouseEvent) => {
            if (ref.current && !ref.current.contains(e.target as Node)) setIsOpen(false);
        };
        document.addEventListener("mousedown", handleClick);
        return () => document.removeEventListener("mousedown", handleClick);
    }, []);

    const selected = options.find((o: any) => o.value === value) || null;

    return (
        <div className={`relative ${className || ''}`} ref={ref}>
            <button
                type="button"
                className={`w-full flex items-center justify-between px-4 py-2.5 bg-white dark:bg-slate-900 border-2 ${isOpen ? 'border-indigo-500 ring-4 ring-indigo-500/10' : 'border-gray-200 dark:border-slate-700'} rounded-xl text-sm font-bold transition-all focus:outline-none ${disabled ? 'opacity-50 cursor-not-allowed bg-gray-50 dark:bg-slate-800/50' : 'hover:border-indigo-400 dark:hover:border-indigo-600'}`}
                onClick={() => !disabled && setIsOpen(!isOpen)}
            >
                <div className="flex-1 text-right text-gray-700 dark:text-gray-200 truncate pl-2">
                    {selected ? (renderValue ? renderValue(selected) : selected.label) : <span className="text-gray-400 dark:text-slate-500">{placeholder}</span>}
                </div>
                <ChevronDown size={18} className={`text-gray-400 transition-transform duration-200 ${isOpen ? 'rotate-180 text-indigo-500' : ''}`} />
            </button>
            
            {isOpen && (
                <div className="absolute z-[60] w-full mt-2 bg-white dark:bg-slate-800 border border-gray-100 dark:border-slate-700 rounded-xl shadow-xl max-h-60 overflow-y-auto py-2 custom-scrollbar animate-in fade-in slide-in-from-top-2">
                    {options.length === 0 ? (
                        <div className="px-4 py-3 text-sm text-center text-gray-500 dark:text-slate-400">لا توجد خيارات</div>
                    ) : (
                        options.map((opt: any) => (
                            <button
                                key={opt.value}
                                type="button"
                                className={`w-full text-right px-4 py-2.5 text-sm transition-colors flex items-center justify-between
                                    ${value === opt.value 
                                        ? 'bg-indigo-50 dark:bg-indigo-900/20 text-indigo-700 dark:text-indigo-400 font-bold' 
                                        : 'text-gray-700 font-bold dark:text-slate-300 hover:bg-gray-50 dark:hover:bg-slate-700/50'}`}
                                onClick={() => { onChange(opt.value); setIsOpen(false); }}
                            >
                                <div className="flex-1 truncate text-right">
                                    {renderOption ? renderOption(opt) : opt.label}
                                </div>
                                {value === opt.value && <Check size={16} className="text-indigo-600 dark:text-indigo-400 ml-2 shrink-0" />}
                            </button>
                        ))
                    )}
                </div>
            )}
        </div>
    );
};
