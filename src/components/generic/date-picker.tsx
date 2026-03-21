import React from 'react';
import DatePicker, { registerLocale } from 'react-datepicker';
import "react-datepicker/dist/react-datepicker.css";
import { Controller, Control } from "react-hook-form";
import { ar } from 'date-fns/locale/ar';
import { Calendar } from 'lucide-react';

registerLocale('ar', ar);

interface DatePickerFieldProps {
    control: Control<any>;
    name: string;
    placeholder?: string;
    required?: boolean;
    error?: boolean;
}

export function DatePickerField({ control, name, placeholder = "اختر التاريخ", required = false, error = false }: DatePickerFieldProps) {
    return (
        <Controller
            control={control}
            name={name}
            rules={{ required }}
            render={({ field }) => (
                <div className="relative w-full">
                    <DatePicker
                        selected={field.value ? new Date(field.value) : null}
                        onChange={(date: Date | null) => {
                            if (date) {
                                const offset = date.getTimezoneOffset() * 60000;
                                const localISOTime = (new Date(date.getTime() - offset)).toISOString().split('T')[0];
                                field.onChange(localISOTime);
                            } else {
                                field.onChange("");
                            }
                        }}
                        dateFormat="yyyy/MM/dd"
                        locale="ar"
                        placeholderText={placeholder}
                        className={`w-full pl-4 pr-11 py-2.5 bg-white dark:bg-slate-900 text-gray-900 dark:text-white border-2 rounded-xl focus:ring-4 outline-none transition-all cursor-pointer font-sans ${error ? 'border-red-400 focus:border-red-500 focus:ring-red-500/10' : 'border-gray-200 dark:border-slate-700 focus:border-teal-500 focus:ring-teal-500/10'}`}
                        wrapperClassName="w-full"
                        showPopperArrow={false}
                        portalId="datepicker-portal"
                        popperProps={{
                            strategy: "fixed"
                        }}
                        peekNextMonth
                        showMonthDropdown
                        showYearDropdown
                        dropdownMode="select"
                        minDate={new Date(1950, 0, 1)}
                        maxDate={new Date(2100, 11, 31)}
                    />
                    <div className="absolute right-4 top-1/2 -translate-y-1/2 pointer-events-none text-slate-400">
                        <Calendar size={18} />
                    </div>
                </div>
            )}
        />
    );
}
