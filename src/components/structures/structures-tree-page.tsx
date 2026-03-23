"use client";

import React, { useState, useMemo, useEffect } from "react";
import { useList, useCreate, useUpdate, useUpdateMany, useDeleteMany } from "@refinedev/core";
import { 
    FolderTree, 
    Maximize2, 
    Minimize2, 
    Plus, 
    Edit, 
    CheckCircle, 
    XCircle, 
    Trash2, 
    Search, 
    FolderOpen 
} from "lucide-react";

import { StructureNode } from "./types";
import { TreeNode } from "./components/tree-node";
import { CustomSelect } from "./components/custom-select";
import { ViewMode, ViewToggle } from "./components/view-toggle";
import { OrgChartView } from "./components/org-chart-view";
import { PrintView } from "./components/print-view";
import { StructureEditModal } from "./modals/edit-modal";
import { StructureDeleteModal } from "./modals/delete-modal";
import { StructureBulkDeleteModal } from "./modals/bulk-delete-modal";
import { Download } from "lucide-react";

export default function StructuresTreePage() {
    const resourceName = "Structures";
    
    const { query } = useList({
        resource: resourceName,
        pagination: { current: 1, pageSize: 500 } as any,
        sorters: [{ field: "sort_order", order: "asc" }] as any
    });

    const listData = query?.data;
    const isLoading = query?.isLoading;
    const refetch = query?.refetch;

    const { mutate: createRecord } = useCreate();
    const { mutate: updateRecord } = useUpdate();
    const { mutate: updateMany } = useUpdateMany();
    const { mutate: deleteMany } = useDeleteMany();

    const rawItems = useMemo(() => (listData?.data as StructureNode[]) || [], [listData?.data]);
    
    const [expandedKeys, setExpandedKeys] = useState<(string | number)[]>([]);
    const [selectedKey, setSelectedKey] = useState<string | number | null>(null);
    const [isModalOpen, setIsModalOpen] = useState(false);
    const [nodeToDelete, setNodeToDelete] = useState<StructureNode | null>(null);
    const [searchQuery, setSearchQuery] = useState("");
    const [selectedIds, setSelectedIds] = useState<Set<string | number>>(new Set());
    const [isBulkDeleteModalOpen, setIsBulkDeleteModalOpen] = useState(false);
    const [filterStatus, setFilterStatus] = useState<"all" | "active" | "inactive">("all");
    const [viewMode, setViewMode] = useState<ViewMode>('tree');
    
    // Form State
    const [formData, setFormData] = useState<Partial<StructureNode>>({});
    const [isSubmitting, setIsSubmitting] = useState(false);

    // Build recursive tree
    const { tree, flatList } = useMemo(() => {
        if (!rawItems.length) return { tree: [], flatList: [] };
        
        let baseItems = rawItems;
        if (filterStatus === "active") {
            baseItems = rawItems.filter((i: StructureNode) => i.is_active === true);
        } else if (filterStatus === "inactive") {
            baseItems = rawItems.filter((i: StructureNode) => i.is_active === false);
        }

        let filteredItems = baseItems;
        if (searchQuery.trim()) {
            const query = searchQuery.toLowerCase();
            const matchedItems = baseItems.filter((i: StructureNode) => 
                (i.name && i.name.toLowerCase().includes(query)) || 
                (i.code && i.code.toLowerCase().includes(query))
            );
            
            const includeSet = new Set(matchedItems.map((i: StructureNode) => i.id));
            const addParents = (id: string | number) => {
                const item = baseItems.find((i: StructureNode) => i.id === id);
                if (item && item.parent_id) {
                    const pId = typeof item.parent_id === 'object' && item.parent_id !== null ? item.parent_id.id : item.parent_id;
                    if (pId && !includeSet.has(pId)) {
                        includeSet.add(pId);
                        addParents(pId);
                    }
                }
            };
            matchedItems.forEach((item: StructureNode) => addParents(item.id));
            filteredItems = baseItems.filter((i: StructureNode) => includeSet.has(i.id));
        }

        const map = new Map<string | number, StructureNode>();
        filteredItems.forEach((item: StructureNode) => {
            map.set(item.id, { ...item, children: [] });
        });

        const localTree: StructureNode[] = [];
        filteredItems.forEach((item: StructureNode) => {
            const node = map.get(item.id)!;
            const pId = typeof item.parent_id === 'object' && item.parent_id !== null ? item.parent_id.id : item.parent_id;
            
            if (pId && map.has(pId)) {
                map.get(pId)!.children.push(node);
            } else {
                localTree.push(node);
            }
        });

        // Sort children
        const sortNodes = (nodes: StructureNode[]) => {
            nodes.sort((a, b) => (a.sort_order || 0) - (b.sort_order || 0));
            nodes.forEach(n => {
                if (n.children && n.children.length > 0) sortNodes(n.children);
            });
        };
        sortNodes(localTree);

        return { tree: localTree, flatList: filteredItems };
    }, [rawItems, searchQuery, filterStatus]);

    // Expand matched items automatically
    useEffect(() => {
        if (searchQuery.trim() && tree.length > 0) {
            // eslint-disable-next-line react-hooks/set-state-in-effect
            setExpandedKeys(flatList.map((i: StructureNode) => i.id));
        }
    }, [searchQuery, flatList, tree.length]);

    // Helper to get all descendant IDs for a given set of parent IDs
    const getAllDescendantIds = (parentIds: (string | number)[]) => {
        let result: (string | number)[] = [];
        let currentLevel = [...parentIds];

        while (currentLevel.length > 0) {
            const children = flatList.filter((item: StructureNode) => {
                const pId = typeof item.parent_id === 'object' && item.parent_id !== null ? item.parent_id.id : item.parent_id;
                return pId !== null && pId !== undefined && currentLevel.includes(pId);
            }).map((item: StructureNode) => item.id);
            
            result = [...result, ...children];
            currentLevel = children;
        }

        return result;
    };

    // Handlers
    const handleExpandAll = () => {
        setExpandedKeys(rawItems.map((item: StructureNode) => item.id));
    };

    const handleCollapseAll = () => {
        setExpandedKeys([]);
        setSelectedKey(null);
    };

    const handleExportCSV = () => {
        const rows: { name: string, code: string, status: string, description: string }[] = [];
        const traverse = (nodes: StructureNode[], depth = 0) => {
            nodes.forEach(n => {
                const indent = '    '.repeat(depth);
                rows.push({
                    name: `${indent}${n.name || 'بدون اسم'}`,
                    code: n.code || '',
                    status: n.is_active ? 'مفعل' : 'موقوف',
                    description: n.description || ''
                });
                if (n.children && n.children.length > 0) traverse(n.children, depth + 1);
            });
        };
        traverse(tree);

        const header = ['القسم/الإدارة', 'الكود', 'الحالة', 'الوصف'].join(',');
        const csvContent = [
            header,
            ...rows.map(r => `"${r.name}","${r.code}","${r.status}","${r.description.replace(/"/g, '""')}"`)
        ].join('\n');

        const blob = new Blob(['\uFEFF' + csvContent], { type: 'text/csv;charset=utf-8;' });
        const url = URL.createObjectURL(blob);
        const link = document.createElement('a');
        link.href = url;
        link.setAttribute('download', `هيكل_المنظمة_${new Date().toLocaleDateString('en-GB').replace(/\//g, '-')}.csv`);
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    };

    const toggleExpand = (id: string | number) => {
        setExpandedKeys(prev => 
            prev.includes(id) ? prev.filter(k => k !== id) : [...prev, id]
        );
    };

    const handleCheckNode = (checked: boolean, id: string | number) => {
        setSelectedIds(prev => {
            const next = new Set(prev);
            
            if (checked) {
                // Add node and all its descendants
                const descendants = getAllDescendantIds([id]);
                [id, ...descendants].forEach(d => next.add(d));

                // Check ancestors: if all children of a parent are selected, select the parent
                let current = flatList.find((i: StructureNode) => String(i.id) === String(id));
                while (current && current.parent_id) {
                    const pId = typeof current.parent_id === 'object' && current.parent_id !== null ? current.parent_id.id : current.parent_id;
                    if (!pId) break;
                    
                    const siblings = flatList.filter((i: StructureNode) => {
                        const itemPId = typeof i.parent_id === 'object' && i.parent_id !== null ? i.parent_id.id : i.parent_id;
                        return String(itemPId) === String(pId);
                    });
                    
                    const allSiblingsSelected = siblings.every((s: StructureNode) => next.has(s.id));
                    if (allSiblingsSelected) {
                        next.add(pId);
                    } else {
                        break;
                    }
                    current = flatList.find((i: StructureNode) => String(i.id) === String(pId));
                }
            } else {
                // Remove node and all its descendants
                const descendants = getAllDescendantIds([id]);
                [id, ...descendants].forEach(d => next.delete(d));

                // Remove all ancestors since not all their children are selected anymore
                let current = flatList.find((i: StructureNode) => String(i.id) === String(id));
                while (current && current.parent_id) {
                    const pId = typeof current.parent_id === 'object' && current.parent_id !== null ? current.parent_id.id : current.parent_id;
                    if (!pId) break;
                    next.delete(pId);
                    current = flatList.find((i: StructureNode) => String(i.id) === String(pId));
                }
            }
            
            return next;
        });
    };

    const handleSelectAll = (checked: boolean) => {
        if (checked) {
            setSelectedIds(new Set(flatList.map((i: StructureNode) => i.id)));
        } else {
            setSelectedIds(new Set());
        }
    };

    const handleBulkAction = (action: 'activate' | 'deactivate' | 'delete') => {
        const ids = Array.from(selectedIds);
        if (action === 'delete') {
            setIsBulkDeleteModalOpen(true);
        } else {
            const isActive = action === 'activate';
            updateMany({
                resource: resourceName,
                ids: ids,
                values: { is_active: isActive },
                successNotification: () => ({ message: `تم ${isActive ? 'التفعيل' : 'التعطيل'} الجماعي بنجاح`, type: "success" })
            }, {
                onSuccess: () => {
                    setSelectedIds(new Set());
                    refetch?.();
                }
            });
        }
    };

    const confirmBulkDelete = () => {
        const initialIds = Array.from(selectedIds);
        const descendantIds = getAllDescendantIds(initialIds);
        const allIdsToDelete = Array.from(new Set([...initialIds, ...descendantIds]));

        deleteMany({
            resource: resourceName,
            ids: allIdsToDelete,
            successNotification: () => ({ message: "تم الحذف مع كافة الأقسام الفرعية التابعة بنجاح", type: "success" }),
            errorNotification: () => ({ message: "فشل الحذف. يرجى التأكد من عدم وجود بيانات (وظائف/موظفين) مرتبطة بهذه الأقسام", type: "error" })
        }, {
            onSuccess: () => {
                setSelectedIds(new Set());
                setIsBulkDeleteModalOpen(false);
                refetch?.();
            }
        });
    };

    const handleAddRoot = () => {
        setFormData({
            is_active: true,
            sort_order: 0,
            parent_id: null
        });
        setIsModalOpen(true);
    };

    const handleEdit = (node: Partial<StructureNode>) => {
        if (!node.id) {
            setFormData({
                is_active: true,
                sort_order: 0,
                parent_id: node.parent_id
            });
        } else {
            const currentParentId = typeof node.parent_id === 'object' && node.parent_id !== null ? node.parent_id.id : node.parent_id;
            setFormData({
                ...node,
                parent_id: currentParentId
            });
        }
        setIsModalOpen(true);
    };

    const handleDelete = (node: StructureNode) => {
        setNodeToDelete(node);
    };

    const confirmDeleteCall = (id: string | number) => {
        const descendantIds = getAllDescendantIds([id]);
        const allIdsToDelete = Array.from(new Set([id, ...descendantIds]));

        deleteMany({
            resource: resourceName,
            ids: allIdsToDelete,
            successNotification: () => ({ message: "تم الحذف مع كافة الأقسام الفرعية التابعة بنجاح", type: "success" }),
            errorNotification: () => ({ message: "فشل الحذف. يرجى التأكد من عدم وجود بيانات (وظائف/موظفين) مرتبطة بهذا القسم", type: "error" })
        }, {
            onSuccess: () => {
                refetch?.();
                if (selectedKey === id || descendantIds.includes(selectedKey as any)) setSelectedKey(null);
                setNodeToDelete(null);
            }
        });
    };

    const handleToggleActive = (node: StructureNode) => {
        updateRecord({
            resource: resourceName,
            id: node.id,
            values: { is_active: !node.is_active },
            successNotification: () => ({ message: "تم تغيير حالة التفعيل بنجاح", type: "success" })
        }, {
            onSuccess: () => refetch?.()
        });
    };

    const handleMove = (node: StructureNode, direction: number) => {
        const pId = typeof node.parent_id === 'object' && node.parent_id !== null ? node.parent_id.id : node.parent_id;
        const siblings = flatList.filter((item: StructureNode) => {
            const itemPId = typeof item.parent_id === 'object' && item.parent_id !== null ? item.parent_id.id : item.parent_id;
            return String(itemPId) === String(pId);
        }).sort((a: StructureNode, b: StructureNode) => (a.sort_order || 0) - (b.sort_order || 0));

        const currentIndex = siblings.findIndex((s: StructureNode) => s.id === node.id);
        if (currentIndex === -1 || currentIndex + direction < 0 || currentIndex + direction >= siblings.length) return;

        const targetNode = siblings[currentIndex + direction];
        const currentSort = node.sort_order || 0;
        const targetSort = targetNode.sort_order || 0;
        
        let newCurrentSort = targetSort;
        const newTargetSort = currentSort;
        if (newCurrentSort === newTargetSort) {
            newCurrentSort += direction;
        }

        updateRecord({ resource: resourceName, id: node.id, values: { sort_order: newCurrentSort }, successNotification: false });
        updateRecord({ resource: resourceName, id: targetNode.id, values: { sort_order: newTargetSort }, successNotification: false }, {
            onSuccess: () => refetch?.()
        });
    };

    const handleSave = async () => {
        setIsSubmitting(true);
        let pId = formData.parent_id;
        if (pId === "" || pId === "null" || pId === null) pId = null;
        else pId = Number(pId);

        const payload = {
            name: formData.name,
            code: formData.code,
            description: formData.description,
            is_active: formData.is_active,
            sort_order: Number(formData.sort_order || 0),
            parent_id: pId
        };

        if (formData.id) {
            updateRecord({
                resource: resourceName,
                id: formData.id,
                values: payload,
                successNotification: () => ({ message: "تم التعديل بنجاح", type: "success" })
            }, {
                onSuccess: () => {
                    setIsModalOpen(false);
                    refetch?.();
                },
                onSettled: () => setIsSubmitting(false)
            });
        } else {
            createRecord({
                resource: resourceName,
                values: payload,
                successNotification: () => ({ message: "تمت الإضافة بنجاح", type: "success" })
            }, {
                onSuccess: () => {
                    setIsModalOpen(false);
                    if (pId && !expandedKeys.includes(pId)) {
                        setExpandedKeys(prev => [...prev, pId]);
                    }
                    refetch?.();
                },
                onSettled: () => setIsSubmitting(false)
            });
        }
    };

    const getAvailableParents = (nodeId: string | number | undefined) => {
        if (!nodeId) return flatList;
        
        const descendants = getAllDescendantIds([nodeId]).map((d: any) => String(d));
        const excludeList = [String(nodeId), ...descendants];
        
        return flatList.filter((item: StructureNode) => !excludeList.includes(String(item.id)));
    };

    return (
        <div className={`w-full flex flex-col p-4 md:p-6 mx-auto ${viewMode === 'print' ? 'min-h-screen print:min-h-0 print:p-0 bg-white dark:bg-slate-900 print:bg-white' : 'h-[calc(100vh-5rem)] overflow-hidden'}`}>
            <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-800 px-6 py-4 mb-5 shrink-0 flex flex-wrap items-center justify-between gap-4 print:hidden">
                <div className="flex items-center gap-3">
                    <div className="w-12 h-12 bg-indigo-50 dark:bg-indigo-900/30 rounded-xl flex items-center justify-center text-indigo-600 dark:text-indigo-400">
                        <FolderTree size={24} />
                    </div>
                    <div>
                        <h1 className="text-xl font-black text-gray-900 dark:text-white">بناء الأقسام (الهيكل)</h1>
                        <p className="text-sm text-gray-500 font-medium">إدارة الهيكل التنظيمي بشجرة تفاعلية وأدوات عرض</p>
                    </div>
                </div>

                <div className="flex flex-wrap items-center gap-4">
                    <ViewToggle viewMode={viewMode} setViewMode={setViewMode} />
                    
                    {viewMode === 'print' && (
                        <>
                            <button 
                                onClick={handleExportCSV}
                                className="flex items-center gap-1.5 px-4 py-2 bg-emerald-600 dark:bg-emerald-500 text-white font-bold rounded-xl hover:bg-emerald-700 dark:hover:bg-emerald-600 transition-colors shadow-sm"
                            >
                                <Download size={16} />
                                <span className="hidden sm:inline">تصدير إكسيل</span>
                            </button>
                            <button 
                                onClick={() => window.print()}
                                className="flex items-center gap-1.5 px-4 py-2 bg-gray-900 dark:bg-white text-white dark:text-gray-900 font-bold rounded-xl hover:bg-gray-800 dark:hover:bg-gray-200 transition-colors shadow-lg"
                            >
                                طباعة التقرير
                            </button>
                        </>
                    )}
                </div>
            </div>

            {viewMode === 'tree' && (
                <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-800 p-4 mb-4 flex flex-wrap items-center justify-between gap-4 shrink-0 rtl print:hidden">
                    <div className="flex flex-wrap items-center gap-3 w-full md:w-auto">
                        <CustomSelect
                        className="w-full sm:w-[13rem] shrink-0"
                        options={[
                            { value: 'all', label: 'عرض الكل' },
                            { value: 'active', label: 'الأقسام المفعلة فقط' },
                            { value: 'inactive', label: 'الأقسام الموقوفة' }
                        ]}
                        value={filterStatus}
                        onChange={(val: any) => setFilterStatus(val)}
                        placeholder="اختر الفلتر"
                    />

                    <div className="w-px h-6 bg-gray-200 dark:bg-slate-700 mx-1 hidden sm:block"></div>

                    <label className="flex items-center gap-2 cursor-pointer font-bold text-sm text-gray-700 dark:text-gray-300 hover:text-indigo-600 transition-colors">
                        <input 
                            type="checkbox" 
                            className="w-5 h-5 text-indigo-600 bg-white border-gray-300 rounded focus:ring-indigo-500 dark:focus:ring-indigo-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
                            checked={flatList.length > 0 && selectedIds.size === flatList.length}
                            onChange={(e) => handleSelectAll(e.target.checked)}
                        />
                        تحديد الكل ({selectedIds.size})
                    </label>

                    {selectedIds.size > 0 && (
                        <>
                            <div className="w-px h-6 bg-gray-200 dark:bg-slate-700 mx-1 hidden sm:block"></div>
                            <button 
                                onClick={() => handleBulkAction('activate')}
                                className="flex items-center gap-1.5 px-3 py-1.5 text-xs font-bold text-emerald-700 dark:text-emerald-300 bg-emerald-100 dark:bg-emerald-900/30 hover:bg-emerald-200 dark:hover:bg-emerald-800/40 rounded-lg transition-all"
                            >
                                <CheckCircle size={14} /> تفعيل
                            </button>
                            <button 
                                onClick={() => handleBulkAction('deactivate')}
                                className="flex items-center gap-1.5 px-3 py-1.5 text-xs font-bold text-gray-700 dark:text-gray-300 bg-gray-100 dark:bg-slate-800 hover:bg-gray-200 dark:hover:bg-slate-700 rounded-lg transition-all"
                            >
                                <XCircle size={14} /> تعطيل
                            </button>
                            <button 
                                onClick={() => handleBulkAction('delete')}
                                className="flex items-center gap-1.5 px-3 py-1.5 text-xs font-bold text-rose-700 dark:text-rose-300 bg-rose-100 dark:bg-rose-900/30 hover:bg-rose-200 dark:hover:bg-rose-800/40 rounded-lg transition-all"
                            >
                                <Trash2 size={14} /> حذف
                            </button>
                        </>
                    )}
                </div>
                
                <div className="relative w-full md:w-96">
                    <div className="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none">
                        <Search size={18} className="text-gray-400" />
                    </div>
                    <input 
                        type="text" 
                        className="w-full bg-gray-50 dark:bg-slate-800 border-2 border-gray-200 dark:border-slate-700 text-gray-900 dark:text-white text-sm rounded-xl focus:ring-indigo-500 focus:border-indigo-500 block pr-10 p-2.5 transition-all outline-none" 
                        placeholder="ابحث باسم القسم أو الكود..."
                        value={searchQuery}
                        onChange={(e) => setSearchQuery(e.target.value)}
                    />
                </div>
            </div>
            )}

            {/* General Toolbar placed above the dynamic content container if needed. For Tree View, we show Expand/Collapse. */}
            {viewMode === 'tree' && (
                <div className="flex items-center gap-2 bg-white dark:bg-slate-900 p-2 rounded-xl border border-gray-100 dark:border-slate-800 shadow-sm mb-4 shrink-0 mx-auto print:hidden">
                    <button 
                        onClick={handleExpandAll}
                        className="flex items-center gap-1.5 px-3 py-2 text-sm font-bold text-gray-700 dark:text-gray-200 hover:bg-gray-50 dark:hover:bg-slate-800 rounded-lg transition-all"
                    >
                        <Maximize2 size={16} className="text-indigo-500" />
                        توسيع الكل
                    </button>
                    <div className="w-px h-6 bg-gray-200 dark:bg-slate-700"></div>
                    <button 
                        onClick={handleCollapseAll}
                        className="flex items-center gap-1.5 px-3 py-2 text-sm font-bold text-gray-700 dark:text-gray-200 hover:bg-gray-50 dark:hover:bg-slate-800 rounded-lg transition-all"
                    >
                        <Minimize2 size={16} className="text-slate-500" />
                        تقليص الكل
                    </button>
                    <div className="w-px h-6 bg-gray-200 dark:bg-slate-700"></div>
                    <button 
                        onClick={handleAddRoot}
                        className="flex items-center gap-1.5 px-4 py-2 text-sm font-bold text-emerald-700 dark:text-emerald-300 bg-emerald-50 dark:bg-emerald-900/30 hover:bg-emerald-100 dark:hover:bg-emerald-800/40 rounded-lg transition-all"
                    >
                        <Plus size={16} />
                        إضافة جذر جديد
                    </button>
                    <div className="w-px h-6 bg-gray-200 dark:bg-slate-700"></div>
                    <button 
                        disabled={!selectedKey}
                        onClick={() => {
                            const node = rawItems.find((r: StructureNode) => r.id === selectedKey);
                            if (node) handleEdit(node);
                        }}
                        className="flex items-center gap-1.5 px-4 py-2 text-sm font-bold text-blue-700 dark:text-blue-300 bg-blue-50 dark:bg-blue-900/30 hover:bg-blue-100 dark:hover:bg-blue-800/40 rounded-lg transition-all disabled:opacity-50 disabled:cursor-not-allowed"
                    >
                        <Edit size={16} />
                        تعديل
                    </button>
                </div>
            )}

            <div className={`bg-white dark:bg-slate-900 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-800 flex-1 relative ${viewMode === 'print' ? 'print:border-none print:shadow-none p-0' : 'p-6 overflow-y-auto'}`}>
                {isLoading ? (
                    <div className="flex justify-center items-center h-full">
                        <div className="w-10 h-10 border-4 border-indigo-100 border-t-indigo-600 rounded-full animate-spin"></div>
                    </div>
                ) : tree.length === 0 ? (
                    <div className="flex flex-col justify-center items-center h-full text-gray-400">
                        <FolderOpen size={48} className="mb-3 text-gray-300" />
                        <span className="font-bold text-lg text-gray-500">لا يوجد بيانات حتى الآن</span>
                        <span className="text-sm mt-1">اضغط على "إضافة جذر جديد" للبدء بتكوين الهيكل</span>
                    </div>
                ) : (
                    viewMode === 'tree' ? (
                        <div className="rtl">
                            {tree.map((node, index) => (
                                <TreeNode 
                                    key={node.id} 
                                    node={node} 
                                    onEdit={handleEdit}
                                    onDelete={handleDelete}
                                    onToggleActive={handleToggleActive}
                                    onMove={handleMove}
                                    expandedKeys={expandedKeys}
                                    toggleExpand={toggleExpand}
                                    selectedKey={selectedKey}
                                    setSelectedKey={setSelectedKey}
                                    isFirstChild={index === 0}
                                    isLastChild={index === tree.length - 1}
                                    selectedIds={selectedIds}
                                    onCheck={handleCheckNode}
                                />
                            ))}
                        </div>
                    ) : viewMode === 'chart' ? (
                        <OrgChartView tree={tree} />
                    ) : (
                        <PrintView tree={tree} />
                    )
                )}
            </div>

            <StructureEditModal 
                isOpen={isModalOpen}
                onClose={() => setIsModalOpen(false)}
                formData={formData}
                setFormData={setFormData}
                onSave={handleSave}
                isSubmitting={isSubmitting}
                availableParents={getAvailableParents(formData.id)}
            />

            <StructureDeleteModal 
                isOpen={!!nodeToDelete}
                onClose={() => setNodeToDelete(null)}
                nodeToDelete={nodeToDelete}
                onConfirm={() => nodeToDelete && confirmDeleteCall(nodeToDelete.id)}
            />

            <StructureBulkDeleteModal 
                isOpen={isBulkDeleteModalOpen}
                onClose={() => setIsBulkDeleteModalOpen(false)}
                selectedCount={selectedIds.size}
                onConfirm={confirmBulkDelete}
            />
        </div>
    );
}
