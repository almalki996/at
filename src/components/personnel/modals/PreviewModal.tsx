import React, { useEffect, useState } from "react";
import { Eye, X, Loader2 } from "lucide-react";

interface PreviewModalProps {
    isOpen: boolean;
    onClose: () => void;
    previewUrl: string | null;
}

export const PreviewModal: React.FC<PreviewModalProps> = ({ isOpen, onClose, previewUrl }) => {
    const [fileType, setFileType] = useState<string | null>(null);
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        let isMounted = true;
        const fetchFileMeta = async () => {
            if (!previewUrl) return;
            // extract file ID from URL, format: .../assets/{id}?access_token=...
            const match = previewUrl.match(/assets\/([a-zA-Z0-9-]+)/);
            if (match && match[1]) {
                setFileType(null);
                setLoading(true);
                try {
                    const baseUrl = process.env.NEXT_PUBLIC_DIRECTUS_URL?.replace('/items', '');
                    const token = process.env.NEXT_PUBLIC_DIRECTUS_TOKEN;
                    const res = await fetch(`${baseUrl}/files/${match[1]}`, {
                        headers: { 'Authorization': `Bearer ${token}` }
                    });
                    const d = await res.json();
                    if (isMounted) setFileType(d?.data?.type || null);
                } catch {
                    if (isMounted) setFileType(null);
                }
                if (isMounted) setLoading(false);
            }
        };

        if (isOpen) {
            fetchFileMeta();
        }
        
        return () => {
            isMounted = false;
        };
    }, [isOpen, previewUrl]);

    if (!isOpen || !previewUrl) return null;

    const isImage = fileType?.startsWith("image/");

    return (
        <div 
            className="fixed inset-0 z-[200] flex items-center justify-center p-4 bg-slate-900/90 backdrop-blur-md animate-in fade-in duration-200"
            onClick={(e) => {
                if (e.target === e.currentTarget) {
                    onClose();
                }
            }}
        >
            <div className="bg-slate-900 rounded-2xl shadow-2xl w-full max-w-5xl flex flex-col h-[90vh] overflow-hidden border border-slate-700 animate-in zoom-in-95 duration-200">
                <div className="px-6 py-4 bg-slate-800 flex items-center justify-between shrink-0 border-b border-slate-700">
                    <h3 className="text-lg font-bold text-white flex items-center gap-2">
                        <Eye size={20} className="text-indigo-400" />
                        استعراض المرفق
                    </h3>
                    <div className="flex items-center gap-2">
                        <a 
                            href={previewUrl} 
                            target="_blank" 
                            rel="noopener noreferrer"
                            className="px-4 py-2 text-slate-300 hover:text-white hover:bg-slate-700 rounded-lg transition-colors flex items-center gap-2 text-sm font-medium"
                            title="فتح المرفق في نافذة جديدة"
                        >
                            فتح في نافذة جديدة
                        </a>
                        <button 
                            type="button"
                            onClick={onClose} 
                            className="p-2 text-slate-400 hover:text-rose-400 hover:bg-slate-700 rounded-lg transition-colors"
                        >
                            <X size={20} />
                        </button>
                    </div>
                </div>
                <div className="flex-1 bg-slate-900/50 relative overflow-hidden flex items-center justify-center p-0">
                    {loading ? (
                        <div className="flex flex-col items-center justify-center text-slate-400 gap-4">
                            <Loader2 size={32} className="animate-spin text-indigo-500" />
                            <span>جاري جلب الملف...</span>
                        </div>
                    ) : isImage ? (
                        <div className="w-full h-full bg-slate-800/50 flex items-center justify-center p-4">
                            {/* eslint-disable-next-line @next/next/no-img-element */}
                            <img 
                                src={previewUrl} 
                                alt="مرفق" 
                                className="max-w-full max-h-full object-contain rounded-xl shadow-lg"
                            />
                        </div>
                    ) : (
                        <iframe 
                            src={previewUrl} 
                            className="w-full h-full border-0 bg-white rounded-b-2xl"
                            title="عرض المرفق"
                        />
                    )}
                </div>
            </div>
        </div>
    );
};
