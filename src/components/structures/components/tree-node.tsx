import React from "react";
import { ChevronDown, ChevronLeft, Plus, Edit, Trash2, ArrowUp, ArrowDown } from "lucide-react";
import { StructureNode } from "../types";

export interface TreeNodeProps {
    node: StructureNode;
    level?: number;
    onEdit: (node: Partial<StructureNode>) => void;
    onDelete: (node: StructureNode) => void;
    expandedKeys: (string | number)[];
    toggleExpand: (id: string | number) => void;
    selectedKey: string | number | null;
    setSelectedKey: (id: string | number) => void;
    onToggleActive: (node: StructureNode) => void;
    onMove: (node: StructureNode, direction: number) => void;
    isFirstChild: boolean;
    isLastChild: boolean;
    selectedIds: Set<string | number>;
    onCheck: (checked: boolean, id: string | number) => void;
}

export const TreeNode = ({ 
    node, 
    level = 0, 
    onEdit, 
    onDelete, 
    expandedKeys, 
    toggleExpand,
    selectedKey,
    setSelectedKey,
    onToggleActive,
    onMove,
    isFirstChild,
    isLastChild,
    selectedIds,
    onCheck
}: TreeNodeProps) => {
    const isExpanded = expandedKeys.includes(node.id);
    const isSelected = selectedKey === node.id;
    const hasChildren = node.children && node.children.length > 0;
    const checked = selectedIds.has(node.id) || selectedIds.has(String(node.id)) || selectedIds.has(Number(node.id));

    return (
        <div className="select-none">
            <div 
                className={`flex items-center gap-2 py-2 px-3 rounded-lg transition-colors cursor-pointer mb-1 ${
                    isSelected ? 'bg-indigo-100 dark:bg-indigo-900/30 ring-1 ring-indigo-400 dark:ring-indigo-600' 
                    : 'hover:bg-gray-50 dark:hover:bg-slate-800/50'
                }`}
                style={{ paddingRight: `${level * 1.5 + 0.5}rem` }}
                onClick={(e) => {
                    e.stopPropagation();
                    setSelectedKey(node.id);
                }}
            >
                <div 
                    className="flex justify-center items-center w-6 h-6 ml-2 cursor-pointer"
                    onClick={(e) => {
                        e.stopPropagation();
                        onCheck(!checked, node.id);
                    }}
                >
                    <input 
                        type="checkbox" 
                        checked={checked} 
                        readOnly
                        className="w-5 h-5 text-indigo-600 bg-white border-gray-300 rounded focus:ring-indigo-500 dark:focus:ring-indigo-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600 cursor-pointer"
                    />
                </div>

                <div 
                    className="flex justify-center items-center w-6 h-6 ml-1"
                    onClick={(e) => {
                        e.stopPropagation();
                        if (hasChildren) toggleExpand(node.id);
                    }}
                >
                    {hasChildren ? (
                        isExpanded ? (
                            <ChevronDown size={20} className="text-gray-500 dark:text-gray-400 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors" />
                        ) : (
                            <ChevronLeft size={20} className="text-gray-500 dark:text-gray-400 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors" />
                        )
                    ) : (
                        <div className="w-1.5 h-1.5 rounded-full bg-gray-300 dark:bg-gray-600 border border-gray-400"></div>
                    )}
                </div>

                <span className="font-bold text-gray-800 dark:text-gray-200 text-base">
                    {node.name || `بدون اسم (كود: ${node.code || '-'})`}
                </span>
                
                <span className="text-xs font-mono font-bold bg-gray-100 dark:bg-slate-800 text-gray-500 dark:text-gray-400 px-2 py-0.5 rounded mr-2 border border-gray-200 dark:border-slate-700">
                    {node.code || 'N/A'}
                </span>

                {!node.is_active && (
                    <span className="text-[11px] font-bold bg-rose-100 dark:bg-rose-900/30 text-rose-600 dark:text-rose-400 px-2.5 py-1 rounded-full mr-2 border border-rose-200 dark:border-rose-900/50">
                        غير مفعل
                    </span>
                )}

                {/* Actions */}
                <div className="flex gap-1.5 mr-auto pr-4">
                    {isSelected && (
                        <>
                            <button 
                                onClick={(e) => { e.stopPropagation(); onMove(node, -1); }}
                                disabled={isFirstChild}
                                className="p-2 text-orange-600 dark:text-orange-400 bg-orange-50 dark:bg-orange-900/40 rounded-lg hover:bg-orange-100 dark:hover:bg-orange-800/60 transition-colors disabled:opacity-30 disabled:cursor-not-allowed border border-transparent dark:border-orange-900/50"
                                title="تحريك للأعلى"
                            >
                                <ArrowUp size={16} />
                            </button>
                            <button 
                                onClick={(e) => { e.stopPropagation(); onMove(node, 1); }}
                                disabled={isLastChild}
                                className="p-2 text-orange-600 dark:text-orange-400 bg-orange-50 dark:bg-orange-900/40 rounded-lg hover:bg-orange-100 dark:hover:bg-orange-800/60 transition-colors disabled:opacity-30 disabled:cursor-not-allowed border border-transparent dark:border-orange-900/50"
                                title="تحريك للأسفل"
                            >
                                <ArrowDown size={16} />
                            </button>
                            <button 
                                onClick={(e) => { e.stopPropagation(); onToggleActive(node); }}
                                className={`w-11 h-6 rounded-full transition-colors relative flex items-center shrink-0 border border-transparent outline-none ${node.is_active ? 'bg-indigo-500 hover:bg-indigo-600 dark:border-indigo-500/50' : 'bg-gray-300 dark:bg-slate-700 hover:bg-gray-400 dark:hover:bg-slate-600 dark:border-slate-600'}`}
                                title={node.is_active ? "إلغاء التفعيل" : "تفعيل"}
                            >
                                <div className={`shadow-sm w-4 h-4 bg-white rounded-full absolute transition-all ${node.is_active ? 'right-6' : 'right-1'}`}></div>
                            </button>

                            <div className="w-px h-8 bg-gray-200 dark:bg-slate-700 mx-1"></div>

                            <button 
                                onClick={(e) => { e.stopPropagation(); onEdit(node); }}
                                className="p-2 text-blue-600 dark:text-blue-400 bg-blue-50 dark:bg-blue-900/40 rounded-lg hover:bg-blue-100 dark:hover:bg-blue-800/60 transition-colors border border-transparent dark:border-blue-900/50"
                                title="تعديل هذا القسم"
                            >
                                <Edit size={16} />
                            </button>
                            <button 
                                onClick={(e) => { e.stopPropagation(); onDelete(node); }}
                                className="p-2 text-red-600 dark:text-red-400 bg-red-50 dark:bg-red-900/40 rounded-lg hover:bg-red-100 dark:hover:bg-red-800/60 transition-colors border border-transparent dark:border-red-900/50"
                                title="حذف هذا القسم"
                            >
                                <Trash2 size={16} />
                            </button>
                            <button 
                                onClick={(e) => { e.stopPropagation(); onEdit({ parent_id: node.id }); }} // Add Child
                                className="p-2 text-emerald-600 dark:text-emerald-400 bg-emerald-50 dark:bg-emerald-900/40 rounded-lg hover:bg-emerald-100 dark:hover:bg-emerald-800/60 transition-colors border border-transparent dark:border-emerald-900/50"
                                title="إضافة قسم فرعي"
                            >
                                <Plus size={16} />
                            </button>
                        </>
                    )}
                </div>
            </div>

            {hasChildren && isExpanded && (
                <div className="flex flex-col border-r-2 border-indigo-100 dark:border-slate-800/80 mr-[1.35rem] pr-1 mt-1 transition-all">
                    {node.children.map((child: StructureNode, index: number) => (
                        <TreeNode 
                            key={child.id} 
                            node={child} 
                            level={level + 1} 
                            onEdit={onEdit}
                            onDelete={onDelete}
                            onToggleActive={onToggleActive}
                            onMove={onMove}
                            expandedKeys={expandedKeys}
                            toggleExpand={toggleExpand}
                            selectedKey={selectedKey}
                            setSelectedKey={setSelectedKey}
                            isFirstChild={index === 0}
                            isLastChild={index === node.children.length - 1}
                            selectedIds={selectedIds}
                            onCheck={onCheck}
                        />
                    ))}
                </div>
            )}
        </div>
    );
};
