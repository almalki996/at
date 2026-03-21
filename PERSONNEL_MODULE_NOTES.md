# Personnel Module - Architecture & Conventions
*(Documented to maintain consistency across AI agent sessions)*

## 1. Module Structure
- The Personnel (شؤون الموظفين) module deviates from the generic dynamic engine (`src/app/[resource]/page.tsx`) because of highly specialized visual requirements (managing employee assignments, tracking qualifications, viewing complex multi-tab details).
- All custom components for this module are strictly located in `src/components/personnel/`.
- **Modals**: The modal logic is split into separate files inside `src/components/personnel/modals/` to prevent a massive monolithic file. State is hoisted to the parent `personnel-page.tsx`.

## 2. Dropdowns and Relation Selects
- Due to `z-index` and `overflow-hidden` constraints inside modals, we implemented a custom `RelationSelect` (`src/components/generic/relation-select.tsx`).
- It uses `createPortal` to render the dropdown list directly into `document.body`.
- **CRITICAL**: Use `onMouseDown` instead of `onClick` for options inside portal-based dropdowns to prevent race conditions where clicking an option triggers a blur event that prematurely closes the dropdown without registering the selection.

## 3. Date Pickers
- All dates are natively handled using `react-datepicker` with Arabic localization via `date-fns/locale/ar`.
- **CRITICAL**: Use the customized `DatePickerField` (`src/components/generic/date-picker.tsx`). It has been specifically configured with `showMonthDropdown`, `showYearDropdown`, and `dropdownMode="select"` to allow rapid navigation across months and years (from 1950 to 2100). Do not use native `<input type="date">`.

## 4. UI/UX Aesthetics
- **Table Views**: The personnel main grid uses a full-screen stretch layout (no restrictive `max-w` containers) with `flex-1` and `overflow-hidden` to attach perfectly to the sidebar and header. Font sizes in tables should be `text-[15px]` or larger for optimal readability.
- **Bulk Actions**: Bulk operations (like mass activation/deletion) are managed via a floating, glassmorphic bottom bar (`fixed bottom-10 left-1/2 -translate-x-1/2`) when items are selected.
- **Icons**: Standardization relies heavily on `lucide-react`.

## 5. Fetching & Hooks
- Native `fetch` is forbidden. The module exclusively uses `@refinedev/core` (`useList`, `useUpdate`, `useDelete`, `useUpdateMany`, etc.).

**Note to newly instantiated AI Agent**: When picking up work on the Personnel Module, respect these components and do not revert the custom `RelationSelect` or `DatePickerField` to standard inputs, and retain the separated file structure.
