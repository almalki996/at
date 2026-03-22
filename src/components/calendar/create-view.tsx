"use client";

import React, { useState, useMemo } from "react";
import { useCreate, useList } from "@refinedev/core";
import { generateWeeks, calculateStats, getArabicWeekName, arabicWeekDays, formatDateOnly, getHijriDate } from "./utils";
import { CalendarWeek, DayType, CalendarEvent } from "./types";
import { ArrowRight, Calendar as CalendarIcon, Save, RefreshCw, CheckCircle2, Circle, CheckSquare, Printer } from "lucide-react";
import toast from "react-hot-toast";
import DatePicker, { registerLocale } from 'react-datepicker';
import "react-datepicker/dist/react-datepicker.css";
import { ar } from 'date-fns/locale/ar';

registerLocale('ar', ar);

interface CreateViewProps {
    onBack: () => void;
}

export default function CreateView({ onBack }: CreateViewProps) {
    const [name, setName] = useState("");
    const [startDate, setStartDate] = useState("");
    const [endDate, setEndDate] = useState("");
    const [weeksData, setWeeksData] = useState<CalendarWeek[]>([]);
    const [hasGenerated, setHasGenerated] = useState(false);
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [selectedWeekends, setSelectedWeekends] = useState<number[]>([5, 6]);
    
    // Fetch existing calendars for overlap validation
    const { query: calendarsQuery } = useList<CalendarEvent>({
        resource: "calendar",
        // @ts-ignore
        pagination: { mode: "off" }
    });
    
    const { mutate: createRecord } = useCreate();

    const stats = useMemo(() => calculateStats(weeksData), [weeksData]);

    const handleGenerate = () => {
        if (!name.trim() || !startDate || !endDate) {
            toast.error("يرجى إدخال اسم الفترة وتاريخ البداية والنهاية");
            return;
        }

        // Overlap Validation
        const calendarsData = calendarsQuery?.data;
        if (calendarsData?.data) {
            const newStart = new Date(startDate);
            const newEnd = new Date(endDate);
            
            const hasOverlap = calendarsData.data.some((cal: CalendarEvent) => {
                if (cal.is_active === false) return false; // Ignore inactive calendars
                const calStart = new Date(cal.start_date);
                const calEnd = new Date(cal.end_date);
                return (newStart <= calEnd) && (newEnd >= calStart);
            });
            
            if (hasOverlap) {
                toast.error("عذراً، هذه الفترة تتقاطع مع تقويم تدريبي آخر (مُفعّل) موجود مسبقاً في النظام.");
                return;
            }
        }

        const generated = generateWeeks(startDate, endDate, selectedWeekends);
        if (generated.length === 0) {
            toast.error("تاريخ النهاية يجب أن يكون بعد تاريخ البداية");
            return;
        }
        setWeeksData(generated);
        setHasGenerated(true);
        toast.success(`تم تحميل ${generated.length} أسبوع بنجاح`);
    };

    const handleReset = () => {
        setName("");
        setStartDate("");
        setEndDate("");
        setWeeksData([]);
        setHasGenerated(false);
    };

    const toggleDayType = (weekIdx: number, dayIdx: number) => {
        setWeeksData(prev => {
            const next = [...prev];
            const currentType = next[weekIdx].days[dayIdx].type;
            let nextType: DayType = 'training';
            
            if (currentType === 'training') nextType = 'vacation';
            else if (currentType === 'vacation') nextType = 'event';
            else nextType = 'training';

            next[weekIdx].days[dayIdx].type = nextType;
            return next;
        });
    };

    const setBulkWeekType = (weekIdx: number, type: DayType) => {
        setWeeksData(prev => {
            const next = [...prev];
            next[weekIdx].days = next[weekIdx].days.map(d => ({ ...d, type }));
            return next;
        });
    };

    const handleSave = () => {
        if (!hasGenerated || weeksData.length === 0) {
            toast.error("الرجاء توليد الأسابيع أولاً");
            return;
        }

        const payload = {
            name,
            start_date: startDate,
            end_date: endDate,
            is_active: true,
            total_weeks: stats.total_weeks,
            training_days: stats.training_days,
            vacation_days: stats.vacation_days,
            event_days: stats.event_days,
            weeks_data: weeksData
        };

        setIsSubmitting(true);
        createRecord({
            resource: "calendar",
            values: payload,
            successNotification: () => ({ message: "تم حفظ التقويم بنجاح", type: "success" })
        }, {
            onSuccess: () => {
                setIsSubmitting(false);
                onBack();
            },
            onError: (err) => {
                setIsSubmitting(false);
                toast.error(err?.message || "حدث خطأ أثناء حفظ التقويم");
            }
        });
    };

    return (
        <div className="w-full h-[calc(100vh-5rem)] flex flex-col p-4 md:p-6 mx-auto rtl print:p-0 print:h-auto print:bg-white bg-transparent">
            {/* Top Bar matching Image 2 */}
            <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-800 p-4 mb-5 shrink-0 flex flex-col gap-4 print:hidden">
                <div className="flex flex-wrap items-center justify-between gap-4">
                    <button 
                        onClick={onBack}
                        className="flex items-center gap-2 px-4 py-2 text-gray-700 dark:text-gray-300 bg-gray-100 dark:bg-slate-800 hover:bg-gray-200 dark:hover:bg-slate-700 rounded-xl transition-all font-bold text-sm"
                    >
                        <ArrowRight size={16} />
                        رجوع للخلف
                    </button>
                    <div className="text-xl font-black text-slate-800 dark:text-slate-100 flex items-center gap-2">
                        <CalendarIcon className="text-teal-600" />
                        التقويم الزمني
                    </div>
                </div>

                <div className="flex flex-wrap items-end gap-4 bg-gray-50 dark:bg-slate-800/50 p-4 rounded-xl border border-gray-100 dark:border-slate-700/50">
                    <div className="flex-1 min-w-[200px]">
                        <label className="text-xs font-bold text-gray-500 mb-1 block">اسم الفترة التدريبية</label>
                        <input 
                            type="text" 
                            className="w-full px-4 py-2.5 bg-white dark:bg-slate-900 text-gray-900 dark:text-white border border-gray-200 dark:border-slate-700 rounded-xl focus:border-teal-500 outline-none transition-all placeholder:text-gray-400 text-sm"
                            placeholder="مثال: الفصل التدريبي الأول 1447هـ"
                            value={name}
                            onChange={e => setName(e.target.value)}
                        />
                    </div>
                    <div className="w-full sm:w-auto">
                        <label className="text-xs font-bold text-gray-500 mb-1 block">تاريخ البداية</label>
                        <div className="relative w-full sm:w-48">
                            <DatePicker
                                selected={startDate ? new Date(startDate) : null}
                                onChange={(date: Date | null) => {
                                    if (date) {
                                        const offset = date.getTimezoneOffset() * 60000;
                                        setStartDate((new Date(date.getTime() - offset)).toISOString().split('T')[0]);
                                    } else {
                                        setStartDate("");
                                    }
                                }}
                                dateFormat="yyyy/MM/dd"
                                locale="ar"
                                placeholderText="اختر التاريخ"
                                className="w-full pl-4 pr-11 py-2.5 bg-white dark:bg-slate-900 text-gray-900 dark:text-white border border-gray-200 dark:border-slate-700 rounded-xl focus:border-teal-500 outline-none transition-all cursor-pointer font-sans text-sm"
                                wrapperClassName="w-full"
                                showPopperArrow={false}
                                todayButton="اليوم"
                            />
                            <div className="absolute right-4 top-1/2 -translate-y-1/2 pointer-events-none text-slate-400">
                                <CalendarIcon size={18} />
                            </div>
                        </div>
                    </div>
                    <div className="w-full sm:w-auto">
                        <label className="text-xs font-bold text-gray-500 mb-1 block">تاريخ النهاية</label>
                        <div className="relative w-full sm:w-48">
                            <DatePicker
                                selected={endDate ? new Date(endDate) : null}
                                onChange={(date: Date | null) => {
                                    if (date) {
                                        const offset = date.getTimezoneOffset() * 60000;
                                        setEndDate((new Date(date.getTime() - offset)).toISOString().split('T')[0]);
                                    } else {
                                        setEndDate("");
                                    }
                                }}
                                dateFormat="yyyy/MM/dd"
                                locale="ar"
                                placeholderText="اختر التاريخ"
                                className="w-full pl-4 pr-11 py-2.5 bg-white dark:bg-slate-900 text-gray-900 dark:text-white border border-gray-200 dark:border-slate-700 rounded-xl focus:border-teal-500 outline-none transition-all cursor-pointer font-sans text-sm"
                                wrapperClassName="w-full"
                                showPopperArrow={false}
                                todayButton="اليوم"
                            />
                            <div className="absolute right-4 top-1/2 -translate-y-1/2 pointer-events-none text-slate-400">
                                <CalendarIcon size={18} />
                            </div>
                        </div>
                    </div>
                </div>
                
                {/* Weekend configuration row */}
                <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 bg-gray-50/50 dark:bg-slate-800/30 p-3 rounded-xl border border-gray-100 dark:border-slate-700/50">
                    <div className="flex items-center gap-2">
                        <label className="text-sm font-bold text-gray-600 dark:text-gray-300">أيام الإجازة الأسبوعية المعتمدة:</label>
                        <div className="flex gap-1.5 flex-wrap">
                            {arabicWeekDays.map((dayName, idx) => (
                                <button
                                    key={idx}
                                    onClick={() => {
                                        setSelectedWeekends(prev => 
                                            prev.includes(idx) ? prev.filter(d => d !== idx) : [...prev, idx]
                                        );
                                    }}
                                    className={`px-3 py-1.5 rounded-lg text-xs font-bold border transition-colors ${
                                        selectedWeekends.includes(idx) 
                                            ? 'bg-cyan-100 dark:bg-cyan-900/30 text-cyan-700 dark:text-cyan-400 border-cyan-200 dark:border-cyan-800' 
                                            : 'bg-white dark:bg-slate-800 text-gray-500 dark:text-gray-400 border-gray-200 dark:border-slate-700 hover:border-cyan-400'
                                    }`}
                                >
                                    {dayName}
                                </button>
                            ))}
                        </div>
                    </div>
                    
                    <div className="flex items-center gap-3 w-full sm:w-auto mt-2 sm:mt-0">
                        <button 
                            onClick={handleReset}
                            className="flex-1 sm:flex-none px-6 py-2.5 bg-white dark:bg-slate-800 text-gray-700 dark:text-gray-300 border border-gray-200 dark:border-slate-700 hover:bg-gray-100 dark:hover:bg-slate-700 rounded-xl transition-all font-bold text-sm flex items-center justify-center gap-2 h-[42px]"
                        >
                            <RefreshCw size={16} />
                            إعادة تعيين
                        </button>

                        <button 
                            onClick={handleGenerate}
                            className="flex-1 sm:flex-none px-6 py-2.5 bg-teal-500 hover:bg-teal-600 text-white rounded-xl transition-all shadow-md shadow-teal-500/20 font-bold text-sm h-[42px]"
                        >
                            توليد الأسابيع
                        </button>
                    </div>
                </div>
            </div>

            {/* Generated Weeks Area */}
            {hasGenerated ? (
                <div className="flex-1 overflow-y-auto custom-scrollbar bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-800 p-4 md:p-6 mb-5 flex flex-col print:border-none print:shadow-none print:p-0 print:overflow-visible">
                    <div className="text-center flex justify-center items-center gap-4 text-teal-600 dark:text-teal-400 font-bold mb-6 bg-teal-50 dark:bg-teal-900/20 py-2 rounded-xl border border-teal-100 dark:border-teal-900/50 print:bg-transparent print:border-none print:text-black">
                        تم تحميل {weeksData.length} أسبوع بنجاح
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 2xl:grid-cols-5 gap-4 pb-4 print:grid-cols-2 print:gap-4">
                        {weeksData.map((week, wIdx) => {
                            // Calculate week stats locally just for the UI header matching Image 4 (training/vacation/event counts)
                            let wT = 0, wV = 0, wE = 0;
                            week.days.forEach(d => {
                                if (d.type === 'training') wT++;
                                else if (d.type === 'vacation') wV++;
                                else wE++;
                            });

                            return (
                                <div key={wIdx} className="bg-white dark:bg-slate-800 rounded-2xl border border-gray-200 dark:border-slate-700 shadow-sm overflow-hidden flex flex-col print:border-gray-800 print:break-inside-avoid">
                                    <div className="bg-teal-600 dark:bg-teal-800 text-white text-center py-2.5 font-black text-sm relative print:bg-gray-100 print:text-black print:border-b print:border-gray-800">
                                        {getArabicWeekName(week.weekNumber)}
                                        {/* Optional date range subtitle */}
                                        <div className="text-[10px] font-normal text-teal-100 mt-0.5 print:text-gray-700" dir="ltr">
                                            {formatDateOnly(week.startDate)} - {formatDateOnly(week.endDate)}
                                        </div>
                                    </div>
                                    
                                    {/* Stats for the week - Optional visually, but nice to map Image 4 */}
                                    <div className="flex text-[10px] text-white p-1 gap-1 font-bold print:hidden">
                                        <div className="flex-1 bg-emerald-500 rounded text-center py-1 cursor-pointer hover:bg-emerald-600 transition" onClick={() => setBulkWeekType(wIdx, 'training')} title="تحديد كامل الأسبوع للتدريب">تدريب {wT}</div>
                                        <div className="flex-1 bg-cyan-500 rounded text-center py-1 cursor-pointer hover:bg-cyan-600 transition" onClick={() => setBulkWeekType(wIdx, 'vacation')} title="تحديد كامل الأسبوع كإجازة">إجازة {wV}</div>
                                        <div className="flex-1 bg-teal-400 rounded text-center py-1 cursor-pointer hover:bg-teal-500 transition" onClick={() => setBulkWeekType(wIdx, 'event')} title="مجموعة مناسبات">مناسبة {wE}</div>
                                    </div>

                                    <div className="flex-1 flex flex-col p-2 gap-1 bg-gray-50/50 dark:bg-slate-800/50 print:bg-white print:gap-0">
                                        {week.days.map((day, dIdx) => (
                                            <div 
                                                key={dIdx} 
                                                onClick={() => toggleDayType(wIdx, dIdx)}
                                                className="flex items-center justify-between p-2 rounded-lg bg-white dark:bg-slate-700/50 border border-gray-100 dark:border-slate-600/50 hover:border-teal-300 dark:hover:border-teal-500/50 cursor-pointer transition-colors group print:border-b print:border-gray-200 print:rounded-none"
                                            >
                                                <div className="flex items-center gap-3">
                                                    <span className={`text-xs font-bold w-14 print:text-black ${
                                                        day.type === 'training' ? 'text-gray-700 dark:text-gray-200' : 
                                                        day.type === 'vacation' ? 'text-cyan-600 dark:text-cyan-400' :
                                                        'text-teal-600 dark:text-teal-400'
                                                    }`}>
                                                        {arabicWeekDays[day.dayOfWeek]}
                                                    </span>
                                                    <div className="flex flex-col text-right">
                                                        <span className="text-[11px] text-gray-500 font-mono print:text-gray-800" dir="ltr">
                                                            {formatDateOnly(day.date).substring(5)}
                                                        </span>
                                                        <span className="text-[9.5px] text-gray-400 font-mono print:text-gray-500" dir="rtl">
                                                            {getHijriDate(day.date)}
                                                        </span>
                                                    </div>
                                                </div>
                                                <div className="shrink-0 flex items-center justify-center">
                                                    {day.type === 'training' ? (
                                                        <CheckCircle2 size={18} className="text-blue-600 dark:text-blue-500 drop-shadow-sm print:text-black" />
                                                    ) : day.type === 'vacation' ? (
                                                        <CheckCircle2 size={18} className="text-cyan-500 drop-shadow-sm print:text-gray-500" />
                                                    ) : (
                                                        <CheckCircle2 size={18} className="text-teal-400 drop-shadow-sm print:text-gray-500" />
                                                    )}
                                                </div>
                                            </div>
                                        ))}
                                    </div>
                                </div>
                            );
                        })}
                    </div>
                </div>
            ) : (
                <div className="flex-1 bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-800 flex items-center justify-center text-gray-400 dark:text-slate-600 mb-5 text-sm p-4 text-center">
                    قم بإدخال البيانات واضغط على "توليد الأسابيع" لعرض التقويم.
                </div>
            )}

            {/* Bottom Actions */}
            <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-800 p-4 shrink-0 flex items-center justify-between print:hidden">
                <button 
                    onClick={onBack}
                    className="px-6 py-2.5 bg-rose-600 hover:bg-rose-700 text-white rounded-xl font-bold transition-all shadow-md shadow-rose-600/20 text-sm"
                >
                    إغلاق
                </button>
                <div className="flex gap-3">
                    {hasGenerated && (
                        <button 
                            onClick={() => window.print()}
                            className="flex items-center gap-2 px-6 py-2.5 bg-gray-100 dark:bg-slate-800 hover:bg-gray-200 dark:hover:bg-slate-700 text-gray-700 dark:text-gray-300 rounded-xl font-bold transition-all text-sm border border-gray-200 dark:border-slate-700"
                        >
                            <Printer size={16} /> طباعة
                        </button>
                    )}
                    <button 
                        onClick={handleSave}
                        disabled={isSubmitting || !hasGenerated}
                        className="flex items-center gap-2 px-8 py-2.5 bg-teal-500 hover:bg-teal-600 text-white rounded-xl font-bold transition-all shadow-md shadow-teal-500/20 text-sm disabled:opacity-50 disabled:cursor-not-allowed"
                    >
                        {isSubmitting ? <RefreshCw size={16} className="animate-spin" /> : <Save size={16} />}
                        حفظ التقويم
                    </button>
                </div>
            </div>
        </div>
    );
}
