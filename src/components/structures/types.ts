export interface StructureNode {
    id: number | string;
    name: string;
    code: string;
    description?: string;
    is_active: boolean;
    sort_order: number;
    parent_id: string | number | null | { id: string | number };
    children: StructureNode[];
}
