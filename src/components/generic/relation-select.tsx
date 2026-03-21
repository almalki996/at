import React, { useState, useRef, useEffect } from "react";
import { createPortal } from "react-dom";
import { useSelect } from "@refinedev/core";
import { useController, Control } from "react-hook-form";
import { ChevronDown, Check, Search } from "lucide-react";

export function RelationSelect({ 
    resource, 
    fieldName, 
    control, 
    required, 
    placeholder 
}: { 
    resource: string; 
    fieldName: string; 
    control: Control<any>; 
    required: boolean; 
    placeholder: string; 
}) {
    const { options, query } = useSelect({
        resource,
        optionValue: "id",
    });

    const {
        field: { onChange, value },
    } = useController({
        name: fieldName,
        control,
        rules: { required },
    });

    const [isOpen, setIsOpen] = useState(false);
    const [searchTerm, setSearchTerm] = useState("");
    const wrapperRef = useRef<HTMLDivElement>(null);
    const [rect, setRect] = useState<DOMRect | null>(null);

    const updateRect = () => {
        if (wrapperRef.current) {
            setRect(wrapperRef.current.getBoundingClientRect());
        }
    };

    useEffect(() => {
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

    useEffect(() => {
        const handleClickOutside = (event: MouseEvent) => {
            const target = event.target as Element;
            if (wrapperRef.current && !wrapperRef.current.contains(target) && !target.closest('.portal-dropdown-content')) {
                setIsOpen(false);
            }
        };
        document.addEventListener("mousedown", handleClickOutside);
        return () => document.removeEventListener("mousedown", handleClickOutside);
    }, []);

    const renderLabel = (opt: any) => {
        const originalData = query?.data?.data?.find((d: any) => d.id === opt.value) as any;
        if (originalData) {
            return originalData.name || originalData.title || originalData.job_title || originalData.العنوان || opt.label || opt.value;
        }
        return opt.label || opt.value;
    };

    const filteredOptions = options?.filter(opt => 
        renderLabel(opt)?.toString().toLowerCase().includes(searchTerm.toLowerCase())
    ) || [];

    const selectedOption = options?.find((o: any) => String(o.value) === String(value));

    return (
        <div className="relative" ref={wrapperRef}>
            <button
                type="button"
                onClick={() => setIsOpen(!isOpen)}
                className={`w-full flex items-center justify-between px-4 py-3 bg-white dark:bg-slate-900 border-2 rounded-xl text-sm transition-all focus:outline-none ${isOpen ? 'border-indigo-500 ring-4 ring-indigo-500/10' : 'border-gray-200 dark:border-slate-700 hover:border-indigo-400 dark:hover:border-indigo-600'}`}
            >
                <div className="flex-1 text-right text-gray-900 dark:text-white truncate font-medium">
                    {query.isLoading ? (
                        <span className="text-gray-400 animate-pulse">جاري التحميل...</span>
                    ) : selectedOption ? (
                        renderLabel(selectedOption)
                    ) : (
                        <span className="text-gray-400 dark:text-slate-500">{placeholder}</span>
                    )}
                </div>
                <ChevronDown size={18} className={`text-gray-400 transition-transform duration-200 ${isOpen ? 'rotate-180 text-indigo-500' : ''}`} />
            </button>

            {isOpen && rect && typeof document !== 'undefined' && createPortal(
                <div 
                    className="portal-dropdown-content fixed z-[9999] bg-white dark:bg-slate-800 border border-gray-100 dark:border-slate-700 rounded-xl shadow-2xl flex flex-col overflow-hidden animate-in fade-in zoom-in-95 duration-200"
                    style={{
                        top: `${rect.bottom + 8}px`,
                        left: `${rect.left}px`,
                        width: `${rect.width}px`,
                        maxHeight: '320px'
                    }}
                >
                    <div className="p-2 border-b border-gray-100 dark:border-slate-700 shrink-0">
                        <div className="relative">
                            <Search size={16} className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400" />
                            <input 
                                type="text"
                                className="w-full bg-gray-50 dark:bg-slate-900/50 text-sm border-none rounded-lg pr-9 pl-4 py-2 focus:ring-2 focus:ring-indigo-500/20 text-gray-900 dark:text-white outline-none"
                                placeholder="بحث..."
                                value={searchTerm}
                                onChange={(e) => setSearchTerm(e.target.value)}
                                onClick={(e) => e.stopPropagation()}
                            />
                        </div>
                    </div>
                    <div className="overflow-y-auto py-1 custom-scrollbar flex-1">
                        {filteredOptions.length === 0 ? (
                            <div className="px-4 py-4 text-sm text-center text-gray-500 dark:text-slate-400">لا توجد تطابقات</div>
                        ) : (
                            filteredOptions.map((opt: any) => (
                                <button
                                    key={opt.value}
                                    type="button"
                                    onMouseDown={(e) => {
                                        e.preventDefault();
                                        e.stopPropagation();
                                        onChange(opt.value);
                                        setIsOpen(false);
                                        setSearchTerm("");
                                    }}
                                    className={`w-full text-right px-4 py-3 text-[15px] transition-colors flex items-center justify-between ${String(value) === String(opt.value) ? 'bg-teal-50 dark:bg-teal-900/20 text-teal-700 dark:text-teal-400 font-bold' : 'text-gray-700 dark:text-slate-300 hover:bg-gray-50 dark:hover:bg-slate-700/50'}`}
                                >
                                    <div className="flex-1 truncate">{renderLabel(opt)}</div>
                                    {String(value) === String(opt.value) && <Check size={16} className="text-teal-600 dark:text-teal-400 ml-2 shrink-0" />}
                                </button>
                            ))
                        )}
                    </div>
                </div>,
                document.body
            )}
        </div>
    );
}
