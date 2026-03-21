import DepartmentsPage from '@/components/departments/departments-page';
import { Metadata } from 'next';

export const metadata: Metadata = {
    title: 'بناء الوظائف | الإعدادات',
    description: 'إدارة بناء الوظائف وربطها بالهيكل',
};

export default function Page() {
    return <DepartmentsPage />;
}
