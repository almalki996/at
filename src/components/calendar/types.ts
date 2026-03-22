export type DayType = 'training' | 'vacation' | 'event';

export interface CalendarDay {
    date: string; // YYYY-MM-DD
    dayOfWeek: number; // 0 (Sunday) to 6 (Saturday)
    type: DayType;
}

export interface CalendarWeek {
    weekNumber: number;
    startDate: string; // YYYY-MM-DD
    endDate: string; // YYYY-MM-DD
    days: CalendarDay[];
}

export interface CalendarEvent {
    id?: number | string;
    name: string;
    start_date: string;
    end_date: string;
    is_active: boolean;
    total_weeks: number;
    training_days: number;
    vacation_days: number;
    event_days: number;
    weeks_data: CalendarWeek[];
}
