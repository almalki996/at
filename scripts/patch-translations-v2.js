const axios = require('axios');

async function patchTranslations() {
  const token = "strategic_plans_super_secure_admin_token";
  const url = "http://127.0.0.1:3012";
  const api = axios.create({
    baseURL: url,
    headers: { Authorization: `Bearer ${token}` }
  });

  const collections = [
    { name: 'strategic_plans', title: 'الخطط الاستراتيجية', icon: 'flag' },
    { name: 'strategic_objectives', title: 'الأهداف الاستراتيجية', icon: 'track_changes' },
    { name: 'operational_objectives', title: 'الأهداف التشغيلية', icon: 'trending_up' },
    { name: 'kpis', title: 'مؤشرات الأداء', icon: 'speed' },
    { name: 'initiatives', title: 'المبادرات', icon: 'lightbulb' },
    { name: 'implementation_mechanisms', title: 'آليات التنفيذ', icon: 'build' }
  ];

  console.log("Patching Collection Metadata...");
  for (const c of collections) {
    try {
      await api.patch(`/collections/${c.name}`, {
        meta: {
          icon: c.icon,
          translations: [
            { language: "en-US", translation: c.name.replace(/_/g, ' ') },
            { language: "ar-SA", translation: c.title }
          ]
        }
      });
      console.log(`✅ Collection ${c.name} metadata updated.`);
    } catch (e) {
      console.log(`❌ Failed collection ${c.name}:`, e.response?.data || e.message);
    }
  }

  const fieldsMap = [
    // Plans
    { col: 'strategic_plans', field: 'vision', ar: 'الرؤية الاستراتيجية' },
    { col: 'strategic_plans', field: 'mission', ar: 'رسالة المؤسسة' },
    { col: 'strategic_plans', field: 'values', ar: 'القيم' },
    { col: 'strategic_plans', field: 'year', ar: 'السنة' },
    { col: 'strategic_plans', field: 'status', ar: 'حالة الخطة' },

    // Strat Obj
    { col: 'strategic_objectives', field: 'name', ar: 'الهدف الاستراتيجي' },
    { col: 'strategic_objectives', field: 'plan_id', ar: 'الخطة الاستراتيجية' },
    { col: 'strategic_objectives', field: 'weight', ar: 'الوزن النسبي (%)' },

    // Op Obj
    { col: 'operational_objectives', field: 'name', ar: 'الهدف التشغيلي' },
    { col: 'operational_objectives', field: 'strategic_objective_id', ar: 'الهدف الاستراتيجي المرجعي' },
    { col: 'operational_objectives', field: 'weight', ar: 'الوزن النسبي (%)' },
    { col: 'operational_objectives', field: 'structure_id', ar: 'الإدارة المسؤولة' },

    // KPIs
    { col: 'kpis', field: 'name', ar: 'اسم المؤشر' },
    { col: 'kpis', field: 'operational_objective_id', ar: 'الهدف التشغيلي المرجعي' },
    { col: 'kpis', field: 'weight', ar: 'الوزن النسبي (%)' },
    { col: 'kpis', field: 'target_value', ar: 'القيمة المستهدفة (%)' },
    { col: 'kpis', field: 'department_id', ar: 'القسم أو الإدارة المباشرة' },

    // Initiatives
    { col: 'initiatives', field: 'name', ar: 'اسم المبادرة' },
    { col: 'initiatives', field: 'kpi_id', ar: 'مؤشر الأداء المرتبط' },
    { col: 'initiatives', field: 'weight', ar: 'الوزن النسبي (%)' },

    // Mechanisms
    { col: 'implementation_mechanisms', field: 'name', ar: 'طريقة التنفيذ / الآلية' },
    { col: 'implementation_mechanisms', field: 'initiative_id', ar: 'المبادرة المرتبطة' },
    { col: 'implementation_mechanisms', field: 'personnel_id', ar: 'الموظف المسؤول' },
    { col: 'implementation_mechanisms', field: 'start_date', ar: 'تاريخ بداية التنفيذ' },
    { col: 'implementation_mechanisms', field: 'end_date', ar: 'تاريخ نهاية التنفيذ' }
  ];

  console.log("\nPatching Fields Metadata...");
  for (const f of fieldsMap) {
    try {
      await api.patch(`/fields/${f.col}/${f.field}`, {
        meta: {
          translations: [
            { language: "en-US", translation: f.field.replace(/_/g, ' ') },
            { language: "ar-SA", translation: f.ar }
          ]
        }
      });
      console.log(`✅ Field ${f.col}.${f.field} metadata updated to: ${f.ar}`);
    } catch (e) {
      console.log(`❌ Failed field ${f.col}.${f.field}:`, e.response?.data?.errors || e.message);
    }
  }

  console.log("✅ Translation patch v2 complete!");
}

patchTranslations().catch(console.error);
