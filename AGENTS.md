<!-- BEGIN:nextjs-agent-rules -->
# This is NOT the Next.js you know

This version has breaking changes — APIs, conventions, and file structure may all differ from your training data. Read the relevant guide in `node_modules/next/dist/docs/` before writing any code. Heed deprecation notices.
<!-- END:nextjs-agent-rules -->

# STRICT ARCHITECTURAL RULES FOR ALL AI AGENTS
**CRITICAL - DO NOT IGNORE**
This project uses a Headless CMS approach (Directus + Refine.dev). The ultimate goal of this project is to allow the USER to build and link pages dynamically strictly by configuring tables in Directus without writing manual UI code for standard CRUD operations.

1. **DYNAMIC ENGINE FIRST**: ALWAYS rely on `src/app/[resource]/page.tsx` and `src/components/generic/generic-form.tsx` for new pages. DO NOT create hardcoded custom pages for tables unless highly specialized visual interactions that CANNOT be achieved dynamically are explicitly requested.
2. **NO MANUAL FETCH**: DO NOT use native `fetch()` calls or manual Axios queries for data mutation or fetching unless dealing with an unsupported edge case. You MUST use `@refinedev/core` hooks (e.g., `useList`, `useCreate`, `useUpdate`, `useDelete`).
3. **IMPROVE THE ENGINE, DON'T BYPASS IT**: If the dynamic generic components lack a feature (e.g., specific file uploading logic, complex relations M2O/O2M dropdowns), **ENHANCE `GenericForm` and `useDirectusSchema`**. Do not create custom modals just to bypass the lack of functionality in the generic engine.
4. **COMPONENT REUSABILITY**: Keep UI components small. If a complex page needs to be created, DO NOT put all modal logic in one 800+ line file. Split them into `/hooks`, `/modals`, `/utils` components inside that specific feature folder.
5. **REACT RULES**: Do not call `setState()` directly synchronously inside `useEffect()` (cascading renders).
6. **AUTHENTICATION & SECURITY**: Authentication is handled via Refine's AuthProvider (`providers/auth-provider.ts`) which manages JWT tokens via Directus (persisted in localStorage). Route protection is explicitly handled using `<Authenticated>` wrappers in Layouts. Do not implement custom route guards or middleware for standard protected resources.
7. **VPS & ATTACHMENTS**: When users upload large files, expect NGINX to block payloads >1MB on VPS deployments by default, resulting in a "Failed to fetch" CORS-like error. Direct the user to set `client_max_body_size 100M;` in their Nginx configuration.
8. **UI CONSISTENCY**: Features like the floating bulk-actions bottom bar (`fixed bottom-10`) and Column Visibility toggles (`visibleColumns` state) should be implemented consistently across all complex data tables (Employees, Departments, Designations) to maintain a cohesive user experience mirroring the Personnel module.
9. **PRINTING & EXPORT**: Use `react-to-print` library for complex printing tasks (like tables and calendars). To prevent printing cutoff bugs in Tailwind, always override scrolling containers during print using `print:overflow-visible print:h-auto print:static`.
10. **ALERTS & CONFIRMATIONS**: NEVER use native `window.confirm` or `window.alert`. Always use custom Tailwind modal overlays (`z-[9999] bg-black/40 backdrop-blur-sm`) to maintain UI consistency for destructive actions.
11. **DATES & HIJRI**: Use native JS `Intl.DateTimeFormat('ar-SA-u-ca-islamic')` for Hijri dates instead of heavy external libraries. Standard date math should be handled by `date-fns`.
12. **VPS PERMISSIONS**: Remember that Directus Admin tokens natively bypass all permission logic. If a CRUD operation works locally/VPS but fails for regular users with `403 Forbidden`, explicitly configure Directus Roles & Policies on the server.
13. **ADA'A SYSTEM UI/UX STANDARDS (Modern Glassmorphism)**: All tables must stretch to fill the screen (`w-full flex-1 overflow-hidden`) and floating toolbars (`fixed bottom-10`) must be used for bulk actions. Native `<select>` inputs are strictly forbidden inside modals to prevent `z-index` cut-offs; always use `CustomSelect` or `RelationSelect` with portals. 
14. **ADA'A SYSTEM V2 VISION**: The project is evolving into a comprehensive Performance & Talent Management System. All future organizational structures (e.g. Designations, Structures, Job Types) must be built to support KPI evaluation and reporting.
15. **ANIMATIONS & UX OVERLAYS**: Use standard Tailwind classes `animate-in fade-in zoom-in-95 duration-200` for all modals, dialogs, and dropdown menus. Standardize notifications via `react-hot-toast`.
