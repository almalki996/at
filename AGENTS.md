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

