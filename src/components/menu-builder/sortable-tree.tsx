"use client";

import React, { useState, useEffect } from "react";
import { Tree, NodeModel, MultiBackend, getBackendOptions } from "@minoru/react-dnd-treeview";
import { DndProvider } from "react-dnd";
import { GripVertical, Edit, Plus, Trash2, ChevronDown, ChevronLeft, Link2, ArrowUp, ArrowDown } from "lucide-react";
import { useDelete, useNotification, useInvalidate } from "@refinedev/core";
import axios from "axios";

export interface MenuItemData {
    id: string | number;
    parent_id?: number | { id: number } | null;
    title: string;
    url_path?: string | null;
    sort_order?: number;
    [key: string]: unknown;
}

export interface SortableTreeProps {
    items: MenuItemData[];
    isExpandedAll: boolean;
    onRefresh: () => void;
    onEdit: (id: string | number) => void;
    onCreateChild: (parentId: string | number) => void;
}

export const SortableTree: React.FC<SortableTreeProps> = ({ items, isExpandedAll, onRefresh, onEdit, onCreateChild }) => {
    const { mutate: deleteItem } = useDelete();
    const { open } = useNotification();
    const invalidate = useInvalidate();
    const treeRef = React.useRef<any>(null);
    const [treeData, setTreeData] = useState<NodeModel<MenuItemData>[]>([]);
    const [deleteNodeId, setDeleteNodeId] = useState<string | number | null>(null);
    
    useEffect(() => {
        if (treeRef.current) {
            if (isExpandedAll) treeRef.current.openAll();
            else treeRef.current.closeAll();
        }
    }, [isExpandedAll]);

    useEffect(() => {
        if (!Array.isArray(items)) return;
        
        const allItems: NodeModel<MenuItemData>[] = items.map((item) => {
            let parentId: string | number = 0;
            if (item.parent_id) {
                parentId = typeof item.parent_id === 'object' ? item.parent_id.id : item.parent_id;
            }

            return {
                id: String(item.id),
                parent: (!parentId || parentId === 0) ? 0 : String(parentId),
                text: item.title,
                droppable: true,
                data: item
            };
        });

        const rebuildFlat = (parentId: string | number): NodeModel<MenuItemData>[] => {
            const children = allItems.filter(n => String(n.parent) === String(parentId));
            children.sort((a, b) => ((a.data?.sort_order || 0) - (b.data?.sort_order || 0)));
            let res: NodeModel<MenuItemData>[] = [];
            for (const child of children) {
                res.push(child);
                res = res.concat(rebuildFlat(child.id));
            }
            return res;
        };

        const hierarchySortedItems = rebuildFlat(0);
        // eslint-disable-next-line react-hooks/set-state-in-effect
        setTreeData(hierarchySortedItems);
    }, [items]);

    const updateHierarchySequence = async (newTree: NodeModel<MenuItemData>[]) => {
        const siblingCounters: Record<string, number> = {};
        
        const sortPayload = newTree.map((node) => {
            const parentKey = node.parent === 0 || node.parent === '0' ? 'root' : String(node.parent);
            if (siblingCounters[parentKey] === undefined) siblingCounters[parentKey] = 0;
            const currentSortingIndex = siblingCounters[parentKey]++;
            
            return {
                id: Number(node.id),
                sort_order: currentSortingIndex,
                parent_id: node.parent === 0 || node.parent === '0' ? null : Number(node.parent)
            };
        });

        try {
            const rawToken = typeof window !== 'undefined' ? localStorage.getItem("directus_token") : null;
            const token = rawToken ? rawToken.replace(/['"]+/g, '') : null;
            const baseUrl = process.env.NEXT_PUBLIC_DIRECTUS_URL || "http://127.0.0.1:8055";
            let url = "";
            if (baseUrl.endsWith("/items") || baseUrl.endsWith("/items/")) {
                url = `${baseUrl.replace(/\/$/, '')}/menu_items`;
            } else {
                url = `${baseUrl.replace(/\/$/, '')}/items/menu_items`;
            }

            await axios.patch(url, sortPayload, {
                headers: token ? { Authorization: `Bearer ${token}` } : {}
            });

            onRefresh();
            invalidate({ resource: "menu_items", invalidates: ["all"] });
            open?.({
                message: "تم حفظ الترتيب",
                description: "تم تحديث هيكلة القائمة بنجاح",
                type: "success"
            });
        } catch (error) {
            console.error("Drag update error:", error);
            open?.({
                message: "خطأ في التحديث",
                description: "لم نتمكن من حفظ الترتيب الجديد للقائمة.",
                type: "error"
            });
        }
    };

    const handleDrop = (newTree: NodeModel<MenuItemData>[]) => {
        setTreeData(newTree);
        updateHierarchySequence(newTree);
    };

    const moveNode = (nodeId: string | number, direction: 'up' | 'down') => {
        const node = treeData.find(n => String(n.id) === String(nodeId));
        if (!node) return;
        
        const siblings = treeData.filter(n => String(n.parent) === String(node.parent));
        const siblingIndex = siblings.findIndex(n => String(n.id) === String(nodeId));
        
        if (direction === 'up' && siblingIndex === 0) return;
        if (direction === 'down' && siblingIndex === siblings.length - 1) return;
        
        const swapTargetId = siblings[direction === 'up' ? siblingIndex - 1 : siblingIndex + 1].id;
        
        const rebuildFlat = (parentId: string | number): NodeModel<MenuItemData>[] => {
            const directChildren = treeData.filter(n => String(n.parent) === String(parentId));
            
            if (String(parentId) === String(node.parent)) {
                const aIdx = directChildren.findIndex(n => String(n.id) === String(node.id));
                const bIdx = directChildren.findIndex(n => String(n.id) === String(swapTargetId));
                if (aIdx !== -1 && bIdx !== -1) {
                    const temp = directChildren[aIdx];
                    directChildren[aIdx] = directChildren[bIdx];
                    directChildren[bIdx] = temp;
                }
            }
            
            let result: NodeModel<MenuItemData>[] = [];
            for (const child of directChildren) {
                result.push(child);
                result = result.concat(rebuildFlat(child.id));
            }
            return result;
        };
        
        const newTree = rebuildFlat(0);
        setTreeData(newTree);
        updateHierarchySequence(newTree);
    };

    const confirmDelete = (id: string | number) => {
        setDeleteNodeId(id);
    };

    const processDelete = async () => {
        if (!deleteNodeId) return;

        // Recursively find all nested descendant IDs
        const findDescendants = (parentId: string | number): (string | number)[] => {
            const children = treeData.filter(n => String(n.parent) === String(parentId));
            let ids = children.map(n => n.id);
            children.forEach(child => {
                ids = [...ids, ...findDescendants(child.id)];
            });
            return ids;
        };

        const idsToDelete = [...findDescendants(deleteNodeId), deleteNodeId];

        try {
            const rawToken = typeof window !== 'undefined' ? localStorage.getItem("directus_token") : null;
            const token = rawToken ? rawToken.replace(/['"]+/g, '') : null;
            const baseUrl = process.env.NEXT_PUBLIC_DIRECTUS_URL || "http://127.0.0.1:8055";
            let url = "";
            if (baseUrl.endsWith("/items") || baseUrl.endsWith("/items/")) {
                url = `${baseUrl.replace(/\/$/, '')}/menu_items`;
            } else {
                url = `${baseUrl.replace(/\/$/, '')}/items/menu_items`;
            }

            await axios.delete(url, {
                headers: token ? { Authorization: `Bearer ${token}` } : {},
                data: idsToDelete
            });

            onRefresh();
            invalidate({ resource: "menu_items", invalidates: ["all"] });
            open?.({
                message: "عملية ناجحة",
                description: "تم حذف العنصر وكافة تفريعاته بنجاح",
                type: "success"
            });
            setDeleteNodeId(null);
        } catch (error) {
            console.error("Delete error:", error);
            open?.({
                message: "فشل الحذف",
                description: "حدث خطأ غير متوقع أثناء حذف العنصر وتفريعاته.",
                type: "error"
            });
            setDeleteNodeId(null);
        }
    };

    const renderNode = (node: NodeModel<MenuItemData>, { depth, isOpen, onToggle }: { depth: number; isOpen: boolean; onToggle: () => void }) => {
        const item = node.data;
        const hasChildren = treeData.some(n => n.parent === node.id);
        
        return (
            <div 
                className="relative flex items-center justify-between bg-white dark:bg-slate-800 border border-gray-100 dark:border-slate-700 hover:border-indigo-300 dark:hover:border-indigo-500 shadow-sm hover:shadow-md hover:shadow-indigo-500/10 rounded-xl p-3 group transition-all duration-300 my-2"
                style={{ marginInlineStart: depth * 32 }}
            >
                {depth > 0 && (
                    <div className="absolute -right-8 top-1/2 w-6 h-[2px] bg-gray-100 dark:bg-slate-700 rounded-full"></div>
                )}
                
                <div className="flex items-center gap-4 flex-1">
                    <div className="cursor-grab active:cursor-grabbing text-gray-300 dark:text-gray-500 hover:text-indigo-500 dark:hover:text-indigo-400 transition-colors p-1 bg-white dark:bg-slate-800 hover:bg-indigo-50 dark:hover:bg-slate-700 rounded-md" title="سحب لترتيب العنصر">
                        <GripVertical size={20} />
                    </div>
                    
                    <div className="flex items-center justify-center w-8 h-8 rounded-lg bg-gray-50 dark:bg-slate-900 border border-gray-100 dark:border-slate-700 transition-colors group-hover:bg-indigo-50 dark:group-hover:bg-slate-700">
                        {hasChildren ? (
                            <button onClick={onToggle} className="cursor-pointer text-indigo-600 dark:text-indigo-400 hover:text-indigo-800 dark:hover:text-indigo-300 transition-colors focus:outline-none flex items-center justify-center w-full h-full rounded-md">
                                {isOpen ? <ChevronDown size={18} /> : <ChevronLeft size={18} />}
                            </button>
                        ) : (
                            <div className="w-2 h-2 rounded-full bg-gray-300 dark:bg-slate-600"></div>
                        )}
                    </div>
                    
                    <div className="flex flex-col">
                        <span className="font-bold text-gray-800 dark:text-slate-100 text-sm tracking-wide">{node.text}</span>
                        {item?.url_path ? (
                            <span className="flex items-center gap-1.5 text-[11px] text-indigo-500 dark:text-indigo-400 font-mono mt-1 opacity-80" dir="ltr">
                                <Link2 size={12} /> {item.url_path}
                            </span>
                        ) : (
                            <span className="text-[11px] text-emerald-600 dark:text-emerald-400 font-semibold mt-1 bg-emerald-50 dark:bg-emerald-500/10 w-fit px-2 py-0.5 rounded-md">تصنيف مجمّع</span>
                        )}
                    </div>
                </div>

                <div className="flex items-center gap-1.5 opacity-0 group-hover:opacity-100 transition-opacity pr-4">
                    <button onClick={() => moveNode(node.id, 'up')} className="text-gray-500 hover:text-indigo-600 bg-white dark:bg-slate-800 border dark:border-slate-700 hover:border-indigo-200 dark:hover:border-slate-600 shadow-sm p-1.5 rounded-lg transition-all" title="تحريك لأعلى">
                        <ArrowUp size={16} />
                    </button>
                    <button onClick={() => moveNode(node.id, 'down')} className="text-gray-500 hover:text-indigo-600 bg-white dark:bg-slate-800 border dark:border-slate-700 hover:border-indigo-200 dark:hover:border-slate-600 shadow-sm p-1.5 rounded-lg transition-all" title="تحريك لأسفل">
                        <ArrowDown size={16} />
                    </button>
                    <div className="w-px h-5 bg-gray-200 dark:bg-slate-700 mx-1"></div>

                    <button onClick={() => onCreateChild(node.id)} className="flex items-center gap-1 px-3 py-1.5 text-xs font-bold text-emerald-600 dark:text-emerald-400 hover:bg-emerald-50 dark:hover:bg-slate-700 rounded-lg transition-colors border border-transparent hover:border-emerald-100 dark:hover:border-slate-600 shadow-sm" title="إضافة فرع جديد">
                        <Plus size={14} /> عنصر متفرع
                    </button>
                    <div className="w-px h-5 bg-gray-200 dark:bg-slate-700 mx-1"></div>
                    <button onClick={() => onEdit(node.id)} className="text-blue-600 dark:text-blue-400 bg-white dark:bg-slate-800 shadow-sm border border-gray-100 dark:border-slate-700 hover:bg-blue-50 dark:hover:bg-slate-700 hover:border-blue-200 dark:hover:border-slate-600 p-2 rounded-lg transition-all" title="تعديل">
                        <Edit size={16} />
                    </button>
                    <button onClick={() => confirmDelete(node.id)} className="text-red-500 dark:text-red-400 bg-white dark:bg-slate-800 shadow-sm border border-gray-100 dark:border-slate-700 hover:bg-red-50 dark:hover:bg-slate-700 hover:border-red-200 dark:hover:border-slate-600 p-2 rounded-lg transition-all" title="حذف">
                        <Trash2 size={16} />
                    </button>
                </div>
            </div>
        );
    };

    const handleCanDrop = (treeArgs: NodeModel<MenuItemData>[], { dragSource, dropTargetId }: { dragSource?: NodeModel<MenuItemData>; dropTargetId: string | number }) => {
        if (dragSource?.id === dropTargetId) return false;

        const isDescendant = (nodeId: string | number, targetId: string | number): boolean => {
            if (targetId === 0 || targetId === '0') return false;
            if (nodeId === targetId) return true;
            const targetNode = treeArgs.find(n => n.id === targetId);
            if (!targetNode) return false;
            return isDescendant(nodeId, targetNode.parent);
        };

        return !isDescendant(dragSource?.id as string | number, dropTargetId);
    };

    return (
        <div className="flex flex-col gap-2 min-h-[250px] relative mt-4">
            {treeData.length === 0 ? (
                <div className="text-center text-gray-500 py-20 border-2 border-dashed border-gray-200 rounded-3xl bg-gray-50 flex flex-col items-center justify-center gap-4 transition-all hover:bg-gray-100">
                    <div className="w-16 h-16 bg-white rounded-2xl flex items-center justify-center shadow-sm border border-gray-100">
                        <Plus className="text-indigo-400" size={32} />
                    </div>
                    <div>
                        <h3 className="text-lg font-extrabold text-gray-800 mb-2">لا توجد عناصر حالياً</h3>
                        <p className="text-sm text-gray-500 max-w-sm mx-auto leading-relaxed">أضف عنصراً جديداً لبدء ترتيب وتكوين القائمة الخاصة بك. يمكنك سحب وإفلات العناصر لاحقاً لتغيير الترتيب.</p>
                    </div>
                </div>
            ) : (
                <DndProvider backend={MultiBackend} options={getBackendOptions()}>
                    <Tree
                        ref={treeRef}
                        tree={treeData}
                        rootId={0}
                        render={renderNode}
                        onDrop={handleDrop}
                        canDrop={handleCanDrop}
                        sort={false}
                        initialOpen={isExpandedAll}
                        classes={{
                            root: "h-auto py-2 list-none",
                            container: "min-h-[60px] list-none p-0 relative",
                            dropTarget: "bg-indigo-50 dark:bg-indigo-900/40 border-indigo-400 dark:border-indigo-500 border-dashed border-2 rounded-2xl my-2 shadow-inner transition-all",
                        }}
                    />
                </DndProvider>
            )}

            {deleteNodeId && (() => {
                const nodeToDelete = treeData.find(n => String(n.id) === String(deleteNodeId));
                const childrenCount = treeData.filter(n => String(n.parent) === String(deleteNodeId)).length;
                return (
                    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
                        <div className="absolute inset-0 bg-slate-900/40 backdrop-blur-sm transition-opacity" onClick={() => setDeleteNodeId(null)}></div>
                        <div className="relative bg-white dark:bg-slate-900 rounded-3xl shadow-2xl w-full max-w-md p-7 animate-in fade-in zoom-in-95 duration-200 border border-white/20 dark:border-slate-800 transition-colors">
                            <div className="w-12 h-12 rounded-full bg-red-50 dark:bg-red-500/10 flex items-center justify-center mb-5 border border-red-100 dark:border-red-500/20">
                                <Trash2 className="text-red-600 dark:text-red-400" size={24} />
                            </div>
                            <h2 className="text-xl font-black text-gray-900 dark:text-white mb-2">تأكيد حذف العنصر</h2>
                            <div className="text-gray-600 dark:text-slate-300 mb-6 font-medium leading-relaxed">
                                هل أنت متأكد من رغبتك في حذف <span className="font-bold text-indigo-700 dark:text-indigo-400">"{nodeToDelete?.text}"</span>؟
                                {childrenCount > 0 && (
                                    <div className="mt-4 p-4 bg-rose-50 dark:bg-rose-500/10 border border-rose-100 dark:border-rose-500/20 text-rose-800 dark:text-rose-400 rounded-2xl font-bold shadow-inner">
                                        ⚠️ تنبيه خطير: هذا العنصر يحتوي على {childrenCount} تفريعات. تأكيد الحذف سيؤدي أيضاً إلى تدمير كافة العناصر المتفرعة منه نهائياً!
                                    </div>
                                )}
                            </div>
                            <div className="flex gap-3 pt-2">
                                <button onClick={processDelete} className="flex-1 bg-red-600 text-white font-bold py-3.5 px-4 rounded-xl hover:bg-red-700 hover:shadow-lg hover:shadow-red-600/20 transition-all">نعم، احذف نهائياً</button>
                                <button onClick={() => setDeleteNodeId(null)} className="flex-1 bg-white dark:bg-slate-800 border border-gray-200 dark:border-slate-700 text-gray-700 dark:text-slate-300 font-bold py-3.5 px-4 rounded-xl hover:bg-gray-50 dark:hover:bg-slate-700 hover:text-gray-900 dark:hover:text-white transition-all shadow-sm">إلغاء الأمر</button>
                            </div>
                        </div>
                    </div>
                );
            })()}
        </div>
    );
};
