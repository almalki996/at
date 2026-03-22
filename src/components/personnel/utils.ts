export const uploadFile = async (file: File): Promise<string> => {
    const baseUrl = process.env.NEXT_PUBLIC_DIRECTUS_URL?.replace('/items', '');
    let token = process.env.NEXT_PUBLIC_DIRECTUS_TOKEN;
    if (typeof window !== "undefined") {
        token = localStorage.getItem("directus_token") || token;
    }
    
    const form = new FormData();
    form.append('file', file);
    
    const res = await fetch(`${baseUrl}/files`, {
        method: 'POST',
        headers: {
            'Authorization': `Bearer ${token}`
        },
        body: form
    });
    
    if (!res.ok) {
        let errMessage = "File upload failed";
        try {
            const errorData = await res.json();
            errMessage = errorData?.errors?.[0]?.message || errMessage;
        } catch(e) {}
        throw new Error(errMessage);
    }
    
    const data = await res.json();
    if (data?.data?.id) return data.data.id;
    throw new Error("File upload failed");
};

export const getPreviewUrl = (fileId: string | object | null | undefined): string | null => {
    if (!fileId) return null;
    const id = typeof fileId === 'object' ? (fileId as any)?.id : fileId;
    if (!id) return null;
    return `${process.env.NEXT_PUBLIC_DIRECTUS_URL?.replace('/items', '')}/assets/${id}?access_token=${process.env.NEXT_PUBLIC_DIRECTUS_TOKEN}`;
};
