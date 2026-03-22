import { addDays, eachDayOfInterval, startOfWeek, endOfWeek, isBefore, isAfter, format, parseISO } from 'date-fns';
import { CalendarDay, CalendarWeek, DayType } from './types';

/**
 * Normalizes a date string to just 'YYYY-MM-DD'
 */
export const formatDateOnly = (date: Date | string): string => {
    try {
        const d = new Date(date);
        return format(d, 'yyyy-MM-dd');
    } catch {
        return String(date);
    }
}

/**
 * Generates an array of weeks (Sun-Sat) between two dates.
 */
export const getHijriDate = (dateStr: string): string => {
    try {
        const d = new Date(dateStr);
        return new Intl.DateTimeFormat('ar-SA-u-ca-islamic', {
            day: 'numeric',
            month: 'numeric',
        }).format(d);
    } catch {
        return "";
    }
}

export const getHolidayType = (dateStr: string | Date): 'event' | null => {
    try {
        const d = new Date(dateStr);
        const month = d.getMonth() + 1;
        const day = d.getDate();
        if (month === 2 && day === 22) return 'event'; // Foundation Day
        if (month === 9 && day === 23) return 'event'; // National Day
        return null;
    } catch {
        return null;
    }
}

export const generateWeeks = (startDateStr: string, endDateStr: string, weekendDays: number[] = [5, 6]): CalendarWeek[] => {
    const start = new Date(startDateStr);
    const end = new Date(endDateStr);

    if (isNaN(start.getTime()) || isNaN(end.getTime()) || isAfter(start, end)) {
        return [];
    }

    // Align start to the beginning of the week (Sunday)
    const calendarStart = startOfWeek(start, { weekStartsOn: 0 }); // 0 = Sunday
    // Align end to the end of the week (Saturday)
    const calendarEnd = endOfWeek(end, { weekStartsOn: 0 });

    const allDays = eachDayOfInterval({ start: calendarStart, end: calendarEnd });
    
    // Group days by 7
    const weeks: CalendarWeek[] = [];
    let currentWeekDays: CalendarDay[] = [];
    let weekCounter = 1;

    allDays.forEach((date, i) => {
        // Only mark as training if it's within the actual selected start/end range
        const isOutOfRange = isBefore(date, start) || isAfter(date, end);
        // Default weekends to vacation, others to training
        const dayOfWeek = date.getDay();
        const isWeekend = weekendDays.includes(dayOfWeek);
        const isHoliday = getHolidayType(date);
        
        let targetType: DayType = 'training';
        if (isOutOfRange) targetType = 'vacation';
        else if (isHoliday) targetType = 'event';
        else if (isWeekend) targetType = 'vacation';

        currentWeekDays.push({
            date: format(date, 'yyyy-MM-dd'),
            dayOfWeek,
            type: targetType,
        });

        if (currentWeekDays.length === 7) {
            weeks.push({
                weekNumber: weekCounter++,
                startDate: currentWeekDays[0].date,
                endDate: currentWeekDays[6].date,
                days: currentWeekDays
            });
            currentWeekDays = [];
        }
    });

    return weeks;
}

/**
 * Calculate stats from weeks_data
 */
export const calculateStats = (weeks: CalendarWeek[]) => {
    let training_days = 0;
    let vacation_days = 0;
    let event_days = 0;

    weeks.forEach(week => {
        week.days.forEach(day => {
            if (day.type === 'training') training_days++;
            else if (day.type === 'vacation') vacation_days++;
            else if (day.type === 'event') event_days++;
        });
    });

    return {
        total_weeks: weeks.length,
        training_days,
        vacation_days,
        event_days
    };
}

export const arabicWeekDays = ['الأحد', 'الاثنين', 'الثلاثاء', 'الأربعاء', 'الخميس', 'الجمعة', 'السبت'];
export const getArabicWeekName = (index: number) => {
    const names = [
        "الأول", "الثاني", "الثالث", "الرابع", "الخامس", 
        "السادس", "السابع", "الثامن", "التاسع", "العاشر",
        "الحادي عشر", "الثاني عشر", "الثالث عشر", "الرابع عشر", "الخامس عشر",
        "السادس عشر", "السابع عشر", "الثامن عشر", "التاسع عشر", "العشرون"
    ];
    // fallback to number if > 20
    if (index >= 1 && index <= 20) return `الأسبوع ${names[index - 1]}`;
    return `الأسبوع ${index}`;
}
