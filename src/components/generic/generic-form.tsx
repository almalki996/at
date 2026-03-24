import React, { useEffect } from "react";
import { useForm } from "@refinedev/react-hook-form";
import { Controller } from "react-hook-form";
import { useDirectusSchema, DirectusField, getTranslation } from "@/hooks/use-directus-schema";
import { Save, Ban, AlertCircle, Loader2, ChevronRight, Database, Edit } from "lucide-react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { RelationSelect } from "./relation-select";
import { CustomSelect } from "./custom-select";
import { DatePickerField } from "./date-picker";

export function GenericForm({ resource, action, id }: { resource: string, action: "create" | "edit", id?: string | number }) {
    const { fields, collectionMeta, isLoading: isSchemaLoading, error: schemaError } = useDirectusSchema(resource);

    const {
        refineCore: { onFinish, formLoading, query },
        register,
        control,
        handleSubmit,
        formState: { errors },
        reset
    } = useForm({
        refineCoreProps: {
            resource,
            action,
            id,
            redirect: false,
            successNotification: () => ({
                message: action === "create" ? "تم إضافة السجل بنجاح" : "تم استكمال التحديث بنجاح",
                description: "تم حفظ البيانات واعتمادها داخل قاعدة البيانات بشكل آمن ومستقر.",
                type: "success"
            }),
            errorNotification: () => ({
                message: "تعذر حفظ التعديلات السابقة",
                description: "رجاءً تأكد من تعبئة كافة الحقول الإلزامية أو تحقق من اتصالك بالشبكة.",
                type: "error"
            })
        }
    });

    useEffect(() => {
        if (action === "edit" && query?.data?.data) {
            reset(query.data.data);
        }
    }, [action, query?.data?.data, reset]);

    const router = useRouter();

    const onSubmit = async (data: Record<string, unknown>) => {
        await onFinish(data);
        router.push(`/${resource}`);
    };

    if (isSchemaLoading || (action === "edit" && query?.isLoading)) {
        return (
            <div className="flex flex-col items-center justify-center p-20 gap-4">
                <div className="w-12 h-12 border-4 border-indigo-100 border-t-indigo-600 rounded-full animate-spin"></div>
                <div className="text-gray-500 font-bold text-sm">جاري معالجة المتطلبات الشاملة للجدول...</div>
            </div>
        );
    }

    if (schemaError) {
        return (
            <div className="p-8 max-w-2xl mx-auto">
                <div className="bg-red-50 dark:bg-red-900/20 border border-red-200 dark:border-red-800 p-6 rounded-2xl flex items-start gap-4">
                    <AlertCircle className="text-red-500 shrink-0 mt-1" size={24} />
                    <div>
                        <h3 className="text-red-800 dark:text-red-400 font-black text-lg mb-2">تعذر قراءة خصائص الجدول</h3>
                        <p className="text-red-600 dark:text-red-300 text-sm leading-relaxed">
                            لم نتمكن من العثور على جدول باسم "{resource}" أو أن صلاحيات الوصول غير متوفرة.
                        </p>
                    </div>
                </div>
            </div>
        );
    }

    const formFields = fields.filter((f: DirectusField) => !f.meta?.hidden && !f.schema?.is_primary_key);
    const localizedTitle = getTranslation(collectionMeta?.translations, resource.replace(/_/g, " "));

    return (
        <div className="w-full">
            <div className="flex items-center gap-2 text-gray-500 dark:text-slate-400 mb-6 font-bold text-sm">
                <Link href={`/${resource}`} className="hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors flex items-center gap-1">
                    <Database size={16} /> استعراض {localizedTitle}
                </Link>
                <ChevronRight size={14} className="rtl:rotate-180" />
                <span className="text-indigo-600 dark:text-indigo-400 flex items-center gap-1">
                    {action === "create" ? "إضافة سجل جديد" : <><Edit size={14}/> تعديل المعرف: <span className="font-mono">{id}</span></>}
                </span>
            </div>

            <form onSubmit={handleSubmit(onSubmit)} className="space-y-6 max-w-4xl bg-white/90 dark:bg-slate-900/90 backdrop-blur-sm p-8 rounded-3xl shadow-xl shadow-indigo-100/20 dark:shadow-indigo-900/10 border border-indigo-50/50 dark:border-slate-800 transition-colors mx-auto mt-6 animate-in fade-in slide-in-from-bottom-4 duration-500">
            <h2 className="text-2xl font-black text-gray-900 dark:text-white mb-6 border-b border-gray-100 dark:border-slate-800 pb-4">
                {action === "create" ? `إضافة سجل جديد (${localizedTitle})` : `تعديل بيانات السجل (${localizedTitle})`}
            </h2>
            
            <div className="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6">
                {formFields.map((field: DirectusField) => {
                    const fieldLabel = getTranslation(field.meta?.translations, field.meta?.display || field.field);
                    return (
                    <div key={field.field} className={`space-y-1.5 ${field.type === "text" || field.type === "json" ? "md:col-span-2" : ""}`}>
                        <label className="block text-sm font-bold text-gray-700 dark:text-slate-300">
                            {fieldLabel} {field.meta?.required && <span className="text-red-500">*</span>}
                        </label>
                        
                        {field.relation && field.relation.related_collection !== "directus_files" ? (
                            <div className="relative z-50">
                                <RelationSelect 
                                    resource={field.relation.related_collection}
                                    fieldName={field.field}
                                    control={control}
                                    required={!!field.meta?.required}
                                    placeholder={`اختر ${fieldLabel}`}
                                />
                            </div>
                        ) : field.type === "boolean" ? (
                            <div className="flex items-center h-12">
                                <label className="relative inline-flex items-center cursor-pointer">
                                    <input 
                                        type="checkbox" 
                                        {...register(field.field)} 
                                        className="sr-only peer"
                                    />
                                    <div className="w-11 h-6 bg-gray-200 dark:bg-slate-700 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-indigo-300 dark:peer-focus:ring-indigo-800 rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-indigo-600"></div>
                                </label>
                            </div>
                        ) : field.type === "text" || field.type === "json" ? (
                            <textarea 
                                {...register(field.field, { required: field.meta?.required })}
                                className="w-full min-h-[120px] border border-gray-200 dark:border-slate-700/60 bg-gray-50/50 dark:bg-slate-800/80 rounded-xl px-4 py-3 focus:bg-white dark:focus:bg-slate-800 focus:ring-4 focus:ring-indigo-500/10 focus:border-indigo-400 dark:focus:border-indigo-500 outline-none transition-all placeholder-gray-400 dark:placeholder-slate-500 font-medium text-gray-900 dark:text-white"
                                placeholder={`أدخل ${fieldLabel}`}
                            />
                        ) : field.type === "integer" || field.type === "float" || field.type === "decimal" ? (
                            <input 
                                type="number"
                                step="any"
                                {...register(field.field, { required: field.meta?.required, valueAsNumber: true })}
                                className="w-full border border-gray-200 dark:border-slate-700/60 bg-gray-50/50 dark:bg-slate-800/80 rounded-xl px-4 py-3 focus:bg-white dark:focus:bg-slate-800 focus:ring-4 focus:ring-indigo-500/10 focus:border-indigo-400 dark:focus:border-indigo-500 outline-none transition-all placeholder-gray-400 dark:placeholder-slate-500 font-medium text-gray-900 dark:text-white"
                                placeholder={`0`}
                            />
                        ) : field.type === "datetime" || field.type === "timestamp" || field.type === "date" ? (
                            <div className="relative z-40">
                                <DatePickerField
                                    control={control}
                                    name={field.field}
                                    required={!!field.meta?.required}
                                    placeholder={`اختر ${fieldLabel}`}
                                    error={!!errors[field.field]}
                                />
                            </div>
                        ) : (field.meta?.interface === "select-dropdown" || field.meta?.options?.choices) ? (
                            <div className="relative z-[55]">
                                <Controller
                                    name={field.field}
                                    control={control}
                                    rules={{ required: field.meta?.required }}
                                    render={({ field: { onChange, value } }) => {
                                        const choices = (field.meta?.options?.choices as Array<any>) || [];
                                        const options = choices.map(c => ({
                                            value: c.value,
                                            label: String(c.text || c.value)
                                        }));
                                        return (
                                            <CustomSelect
                                                options={options}
                                                value={value}
                                                onChange={onChange}
                                                placeholder={`اختر ${fieldLabel}`}
                                            />
                                        );
                                    }}
                                />
                            </div>
                        ) : (
                            <input 
                                type="text"
                                {...register(field.field, { required: field.meta?.required })}
                                className="w-full border border-gray-200 dark:border-slate-700/60 bg-gray-50/50 dark:bg-slate-800/80 rounded-xl px-4 py-3 focus:bg-white dark:focus:bg-slate-800 focus:ring-4 focus:ring-indigo-500/10 focus:border-indigo-400 dark:focus:border-indigo-500 outline-none transition-all placeholder-gray-400 dark:placeholder-slate-500 font-medium text-gray-900 dark:text-white"
                                placeholder={`أدخل ${fieldLabel}`}
                            />
                        )}
                        {errors[field.field] && (
                            <span className="text-red-500 text-xs font-semibold flex items-center gap-1 mt-1">
                                <Ban size={12}/> {fieldLabel} مطلوب للإكمال
                            </span>
                        )}
                    </div>
                    );
                })}
            </div>

            <div className="pt-8 mt-6 border-t border-gray-100 dark:border-slate-800 flex justify-end">
                <button 
                    type="submit" 
                    disabled={formLoading}
                    className="flex lg:w-64 w-full items-center justify-center gap-2 bg-indigo-600 text-white px-4 py-3.5 rounded-xl hover:bg-indigo-700 hover:shadow-lg hover:shadow-indigo-600/20 transition-all font-bold disabled:opacity-70 disabled:cursor-not-allowed shadow-sm"
                >
                    {formLoading ? <Loader2 size={18} className="animate-spin" /> : <Save size={18} />}
                    {formLoading ? "جاري الحفظ..." : "حفظ التغييرات"}
                </button>
            </div>
        </form>
        </div>
    );
}
