require('dotenv').config({ path: '.env' });
const token = process.env.NEXT_PUBLIC_DIRECTUS_TOKEN;

async function updateTranslations(collection, field, translationStr) {
  const url = `http://127.0.0.1:3012/fields/${collection}/${field}`;
  const getRes = await fetch(url, { headers: { "Authorization": `Bearer ${token}` } });
  if (!getRes.ok) return;
  const data = await getRes.json();
  const meta = data.data.meta || {};
  let trans = meta.translations || [];
  
  if (!trans.some(t => t.language === 'ar-SA')) {
    trans.push({ language: 'ar-SA', translation: translationStr });
    await fetch(url, {
      method: 'PATCH',
      headers: { "Authorization": `Bearer ${token}`, "Content-Type": "application/json" },
      body: JSON.stringify({ meta: { translations: trans } })
    });
    console.log(`Updated ${collection}.${field} to ${translationStr}`);
  }
}

async function run() {
  const translations = [
    ['strategic_plans', 'vision', 'الرؤية الاستراتيجية'],
    ['strategic_plans', 'mission', 'رسالة المؤسسة'],
    ['strategic_plans', 'values', 'القيم'],
    ['strategic_plans', 'year', 'السنة'],
    ['strategic_plans', 'status', 'حالة الخطة'],
    
    ['strategic_objectives', 'plan_id', 'الخطة الاستراتيجية'],
    ['strategic_objectives', 'objective_name', 'الهدف الاستراتيجي'],
    ['strategic_objectives', 'description', 'الوصف'],
    ['strategic_objectives', 'weight', 'الوزن النسبي (%)'],
    
    ['operational_objectives', 'strategic_objective_id', 'الهدف الاستراتيجي'],
    ['operational_objectives', 'department_id', 'الجهة المسؤولة'],
    ['operational_objectives', 'objective_name', 'الهدف التشغيلي'],
    ['operational_objectives', 'description', 'الوصف'],
    ['operational_objectives', 'weight', 'الوزن النسبي (%)'],
    
    ['kpis', 'operational_objective_id', 'الهدف التشغيلي'],
    ['kpis', 'kpi_name', 'اسم المؤشر (KPI)'],
    ['kpis', 'description', 'وصف المؤشر'],
    ['kpis', 'target_value', 'القيمة المستهدفة'],
    ['kpis', 'unit', 'وحدة القياس'],
    ['kpis', 'weight', 'الوزن النسبي (%)'],
    ['kpis', 'polarity', 'القطبية (اتجاه المؤشر)'],
    
    ['initiatives', 'kpi_id', 'مؤشر الأداء المرتبط'],
    ['initiatives', 'department_id', 'الجهة المنفذة'],
    ['initiatives', 'initiative_name', 'اسم المبادرة'],
    ['initiatives', 'description', 'تفاصيل المبادرة'],
    ['initiatives', 'start_date', 'تاريخ البداية'],
    ['initiatives', 'end_date', 'تاريخ النهاية'],
    ['initiatives', 'budget', 'الميزانية المعتمدة'],
    ['initiatives', 'status', 'حالة المبادرة'],
    
    ['implementation_mechanisms', 'initiative_id', 'المبادرة المرتبطة'],
    ['implementation_mechanisms', 'mechanism_name', 'آلية التنفيذ / الإجراء'],
    ['implementation_mechanisms', 'description', 'الوصف المختصر'],
    ['implementation_mechanisms', 'timeline', 'الجدول الزمني للإجراء'],
    ['implementation_mechanisms', 'status', 'حالة الإجراء']
  ];

  for (const [col, fld, trans] of translations) {
    await updateTranslations(col, fld, trans);
  }
}
run();
