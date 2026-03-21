"use client";

import React, { useState, useEffect } from "react";
import { useForm } from "react-hook-form";
import { Save, Settings, Image as ImageIcon, UploadCloud, CheckCircle, XCircle } from "lucide-react";
import axios from "axios";

export default function SiteSettingsPage() {
    const [uploading, setUploading] = useState(false);
    const [isLoading, setIsLoading] = useState(true);
    const [formLoading, setFormLoading] = useState(false);
    const [toast, setToast] = useState<{message: string, type: 'success' | 'error'} | null>(null);

    const showToast = (message: string, type: 'success' | 'error') => {
        setToast({ message, type });
        setTimeout(() => setToast(null), 4000);
    };
    
    const {
        register,
        handleSubmit,
        setValue,
        watch,
        reset,
        formState: { errors }
    } = useForm();

    const watchLogo = watch("logo");

    const getBaseUrl = () => {
        const url = process.env.NEXT_PUBLIC_DIRECTUS_URL || "http://127.0.0.1:8055/items";
        return url.replace(/\/items\/?$/, '').replace(/\/$/, '');
    };
    
    const token = process.env.NEXT_PUBLIC_DIRECTUS_TOKEN;
    const axiosConfig = {
        headers: token ? { Authorization: `Bearer ${token}` } : {}
    };

    useEffect(() => {
        const fetchSettings = async () => {
            try {
                const url = `${getBaseUrl()}/items/site_settings`;
                const res = await axios.get(url, axiosConfig);
                const data = res.data.data;
                if (data) {
                    reset({
                        site_name: data.site_name || "",
                        site_description: data.site_description || "",
                        logo: data.logo || ""
                    });
                }
            } catch (err) {
                console.error("Failed to load settings", err);
            } finally {
                setIsLoading(false);
            }
        };
        fetchSettings();
    }, []);

    const onSubmit = async (data: Record<string, unknown>) => {
        setFormLoading(true);
        try {
            const url = `${getBaseUrl()}/items/site_settings`;
            await axios.patch(url, {
                site_name: data.site_name,
                site_description: data.site_description,
                logo: data.logo || null
            }, axiosConfig);
            
            showToast("تم تحديث وحفظ إعدادات النظام بنجاح!", "success");
            
            // Reload the page silently after 1 second so the Sidebar picks up the new logo
            setTimeout(() => {
                window.location.reload();
            }, 1000);

        } catch (err) {
            console.error("Failed to save settings", err);
            showToast("فشلت عملية الحفظ بسبب خطأ تقني، يرجى المحاولة لاحقاً.", "error");
        } finally {
            setFormLoading(false);
        }
    };

    const handleFileUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
        const file = e.target.files?.[0];
        if (!file) return;

        setUploading(true);
        const formData = new FormData();
        formData.append("file", file);

        try {
            const res = await axios.post(`${getBaseUrl()}/files`, formData, {
                headers: {
                    "Content-Type": "multipart/form-data",
                    ...(token ? { Authorization: `Bearer ${token}` } : {})
                }
            });
            
            const fileId = res.data.data.id;
            setValue("logo", fileId, { shouldDirty: true });
            showToast("تم رفع وقراءة الشعار بنجاح، يرجى النقر على زر الحفظ الآن.", "success");
        } catch (err: any) {
            console.error("Upload failed", err?.response?.data || err.message);
            showToast("فشلت عملية رفع رمز الشعار، تأكد من اتصالك بالخادم.", "error");
        } finally {
            setUploading(false);
        }
    };

    const baseUrlStr = getBaseUrl();

    return (
        <div className="w-full h-full">
            <div className="bg-white dark:bg-slate-900 rounded-3xl shadow-sm border border-gray-100 dark:border-slate-800 overflow-hidden transition-colors duration-300">
                <div className="bg-gradient-to-l from-indigo-50/50 dark:from-indigo-950/20 to-white dark:to-slate-900 px-8 py-8 border-b border-gray-100 dark:border-slate-800">
                    <div className="flex items-center gap-5">
                        <div className="w-16 h-16 bg-gradient-to-br from-indigo-500 to-indigo-700 rounded-2xl flex items-center justify-center shadow-lg shadow-indigo-600/30 text-white">
                            <Settings size={32} />
                        </div>
                        <div>
                            <h1 className="text-3xl font-black text-gray-900 dark:text-white tracking-tight">الإعدادات العامة</h1>
                            <p className="text-gray-500 dark:text-slate-400 mt-2 text-sm max-w-lg font-semibold">قم بتحديث اسم الموقع والشعار الذي يظهر في جميع صفحات النظام.</p>
                        </div>
                    </div>
                </div>

                <div className="p-8 min-h-[400px]">
                    {isLoading ? (
                        <div className="flex flex-col items-center justify-center py-20 gap-4">
                            <div className="w-10 h-10 border-4 border-indigo-100 border-t-indigo-600 rounded-full animate-spin"></div>
                            <div className="text-gray-500 font-bold text-sm">جاري جلب الإعدادات...</div>
                        </div>
                    ) : (
                        <form onSubmit={handleSubmit(onSubmit)} className="space-y-8 max-w-2xl">
                            <div className="space-y-2">
                                <label className="block text-sm font-bold text-gray-700 dark:text-slate-300">اسم الموقع (Site Name)</label>
                                <input 
                                    {...register("site_name", { required: "اسم الموقع مطلوب" })}
                                    className="w-full border border-gray-200 dark:border-slate-700/60 bg-gray-50/50 dark:bg-slate-800/80 rounded-xl px-4 py-3 focus:bg-white dark:focus:bg-slate-800 focus:ring-4 focus:ring-indigo-500/10 focus:border-indigo-400 outline-none transition-all font-medium text-gray-900 dark:text-white placeholder-gray-400 dark:placeholder-slate-500" 
                                    placeholder="أدخل اسم الموقع..." 
                                />
                                {errors.site_name && <span className="text-red-500 text-xs font-bold">{String(errors.site_name.message)}</span>}
                            </div>

                            <div className="space-y-2">
                                <label className="block text-sm font-bold text-gray-700 dark:text-slate-300">العبارة المصاحبة (Sub-title)</label>
                                <input
                                    {...register("site_description")}
                                    className="w-full border border-gray-200 dark:border-slate-700/60 bg-gray-50/50 dark:bg-slate-800/80 rounded-xl px-4 py-3 focus:bg-white dark:focus:bg-slate-800 focus:ring-4 focus:ring-indigo-500/10 focus:border-indigo-400 outline-none transition-all font-medium text-gray-900 dark:text-white placeholder-gray-400 dark:placeholder-slate-500"
                                    placeholder="مثال: بوابة السجلات المركزية وإدارة الموارد"
                                />
                            </div>

                            <div className="space-y-3">
                                <label className="block text-sm font-bold text-gray-700 dark:text-slate-300">شعار الموقع (Logo)</label>
                                
                                <div className="flex flex-col sm:flex-row gap-6 items-start">
                                    {/* Logo Preview box */}
                                    <div className="w-32 h-32 rounded-2xl border-2 border-dashed border-gray-200 dark:border-slate-700 bg-gray-50 dark:bg-slate-800/50 flex flex-col items-center justify-center overflow-hidden shrink-0 group relative">
                                        {watchLogo ? (
                                            <img 
                                                src={watchLogo.includes("http") ? watchLogo : `${baseUrlStr}/assets/${watchLogo}?access_token=${token}`} 
                                                alt="Logo Preview" 
                                                className="w-full h-full object-contain p-2"
                                            />
                                        ) : (
                                            <ImageIcon size={32} className="text-gray-300" />
                                        )}
                                        {watchLogo && (
                                            <div className="absolute inset-0 bg-black/40 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity">
                                                <button 
                                                    type="button" 
                                                    onClick={() => setValue("logo", "")} 
                                                    className="text-white text-xs font-bold bg-red-500 px-3 py-1.5 rounded-lg"
                                                >
                                                    إزالة
                                                </button>
                                            </div>
                                        )}
                                    </div>

                                    <div className="flex-1 space-y-4 w-full">
                                        {/* Hidden file input */}
                                        <input 
                                            type="file" 
                                            id="logo-upload" 
                                            accept="image/png, image/jpeg, image/svg+xml" 
                                            className="hidden" 
                                            onChange={handleFileUpload}
                                            disabled={uploading}
                                        />
                                        
                                        <label 
                                            htmlFor="logo-upload" 
                                            className="flex flex-col items-center justify-center w-full border-2 border-dashed border-indigo-200 dark:border-indigo-900/40 bg-indigo-50/50 dark:bg-indigo-950/20 rounded-2xl px-4 py-6 cursor-pointer hover:bg-indigo-50 dark:hover:bg-indigo-900/30 hover:border-indigo-400 dark:hover:border-indigo-600 transition-colors"
                                        >
                                            {uploading ? (
                                                <div className="flex flex-col items-center gap-2">
                                                    <div className="w-6 h-6 border-2 border-indigo-200 border-t-indigo-600 rounded-full animate-spin"></div>
                                                    <span className="text-sm font-bold text-indigo-600 dark:text-indigo-400">جاري الرفع...</span>
                                                </div>
                                            ) : (
                                                <div className="flex flex-col items-center gap-2">
                                                    <UploadCloud size={24} className="text-indigo-400 dark:text-indigo-500" />
                                                    <span className="text-sm font-bold text-indigo-700 dark:text-indigo-300">انقر هنا لرفع أو استيراد صورة الشعار</span>
                                                    <span className="text-xs font-medium text-gray-400 dark:text-slate-500">يدعم PNG, JPG, SVG</span>
                                                </div>
                                            )}
                                        </label>
                                        
                                        {/* fallback manual input */}
                                        <div className="flex flex-col gap-1.5 hidden">
                                            <input 
                                                {...register("logo")}
                                                className="w-full border border-gray-200 bg-gray-50/50 rounded-xl px-4 py-2.5 outline-none font-mono text-xs text-gray-500" 
                                                placeholder="أو ضع رابط مباشر للصورة هنا..." 
                                                dir="ltr"
                                            />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="pt-6 border-t border-gray-100 dark:border-slate-800 mt-8">
                                <button 
                                    type="submit"
                                    disabled={formLoading || uploading}
                                    className="flex items-center justify-center gap-2 bg-indigo-600 text-white px-8 py-3.5 rounded-xl hover:bg-indigo-700 hover:shadow-lg hover:shadow-indigo-600/20 transition-all font-bold disabled:opacity-70 disabled:cursor-not-allowed shadow-sm w-full sm:w-auto"
                                >
                                    <Save size={18} /> {formLoading ? "جاري الحفظ..." : "حفظ الإعدادات"}
                                </button>
                            </div>
                        </form>
                    )}
                </div>
            </div>

            {/* Custom Toast Notification */}
            {toast && (
                <div className={`fixed bottom-6 left-1/2 -translate-x-1/2 sm:translate-x-0 sm:left-6 px-5 py-4 rounded-xl shadow-2xl flex items-center gap-3 animate-in fade-in slide-in-from-bottom-5 duration-300 z-50 border ${toast.type === 'success' ? 'bg-emerald-50 border-emerald-200 text-emerald-800' : 'bg-red-50 border-red-200 text-red-800'}`}>
                    {toast.type === 'success' ? <CheckCircle size={22} className="text-emerald-600" /> : <XCircle size={22} className="text-red-600" />}
                    <span className="font-extrabold text-sm">{toast.message}</span>
                </div>
            )}
        </div>
    );
}
