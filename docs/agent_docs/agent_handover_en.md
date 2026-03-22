# Ada'a System - Next AI Agent Handover

This document is specifically designed for the next AI Agent. It contains the project's completed phases, architectural rules, current state, and the roadmap for Phase 4.

---

## 1. Completed Phases & Current State
We have successfully completed Phases 1, 2, and 3: Foundation, DB Updates, and Pages Refactoring.

1. **Jobs Directory (`/designations`):**
   - Built a modern tabbed interface containing Cadre, Job Type, Axis, and **Job Titles**.
   - The old Employees (job titles) page was fully integrated into this directory.

2. **Vacancy Planning (`/departments`):**
   - Transformed the generic Departments UI to act as "Vacancy Planning" (Managing Job Seats within the organizational structure).
   - Added a top Dashboard summarizing total seats, vacant seats, and occupied seats.

3. **Personnel Records (`/personnel`):**
   - Refactored the personnel module to link employees directly to "Vacancies" in the `Departments` table.
   - When assigning or editing an employee, the HR user now selects an available Vacancy, which auto-fills the underlying `department_id` (Structure) and `primary_job_id` (Job Title) implicitly.

---

## 2. UI/UX & Architectural Rules
Dear Next AI, you **MUST** strictly adhere to these rules (refer to `AGENTS.md` for full details):

- **UI Consistency:** Use Modern Glassmorphism & Enterprise UI. All data tables must be full-width (`w-full flex-1 overflow-hidden`). Modals must be centered and use `animate-in fade-in`. Use bottom floating action bars (`fixed bottom-10`) for bulk selections.
- **Headless CMS Engine:** The project uses Directus + Refine.dev. All CRUD actions must use `@refinedev/core` hooks. **NO manual `fetch` or `axios` queries** unless strictly necessary for complex file uploads (like NGINX 1MB bypasses).
- **Forms & Z-Index:** **NEVER** use native HTML `<select>` inside modals. ALWAYS use `CustomSelect` or `RelationSelect` with portal support to avoid z-index cropping bugs.
- **Component Modularity:** Keep files small. Avoid files > 500 lines. Split them into `/tabs` and `/modals` folders per module. DO NOT bloat solitary files.

---

## 3. The Next Step (Phase 4 - Performance Module)
You are starting Phase 4 (The Core Business Logic). You must analyze and discuss this with the User before writing any code:

1. **KPI Database Architecture:**
   - Determine tables for KPI Library, Employee KPIs, and Evaluation Cycles.
   - Establish relations (e.g., how KPIs map to specific Vacancies or Cadres).

2. **KPI Dictionary / Library Page:**
   - A screen for HR/Admins to build and classify KPIs and associate them with existing structures and job titles.

3. **Employee Appraisal Screen:**
   - Allow managers to see their subordinates within the hierarchy (Structure) and evaluate them based on the KPIs assigned to their specific vacancy.

4. **Performance Dashboard:**
   - High-level progress metrics for the entire organization.

---

## 4. Onboarding Checklist for You (The AI)
1. Read this entire document carefully.
2. Review the `departments-page.tsx` and `personnel-page.tsx` code to fully understand how the Vacancy-based architecture was implemented.
3. Discuss the KPI Database architecture with the User. **Wait for approval**. DO NOT assume tables exist. Provide a simple ERD/Plan before proceeding.
4. If any user instruction conflicts with the architectural rules or breaks the UI, gently explain the issue to the user and suggest a compliant alternative.
