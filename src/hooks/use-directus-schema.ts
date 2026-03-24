import { useState, useEffect } from "react";
import axios from "axios";

export interface DirectusField {
    field: string;
    type: string;
    schema: {
        is_primary_key: boolean;
        has_auto_increment: boolean;
        is_nullable: boolean;
        default_value: unknown;
        max_length: number | null;
        foreign_key_column: string | null;
        foreign_key_table: string | null;
    } | null;
    meta: {
        hidden: boolean;
        interface: string;
        options: Record<string, unknown> | null;
        display: string | null;
        display_options: Record<string, unknown> | null;
        readonly: boolean;
        required: boolean;
        sort: number;
        translations: Record<string, unknown>[] | null;
    } | null;
    relation?: {
        related_collection: string;
    } | null;
}

export const getTranslation = (
    translations: Record<string, unknown>[] | null | undefined,
    fallback: string,
    locale: string = "ar-SA",
    secondaryLocale: string = "ar"
): string => {
    if (!translations || !Array.isArray(translations) || translations.length === 0) return fallback;
    
    // Attempt primary locale match
    const primaryMatch = translations.find((t: Record<string, unknown>) => t.language === locale);
    if (primaryMatch?.translation) return String(primaryMatch.translation);
    
    // Attempt secondary loose locale
    const secondaryMatch = translations.find((t: Record<string, unknown>) => t.language === secondaryLocale || String(t.language).startsWith(secondaryLocale));
    if (secondaryMatch?.translation) return String(secondaryMatch.translation);
    
    // Fallback to first available translation
    const firstTranslation = translations[0]?.translation;
    return firstTranslation ? String(firstTranslation) : fallback;
};

export interface DirectusCollectionMeta {
    translations?: Record<string, unknown>[] | null;
    [key: string]: unknown;
}

export const useDirectusSchema = (collection: string) => {
    const [fields, setFields] = useState<DirectusField[]>([]);
    const [collectionMeta, setCollectionMeta] = useState<DirectusCollectionMeta | null>(null);
    const [isLoading, setIsLoading] = useState(true);
    const [error, setError] = useState<Error | null>(null);

    useEffect(() => {
        if (!collection) {
            setIsLoading(false);
            return;
        }

        const fetchSchema = async () => {
            setIsLoading(true);
            try {
                const sessionToken = typeof window !== "undefined" ? localStorage.getItem("directus_token") : null;
                const token = sessionToken || process.env.NEXT_PUBLIC_DIRECTUS_TOKEN;
                const baseUrl = (process.env.NEXT_PUBLIC_DIRECTUS_URL || "http://127.0.0.1:8055").replace(/\/items\/?$/, '').replace(/\/$/, '');
                const [fieldsRes, collectionRes, relationsRes] = await Promise.all([
                    axios.get(`${baseUrl}/fields/${collection}`, {
                        headers: token ? { Authorization: `Bearer ${token}` } : {}
                    }),
                    axios.get(`${baseUrl}/collections/${collection}`, {
                        headers: token ? { Authorization: `Bearer ${token}` } : {}
                    }).catch(() => null),
                    axios.get(`${baseUrl}/relations/${collection}`, {
                        headers: token ? { Authorization: `Bearer ${token}` } : {}
                    }).catch(() => null)
                ]);
                
                if (collectionRes?.data?.data?.meta) {
                    setCollectionMeta(collectionRes.data.data.meta);
                }

                const relationsMap = new Map<string, string>();
                if (relationsRes?.data?.data) {
                    relationsRes.data.data.forEach((rel: any) => {
                        if (rel.collection === collection && rel.related_collection) {
                            relationsMap.set(rel.field, rel.related_collection);
                        }
                    });
                }

                if (fieldsRes.data?.data) {
                    // Filter out internal system fields and sort by defined 'sort' order
                    const visibleFields = (fieldsRes.data.data as DirectusField[]).filter(f => {
                        // Always include primary key tracking
                        if (f.schema?.is_primary_key) return true;
                        
                        // Hide fields explicitly disabled from UI forms by Directus Admin
                        if (f.meta?.hidden) return false;
                        
                        // Exclude native system footprint columns (Audit trail)
                        const blockList = ["sort", "user_created", "date_created", "user_updated", "date_updated"];
                        if (blockList.includes(f.field)) return false;
                        
                        return true;
                    });
                    
                    // Attach relation if exists
                    const fieldsWithRelations = visibleFields.map(f => {
                        const relatedCollection = relationsMap.get(f.field);
                        if (relatedCollection) {
                            return { ...f, relation: { related_collection: relatedCollection } };
                        }
                        return f;
                    });
                    
                    // Sort using Directus logical explicit integer increments. Un-sorted fields push to bottom.
                    fieldsWithRelations.sort((a, b) => (a.meta?.sort ?? 999) - (b.meta?.sort ?? 999));
                    setFields(fieldsWithRelations);
                }
            } catch (err) {
                console.error(`Failed to fetch generic schema fields for collection [${collection}]:`, err);
                setError(err as Error);
            } finally {
                setIsLoading(false);
            }
        };

        fetchSchema();
    }, [collection]);

    return { fields, collectionMeta, isLoading, error };
};
