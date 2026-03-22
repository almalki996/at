"use client";

import React, { useState, useEffect, useMemo, useRef } from "react";
import { useList, useUpdate, useDelete } from "@refinedev/core";
import { useReactToPrint } from "react-to-print";
import { calculateStats, getArabicWeekName, arabicWeekDays, formatDateOnly, getHijriDate } from "./utils";
import { CalendarEvent, CalendarWeek, DayType } from "./types";
import { ArrowRight, Save, X, Edit, Calendar as CalendarIcon, CalendarDays, CheckCircle2, GraduationCap, Tent, Globe, Printer, Trash2, AlertTriangle } from "lucide-react";
import toast from "react-hot-toast";
import { CustomSelect } from "../generic/custom-select";

interface ListViewProps {
    onBack: () => void;
}

export default function ListView({ onBack }: ListViewProps) {
    const [selectedId, setSelectedId] = useState<string | number>("");
    const [isEditing, setIsEditing] = useState(false);
    const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false);
    const [localData, setLocalData] = useState<CalendarWeek[]>([]);
    const [isActive, setIsActive] = useState(true);
    const contentRef = useRef<HTMLDivElement>(null);

    const handlePrint = useReactToPrint({
        contentRef,
        documentTitle: 'عرض_التقويم_التدريبي',
    });

    const { query } = useList<CalendarEvent>({
        resource: "calendar",
        // @ts-ignore
        pagination: { current: 1, pageSize: 50 },
        // @ts-ignore
        sorters: [{ field: "id", order: "desc" }]
    });

    const calendars = query?.data?.data || [];
    const isLoading = query?.isLoading || false;
    const selectedCalendar = useMemo(() => calendars.find(c => String(c.id) === String(selectedId)), [calendars, selectedId]);

    const [isSubmitting, setIsSubmitting] = useState(false);
    const { mutate: updateRecord } = useUpdate();
    const { mutate: deleteRecord } = useDelete();

    useEffect(() => {
        if (selectedCalendar) {
            setLocalData(selectedCalendar.weeks_data || []);
            setIsActive(selectedCalendar.is_active ?? true);
            setIsEditing(false); // reset edit mode on change
        } else {
            setLocalData([]);
        }
    }, [selectedCalendar]);

    const stats = useMemo(() => {
        if (isEditing) return calculateStats(localData);
        if (!selectedCalendar) return { total_weeks: 0, training_days: 0, vacation_days: 0, event_days: 0 };
        return {
            total_weeks: selectedCalendar.total_weeks,
            training_days: selectedCalendar.training_days,
            vacation_days: selectedCalendar.vacation_days,
            event_days: selectedCalendar.event_days,
        };
    }, [selectedCalendar, localData, isEditing]);

    const handleSave = () => {
        if (!selectedCalendar) return;

        const payload = {
            is_active: isActive,
            weeks_data: localData,
            total_weeks: stats.total_weeks,
            training_days: stats.training_days,
            vacation_days: stats.vacation_days,
            event_days: stats.event_days,
        };

        setIsSubmitting(true);
        updateRecord({
            resource: "calendar",
            id: selectedCalendar.id!,
            values: payload,
            successNotification: () => ({ message: "تم تحديث التقويم بنجاح", type: "success" })
        }, {
            onSuccess: () => {
                setIsSubmitting(false);
                setIsEditing(false);
            },
            onError: (err) => {
                setIsSubmitting(false);
                toast.error(err?.message || "حدث خطأ أثناء التحديث");
            }
        });
    };

    const confirmDelete = () => {
        if (!selectedCalendar) return;
        setIsDeleteModalOpen(false);
        setIsSubmitting(true);
        deleteRecord({
            resource: "calendar",
            id: selectedCalendar.id!,
            successNotification: () => ({ message: "تم حذف التقويم بنجاح", type: "success" })
        }, {
            onSuccess: () => {
                setIsSubmitting(false);
                setSelectedId(""); // Clear selection
            },
            onError: (err) => {
                setIsSubmitting(false);
                toast.error(err?.message || "حدث خطأ أثناء الحذف");
            }
        });
    };

    const toggleDayType = (weekIdx: number, dayIdx: number) => {
        if (!isEditing) return;

        setLocalData(prev => {
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
        if (!isEditing) return;
        setLocalData(prev => {
            const next = [...prev];
            next[weekIdx].days = next[weekIdx].days.map(d => ({ ...d, type }));
            return next;
        });
    };

    const calendarOptions = calendars.map(c => ({
        value: c.id as string | number,
        label: c.name || `تقويم رقم ${c.id}`
    }));

    return (
        <div className="w-full h-[calc(100vh-5rem)] flex flex-col p-4 md:p-6 mx-auto rtl print:p-0 print:h-auto print:bg-white bg-transparent" ref={contentRef}>
            
            {/* Top Bar matching Image 4 */}
            <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-800 p-4 mb-5 shrink-0 flex flex-col xl:flex-row items-center justify-between gap-4 print:hidden">
                <div className="w-full xl:w-auto flex flex-wrap items-center gap-4 text-sm font-bold order-2 xl:order-1">
                    <button 
                        onClick={onBack}
                        className="px-5 py-2.5 bg-gray-100 dark:bg-slate-800 hover:bg-gray-200 dark:hover:bg-slate-700 text-gray-700 dark:text-gray-300 rounded-xl transition-all border border-transparent dark:border-slate-700"
                    >
                        إغلاق
                    </button>

                    {selectedCalendar && (
                        <>
                            {isEditing ? (
                                <button 
                                    onClick={handleSave}
                                    disabled={isSubmitting}
                                    className="flex items-center gap-2 px-6 py-2.5 bg-teal-500 hover:bg-teal-600 text-white rounded-xl transition-all shadow-md shadow-teal-500/20"
                                >
                                    <Save size={16} /> حفظ التعديلات
                                </button>
                            ) : (
                                <button 
                                    onClick={() => setIsEditing(true)}
                                    className="flex items-center gap-2 px-6 py-2.5 bg-blue-50 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400 hover:bg-blue-100 dark:hover:bg-blue-800/50 rounded-xl transition-all border border-blue-200 dark:border-blue-800"
                                >
                                    <Edit size={16} /> تعديل
                                </button>
                            )}
                            
                            {!isEditing && (
                                <>
                                    <button 
                                        onClick={() => setIsDeleteModalOpen(true)}
                                        disabled={isSubmitting}
                                        className="flex items-center gap-2 px-5 py-2.5 bg-rose-50 dark:bg-rose-900/30 hover:bg-rose-100 dark:hover:bg-rose-800/50 text-rose-600 dark:text-rose-400 rounded-xl transition-all border border-rose-200 dark:border-rose-800 disabled:opacity-50"
                                        title="حذف التقويم"
                                    >
                                        <Trash2 size={16} /> حذف
                                    </button>
                                    <button 
                                        onClick={() => handlePrint()}
                                        className="flex items-center gap-2 px-5 py-2.5 bg-gray-100 dark:bg-slate-800 hover:bg-gray-200 dark:hover:bg-slate-700 text-gray-700 dark:text-gray-300 rounded-xl transition-all border border-gray-200 dark:border-slate-700 hidden sm:flex"
                                        title="طباعة التقويم"
                                    >
                                        <Printer size={16} /> طباعة
                                    </button>
                                </>
                            )}

                            <div className="flex items-center gap-3 bg-gray-50 dark:bg-slate-800/50 px-4 py-2 rounded-xl border border-gray-200 dark:border-slate-700 h-[42px]">
                                <label className="text-gray-700 dark:text-gray-300 select-none cursor-pointer flex items-center gap-2">
                                    <button 
                                        type="button" 
                                        disabled={!isEditing}
                                        className={`w-10 h-5 rounded-full transition-colors relative ${isActive ? 'bg-blue-600' : 'bg-gray-300 dark:bg-slate-600'} ${!isEditing && 'opacity-70 cursor-not-allowed'}`}
                                        onClick={() => isEditing && setIsActive(!isActive)}
                                    >
                                        <div className={`shadow-sm w-3.5 h-3.5 bg-white rounded-full absolute top-[3px] transition-all ${isActive ? 'right-6' : 'right-1'}`}>
                                        </div>
                                    </button>
                                    تفعيل/إلغاء التفعيل
                                </label>
                            </div>
                        </>
                    )}
                </div>

                <div className="w-full xl:w-auto flex flex-1 xl:flex-none flex-col sm:flex-row items-center justify-end gap-3 order-1 xl:order-2">
                    <h2 className="text-xl font-black text-blue-600 dark:text-blue-400 w-full text-center xl:w-auto xl:text-left drop-shadow-sm mb-2 sm:mb-0 pb-2 sm:pb-0 border-b sm:border-none border-gray-100 dark:border-slate-800">
                        عرض التقويم التدريبي
                    </h2>
                    
                    <div className="flex items-center gap-3 w-full sm:w-auto bg-gray-50 dark:bg-slate-800 p-1.5 rounded-xl border border-gray-200 dark:border-slate-700">
                        <label className="text-sm font-bold text-gray-700 dark:text-gray-300 whitespace-nowrap px-2">
                            اختر الفترة التدريبية:
                        </label>
                        <div className="w-full sm:w-64">
                            <CustomSelect 
                                value={selectedId}
                                onChange={(val: any) => setSelectedId(val)}
                                options={calendarOptions}
                                placeholder="اختر التقويم..."
                            />
                        </div>
                    </div>
                </div>
            </div>

            {/* Content Area */}
            {selectedCalendar ? (
                <div className="flex-1 flex flex-col gap-4 overflow-hidden print:overflow-visible">
                    {/* Stats Header matching Image 4 */}
                    <div className="grid grid-cols-2 md:grid-cols-3 xl:grid-cols-6 gap-3 shrink-0 print:grid-cols-3 print:gap-2 print:break-inside-avoid">
                        
                        <div className="bg-orange-50 dark:bg-orange-900/20 rounded-xl p-4 flex flex-col items-center justify-center border border-orange-100 dark:border-orange-900/50">
                            <div className="text-orange-500 mb-1"><CalendarIcon size={24} /></div>
                            <div className="text-sm font-bold text-orange-600 dark:text-orange-400 mb-1">{selectedCalendar.start_date}</div>
                            <div className="text-xs text-orange-400">تاريخ البداية</div>
                        </div>
                        
                        <div className="bg-orange-50 dark:bg-orange-900/20 rounded-xl p-4 flex flex-col items-center justify-center border border-orange-100 dark:border-orange-900/50">
                            <div className="text-orange-500 mb-1"><CalendarIcon size={24} /></div>
                            <div className="text-sm font-bold text-orange-600 dark:text-orange-400 mb-1">{selectedCalendar.end_date}</div>
                            <div className="text-xs text-orange-400">تاريخ النهاية</div>
                        </div>

                        <div className="bg-blue-50 dark:bg-blue-900/20 rounded-xl p-4 flex flex-col items-center justify-center border border-blue-100 dark:border-blue-900/50">
                            <div className="text-blue-500 mb-1"><CalendarDays size={24} /></div>
                            <div className="text-xl font-black text-blue-600 dark:text-blue-400 mb-1">{stats.total_weeks}</div>
                            <div className="text-xs text-blue-400">إجمالي الأسابيع</div>
                        </div>
                        
                        <div className="bg-emerald-50 dark:bg-emerald-900/20 rounded-xl p-4 flex flex-col items-center justify-center border border-emerald-100 dark:border-emerald-900/50">
                            <div className="text-emerald-500 mb-1"><GraduationCap size={24} /></div>
                            <div className="text-xl font-black text-emerald-600 dark:text-emerald-400 mb-1">{stats.training_days}</div>
                            <div className="text-xs text-emerald-400">أيام التدريب</div>
                        </div>

                        <div className="bg-rose-50 dark:bg-rose-900/20 rounded-xl p-4 flex flex-col items-center justify-center border border-rose-100 dark:border-rose-900/50">
                            <div className="text-rose-500 mb-1"><Tent size={24} /></div>
                            <div className="text-xl font-black text-rose-600 dark:text-rose-400 mb-1">{stats.vacation_days}</div>
                            <div className="text-xs text-rose-400">أيام الإجازة</div>
                        </div>

                        <div className="bg-pink-50 dark:bg-pink-900/20 rounded-xl p-4 flex flex-col items-center justify-center border border-pink-100 dark:border-pink-900/50">
                            <div className="text-pink-500 mb-1"><Globe size={24} /></div>
                            <div className="text-xl font-black text-pink-600 dark:text-pink-400 mb-1">{stats.event_days}</div>
                            <div className="text-xs text-pink-400">أيام المناسبات العالمية</div>
                        </div>
                        
                    </div>
                    
                    {/* Status Message */}
                    <div className="text-center text-blue-600 dark:text-blue-400 font-bold bg-white dark:bg-slate-900 py-2 rounded-xl border border-gray-100 dark:border-slate-800 shadow-sm shrink-0 flex justify-center items-center gap-2 text-sm">
                        <CheckCircle2 size={16} />
                        تم تحميل {stats.total_weeks} أسبوع بنجاح
                    </div>

                    {/* Weeks Grid */}
                    <div className="flex-1 overflow-y-auto custom-scrollbar bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-800 p-4 print:overflow-visible print:border-none print:shadow-none print:p-0">
                        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 2xl:grid-cols-5 gap-4 print:grid-cols-2 print:gap-4">
                            {localData.map((week, wIdx) => {
                                let wT = 0, wV = 0, wE = 0;
                                week.days.forEach(d => {
                                    if (d.type === 'training') wT++;
                                    else if (d.type === 'vacation') wV++;
                                    else wE++;
                                });

                                return (
                                    <div key={wIdx} className="bg-white dark:bg-slate-800 rounded-2xl border border-gray-200 dark:border-slate-700 shadow-sm overflow-hidden flex flex-col print:border-gray-800 print:break-inside-avoid">
                                    <div className="bg-teal-700 dark:bg-teal-800 text-white text-center py-2.5 font-bold text-sm relative print:bg-gray-100 print:text-black print:border-b print:border-gray-800">
                                        {getArabicWeekName(week.weekNumber)}
                                        <div className="text-[10px] font-normal text-teal-100 mt-0.5 print:text-gray-700" dir="ltr">
                                            {formatDateOnly(week.startDate)} - {formatDateOnly(week.endDate)}
                                        </div>
                                    </div>
                                    
                                    <div className="flex text-[10px] text-white p-1 gap-1 font-bold print:hidden">
                                        <div className={`flex-1 bg-emerald-500 rounded text-center py-1 transition ${isEditing ? 'cursor-pointer hover:bg-emerald-600' : ''}`} onClick={() => setBulkWeekType(wIdx, 'training')}>تدريب {wT}</div>
                                        <div className={`flex-1 bg-cyan-500 rounded text-center py-1 transition ${isEditing ? 'cursor-pointer hover:bg-cyan-600' : ''}`} onClick={() => setBulkWeekType(wIdx, 'vacation')}>إجازة {wV}</div>
                                        <div className={`flex-1 bg-teal-400 rounded text-center py-1 transition ${isEditing ? 'cursor-pointer hover:bg-teal-500' : ''}`} onClick={() => setBulkWeekType(wIdx, 'event')}>مناسبة {wE}</div>
                                    </div>

                                    <div className="flex-1 flex flex-col p-2 gap-1 bg-gray-50/50 dark:bg-slate-800/50 print:bg-white print:gap-0">
                                        {week.days.map((day, dIdx) => (
                                            <div 
                                                key={dIdx} 
                                                onClick={() => toggleDayType(wIdx, dIdx)}
                                                className={`flex items-center justify-between p-2 rounded-lg bg-white dark:bg-slate-700/50 border border-gray-100 dark:border-slate-600/50 select-none print:border-b print:border-gray-200 print:rounded-none ${isEditing ? 'hover:border-teal-300 dark:hover:border-teal-500/50 cursor-pointer transition-colors group' : ''}`}
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
                                                        <span className="text-[11px] text-gray-400 dark:text-gray-500 font-mono print:text-gray-800" dir="ltr">
                                                            {formatDateOnly(day.date).substring(5)}
                                                        </span>
                                                        <span className="text-[9.5px] text-gray-400 font-mono print:text-gray-500" dir="rtl">
                                                            {getHijriDate(day.date)}
                                                        </span>
                                                    </div>
                                                </div>
                                                <div className={`shrink-0 flex items-center justify-center ${!isEditing && 'opacity-80'}`}>
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
                </div>
            ) : (
                <div className="flex-1 bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-800 flex items-center justify-center">
                    {isLoading ? (
                        <div className="flex flex-col items-center gap-4 text-gray-400 dark:text-slate-500">
                            <div className="w-8 h-8 border-4 border-teal-500/30 border-t-teal-500 rounded-full animate-spin"></div>
                            جاري تحميل التقاويم...
                        </div>
                    ) : (
                        <div className="flex flex-col items-center gap-4 text-gray-400 dark:text-slate-500 max-w-sm text-center">
                            <CalendarDays size={48} className="text-gray-200 dark:text-slate-700 mb-2" />
                            <p className="font-bold text-lg">لم يتم اختيار أي تقويم</p>
                            <p className="text-sm">يرجى تحديد فترة تدريبية من القائمة العلوية لعرض تفاصيل التقويم.</p>
                        </div>
                    )}
                </div>
            )}

            {/* Delete Confirmation Modal */}
            {isDeleteModalOpen && (
                <div className="fixed inset-0 z-[9999] bg-black/40 backdrop-blur-sm flex items-center justify-center p-4">
                    <div className="bg-white dark:bg-slate-900 rounded-3xl shadow-2xl border border-gray-100 dark:border-slate-800 w-full max-w-sm p-6 flex flex-col items-center text-center animate-in fade-in zoom-in-95 duration-200">
                        <div className="w-16 h-16 bg-rose-50 dark:bg-rose-900/30 rounded-full flex items-center justify-center mb-4 border-8 border-rose-50/50 dark:border-rose-900/10">
                            <AlertTriangle size={28} className="text-rose-500 flex-shrink-0" />
                        </div>
                        <h3 className="text-xl font-black text-gray-800 dark:text-gray-100 mb-2">تأكيد الحذف</h3>
                        <p className="text-gray-500 dark:text-gray-400 text-sm mb-6 leading-relaxed">
                            هل أنت متأكد من رغبتك في حذف التقويم التدريبي 
                            <span className="font-bold text-gray-700 dark:text-gray-300 mx-1">
                                "{selectedCalendar?.name || `رقم ${selectedCalendar?.id}`}"
                            </span> 
                            نهائياً؟ لا يمكن التراجع عن هذا الإجراء.
                        </p>
                        <div className="flex gap-3 w-full">
                            <button 
                                onClick={() => setIsDeleteModalOpen(false)}
                                className="flex-1 px-4 py-2.5 rounded-xl bg-gray-100 dark:bg-slate-800 text-gray-700 dark:text-gray-300 font-bold hover:bg-gray-200 dark:hover:bg-slate-700 transition"
                            >
                                تراجع
                            </button>
                            <button 
                                onClick={confirmDelete}
                                className="flex-1 px-4 py-2.5 rounded-xl bg-rose-500 text-white font-bold hover:bg-rose-600 shadow-md shadow-rose-500/20 transition"
                            >
                                نعم، احذف
                            </button>
                        </div>
                    </div>
                </div>
            )}
        </div>
    );
}
