import React from 'react';
import { createPortal } from 'react-dom';
import { ChevronDown, Check } from 'lucide-react';

interface CustomSelectProps {
    options: { value: string | number; label: string; [key: string]: any }[];
    value?: string | number;
    onChange: (val: string | number) => void;
    placeholder?: string;
    disabled?: boolean;
    renderOption?: (opt: any) => React.ReactNode;
    renderValue?: (opt: any) => React.ReactNode;
    className?: string;
}

export const CustomSelect = ({ 
    options, 
    value, 
    onChange, 
    placeholder = "اختر...", 
    disabled = false, 
    renderOption,
    renderValue,
    className
}: CustomSelectProps) => {
    const [isOpen, setIsOpen] = React.useState(false);
    const ref = React.useRef<HTMLDivElement>(null);
    const [rect, setRect] = React.useState<DOMRect | null>(null);

    const updateRect = () => {
        if (ref.current) {
            setRect(ref.current.getBoundingClientRect());
        }
    };

    React.useEffect(() => {
        if (isOpen) {
            updateRect();
            window.addEventListener('scroll', updateRect, true);
            window.addEventListener('resize', updateRect);
        }
        return () => {
            window.removeEventListener('scroll', updateRect, true);
            window.removeEventListener('resize', updateRect);
        };
    }, [isOpen]);
    
    React.useEffect(() => {
        const handleClick = (e: MouseEvent) => {
            const target = e.target as Element;
            if (ref.current && !ref.current.contains(target) && !target.closest('.custom-select-portal')) {
                setIsOpen(false);
            }
        };
        document.addEventListener("mousedown", handleClick);
        return () => document.removeEventListener("mousedown", handleClick);
    }, []);

    const selected = options.find((o) => o.value === value) || null;

    return (
        <div className="relative w-full" ref={ref}>
            <button
                type="button"
                className={className || `w-full flex items-center justify-between px-4 py-3 bg-white dark:bg-slate-900 border ${isOpen ? 'border-teal-500 ring-4 ring-teal-500/10' : 'border-gray-200 dark:border-slate-700'} rounded-xl text-sm transition-all focus:outline-none ${disabled ? 'opacity-50 cursor-not-allowed bg-gray-50 dark:bg-slate-800/50' : 'hover:border-teal-400 dark:hover:border-teal-600'}`}
                onClick={(e) => { e.preventDefault(); !disabled && setIsOpen(!isOpen); }}
            >
                <div className="flex-1 text-right text-gray-700 dark:text-gray-200 truncate pl-2">
                    {selected ? (renderValue ? renderValue(selected) : selected.label) : <span className="text-gray-400 dark:text-slate-500">{placeholder}</span>}
                </div>
                <ChevronDown size={18} className={`text-gray-400 transition-transform duration-200 shrink-0 ${isOpen ? 'rotate-180 text-teal-500' : ''}`} />
            </button>
            
            {isOpen && rect && typeof document !== 'undefined' && createPortal(
                <div 
                    className="custom-select-portal fixed z-[9999] bg-white dark:bg-slate-800 border border-gray-100 dark:border-slate-700 rounded-xl shadow-2xl overflow-y-auto py-2 custom-scrollbar animate-in fade-in zoom-in-95 duration-200 focus:outline-none"
                    style={{
                        top: `${rect.bottom + 8}px`,
                        left: `${rect.left}px`,
                        width: `${rect.width}px`,
                        maxHeight: '260px'
                    }}
                >
                    {options.length === 0 ? (
                        <div className="px-4 py-3 text-sm text-center text-gray-500 dark:text-slate-400">لا توجد خيارات</div>
                    ) : (
                        options.map((opt) => (
                            <button
                                key={opt.value}
                                type="button"
                                className={`w-full text-right px-4 py-2.5 text-sm transition-colors flex items-center justify-between
                                    ${value === opt.value 
                                        ? 'bg-teal-50 dark:bg-teal-900/20 text-teal-700 dark:text-teal-400 font-bold' 
                                        : 'text-gray-700 dark:text-slate-300 hover:bg-gray-50 dark:hover:bg-slate-700/50'}`}
                                onMouseDown={(e) => { e.preventDefault(); e.stopPropagation(); onChange(opt.value); setIsOpen(false); }}
                            >
                                <div className="flex-1 truncate text-right">
                                    {renderOption ? renderOption(opt) : opt.label}
                                </div>
                                {value === opt.value && <Check size={16} className="text-teal-600 dark:text-teal-400 ml-2 shrink-0" />}
                            </button>
                        ))
                    )}
                </div>,
                document.body
            )}
        </div>
    );
};
