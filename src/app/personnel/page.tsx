import { Metadata } from 'next';
import PersonnelPage from '@/components/personnel/personnel-page';

export const metadata: Metadata = {
    title: 'بيانات الموظفين | المؤسسة العامة للتدريب التقني والمهني',
    description: 'إدارة ملفات الموظفين، التكليفات، والدورات التدريبية',
};

export default function Page() {
    return <PersonnelPage />;
}
