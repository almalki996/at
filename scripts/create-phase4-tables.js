

const url = 'https://at-api.sofoit.pro';
const token = 'PTP51uuuMTgRn7WKrcNtiFEeyjkvKp12';
const headers = {
    'Authorization': `Bearer ${token}`,
    'Content-Type': 'application/json'
};

const collections = [
    {
        collection: "strategic_plans",
        meta: { icon: "flag", note: "الخطة الاستراتيجية الأساسية" },
        schema: { name: "strategic_plans" },
        fields: [
            { field: "id", type: "uuid", schema: { is_primary_key: true, has_auto_increment: false }, meta: { hidden: true, readonly: true } },
            { field: "vision", type: "text", meta: { interface: "input-multiline" } },
            { field: "mission", type: "text", meta: { interface: "input-multiline" } },
            { field: "values", type: "text", meta: { interface: "input-multiline" } },
            { field: "year", type: "string" },
            { field: "status", type: "string", meta: { interface: "select-dropdown", options: { choices: [{ text: "نشطة", value: "active" }, { text: "مسودة", value: "draft" }] } } }
        ]
    },
    {
        collection: "strategic_objectives",
        meta: { icon: "emoji_events", note: "الأهداف الاستراتيجية" },
        schema: { name: "strategic_objectives" },
        fields: [
            { field: "id", type: "uuid", schema: { is_primary_key: true }, meta: { hidden: true } },
            { field: "plan_id", type: "uuid", meta: { interface: "select-dropdown-m2o" } },
            { field: "name", type: "string" },
            { field: "weight", type: "integer" }
        ]
    },
    {
        collection: "operational_objectives",
        meta: { icon: "track_changes", note: "الأهداف التشغيلية" },
        schema: { name: "operational_objectives" },
        fields: [
            { field: "id", type: "uuid", schema: { is_primary_key: true }, meta: { hidden: true } },
            { field: "strategic_objective_id", type: "uuid", meta: { interface: "select-dropdown-m2o" } },
            { field: "name", type: "string" },
            { field: "weight", type: "integer" },
            { field: "structure_id", type: "integer", meta: { interface: "select-dropdown-m2o" } }
        ]
    },
    {
        collection: "kpis",
        meta: { icon: "speed", note: "مؤشرات الأداء" },
        schema: { name: "kpis" },
        fields: [
            { field: "id", type: "uuid", schema: { is_primary_key: true }, meta: { hidden: true } },
            { field: "operational_objective_id", type: "uuid", meta: { interface: "select-dropdown-m2o" } },
            { field: "name", type: "string" },
            { field: "weight", type: "integer" },
            { field: "target_value", type: "float" },
            { field: "department_id", type: "integer", meta: { interface: "select-dropdown-m2o" } }
        ]
    },
    {
        collection: "initiatives",
        meta: { icon: "lightbulb", note: "المبادرات" },
        schema: { name: "initiatives" },
        fields: [
            { field: "id", type: "uuid", schema: { is_primary_key: true }, meta: { hidden: true } },
            { field: "kpi_id", type: "uuid", meta: { interface: "select-dropdown-m2o" } },
            { field: "name", type: "string" },
            { field: "weight", type: "integer" }
        ]
    },
    {
        collection: "implementation_mechanisms",
        meta: { icon: "construction", note: "آليات التنفيذ" },
        schema: { name: "implementation_mechanisms" },
        fields: [
            { field: "id", type: "uuid", schema: { is_primary_key: true }, meta: { hidden: true } },
            { field: "initiative_id", type: "uuid", meta: { interface: "select-dropdown-m2o" } },
            { field: "name", type: "string" },
            { field: "start_date", type: "date" },
            { field: "end_date", type: "date" },
            { field: "personnel_id", type: "integer", meta: { interface: "select-dropdown-m2o" } }
        ]
    }
];

const relations = [
    { collection: "strategic_objectives", field: "plan_id", related_collection: "strategic_plans" },
    { collection: "operational_objectives", field: "strategic_objective_id", related_collection: "strategic_objectives" },
    { collection: "operational_objectives", field: "structure_id", related_collection: "Structures" },
    { collection: "kpis", field: "operational_objective_id", related_collection: "operational_objectives" },
    { collection: "kpis", field: "department_id", related_collection: "Departments" },
    { collection: "initiatives", field: "kpi_id", related_collection: "kpis" },
    { collection: "implementation_mechanisms", field: "initiative_id", related_collection: "initiatives" },
    { collection: "implementation_mechanisms", field: "personnel_id", related_collection: "Personnel" }
];

async function delay(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function run() {
    console.log("Starting to create collections...");

    // 1. Create collections and fields
    for (const c of collections) {
        console.log(`Creating collection: ${c.collection}`);
        const res = await fetch(`${url}/collections`, {
            method: 'POST',
            headers,
            body: JSON.stringify(c)
        });

        if (res.ok) {
            console.log(`  -> Created ${c.collection}`);
        } else {
            const err = await res.json();
            console.log(`  -> Error or already exists for ${c.collection}:`, JSON.stringify(err.errors[0]?.message || err));
        }
        await delay(500); // give it a little time
    }

    console.log("\nStarting to create relations...");
    // 2. Create relationships
    for (const r of relations) {
        console.log(`Creating relation: ${r.collection}.${r.field} -> ${r.related_collection}`);
        const res = await fetch(`${url}/relations`, {
            method: 'POST',
            headers,
            body: JSON.stringify(r)
        });

        if (res.ok) {
            console.log(`  -> Created relation for ${r.collection}.${r.field}`);
        } else {
            const err = await res.json();
            console.log(`  -> Error for relation ${r.collection}.${r.field}:`, err.errors?.[0]?.message || err);
        }
        await delay(300);
    }

    console.log("\nDone!");
}

run();
