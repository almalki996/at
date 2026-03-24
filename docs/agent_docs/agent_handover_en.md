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

## 3. The Next Step (Phase 5 - Performance Appraisals / Evaluation)
You are starting Phase 5. Phase 4 (Strategic Management) has been entirely completed (Plans -> Objectives -> Op Objectives -> KPIs -> Initiatives -> Mechanisms). The `useDirectusSchema` hook was successfully security-patched to securely use `localStorage` JWTs instead of hardcoded tokens.

For Phase 5, you must analyze and discuss the upcoming requirements with the User before writing any code:

1. **Performance Evaluation Database Architecture:**
   - Determine tables for Employee Appraisal cycles based on the KPIs they were assigned in Phase 4.
   - Establish relations (how managers approve or rate the assigned mechanisms and KPIs).

2. **Evaluation Interface:**
   - Allow managers to see their subordinates within the hierarchy (Structure) and evaluate them based on the KPIs assigned to their specific vacancy.

3. **Performance Dashboard:**
   - High-level progress metrics and employee scores for the entire organization based on the evaluations.

---

## 4. Onboarding Checklist for You (The AI)
1. Read this entire document carefully.
2. Review the `departments-page.tsx` and `personnel-page.tsx` code to fully understand how the Vacancy-based architecture was implemented.
3. Discuss the KPI Database architecture with the User. **Wait for approval**. DO NOT assume tables exist. Provide a simple ERD/Plan before proceeding.
4. If any user instruction conflicts with the architectural rules or breaks the UI, gently explain the issue to the user and suggest a compliant alternative.
