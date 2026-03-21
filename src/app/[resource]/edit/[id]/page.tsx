"use client";

import React, { use } from "react";
import { GenericForm } from "@/components/generic/generic-form";
import { useNavigation } from "@refinedev/core";

export default function GenericEdit({ params }: { params: Promise<{ resource: string, id: string }> }) {
    const { resource: resourceName, id } = use(params);

    return (
        <div className="w-full h-full">
            <GenericForm resource={resourceName} action="edit" id={id} />
        </div>
    );
}
