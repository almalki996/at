"use client";

import React from "react";
import { LayoutDashboard, Users, TrendingUp } from "lucide-react";

export default function DashboardPage() {
    return (
        <div className="p-8 max-w-7xl mx-auto space-y-8 animate-in fade-in duration-500">
            <div className="border-b pb-6">
                <h1 className="text-3xl font-extrabold text-gray-800">مرحباً بك في اللوحة الرئيسية</h1>
                <p className="text-gray-500 mt-2">نظرة عامة على النظام والإحصائيات الخاصة بك.</p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 flex flex-col hover:shadow-md transition">
                    <div className="flex items-center gap-4 mb-4">
                        <div className="p-3 bg-indigo-50 text-indigo-600 rounded-lg">
                            <LayoutDashboard size={24} />
                        </div>
                        <h3 className="text-lg font-bold text-gray-700">إحصائيات النظام</h3>
                    </div>
                    <p className="text-gray-500 text-sm flex-1 leading-relaxed">النظام يعمل بكفاءة. لا توجد تنبيهات حالية تحتاج لمراجعتك المبكرة.</p>
                </div>

                <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 flex flex-col hover:shadow-md transition">
                    <div className="flex items-center gap-4 mb-4">
                        <div className="p-3 bg-emerald-50 text-emerald-600 rounded-lg">
                            <Users size={24} />
                        </div>
                        <h3 className="text-lg font-bold text-gray-700">المستخدمين النشطين</h3>
                    </div>
                    <p className="text-gray-500 text-sm flex-1 leading-relaxed">هناك نشاط طبيعي للمستخدمين على النظام في الساعات الأخيرة، ويمكنك إدارة الصلاحيات لاحقاً.</p>
                </div>

                <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 flex flex-col hover:shadow-md transition">
                    <div className="flex items-center gap-4 mb-4">
                        <div className="p-3 bg-amber-50 text-amber-600 rounded-lg">
                            <TrendingUp size={24} />
                        </div>
                        <h3 className="text-lg font-bold text-gray-700">النمو والأداء</h3>
                    </div>
                    <p className="text-gray-500 text-sm flex-1 leading-relaxed">معدل الإنجاز للخطط الاستراتيجية يرتفع بشكل ملحوظ مقارنة بالأسابيع الماضية.</p>
                </div>
            </div>
        </div>
    );
}
