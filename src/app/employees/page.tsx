import { Metadata } from 'next';
import EmployeesPage from '@/components/employees/employees-page';

export const metadata: Metadata = {
    title: 'المسميات الوظيفية | نظام أداء',
    description: 'إدارة قائمة المسميات الوظيفية وربطها بالكادر الوظيفي',
};

export default function Page() {
    return <EmployeesPage />;
}
