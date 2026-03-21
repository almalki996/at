import React, { useRef, useState } from "react";
import { StructureNode } from "../types";

const OrgChartNode = ({ node }: { node: StructureNode }) => {
    const hasChildren = node.children && node.children.length > 0;
    
    return (
        <div className="flex flex-col items-center relative">
            {/* The line coming down from parent (already handled by parent's map loop, but we need the box) */}
            
            {/* The node card */}
            <div className={`relative flex flex-col items-center justify-center px-4 py-3 min-w-[150px] max-w-[220px] min-h-[70px] border-2 rounded-2xl text-center shadow-sm z-10 transition-all hover:-translate-y-1 hover:shadow-md 
                ${node.is_active 
                    ? 'bg-white dark:bg-slate-900 border-indigo-200 dark:border-indigo-900/60' 
                    : 'bg-gray-50 dark:bg-slate-800/50 border-gray-200 dark:border-slate-800 opacity-80'}`}>
                
                <span className="font-black text-gray-800 dark:text-white text-sm leading-snug break-words w-full">{node.name || 'بدون اسم'}</span>
                
                <div className="flex items-center gap-2 mt-2">
                    <span className="text-[10px] font-mono font-bold text-gray-500 bg-gray-100 dark:bg-slate-800 px-2 py-0.5 rounded-md border border-gray-200 dark:border-slate-700">
                        {node.code || 'N/A'}
                    </span>
                    {!node.is_active && (
                        <span className="text-[10px] font-bold bg-rose-100 dark:bg-rose-900/30 text-rose-600 dark:text-rose-400 px-2 py-0.5 rounded-md">
                            موقوف
                        </span>
                    )}
                </div>
            </div>

            {hasChildren && (
                <>
                    {/* The line going down from this node */}
                    <div className="w-px h-8 bg-gray-300 dark:bg-slate-700"></div>
                    
                    {/* The children container with top horizontal line connecting them */}
                    <div className="flex justify-center relative">
                        {node.children.map((child: StructureNode, index: number) => {
                            const isFirst = index === 0;
                            const isLast = index === node.children.length - 1;
                            const isOnly = isFirst && isLast;
                            
                            return (
                                <div key={child.id} className="relative flex flex-col items-center px-1 sm:px-3">
                                    {/* Horizontal line segments */}
                                    {!isOnly && (
                                        <div className="absolute top-0 w-full h-px flex">
                                            <div className={`h-px w-1/2 ${isFirst ? 'bg-transparent' : 'bg-gray-300 dark:bg-slate-700'}`}></div>
                                            <div className={`h-px w-1/2 ${isLast ? 'bg-transparent' : 'bg-gray-300 dark:bg-slate-700'}`}></div>
                                        </div>
                                    )}
                                    {/* Vertical line dropping to child */}
                                    <div className="w-px h-8 bg-gray-300 dark:bg-slate-700"></div>
                                    
                                    <OrgChartNode node={child} />
                                </div>
                            );
                        })}
                    </div>
                </>
            )}
        </div>
    );
};

export const OrgChartView = ({ tree }: { tree: StructureNode[] }) => {
    const scrollRef = useRef<HTMLDivElement>(null);
    const [isDragging, setIsDragging] = useState(false);
    const [startX, setStartX] = useState(0);
    const [startY, setStartY] = useState(0);
    const [scrollLeft, setScrollLeft] = useState(0);
    const [scrollTop, setScrollTop] = useState(0);

    const handleMouseDown = (e: React.MouseEvent) => {
        if (!scrollRef.current) return;
        setIsDragging(true);
        setStartX(e.pageX - scrollRef.current.offsetLeft);
        setStartY(e.pageY - scrollRef.current.offsetTop);
        setScrollLeft(scrollRef.current.scrollLeft);
        setScrollTop(scrollRef.current.scrollTop);
    };

    const handleMouseLeave = () => {
        setIsDragging(false);
    };

    const handleMouseUp = () => {
        setIsDragging(false);
    };

    const handleMouseMove = (e: React.MouseEvent) => {
        if (!isDragging || !scrollRef.current) return;
        e.preventDefault();
        const x = e.pageX - scrollRef.current.offsetLeft;
        const y = e.pageY - scrollRef.current.offsetTop;
        const walkX = (x - startX) * 1.5; 
        const walkY = (y - startY) * 1.5;
        scrollRef.current.scrollLeft = scrollLeft - walkX;
        scrollRef.current.scrollTop = scrollTop - walkY;
    };

    if (!tree || tree.length === 0) {
        return (
            <div className="flex justify-center flex-col items-center h-full text-gray-400">
                <span className="font-bold text-lg text-gray-500">لا يوجد هيكل لعرضه</span>
            </div>
        );
    }

    return (
        <div 
            ref={scrollRef}
            onMouseDown={handleMouseDown}
            onMouseLeave={handleMouseLeave}
            onMouseUp={handleMouseUp}
            onMouseMove={handleMouseMove}
            className={`w-full h-full overflow-auto custom-scrollbar bg-slate-50/50 dark:bg-slate-950/20 rounded-xl p-8 rtl ${isDragging ? 'cursor-grabbing select-none' : 'cursor-grab'}`}
        >
            <div className="min-w-max flex justify-center gap-10">
                {tree.map(rootNode => (
                    <OrgChartNode key={rootNode.id} node={rootNode} />
                ))}
            </div>
        </div>
    );
};
