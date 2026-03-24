"use client";

import React, { useState, useMemo } from "react";
import { useList } from "@refinedev/core";
import { 
    Flag, Target, Activity, TrendingUp, Lightbulb, Wrench, ChevronDown, ChevronRight, CheckCircle2, AlertCircle, Building2, Briefcase, UserCircle
} from "lucide-react";

export default function DashboardPage() {
    // 1. Fetch all data
    const { query: plansQuery } = useList({ resource: "strategic_plans", pagination: { mode: "off" } as any });
    const { query: stratObjQuery } = useList({ resource: "strategic_objectives", pagination: { mode: "off" } as any });
    const { query: opObjQuery } = useList({ resource: "operational_objectives", pagination: { mode: "off" } as any });
    const { query: kpisQuery } = useList({ resource: "kpis", pagination: { mode: "off" } as any });
    const { query: initiativesQuery } = useList({ resource: "initiatives", pagination: { mode: "off" } as any });
    const { query: mechQuery } = useList({ resource: "implementation_mechanisms", pagination: { mode: "off" } as any });
    
    // Relations lookups
    const { query: structuresQuery } = useList({ resource: "Structures", pagination: { mode: "off" } as any });
    const { query: departmentsQuery } = useList({ resource: "Departments", pagination: { mode: "off" } as any });
    const { query: personnelQuery } = useList({ resource: "Personnel", pagination: { mode: "off" } as any });

    const plansData = plansQuery?.data;
    const stratObjRaw = stratObjQuery?.data;
    const opObjRaw = opObjQuery?.data;
    const kpisRaw = kpisQuery?.data;
    const initiativesRaw = initiativesQuery?.data;
    const mechRaw = mechQuery?.data;

    const structuresRaw = structuresQuery?.data;
    const departmentsRaw = departmentsQuery?.data;
    const personnelRaw = personnelQuery?.data;

    const isPlansLoading = plansQuery?.isLoading;
    const isStratObjLoading = stratObjQuery?.isLoading;
    const isOpObjLoading = opObjQuery?.isLoading;
    const isKpisLoading = kpisQuery?.isLoading;
    const isInitLoading = initiativesQuery?.isLoading;
    const isMechLoading = mechQuery?.isLoading;

    const plans = plansData?.data || [];
    const stratObjs = stratObjRaw?.data || [];
    const opObjs = opObjRaw?.data || [];
    const kpis = kpisRaw?.data || [];
    const initiatives = initiativesRaw?.data || [];
    const mechanisms = mechRaw?.data || [];
    
    const structuresMap = useMemo(() => new Map((structuresRaw?.data || []).map(s => [s.id, s])), [structuresRaw?.data]);
    const departmentsMap = useMemo(() => new Map((departmentsRaw?.data || []).map(d => [d.id, d])), [departmentsRaw?.data]);
    const personnelMap = useMemo(() => new Map((personnelRaw?.data || []).map(p => [p.id, p])), [personnelRaw?.data]);

    const isLoading = isPlansLoading || isStratObjLoading || isOpObjLoading || isKpisLoading || isInitLoading || isMechLoading;

    // Filter state
    const [selectedPlanId, setSelectedPlanId] = useState<string | null>(null);
    const activePlan = useMemo(() => {
        if (!plans.length) return null;
        if (selectedPlanId) return plans.find(p => p.id === selectedPlanId) || null;
        // Default to first active plan or just first plan
        const firstActive = plans.find(p => p.status === 'active');
        return firstActive || plans[0];
    }, [plans, selectedPlanId]);

    // Derived hierarchy
    const hierarchy = useMemo(() => {
        if (!activePlan) return [];
        return stratObjs.filter(so => 
            // Handle both uuid (string) and potential object shapes from M2O
            typeof so.plan_id === 'object' ? so.plan_id?.id === activePlan.id : so.plan_id === activePlan.id
        ).map(so => {
            const childrenOp = opObjs.filter(op => typeof op.strategic_objective_id === 'object' ? op.strategic_objective_id?.id === so.id : op.strategic_objective_id === so.id).map(op => {
                const childrenKpi = kpis.filter(kpi => typeof kpi.operational_objective_id === 'object' ? kpi.operational_objective_id?.id === op.id : kpi.operational_objective_id === op.id).map(kpi => {
                    const childrenInit = initiatives.filter(init => typeof init.kpi_id === 'object' ? init.kpi_id?.id === kpi.id : init.kpi_id === kpi.id).map(init => {
                        const childrenMech = mechanisms.filter(mech => typeof mech.initiative_id === 'object' ? mech.initiative_id?.id === init.id : mech.initiative_id === init.id);
                        return { ...init, children: childrenMech };
                    });
                    return { ...kpi, children: childrenInit };
                });
                return { ...op, children: childrenKpi };
            });
            return { ...so, children: childrenOp };
        });
    }, [activePlan, stratObjs, opObjs, kpis, initiatives, mechanisms]);

    if (isLoading) {
        return (
            <div className="flex justify-center items-center h-[60vh]">
                <div className="w-12 h-12 border-4 border-indigo-100 border-t-indigo-600 rounded-full animate-spin"></div>
            </div>
        );
    }

    if (!plans.length) {
        return (
            <div className="p-8 max-w-4xl mx-auto text-center bg-white dark:bg-slate-900 rounded-3xl mt-10 border border-gray-100 dark:border-slate-800 shadow-sm">
                <div className="w-20 h-20 bg-gray-50 dark:bg-slate-800 rounded-full flex items-center justify-center mx-auto mb-4 border border-gray-100 dark:border-slate-700">
                    <Flag className="text-gray-400" size={32} />
                </div>
                <h2 className="text-2xl font-black text-gray-900 dark:text-white mb-3">لا توجد خطط استراتيجية</h2>
                <p className="text-gray-500 max-w-md mx-auto mb-6">يرجى من مدير النظام إضافة وتسجيل الخطة الاستراتيجية الأولى من الشاشات الخاصة بالمرحلة الرابعة ليتم عرض الهرم الاستراتيجي هنا.</p>
                <a href="/strategic_plans/create" className="px-6 py-3 bg-indigo-600 text-white font-bold rounded-xl hover:bg-indigo-700 shadow-md transition-all inline-block">
                    إنشاء الخطة الأولى
                </a>
            </div>
        );
    }

    return (
        <div className="w-full flex flex-col p-4 md:p-6 mx-auto pb-16">
            {/* Header section */}
            <div className="bg-white dark:bg-slate-900 rounded-3xl shadow-sm border border-gray-100 dark:border-slate-800 p-6 lg:p-8 mb-6 shrink-0 relative overflow-hidden transition-colors duration-300">
                <div className="absolute top-0 right-0 w-64 h-64 bg-indigo-500/10 rounded-full blur-3xl -translate-y-1/2 translate-x-1/2 dark:bg-indigo-500/5"></div>
                
                <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-6 relative z-10">
                    <div className="flex items-center gap-5">
                        <div className="w-16 h-16 bg-gradient-to-br from-indigo-500 to-indigo-700 rounded-2xl flex items-center justify-center shadow-lg shadow-indigo-600/30 text-white shrink-0">
                            <NetworkIcon size={32} />
                        </div>
                        <div>
                            <h1 className="text-3xl font-black text-gray-900 dark:text-white tracking-tight">استعراض الهرم الاستراتيجي {activePlan?.year ? `(${activePlan.year})` : ""}</h1>
                            <p className="text-gray-500 dark:text-slate-400 mt-1.5 text-sm font-semibold max-w-xl leading-relaxed">
                                استعراض ترابط الأهداف التشغيلية ومؤشرات الأداء وصولاً لمبادرات المنظمة.
                            </p>
                        </div>
                    </div>

                    <div className="bg-gray-50 dark:bg-slate-800 p-2 rounded-xl border border-gray-100 dark:border-slate-700 w-full lg:w-72 shrink-0">
                        <div className="text-xs text-gray-400 dark:text-slate-500 mb-1.5 px-2 font-bold select-none cursor-default">تبديل الخطة المعروضة</div>
                        <select 
                            className="w-full bg-white dark:bg-slate-900 border-none rounded-lg p-2.5 text-sm font-bold text-gray-800 dark:text-white focus:ring-2 focus:ring-indigo-500 cursor-pointer shadow-sm"
                            value={activePlan?.id || ""}
                            onChange={(e) => setSelectedPlanId(e.target.value)}
                        >
                            {plans.map(p => (
                                <option key={p.id} value={p.id}>{p.status === 'active' ? '🟢' : '⚪'} {p.year ? `خطة ${p.year}` : `خطة ${p.id}`}</option>
                            ))}
                        </select>
                    </div>
                </div>

                {/* Plan Details Cards */}
                {activePlan && (
                    <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mt-8 pt-6 border-t border-gray-100 dark:border-slate-800/50">
                        <div className="bg-indigo-50/50 dark:bg-indigo-900/10 rounded-2xl p-5 border border-indigo-100 dark:border-indigo-500/20 transition-all hover:bg-indigo-50 dark:hover:bg-indigo-900/20">
                            <div className="flex items-center gap-2 mb-3">
                                <Flag size={18} className="text-indigo-600 dark:text-indigo-400" />
                                <h3 className="font-bold text-indigo-900 dark:text-indigo-300">الرؤية (Vision)</h3>
                            </div>
                            <p className="text-sm text-gray-600 dark:text-slate-400 leading-relaxed font-medium">{activePlan.vision || "لم يتم كتابة الرؤية."}</p>
                        </div>
                        <div className="bg-emerald-50/50 dark:bg-emerald-900/10 rounded-2xl p-5 border border-emerald-100 dark:border-emerald-500/20 transition-all hover:bg-emerald-50 dark:hover:bg-emerald-900/20">
                            <div className="flex items-center gap-2 mb-3">
                                <Target size={18} className="text-emerald-600 dark:text-emerald-400" />
                                <h3 className="font-bold text-emerald-900 dark:text-emerald-300">الرسالة (Mission)</h3>
                            </div>
                            <p className="text-sm text-gray-600 dark:text-slate-400 leading-relaxed font-medium">{activePlan.mission || "لم يتم كتابة الرسالة."}</p>
                        </div>
                        <div className="bg-amber-50/50 dark:bg-amber-900/10 rounded-2xl p-5 border border-amber-100 dark:border-amber-500/20 transition-all hover:bg-amber-50 dark:hover:bg-amber-900/20">
                            <div className="flex items-center gap-2 mb-3">
                                <Activity size={18} className="text-amber-600 dark:text-amber-400" />
                                <h3 className="font-bold text-amber-900 dark:text-amber-300">القيم (Values)</h3>
                            </div>
                            <p className="text-sm text-gray-600 dark:text-slate-400 leading-relaxed font-medium">{activePlan.values || "لم يتم كتابة القيم."}</p>
                        </div>
                    </div>
                )}
            </div>

            {/* Tree Area */}
            <div className="bg-gray-50/80 dark:bg-slate-900/50 rounded-3xl flex-1 border border-gray-100 dark:border-slate-800 overflow-hidden relative p-4 lg:p-8 space-y-6">
                {!hierarchy.length ? (
                    <div className="text-center py-20">
                        <div className="w-16 h-16 bg-white dark:bg-slate-800 rounded-full flex items-center justify-center mx-auto mb-4 border border-gray-100 dark:border-slate-700 shadow-sm">
                            <Target className="text-gray-400" size={24} />
                        </div>
                        <h3 className="text-lg font-bold text-gray-700 dark:text-slate-200 mb-1">الهرم فارغ حالياً</h3>
                        <p className="text-sm text-gray-500">قم بإضافة "الأهداف الاستراتيجية" وربطها بالخطة لعرضها هنا.</p>
                    </div>
                ) : (
                    hierarchy.map((so: any) => (
                        <TreeNodeSo key={so.id} node={so} structs={structuresMap} depts={departmentsMap} per={personnelMap} />
                    ))
                )}
            </div>
        </div>
    );
}

// Sub-components for recursive rendering

function TreeNodeSo({ node, structs, depts, per }: any) {
    const [open, setOpen] = useState(false);
    
    return (
        <div className="bg-white dark:bg-slate-900 border border-gray-200 dark:border-slate-700 rounded-2xl overflow-hidden shadow-sm transition-all hover:shadow-md">
            <div 
                className="p-5 flex items-center justify-between cursor-pointer group bg-gradient-to-r hover:from-slate-50 dark:hover:from-slate-800 transition-colors"
                onClick={() => setOpen(!open)}
            >
                <div className="flex items-center gap-4 cursor-pointer">
                    <div className="w-10 h-10 rounded-xl bg-blue-100 dark:bg-blue-900/40 text-blue-700 dark:text-blue-400 flex items-center justify-center font-bold">
                        <Target size={20} />
                    </div>
                    <div>
                        <div className="text-xs font-bold text-blue-600 dark:text-blue-400 mb-1 uppercase tracking-wider">هدف استراتيجي</div>
                        <h3 className="text-lg font-black text-gray-900 dark:text-gray-100 group-hover:text-blue-700 dark:group-hover:text-blue-400 transition-colors">{node.name || 'بدون اسم'}</h3>
                    </div>
                </div>
                <div className="flex items-center gap-4">
                    <div className="hidden sm:flex items-center gap-2 px-3 py-1.5 bg-gray-50 dark:bg-slate-800 rounded-lg border border-gray-100 dark:border-slate-700 text-sm font-medium text-gray-700 dark:text-gray-300">
                        <span>الوزن: {node.weight || 0}%</span>
                    </div>
                    {node.children?.length > 0 && (
                        <div className="w-8 h-8 rounded-full bg-gray-50 dark:bg-slate-800 flex items-center justify-center text-gray-400 group-hover:bg-blue-50 dark:group-hover:bg-blue-900/30 group-hover:text-blue-600 transition-colors">
                            <ChevronDown className={`transition-transform duration-300 ${open ? 'rotate-180' : ''}`} size={18} />
                        </div>
                    )}
                </div>
            </div>
            
            <div className={`grid transition-[grid-template-rows] duration-300 ease-in-out ${open ? 'grid-rows-[1fr]' : 'grid-rows-[0fr]'}`}>
                <div className="overflow-hidden bg-gray-50/50 dark:bg-slate-800/20">
                    <div className="p-4 sm:p-6 border-t border-gray-100 dark:border-slate-700 space-y-4">
                        {!node.children?.length ? (
                            <div className="text-sm text-gray-400 text-center py-4 bg-white dark:bg-slate-900 rounded-xl border border-dashed border-gray-200 dark:border-slate-700">لا يوجد أهداف تشغيلية مرتبطة</div>
                        ) : (
                            node.children.map((op: any) => <TreeNodeOp key={op.id} node={op} structs={structs} depts={depts} per={per} />)
                        )}
                    </div>
                </div>
            </div>
        </div>
    );
}

function TreeNodeOp({ node, structs, depts, per }: any) {
    const [open, setOpen] = useState(false);
    const structId = typeof node.structure_id === 'object' ? node.structure_id?.id : node.structure_id;
    const structureName = structId ? structs.get(structId)?.name : null;

    return (
        <div className="bg-white dark:bg-slate-900 border border-gray-200/80 dark:border-slate-700 rounded-xl overflow-hidden shadow-sm mr-4 sm:mr-8 relative before:content-[''] before:absolute before:right-[-20px] before:top-8 before:w-5 before:h-px before:bg-gray-200 dark:before:bg-slate-700">
            <div 
                className="p-4 sm:p-5 flex flex-col sm:flex-row sm:items-center justify-between cursor-pointer hover:bg-slate-50 dark:hover:bg-slate-800/50 transition-colors gap-4"
                onClick={() => setOpen(!open)}
            >
                <div className="flex items-start sm:items-center gap-3 w-full">
                    <div className="w-8 h-8 shrink-0 rounded-lg bg-emerald-100 dark:bg-emerald-900/40 text-emerald-700 dark:text-emerald-400 flex items-center justify-center">
                        <Activity size={16} />
                    </div>
                    <div className="flex-1">
                        <div className="flex justify-between items-center sm:hidden mb-2">
                             <div className="text-[10px] font-bold text-emerald-600 dark:text-emerald-400 uppercase tracking-wider bg-emerald-50 dark:bg-emerald-500/10 px-2 py-0.5 rounded-md inline-block">هدف تشغيلي</div>
                             <span className="text-xs font-bold text-gray-500">{node.weight || 0}%</span>
                        </div>
                        <h4 className="text-md font-bold text-gray-800 dark:text-gray-200 leading-tight">{node.name || 'بدون اسم'}</h4>
                        {structureName && (
                            <div className="flex items-center gap-1.5 mt-2 text-xs text-slate-500 dark:text-slate-400 bg-slate-50 dark:bg-slate-800 w-fit px-2.5 py-1 rounded-md border border-slate-100 dark:border-slate-700">
                                <Building2 size={12} className="text-slate-400" />
                                {structureName}
                            </div>
                        )}
                    </div>
                </div>
                
                <div className="hidden sm:flex items-center gap-3 shrink-0">
                    <div className="text-xs font-bold text-emerald-600 dark:text-emerald-400 uppercase bg-emerald-50 dark:bg-emerald-500/10 px-2.5 py-1 rounded-md">هدف تشغيلي</div>
                    <span className="text-sm font-black text-gray-700 dark:text-gray-300 w-12 text-center">{node.weight || 0}%</span>
                    {node.children?.length > 0 && (
                        <ChevronDown className={`text-gray-400 transition-transform duration-300 ${open ? 'rotate-180' : ''}`} size={18} />
                    )}
                </div>
            </div>
            
            <div className={`grid transition-[grid-template-rows] duration-300 ease-in-out ${open ? 'grid-rows-[1fr]' : 'grid-rows-[0fr]'}`}>
                <div className="overflow-hidden bg-gray-50/30 dark:bg-slate-800/10">
                    <div className="p-3 sm:p-5 border-t border-gray-100 dark:border-slate-700/50 space-y-3">
                        {!node.children?.length ? (
                            <div className="text-xs text-gray-400 text-center py-3 bg-white dark:bg-slate-900 rounded-lg border border-dashed border-gray-200 dark:border-slate-700">لا يوجد مؤشرات أداء مرتبطة</div>
                        ) : (
                            node.children.map((kpi: any) => <TreeNodeKpi key={kpi.id} node={kpi} depts={depts} per={per} />)
                        )}
                    </div>
                </div>
            </div>
        </div>
    );
}

function TreeNodeKpi({ node, depts, per }: any) {
    const [open, setOpen] = useState(false);
    const deptId = typeof node.department_id === 'object' ? node.department_id?.id : node.department_id;
    const deptName = deptId ? depts.get(deptId)?.name : null;

    return (
        <div className="bg-white dark:bg-slate-800/80 border border-gray-200/60 dark:border-slate-600/50 rounded-lg overflow-hidden mr-4 sm:mr-8 relative before:content-[''] before:absolute before:right-[-20px] before:top-6 before:w-5 before:h-px before:bg-gray-200 dark:before:bg-slate-700">
            <div 
                className="p-3 sm:p-4 flex flex-col sm:flex-row sm:items-center justify-between cursor-pointer hover:bg-slate-50 dark:hover:bg-slate-700/50 transition-colors gap-3"
                onClick={() => setOpen(!open)}
            >
                <div className="flex items-start gap-3 w-full">
                    <div className="w-7 h-7 shrink-0 rounded-md bg-amber-100 dark:bg-amber-900/40 text-amber-700 dark:text-amber-400 flex items-center justify-center mt-0.5">
                        <TrendingUp size={14} />
                    </div>
                    <div className="flex-1">
                        <h5 className="text-sm font-bold text-gray-800 dark:text-gray-200">{node.name || 'بدون اسم'}</h5>
                        <div className="flex flex-wrap items-center gap-2 mt-2">
                             {deptName && (
                                <div className="flex items-center gap-1 text-[10px] font-bold text-indigo-600 dark:text-indigo-400 bg-indigo-50 dark:bg-indigo-900/30 px-2 py-0.5 rounded border border-indigo-100/50 dark:border-indigo-500/20">
                                    <Briefcase size={10} /> {deptName}
                                </div>
                            )}
                            {node.target_value && (
                                <div className="text-[10px] bg-slate-100 dark:bg-slate-700 text-slate-600 dark:text-slate-300 px-2 py-0.5 rounded font-semibold border border-slate-200 dark:border-slate-600">المستهدف: {node.target_value}</div>
                            )}
                        </div>
                    </div>
                </div>
                
                <div className="flex items-center justify-between sm:justify-end gap-3 w-full sm:w-auto px-10 sm:px-0">
                     <span className="text-xs font-black text-gray-600 dark:text-gray-400">{node.weight || 0}%</span>
                     {node.children?.length > 0 && <ChevronDown className={`text-gray-400 shrink-0 transition-transform duration-300 ${open ? 'rotate-180' : ''}`} size={16} />}
                </div>
            </div>
            
            <div className={`grid transition-[grid-template-rows] duration-300 ease-in-out ${open ? 'grid-rows-[1fr]' : 'grid-rows-[0fr]'}`}>
                <div className="overflow-hidden bg-white/50 dark:bg-slate-900/30">
                    <div className="p-3 border-t border-gray-100 dark:border-slate-700/50 space-y-2">
                        {!node.children?.length ? (
                             <div className="text-[11px] text-gray-400 text-center py-2 bg-gray-50 dark:bg-slate-800 rounded border border-dashed border-gray-200 dark:border-slate-700">لا يوجد مبادرات تابعة</div>
                        ) : (
                             node.children.map((init: any) => <TreeNodeInit key={init.id} node={init} per={per} />)
                        )}
                    </div>
                </div>
            </div>
        </div>
    );
}

function TreeNodeInit({ node, per }: any) {
    const [open, setOpen] = useState(false);
    return (
        <div className="bg-slate-50 dark:bg-slate-800 rounded-md border border-slate-200/60 dark:border-slate-700/60 overflow-hidden mr-4 sm:mr-8 relative before:content-[''] before:absolute before:right-[-20px] before:top-5 before:w-5 before:h-px before:bg-slate-200 dark:before:bg-slate-700">
             <div 
                className="p-2.5 flex items-center justify-between cursor-pointer hover:bg-slate-100 dark:hover:bg-slate-700 transition-colors"
                onClick={() => setOpen(!open)}
            >
                 <div className="flex items-center gap-2.5">
                    <Lightbulb size={14} className="text-purple-500 dark:text-purple-400 shrink-0" />
                    <span className="text-sm font-semibold text-gray-700 dark:text-gray-300">{node.name || 'بدون اسم'}</span>
                 </div>
                 <div className="flex items-center gap-2">
                    <span className="text-[11px] font-bold text-gray-500">{node.weight || 0}%</span>
                    {node.children?.length > 0 && <ChevronDown className={`text-gray-400 shrink-0 transition-transform duration-300 ${open ? 'rotate-180' : ''}`} size={14} />}
                 </div>
            </div>
            
            <div className={`grid transition-[grid-template-rows] duration-200 ease-in-out ${open ? 'grid-rows-[1fr]' : 'grid-rows-[0fr]'}`}>
                <div className="overflow-hidden bg-white dark:bg-slate-900">
                    <div className="p-2 border-t border-slate-100 dark:border-slate-700/50 space-y-1.5">
                        {!node.children?.length ? (
                             <div className="text-[10px] text-gray-400 text-center py-1">لا يوجد آليات تنفيذ مضافة</div>
                        ) : (
                             node.children.map((mech: any) => {
                                 const pId = typeof mech.personnel_id === 'object' ? mech.personnel_id?.id : mech.personnel_id;
                                 const pName = pId ? per.get(pId)?.name : null;
                                 return (
                                     <div key={mech.id} className="flex flex-col sm:flex-row sm:items-center justify-between p-2 rounded bg-slate-50/80 dark:bg-slate-800/50 border border-slate-100 dark:border-slate-700/50 mr-4 sm:mr-8 relative gap-2 sm:gap-0 before:content-[''] before:absolute before:right-[-20px] before:top-4 before:w-5 before:h-px before:bg-slate-100 dark:before:bg-slate-700/50">
                                         <div className="flex items-center gap-2">
                                             <Wrench size={12} className="text-slate-400 shrink-0" />
                                             <span className="text-xs font-medium text-slate-700 dark:text-slate-300 max-w-[200px] truncate" title={mech.name}>{mech.name || 'بدون اسم'}</span>
                                         </div>
                                         <div className="flex items-center gap-2 px-6 sm:px-0">
                                            {pName && (
                                                <div className="flex items-center gap-1 text-[10px] text-teal-600 dark:text-teal-400 bg-teal-50 dark:bg-teal-500/10 px-1.5 py-0.5 rounded border border-teal-100/50 dark:border-teal-500/20 max-w-[120px] truncate">
                                                    <UserCircle size={10} className="shrink-0" /> {pName}
                                                </div>
                                            )}
                                            {(mech.start_date || mech.end_date) && (
                                                <div className="text-[10px] text-slate-500 dark:text-slate-400 font-mono">
                                                    {mech.start_date ? new Date(mech.start_date).toLocaleDateString("en-GB") : '?'} - {mech.end_date ? new Date(mech.end_date).toLocaleDateString("en-GB") : '?'}
                                                </div>
                                            )}
                                         </div>
                                     </div>
                                 );
                             })
                        )}
                    </div>
                </div>
            </div>
        </div>
    );
}

// A simple Network icon component
function NetworkIcon({ size = 24 }: { size?: number }) {
    return (
        <svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <rect x="16" y="16" width="6" height="6" rx="1"></rect>
            <rect x="2" y="16" width="6" height="6" rx="1"></rect>
            <rect x="9" y="2" width="6" height="6" rx="1"></rect>
            <path d="M5 16v-3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3"></path>
            <path d="M12 12V8"></path>
        </svg>
    );
}
