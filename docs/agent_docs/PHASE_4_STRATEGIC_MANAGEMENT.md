# Phase 4: Strategic Management Module Notes
*Date: March 24, 2026*

## Architectural Overview
Phase 4 ("الإدارة الاستراتيجية" / Strategic Management) introduces a 6-tier hierarchical architecture designed to track an organization's high-level strategy down to individual tasks. It strictly follows the headless CMS paradigm built on Directus and Refine.

**Core Entities (Directus Collections):**
1. `strategic_plans` (الخطط الاستراتيجية)
2. `strategic_objectives` (الأهداف الاستراتيجية) - M2O `plan_id`
3. `operational_objectives` (الأهداف التشغيلية) - M2O `strategic_objective_id`, `structure_id`
4. `kpis` (مؤشرات الأداء) - M2O `operational_objective_id`, `department_id`
5. `initiatives` (المبادرات) - M2O `kpi_id`
6. `implementation_mechanisms` (آليات التنفيذ) - M2O `initiative_id`, `personnel_id`

## Key Technical Implementations

### 1. Dynamic Relational Hydration (Axios Interception)
By default, `@refinedev/simple-rest` does not support Directus's `*.*` nested field querying structure. This caused `GenericList` tables to render raw IDs (e.g., `19` instead of an Employee name) for foreign keys.
**Solution:** Intercepted all GET requests in `src/providers/data-provider.ts` and appended `fields=*.*,*`. 
**Impact:** Directus now automatically populates and hydrates all relational references natively. `GenericList` in `src/app/[resource]/page.tsx` now successfully detects nested objects and renders their textual names instead of UUIDs.

### 2. Zero-Trust Security & Dynamic Schema Hook
**The Vulnerability:** Previously, the frontend Relational Selects and Table Grids relied on an Admin token hardcoded in `.env` as `NEXT_PUBLIC_DIRECTUS_TOKEN` to bypass permission errors for unregistered users. This is a critical security vulnerability.
**The Fix:** 
- The token was permanently removed from `.env`.
- We modified `src/hooks/use-directus-schema.ts` to dynamically fetch the ephemeral User Session Token (`localStorage.getItem("directus_token")`).
- If an agent or script encounters `403 Forbidden` errors while fetching the schema, it indicates the active web session has expired. The user must simply log out and back in via the frontend (Refine AuthProvider handles this transparently).

### 3. Strategic Hierarchical Dashboard
Located at `src/components/strategic-dashboard/dashboard-page.tsx`. This dynamically recursively maps the 6 tables to render a visual organization tree.
**UI Rule:** Do absolutely NOT use `h-screen`, `h-[calc(...)]`, or nested `overflow-y-auto` rules on root page layouts in Refine unless making a modal. The overall Next.js Layout component provides the scroll-window natively. Doing so causes clipped content and duplicate scrollbars.

### 4. Custom Date Picker Field
For creating standardized aesthetic inputs, standard HTML `<input type="date">` is forbidden due to inconsistent cross-browser rendering.
**Component:** We use `DatePickerField` (`src/components/generic/date-picker.tsx`) which wraps `react-datepicker` and perfectly matches the Tailwind stylistic requirements. It has been natively integrated into `GenericForm`.

## Deployment Scripts (DevOps)
`scripts/patch-translations-v2.js` is a Node.js seeder. Due to the Headless CMS architecture, translations and table names exist in the inner SQLite/PostgreSQL `directus_collections` metadata context, not the Source Code.
This script must be executed on the root VPS directly (`node scripts/patch-translations-v2.js`). It reads standard server credentials from `.env` dynamically, strictly looking for `DIRECTUS_ADMIN_TOKEN` securely, to overwrite/patch the translations onto production databases.
