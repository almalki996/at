# الخطة التنفيذية للمرحلة الرابعة (الإدارة الاستراتيجية - Strategic Cascade)

بناءً على المعمارية المعتمدة للمشروع (نظام أداء - Headless CMS & Refine)، هذه هي المعمارية الجوهرية للمرحلة الرابعة:

## 1. الهيكلة الاستراتيجية المطلوبة
النظام ليس مجرد شاشة KPI، بل هو تسلسل هرمي لبطاقات الأداء المتوازنة (Strategic Cascade):
1. **الخطة الاستراتيجية الأساسية (Strategic Plan):** (الرؤية، الرسالة، القيم).
2. **الأهداف الاستراتيجية (Strategic Objectives):** لها وزن نسبي (يجب أن يكون مجموع الأوزان = 100%).
3. **الأهداف التشغيلية (Operational Objectives):** تتفرع من الاستراتيجية ولها نسبة مئوية.
4. **مؤشرات الأداء (KPIs):** تتفرع من التشغيلية ولها نسبة مئوية.
5. **المبادرات (Initiatives):** تتفرع من المؤشرات ولها نسبة مئوية.
6. **آليات التنفيذ (Implementation Mechanisms):** مهام تتفرع من المبادرات، وتنفذ في زمن محدد.

## 2. الجداول وقاعدة البيانات (ERD) في Directus
يجب على Agent إنشاء (أو طلب المستخدم إنشاء) الجداول الستة التالية:
1. `strategic_plans` (id, vision, mission, values, year, status).
2. `strategic_objectives` (id, plan_id, name, weight).
3. `operational_objectives` (id, strategic_objective_id, name, weight, **structure_id** [ارتباط بالقسم]).
4. `kpis` (id, operational_objective_id, name, weight, target_value, **department_id** [ارتباط بالشاغر]).
5. `initiatives` (id, kpi_id, name, weight).
6. `implementation_mechanisms` (id, initiative_id, name, start_date, end_date, **personnel_id** [الموظف المكلف]).

## 3. ملاحظة هندسية للـ Agent القادم
المرحلة السابقة (الثالثة) تم فيها ربط الموظف (`Personnel`) بشاغره الوظيفي (`department_id` -> vacancy_id) وتم أتمتة إشغال الشاغر.
لذلك، عندما نقوم بتقييم الموظف بناءً على **آليات التنفيذ** الموكلة إليه، سيتصل هذا التقييم بناءً على شاغره بالـ KPIs، ومن ثم الأهداف التشغيلية للقسم (`structures`)، وصولاً للهدف الاستراتيجي.
