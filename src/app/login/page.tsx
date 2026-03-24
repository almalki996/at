"use client";

import React, { useState } from "react";
import { useLogin } from "@refinedev/core";
import { Mail, Lock, LogIn } from "lucide-react";

export default function LoginPage() {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    
    // useLogin from refine core integrates directly with our custom authProvider
    const { mutate: login, isPending } = useLogin();

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        login({ email, password });
    };

    return (
        <div className="min-h-screen bg-slate-50 dark:bg-slate-950 flex flex-col justify-center items-center p-4 relative overflow-hidden transition-colors duration-300">
            {/* Background design elements */}
            <div className="absolute top-[-10%] left-[-10%] w-[40%] h-[40%] bg-indigo-500/10 dark:bg-indigo-600/20 rounded-full blur-3xl pointer-events-none"></div>
            <div className="absolute bottom-[-10%] right-[-10%] w-[40%] h-[40%] bg-emerald-500/10 dark:bg-emerald-600/20 rounded-full blur-3xl pointer-events-none"></div>

            <div className="w-full max-w-md bg-white/80 dark:bg-slate-900/80 backdrop-blur-xl border border-white/20 dark:border-slate-800 shadow-2xl rounded-3xl p-8 relative z-10 animate-in fade-in zoom-in-95 duration-500 ease-out">
                
                <div className="flex flex-col items-center mb-8">
                    <div className="w-16 h-16 bg-gradient-to-br from-indigo-500 to-indigo-700 rounded-2xl flex items-center justify-center shadow-lg shadow-indigo-600/30 text-white mb-6">
                        <Lock size={32} />
                    </div>
                    <h1 className="text-3xl font-black text-slate-800 dark:text-white tracking-tight">تسجيل الدخول</h1>
                    <p className="text-slate-500 dark:text-slate-400 mt-2 text-center text-sm font-medium">أدخل بيانات الاعتماد الخاصة بك للوصول إلى النظام</p>
                </div>

                <form onSubmit={handleSubmit} className="space-y-6">
                    <div className="space-y-2 relative">
                        <label className="block text-sm font-bold text-slate-700 dark:text-slate-300">البريد الإلكتروني</label>
                        <div className="relative">
                            <div className="absolute inset-y-0 right-0 pr-4 flex items-center pointer-events-none text-slate-400">
                                <Mail size={18} />
                            </div>
                            <input 
                                type="email"
                                value={email}
                                onChange={(e) => setEmail(e.target.value)}
                                className="w-full pl-4 pr-11 py-3 bg-slate-50 dark:bg-slate-800/50 border border-slate-200 dark:border-slate-700 rounded-xl focus:bg-white dark:focus:bg-slate-800 focus:ring-4 focus:ring-indigo-500/10 focus:border-indigo-400 outline-none transition-all text-slate-800 dark:text-white font-medium" 
                                placeholder="name@example.com" 
                                required
                                dir="ltr"
                            />
                        </div>
                    </div>

                    <div className="space-y-2 relative">
                        <label className="block text-sm font-bold text-slate-700 dark:text-slate-300">كلمة المرور</label>
                        <div className="relative">
                            <div className="absolute inset-y-0 right-0 pr-4 flex items-center pointer-events-none text-slate-400">
                                <Lock size={18} />
                            </div>
                            <input 
                                type="password" 
                                value={password}
                                onChange={(e) => setPassword(e.target.value)}
                                className="w-full pl-4 pr-11 py-3 bg-slate-50 dark:bg-slate-800/50 border border-slate-200 dark:border-slate-700 rounded-xl focus:bg-white dark:focus:bg-slate-800 focus:ring-4 focus:ring-indigo-500/10 focus:border-indigo-400 outline-none transition-all text-slate-800 dark:text-white font-medium" 
                                placeholder="••••••••" 
                                required
                                dir="ltr"
                            />
                        </div>
                    </div>

                    <button 
                        type="submit" 
                        disabled={isPending}
                        className="w-full flex items-center justify-center gap-3 bg-indigo-600 hover:bg-indigo-700 text-white py-3.5 rounded-xl transition-all shadow-lg hover:shadow-indigo-600/25 font-bold disabled:opacity-70 disabled:cursor-not-allowed group mt-2"
                    >
                        {isPending ? (
                            <div className="w-6 h-6 border-2 border-white/30 border-t-white rounded-full animate-spin"></div>
                        ) : (
                            <>
                                <LogIn size={20} className="group-hover:-translate-x-1 transition-transform" />
                                <span>تسجيل الدخول</span>
                            </>
                        )}
                    </button>
                    
                </form>

            </div>
            
            <div className="mt-8 text-slate-500 dark:text-slate-500 text-sm font-medium">
                بوابة السجلات المركزية وإدارة الموارد © {new Date().getFullYear()}
            </div>
        </div>
    );
}
