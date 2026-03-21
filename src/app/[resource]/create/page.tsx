"use client";

import React, { use } from "react";
import { GenericForm } from "@/components/generic/generic-form";
import { useNavigation } from "@refinedev/core";

export default function GenericCreate({ params }: { params: Promise<{ resource: string }> }) {
    const { resource: resourceName } = use(params);

    return (
        <div className="w-full h-full">
            <GenericForm resource={resourceName} action="create" />
        </div>
    );
}
