--
-- PostgreSQL database dump
--

\restrict jC3Jtrb00FO2NeBtpWBeaHXkrUD3WpCoHJ9iBeKh17HGZvEu6BzE6XKabiTJ2EV

-- Dumped from database version 15.17 (Debian 15.17-1.pgdg13+1)
-- Dumped by pg_dump version 15.17 (Debian 15.17-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public."Structures" DROP CONSTRAINT IF EXISTS structures_parent_id_foreign;
ALTER TABLE IF EXISTS ONLY public."Personnel" DROP CONSTRAINT IF EXISTS personnel_primary_job_id_foreign;
ALTER TABLE IF EXISTS ONLY public."Personnel" DROP CONSTRAINT IF EXISTS personnel_department_id_foreign;
ALTER TABLE IF EXISTS ONLY public.menu_items DROP CONSTRAINT IF EXISTS menu_items_parent_id_foreign;
ALTER TABLE IF EXISTS ONLY public."Employee_Assignments" DROP CONSTRAINT IF EXISTS fk_employee_assignments_attachment;
ALTER TABLE IF EXISTS ONLY public."Employees" DROP CONSTRAINT IF EXISTS employees_designation_foreign;
ALTER TABLE IF EXISTS ONLY public."Employee_Qualifications" DROP CONSTRAINT IF EXISTS employee_qualifications_personnel_id_foreign;
ALTER TABLE IF EXISTS ONLY public."Employee_Qualifications" DROP CONSTRAINT IF EXISTS employee_qualifications_attachment_foreign;
ALTER TABLE IF EXISTS ONLY public."Employee_Assignments" DROP CONSTRAINT IF EXISTS employee_assignments_personnel_id_foreign;
ALTER TABLE IF EXISTS ONLY public."Employee_Assignments" DROP CONSTRAINT IF EXISTS employee_assignments_job_id_foreign;
ALTER TABLE IF EXISTS ONLY public."Employee_Assignments" DROP CONSTRAINT IF EXISTS employee_assignments_department_id_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_versions DROP CONSTRAINT IF EXISTS directus_versions_user_updated_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_versions DROP CONSTRAINT IF EXISTS directus_versions_user_created_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_versions DROP CONSTRAINT IF EXISTS directus_versions_collection_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_users DROP CONSTRAINT IF EXISTS directus_users_role_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_shares DROP CONSTRAINT IF EXISTS directus_shares_user_created_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_shares DROP CONSTRAINT IF EXISTS directus_shares_role_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_shares DROP CONSTRAINT IF EXISTS directus_shares_collection_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_settings DROP CONSTRAINT IF EXISTS directus_settings_storage_default_folder_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_settings DROP CONSTRAINT IF EXISTS directus_settings_public_registration_role_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_settings DROP CONSTRAINT IF EXISTS directus_settings_public_foreground_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_settings DROP CONSTRAINT IF EXISTS directus_settings_public_favicon_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_settings DROP CONSTRAINT IF EXISTS directus_settings_public_background_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_settings DROP CONSTRAINT IF EXISTS directus_settings_project_logo_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_sessions DROP CONSTRAINT IF EXISTS directus_sessions_user_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_sessions DROP CONSTRAINT IF EXISTS directus_sessions_share_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_roles DROP CONSTRAINT IF EXISTS directus_roles_parent_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_revisions DROP CONSTRAINT IF EXISTS directus_revisions_version_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_revisions DROP CONSTRAINT IF EXISTS directus_revisions_parent_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_revisions DROP CONSTRAINT IF EXISTS directus_revisions_activity_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_presets DROP CONSTRAINT IF EXISTS directus_presets_user_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_presets DROP CONSTRAINT IF EXISTS directus_presets_role_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_permissions DROP CONSTRAINT IF EXISTS directus_permissions_policy_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_panels DROP CONSTRAINT IF EXISTS directus_panels_user_created_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_panels DROP CONSTRAINT IF EXISTS directus_panels_dashboard_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_operations DROP CONSTRAINT IF EXISTS directus_operations_user_created_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_operations DROP CONSTRAINT IF EXISTS directus_operations_resolve_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_operations DROP CONSTRAINT IF EXISTS directus_operations_reject_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_operations DROP CONSTRAINT IF EXISTS directus_operations_flow_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_notifications DROP CONSTRAINT IF EXISTS directus_notifications_sender_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_notifications DROP CONSTRAINT IF EXISTS directus_notifications_recipient_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_folders DROP CONSTRAINT IF EXISTS directus_folders_parent_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_flows DROP CONSTRAINT IF EXISTS directus_flows_user_created_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_files DROP CONSTRAINT IF EXISTS directus_files_uploaded_by_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_files DROP CONSTRAINT IF EXISTS directus_files_modified_by_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_files DROP CONSTRAINT IF EXISTS directus_files_folder_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_deployments DROP CONSTRAINT IF EXISTS directus_deployments_user_created_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_deployment_runs DROP CONSTRAINT IF EXISTS directus_deployment_runs_user_created_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_deployment_runs DROP CONSTRAINT IF EXISTS directus_deployment_runs_project_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_deployment_projects DROP CONSTRAINT IF EXISTS directus_deployment_projects_user_created_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_deployment_projects DROP CONSTRAINT IF EXISTS directus_deployment_projects_deployment_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_dashboards DROP CONSTRAINT IF EXISTS directus_dashboards_user_created_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_comments DROP CONSTRAINT IF EXISTS directus_comments_user_updated_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_comments DROP CONSTRAINT IF EXISTS directus_comments_user_created_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_collections DROP CONSTRAINT IF EXISTS directus_collections_group_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_access DROP CONSTRAINT IF EXISTS directus_access_user_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_access DROP CONSTRAINT IF EXISTS directus_access_role_foreign;
ALTER TABLE IF EXISTS ONLY public.directus_access DROP CONSTRAINT IF EXISTS directus_access_policy_foreign;
ALTER TABLE IF EXISTS ONLY public."Departments" DROP CONSTRAINT IF EXISTS departments_structure_id_foreign;
ALTER TABLE IF EXISTS ONLY public."Departments" DROP CONSTRAINT IF EXISTS departments_job_type_foreign;
ALTER TABLE IF EXISTS ONLY public."Departments" DROP CONSTRAINT IF EXISTS departments_employee_job_foreign;
ALTER TABLE IF EXISTS ONLY public."Departments" DROP CONSTRAINT IF EXISTS departments_designation_foreign;
DROP INDEX IF EXISTS public.directus_revisions_parent_index;
DROP INDEX IF EXISTS public.directus_revisions_activity_index;
DROP INDEX IF EXISTS public.directus_activity_timestamp_index;
ALTER TABLE IF EXISTS ONLY public.site_settings DROP CONSTRAINT IF EXISTS site_settings_pkey;
ALTER TABLE IF EXISTS ONLY public.menu_items DROP CONSTRAINT IF EXISTS menu_items_pkey;
ALTER TABLE IF EXISTS ONLY public.job_types DROP CONSTRAINT IF EXISTS job_types_pkey;
ALTER TABLE IF EXISTS ONLY public.job_axes DROP CONSTRAINT IF EXISTS job_axes_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_versions DROP CONSTRAINT IF EXISTS directus_versions_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_users DROP CONSTRAINT IF EXISTS directus_users_token_unique;
ALTER TABLE IF EXISTS ONLY public.directus_users DROP CONSTRAINT IF EXISTS directus_users_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_users DROP CONSTRAINT IF EXISTS directus_users_external_identifier_unique;
ALTER TABLE IF EXISTS ONLY public.directus_users DROP CONSTRAINT IF EXISTS directus_users_email_unique;
ALTER TABLE IF EXISTS ONLY public.directus_translations DROP CONSTRAINT IF EXISTS directus_translations_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_shares DROP CONSTRAINT IF EXISTS directus_shares_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_settings DROP CONSTRAINT IF EXISTS directus_settings_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_sessions DROP CONSTRAINT IF EXISTS directus_sessions_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_roles DROP CONSTRAINT IF EXISTS directus_roles_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_revisions DROP CONSTRAINT IF EXISTS directus_revisions_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_relations DROP CONSTRAINT IF EXISTS directus_relations_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_presets DROP CONSTRAINT IF EXISTS directus_presets_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_policies DROP CONSTRAINT IF EXISTS directus_policies_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_permissions DROP CONSTRAINT IF EXISTS directus_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_panels DROP CONSTRAINT IF EXISTS directus_panels_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_operations DROP CONSTRAINT IF EXISTS directus_operations_resolve_unique;
ALTER TABLE IF EXISTS ONLY public.directus_operations DROP CONSTRAINT IF EXISTS directus_operations_reject_unique;
ALTER TABLE IF EXISTS ONLY public.directus_operations DROP CONSTRAINT IF EXISTS directus_operations_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_notifications DROP CONSTRAINT IF EXISTS directus_notifications_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_migrations DROP CONSTRAINT IF EXISTS directus_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_folders DROP CONSTRAINT IF EXISTS directus_folders_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_flows DROP CONSTRAINT IF EXISTS directus_flows_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_flows DROP CONSTRAINT IF EXISTS directus_flows_operation_unique;
ALTER TABLE IF EXISTS ONLY public.directus_files DROP CONSTRAINT IF EXISTS directus_files_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_fields DROP CONSTRAINT IF EXISTS directus_fields_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_extensions DROP CONSTRAINT IF EXISTS directus_extensions_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_deployments DROP CONSTRAINT IF EXISTS directus_deployments_provider_unique;
ALTER TABLE IF EXISTS ONLY public.directus_deployments DROP CONSTRAINT IF EXISTS directus_deployments_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_deployment_runs DROP CONSTRAINT IF EXISTS directus_deployment_runs_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_deployment_projects DROP CONSTRAINT IF EXISTS directus_deployment_projects_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_deployment_projects DROP CONSTRAINT IF EXISTS directus_deployment_projects_deployment_external_id_unique;
ALTER TABLE IF EXISTS ONLY public.directus_dashboards DROP CONSTRAINT IF EXISTS directus_dashboards_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_comments DROP CONSTRAINT IF EXISTS directus_comments_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_collections DROP CONSTRAINT IF EXISTS directus_collections_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_activity DROP CONSTRAINT IF EXISTS directus_activity_pkey;
ALTER TABLE IF EXISTS ONLY public.directus_access DROP CONSTRAINT IF EXISTS directus_access_pkey;
ALTER TABLE IF EXISTS ONLY public.designations DROP CONSTRAINT IF EXISTS designations_pkey;
ALTER TABLE IF EXISTS ONLY public."Structures" DROP CONSTRAINT IF EXISTS "Structures_pkey";
ALTER TABLE IF EXISTS ONLY public."Personnel" DROP CONSTRAINT IF EXISTS "Personnel_pkey";
ALTER TABLE IF EXISTS ONLY public."Jobs" DROP CONSTRAINT IF EXISTS "Jobs_pkey";
ALTER TABLE IF EXISTS ONLY public."Employees" DROP CONSTRAINT IF EXISTS "Employees_pkey";
ALTER TABLE IF EXISTS ONLY public."Employee_Qualifications" DROP CONSTRAINT IF EXISTS "Employee_Qualifications_pkey";
ALTER TABLE IF EXISTS ONLY public."Employee_Assignments_undefined" DROP CONSTRAINT IF EXISTS "Employee_Assignments_undefined_pkey";
ALTER TABLE IF EXISTS ONLY public."Employee_Assignments" DROP CONSTRAINT IF EXISTS "Employee_Assignments_pkey";
ALTER TABLE IF EXISTS ONLY public."Departments" DROP CONSTRAINT IF EXISTS "Departments_pkey";
ALTER TABLE IF EXISTS ONLY public."Categories" DROP CONSTRAINT IF EXISTS "Categories_pkey";
ALTER TABLE IF EXISTS ONLY public."Calendars" DROP CONSTRAINT IF EXISTS "Calendars_pkey";
ALTER TABLE IF EXISTS public.site_settings ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.menu_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.job_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.job_axes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.directus_settings ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.directus_revisions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.directus_relations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.directus_presets ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.directus_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.directus_notifications ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.directus_fields ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.directus_activity ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.designations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Structures" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Personnel" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Jobs" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Employees" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Employee_Qualifications" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Employee_Assignments_undefined" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Employee_Assignments" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Departments" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Categories" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public."Calendars" ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.site_settings_id_seq;
DROP TABLE IF EXISTS public.site_settings;
DROP SEQUENCE IF EXISTS public.menu_items_id_seq;
DROP TABLE IF EXISTS public.menu_items;
DROP SEQUENCE IF EXISTS public.job_types_id_seq;
DROP TABLE IF EXISTS public.job_types;
DROP SEQUENCE IF EXISTS public.job_axes_id_seq;
DROP TABLE IF EXISTS public.job_axes;
DROP TABLE IF EXISTS public.directus_versions;
DROP TABLE IF EXISTS public.directus_users;
DROP TABLE IF EXISTS public.directus_translations;
DROP TABLE IF EXISTS public.directus_shares;
DROP SEQUENCE IF EXISTS public.directus_settings_id_seq;
DROP TABLE IF EXISTS public.directus_settings;
DROP TABLE IF EXISTS public.directus_sessions;
DROP TABLE IF EXISTS public.directus_roles;
DROP SEQUENCE IF EXISTS public.directus_revisions_id_seq;
DROP TABLE IF EXISTS public.directus_revisions;
DROP SEQUENCE IF EXISTS public.directus_relations_id_seq;
DROP TABLE IF EXISTS public.directus_relations;
DROP SEQUENCE IF EXISTS public.directus_presets_id_seq;
DROP TABLE IF EXISTS public.directus_presets;
DROP TABLE IF EXISTS public.directus_policies;
DROP SEQUENCE IF EXISTS public.directus_permissions_id_seq;
DROP TABLE IF EXISTS public.directus_permissions;
DROP TABLE IF EXISTS public.directus_panels;
DROP TABLE IF EXISTS public.directus_operations;
DROP SEQUENCE IF EXISTS public.directus_notifications_id_seq;
DROP TABLE IF EXISTS public.directus_notifications;
DROP TABLE IF EXISTS public.directus_migrations;
DROP TABLE IF EXISTS public.directus_folders;
DROP TABLE IF EXISTS public.directus_flows;
DROP TABLE IF EXISTS public.directus_files;
DROP SEQUENCE IF EXISTS public.directus_fields_id_seq;
DROP TABLE IF EXISTS public.directus_fields;
DROP TABLE IF EXISTS public.directus_extensions;
DROP TABLE IF EXISTS public.directus_deployments;
DROP TABLE IF EXISTS public.directus_deployment_runs;
DROP TABLE IF EXISTS public.directus_deployment_projects;
DROP TABLE IF EXISTS public.directus_dashboards;
DROP TABLE IF EXISTS public.directus_comments;
DROP TABLE IF EXISTS public.directus_collections;
DROP SEQUENCE IF EXISTS public.directus_activity_id_seq;
DROP TABLE IF EXISTS public.directus_activity;
DROP TABLE IF EXISTS public.directus_access;
DROP SEQUENCE IF EXISTS public.designations_id_seq;
DROP TABLE IF EXISTS public.designations;
DROP SEQUENCE IF EXISTS public."Structures_id_seq";
DROP TABLE IF EXISTS public."Structures";
DROP SEQUENCE IF EXISTS public."Personnel_id_seq";
DROP TABLE IF EXISTS public."Personnel";
DROP SEQUENCE IF EXISTS public."Jobs_id_seq";
DROP TABLE IF EXISTS public."Jobs";
DROP SEQUENCE IF EXISTS public."Employees_id_seq";
DROP TABLE IF EXISTS public."Employees";
DROP SEQUENCE IF EXISTS public."Employee_Qualifications_id_seq";
DROP TABLE IF EXISTS public."Employee_Qualifications";
DROP SEQUENCE IF EXISTS public."Employee_Assignments_undefined_id_seq";
DROP TABLE IF EXISTS public."Employee_Assignments_undefined";
DROP SEQUENCE IF EXISTS public."Employee_Assignments_id_seq";
DROP TABLE IF EXISTS public."Employee_Assignments";
DROP SEQUENCE IF EXISTS public."Departments_id_seq";
DROP TABLE IF EXISTS public."Departments";
DROP SEQUENCE IF EXISTS public."Categories_id_seq";
DROP TABLE IF EXISTS public."Categories";
DROP SEQUENCE IF EXISTS public."Calendars_id_seq";
DROP TABLE IF EXISTS public."Calendars";
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Calendars; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."Calendars" (
    id integer NOT NULL
);


ALTER TABLE public."Calendars" OWNER TO directus;

--
-- Name: Calendars_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public."Calendars_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Calendars_id_seq" OWNER TO directus;

--
-- Name: Calendars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public."Calendars_id_seq" OWNED BY public."Calendars".id;


--
-- Name: Categories; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."Categories" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public."Categories" OWNER TO directus;

--
-- Name: Categories_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public."Categories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Categories_id_seq" OWNER TO directus;

--
-- Name: Categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public."Categories_id_seq" OWNED BY public."Categories".id;


--
-- Name: Departments; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."Departments" (
    id integer NOT NULL,
    structure_id integer,
    designation integer,
    job_type integer,
    employee_job integer,
    job_status character varying(255),
    sort_order integer
);


ALTER TABLE public."Departments" OWNER TO directus;

--
-- Name: Departments_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public."Departments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Departments_id_seq" OWNER TO directus;

--
-- Name: Departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public."Departments_id_seq" OWNED BY public."Departments".id;


--
-- Name: Employee_Assignments; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."Employee_Assignments" (
    id integer NOT NULL,
    personnel_id integer,
    subject character varying(255),
    decision_number character varying(255),
    decision_date date,
    decision_summary text,
    effective_from date,
    effective_to date,
    decision_source character varying(255),
    department_id integer,
    job_id integer,
    attachment uuid
);


ALTER TABLE public."Employee_Assignments" OWNER TO directus;

--
-- Name: Employee_Assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public."Employee_Assignments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Employee_Assignments_id_seq" OWNER TO directus;

--
-- Name: Employee_Assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public."Employee_Assignments_id_seq" OWNED BY public."Employee_Assignments".id;


--
-- Name: Employee_Assignments_undefined; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."Employee_Assignments_undefined" (
    id integer NOT NULL,
    "Employee_Assignments_id" integer,
    item character varying(255),
    collection character varying(255)
);


ALTER TABLE public."Employee_Assignments_undefined" OWNER TO directus;

--
-- Name: Employee_Assignments_undefined_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public."Employee_Assignments_undefined_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Employee_Assignments_undefined_id_seq" OWNER TO directus;

--
-- Name: Employee_Assignments_undefined_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public."Employee_Assignments_undefined_id_seq" OWNED BY public."Employee_Assignments_undefined".id;


--
-- Name: Employee_Qualifications; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."Employee_Qualifications" (
    id integer NOT NULL,
    personnel_id integer,
    course_name character varying(255),
    training_entity character varying(255),
    start_date date,
    end_date date,
    score bigint,
    attachment uuid
);


ALTER TABLE public."Employee_Qualifications" OWNER TO directus;

--
-- Name: Employee_Qualifications_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public."Employee_Qualifications_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Employee_Qualifications_id_seq" OWNER TO directus;

--
-- Name: Employee_Qualifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public."Employee_Qualifications_id_seq" OWNED BY public."Employee_Qualifications".id;


--
-- Name: Employees; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."Employees" (
    id integer NOT NULL,
    designation integer,
    job_title character varying(255),
    job_description text,
    is_active boolean,
    sort_order integer
);


ALTER TABLE public."Employees" OWNER TO directus;

--
-- Name: Employees_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public."Employees_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Employees_id_seq" OWNER TO directus;

--
-- Name: Employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public."Employees_id_seq" OWNED BY public."Employees".id;


--
-- Name: Jobs; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."Jobs" (
    id integer NOT NULL
);


ALTER TABLE public."Jobs" OWNER TO directus;

--
-- Name: Jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public."Jobs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Jobs_id_seq" OWNER TO directus;

--
-- Name: Jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public."Jobs_id_seq" OWNED BY public."Jobs".id;


--
-- Name: Personnel; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."Personnel" (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    mobile_number character varying(255),
    job_number character varying(255),
    department_id integer,
    primary_job_id integer,
    qualification character varying(255),
    graduation_entity character varying(255),
    graduation_year integer,
    is_active boolean,
    sort_order integer
);


ALTER TABLE public."Personnel" OWNER TO directus;

--
-- Name: Personnel_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public."Personnel_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Personnel_id_seq" OWNER TO directus;

--
-- Name: Personnel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public."Personnel_id_seq" OWNED BY public."Personnel".id;


--
-- Name: Structures; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."Structures" (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description text,
    is_active boolean,
    sort_order integer,
    parent_id integer
);


ALTER TABLE public."Structures" OWNER TO directus;

--
-- Name: Structures_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public."Structures_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Structures_id_seq" OWNER TO directus;

--
-- Name: Structures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public."Structures_id_seq" OWNED BY public."Structures".id;


--
-- Name: designations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.designations (
    id integer NOT NULL,
    name character varying(255),
    is_active boolean,
    sort_order integer
);


ALTER TABLE public.designations OWNER TO directus;

--
-- Name: designations_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.designations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.designations_id_seq OWNER TO directus;

--
-- Name: designations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.designations_id_seq OWNED BY public.designations.id;


--
-- Name: directus_access; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_access (
    id uuid NOT NULL,
    role uuid,
    "user" uuid,
    policy uuid NOT NULL,
    sort integer
);


ALTER TABLE public.directus_access OWNER TO directus;

--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent text,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO directus;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_activity_id_seq OWNER TO directus;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(64),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO directus;

--
-- Name: directus_comments; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_comments (
    id uuid NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


ALTER TABLE public.directus_comments OWNER TO directus;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO directus;

--
-- Name: directus_deployment_projects; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_deployment_projects (
    id uuid NOT NULL,
    deployment uuid NOT NULL,
    external_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    url character varying(255),
    framework character varying(255),
    deployable boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_deployment_projects OWNER TO directus;

--
-- Name: directus_deployment_runs; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_deployment_runs (
    id uuid NOT NULL,
    project uuid NOT NULL,
    external_id character varying(255) NOT NULL,
    target character varying(255) NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    status character varying(255),
    url character varying(255),
    started_at timestamp with time zone,
    completed_at timestamp with time zone
);


ALTER TABLE public.directus_deployment_runs OWNER TO directus;

--
-- Name: directus_deployments; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_deployments (
    id uuid NOT NULL,
    provider character varying(255) NOT NULL,
    credentials text,
    options text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    webhook_ids json,
    webhook_secret character varying(255),
    last_synced_at timestamp with time zone
);


ALTER TABLE public.directus_deployments OWNER TO directus;

--
-- Name: directus_extensions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);


ALTER TABLE public.directus_extensions OWNER TO directus;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text,
    searchable boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_fields OWNER TO directus;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_fields_id_seq OWNER TO directus;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    created_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer,
    tus_id character varying(64),
    tus_data json,
    uploaded_on timestamp with time zone
);


ALTER TABLE public.directus_files OWNER TO directus;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO directus;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO directus;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO directus;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO directus;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_notifications_id_seq OWNER TO directus;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO directus;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(64) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO directus;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    policy uuid NOT NULL
);


ALTER TABLE public.directus_permissions OWNER TO directus;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_permissions_id_seq OWNER TO directus;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_policies; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_policies (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'badge'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_policies OWNER TO directus;

--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(64) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO directus;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_presets_id_seq OWNER TO directus;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO directus;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_relations_id_seq OWNER TO directus;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);


ALTER TABLE public.directus_revisions OWNER TO directus;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_revisions_id_seq OWNER TO directus;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    parent uuid
);


ALTER TABLE public.directus_roles OWNER TO directus;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent text,
    share uuid,
    origin character varying(255),
    next_token character varying(64)
);


ALTER TABLE public.directus_sessions OWNER TO directus;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json,
    report_error_url character varying(255),
    report_bug_url character varying(255),
    report_feature_url character varying(255),
    public_registration boolean DEFAULT false NOT NULL,
    public_registration_verify_email boolean DEFAULT true NOT NULL,
    public_registration_role uuid,
    public_registration_email_filter json,
    visual_editor_urls json,
    project_id uuid,
    mcp_enabled boolean DEFAULT false NOT NULL,
    mcp_allow_deletes boolean DEFAULT false NOT NULL,
    mcp_prompts_collection character varying(255) DEFAULT NULL::character varying,
    mcp_system_prompt_enabled boolean DEFAULT true NOT NULL,
    mcp_system_prompt text,
    project_owner character varying(255),
    project_usage character varying(255),
    org_name character varying(255),
    product_updates boolean,
    project_status character varying(255),
    ai_openai_api_key text,
    ai_anthropic_api_key text,
    ai_system_prompt text,
    ai_google_api_key text,
    ai_openai_compatible_api_key text,
    ai_openai_compatible_base_url text,
    ai_openai_compatible_name text,
    ai_openai_compatible_models json,
    ai_openai_compatible_headers json,
    ai_openai_allowed_models json,
    ai_anthropic_allowed_models json,
    ai_google_allowed_models json,
    collaborative_editing_enabled boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_settings OWNER TO directus;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_settings_id_seq OWNER TO directus;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO directus;

--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.directus_translations OWNER TO directus;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json,
    text_direction character varying(255) DEFAULT 'auto'::character varying NOT NULL
);


ALTER TABLE public.directus_users OWNER TO directus;

--
-- Name: directus_versions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid,
    delta json
);


ALTER TABLE public.directus_versions OWNER TO directus;

--
-- Name: job_axes; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.job_axes (
    id integer NOT NULL,
    name character varying(255),
    is_active boolean,
    sort_order integer
);


ALTER TABLE public.job_axes OWNER TO directus;

--
-- Name: job_axes_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.job_axes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_axes_id_seq OWNER TO directus;

--
-- Name: job_axes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.job_axes_id_seq OWNED BY public.job_axes.id;


--
-- Name: job_types; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.job_types (
    id integer NOT NULL,
    name character varying(255),
    is_active boolean,
    sort_order integer
);


ALTER TABLE public.job_types OWNER TO directus;

--
-- Name: job_types_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.job_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_types_id_seq OWNER TO directus;

--
-- Name: job_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.job_types_id_seq OWNED BY public.job_types.id;


--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.menu_items (
    id integer NOT NULL,
    title character varying(255),
    url_path character varying(255),
    sort_order integer,
    parent_id integer,
    icon character varying(255)
);


ALTER TABLE public.menu_items OWNER TO directus;

--
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.menu_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_items_id_seq OWNER TO directus;

--
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.menu_items_id_seq OWNED BY public.menu_items.id;


--
-- Name: site_settings; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.site_settings (
    id integer NOT NULL,
    site_name character varying(255),
    logo uuid,
    site_description character varying(255)
);


ALTER TABLE public.site_settings OWNER TO directus;

--
-- Name: site_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.site_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_settings_id_seq OWNER TO directus;

--
-- Name: site_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.site_settings_id_seq OWNED BY public.site_settings.id;


--
-- Name: Calendars id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Calendars" ALTER COLUMN id SET DEFAULT nextval('public."Calendars_id_seq"'::regclass);


--
-- Name: Categories id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Categories" ALTER COLUMN id SET DEFAULT nextval('public."Categories_id_seq"'::regclass);


--
-- Name: Departments id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Departments" ALTER COLUMN id SET DEFAULT nextval('public."Departments_id_seq"'::regclass);


--
-- Name: Employee_Assignments id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Employee_Assignments" ALTER COLUMN id SET DEFAULT nextval('public."Employee_Assignments_id_seq"'::regclass);


--
-- Name: Employee_Assignments_undefined id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Employee_Assignments_undefined" ALTER COLUMN id SET DEFAULT nextval('public."Employee_Assignments_undefined_id_seq"'::regclass);


--
-- Name: Employee_Qualifications id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Employee_Qualifications" ALTER COLUMN id SET DEFAULT nextval('public."Employee_Qualifications_id_seq"'::regclass);


--
-- Name: Employees id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Employees" ALTER COLUMN id SET DEFAULT nextval('public."Employees_id_seq"'::regclass);


--
-- Name: Jobs id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Jobs" ALTER COLUMN id SET DEFAULT nextval('public."Jobs_id_seq"'::regclass);


--
-- Name: Personnel id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Personnel" ALTER COLUMN id SET DEFAULT nextval('public."Personnel_id_seq"'::regclass);


--
-- Name: Structures id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Structures" ALTER COLUMN id SET DEFAULT nextval('public."Structures_id_seq"'::regclass);


--
-- Name: designations id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.designations ALTER COLUMN id SET DEFAULT nextval('public.designations_id_seq'::regclass);


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: job_axes id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.job_axes ALTER COLUMN id SET DEFAULT nextval('public.job_axes_id_seq'::regclass);


--
-- Name: job_types id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.job_types ALTER COLUMN id SET DEFAULT nextval('public.job_types_id_seq'::regclass);


--
-- Name: menu_items id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.menu_items ALTER COLUMN id SET DEFAULT nextval('public.menu_items_id_seq'::regclass);


--
-- Name: site_settings id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.site_settings ALTER COLUMN id SET DEFAULT nextval('public.site_settings_id_seq'::regclass);


--
-- Data for Name: Calendars; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."Calendars" (id) FROM stdin;
\.


--
-- Data for Name: Categories; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."Categories" (id, name, description) FROM stdin;
\.


--
-- Data for Name: Departments; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."Departments" (id, structure_id, designation, job_type, employee_job, job_status, sort_order) FROM stdin;
2	7	8	3	4	مشغولة	0
\.


--
-- Data for Name: Employee_Assignments; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."Employee_Assignments" (id, personnel_id, subject, decision_number, decision_date, decision_summary, effective_from, effective_to, decision_source, department_id, job_id, attachment) FROM stdin;
1	\N	dfhfdhfd	sdgsgd	2026-03-21	sdgsdg	2026-03-21	\N	vxcvxcb	7	4	\N
4	\N	sgdfsd	sdgsd	2026-03-21	sdgsdg	2026-03-21	2026-03-21	sdgsdg	7	4	201eb4fa-6005-44ef-82b1-876aced976b3
5	\N	بيبيل	يبايب	2026-03-21	يبل	\N	\N	سيلسيل	7	4	996664a4-230d-4955-b6f1-7419e9ff0da9
\.


--
-- Data for Name: Employee_Assignments_undefined; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."Employee_Assignments_undefined" (id, "Employee_Assignments_id", item, collection) FROM stdin;
\.


--
-- Data for Name: Employee_Qualifications; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."Employee_Qualifications" (id, personnel_id, course_name, training_entity, start_date, end_date, score, attachment) FROM stdin;
1	\N	hh	\N	2026-03-21	2026-03-21	\N	cbbb373a-12aa-4c05-9530-c1326ee5faf3
4	\N	سيلس	بشسب	2026-03-21	2026-03-21	99	7c550851-cf69-48a2-93a8-09986e52d7f1
\.


--
-- Data for Name: Employees; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."Employees" (id, designation, job_title, job_description, is_active, sort_order) FROM stdin;
4	8	منسق قسم	بسم الله نبدأ	t	0
5	8	اللل		t	0
6	8	سيليس	يبلسل	t	0
\.


--
-- Data for Name: Jobs; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."Jobs" (id) FROM stdin;
\.


--
-- Data for Name: Personnel; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."Personnel" (id, name, email, mobile_number, job_number, department_id, primary_job_id, qualification, graduation_entity, graduation_year, is_active, sort_order) FROM stdin;
11	عبدالعزيز	az.almalki.1996@gmail.com	0593008572	4545	7	4	\N	\N	\N	f	\N
\.


--
-- Data for Name: Structures; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."Structures" (id, name, code, description, is_active, sort_order, parent_id) FROM stdin;
9	العمادة	148	\N	t	0	8
10	وكالة شؤون المدربين	140	\N	t	-1	8
24	أمانة مجلس الكلية	\N	\N	t	0	10
25	وحدة الاتصال المؤسسي	\N	\N	t	0	10
11	وكالة الجودة	200	\N	t	0	8
7	الكلية التقنية بظهران الجنوب	258	كلية	t	0	\N
13	إدارة الخدمات المساندة	451	\N	t	0	8
12	وكالة شؤون المتدربين	700	\N	t	0	8
22	قسم التديب الإلكتروني	\N	\N	t	0	10
23	الأقسام التدريبية	95	\N	t	0	10
8	مجلس الكلية	185	\N	t	0	7
14	مكتب العميد	410	\N	t	0	9
15	السكرتارية	4512	\N	t	0	9
16	وحدة الرقابة	7546	\N	t	0	9
19	مركز خدمة المجتمع	5846	\N	t	0	9
17	وجدة الاتصال المؤسسي	784	\N	t	0	9
21	قسم التنسيق الوظيفي	87888	\N	t	0	9
20	وحدة تقنية المعلومات	1231	\N	t	0	9
18	قسم التدريبات العامة	\N	\N	t	0	17
\.


--
-- Data for Name: designations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.designations (id, name, is_active, sort_order) FROM stdin;
9	الوظائف تجريبي 1	t	0
8	الوظائف الإدارية والفنية	t	0
10	بيليبل	t	0
\.


--
-- Data for Name: directus_access; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_access (id, role, "user", policy, sort) FROM stdin;
a835305d-7cc3-4346-b45f-2d71ce9a2e9c	\N	\N	abf8a154-5b1c-4a46-ac9c-7300570f4f17	1
8bb16fff-8185-43ae-b0c9-b7955f61ca4f	a5a97f5c-2db7-4627-aa8e-ce7c37fce106	\N	50947f50-4b94-4e8a-8c29-1bf8581b6295	\N
311caff4-fb31-48af-9c59-866ef11d5958	a5a97f5c-2db7-4627-aa8e-ce7c37fce106	\N	ac52433e-48f5-4161-aa8e-aa3a77abda8d	\N
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, origin) FROM stdin;
1	login	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 17:06:13.456+00	172.20.0.1	node	directus_users	e7c14f87-5452-4b00-b431-3d407c9dceaa	\N
2	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 17:06:13.92+00	172.20.0.1	node	directus_users	e7c14f87-5452-4b00-b431-3d407c9dceaa	\N
3	login	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 17:07:20.956+00	172.20.0.1	node	directus_users	e7c14f87-5452-4b00-b431-3d407c9dceaa	\N
4	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 17:07:21.353+00	172.20.0.1	node	directus_users	e7c14f87-5452-4b00-b431-3d407c9dceaa	\N
5	login	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 17:09:53.767+00	172.20.0.1	curl/8.5.0	directus_users	e7c14f87-5452-4b00-b431-3d407c9dceaa	\N
6	login	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 17:11:12.1+00	172.20.0.1	curl/8.5.0	directus_users	e7c14f87-5452-4b00-b431-3d407c9dceaa	\N
7	login	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 18:32:24.579+00	172.20.0.1	node	directus_users	e7c14f87-5452-4b00-b431-3d407c9dceaa	\N
8	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 18:32:24.995+00	172.20.0.1	node	directus_users	e7c14f87-5452-4b00-b431-3d407c9dceaa	\N
9	login	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 18:39:15.584+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_users	e7c14f87-5452-4b00-b431-3d407c9dceaa	http://localhost:8055
10	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 18:39:35.071+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
11	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 18:40:01.224+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	1	http://localhost:8055
12	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 18:40:01.237+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_collections	jobs	http://localhost:8055
13	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 18:40:17.867+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	2	http://localhost:8055
14	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 18:40:30.746+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	3	http://localhost:8055
15	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 18:40:49.615+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_permissions	1	http://localhost:8055
16	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 18:40:49.63+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_permissions	2	http://localhost:8055
17	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 18:40:49.651+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_permissions	3	http://localhost:8055
18	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 18:40:49.67+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_permissions	4	http://localhost:8055
19	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 18:40:49.686+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
20	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:03:24.893+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_collections	jobs	http://localhost:8055
21	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:03:37.718+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_collections	jobs	http://localhost:8055
22	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:04:15.322+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	4	http://localhost:8055
23	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:04:15.337+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_collections	Categories	http://localhost:8055
24	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:04:33.567+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	5	http://localhost:8055
25	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:04:44.874+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	6	http://localhost:8055
26	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:05:18.256+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	7	http://localhost:8055
27	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:05:18.268+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_collections	Jobs	http://localhost:8055
28	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:05:34.639+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	8	http://localhost:8055
29	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:05:44.967+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	9	http://localhost:8055
1233	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:53:07.869+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	996664a4-230d-4955-b6f1-7419e9ff0da9	http://localhost:3000
32	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:14:06.42+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	10	http://localhost:8055
33	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:14:06.425+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_collections	menu_items	http://localhost:8055
34	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:14:18.572+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	11	http://localhost:8055
35	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:14:31.983+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	12	http://localhost:8055
36	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:14:43.401+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	13	http://localhost:8055
37	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:14:52.593+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	14	http://localhost:8055
38	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:15:46.603+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	13	http://localhost:8055
39	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:15:48.433+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	14	http://localhost:8055
40	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:16:30.034+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	15	http://localhost:8055
41	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:19:12.84+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	16	http://localhost:8055
47	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:42:20.552+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	Categories	3	http://localhost:3000
48	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:42:35.765+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	Categories	4	http://localhost:3000
1234	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:53:09.626+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Assignments	5	http://localhost:3000
1235	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:54:05.151+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	10	http://localhost:3000
1236	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:55:43.19+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	11	http://localhost:3000
1237	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:57:26.586+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	11	http://localhost:3000
1276	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:31:58.772+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	10	http://localhost:3000
1277	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:32:15.415+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employees	6	http://localhost:3000
42	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:22:42.835+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	Categories	1	http://localhost:3000
43	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:30:11.788+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	1	http://localhost:3000
44	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:30:33.517+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	2	http://localhost:3000
45	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:33:25.186+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	3	http://localhost:3000
46	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:42:10.316+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	Categories	2	http://localhost:3000
49	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:47:54.42+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	1	http://localhost:8055
50	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:47:54.422+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	2	http://localhost:8055
51	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:47:54.424+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	3	http://localhost:8055
1238	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:52:02.156+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	11	http://localhost:3000
1239	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:52:59.298+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	11	http://localhost:3000
54	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:48:07.47+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	Categories	1	http://localhost:8055
55	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:48:07.471+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	Categories	2	http://localhost:8055
56	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:48:07.473+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	Categories	3	http://localhost:8055
57	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:48:07.475+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	Categories	4	http://localhost:8055
58	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:48:40.587+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
59	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:53:09.411+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	5	http://localhost:3000
60	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 19:58:51.174+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	6	http://localhost:3000
61	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-19 20:03:12.147+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	7	http://localhost:3000
62	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 02:06:49.735+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	7	http://localhost:3000
63	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 02:06:57.315+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	5	http://localhost:3000
64	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 02:07:15.881+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	6	http://localhost:3000
65	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 02:07:15.892+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
66	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 02:07:17.333+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
67	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 02:07:17.335+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	6	http://localhost:3000
68	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 02:07:18.865+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	6	http://localhost:3000
69	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 02:07:18.868+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
70	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 02:08:17.929+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	8	http://localhost:3000
71	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 02:08:42.892+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
72	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 02:08:42.942+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	6	http://localhost:3000
73	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 02:08:42.944+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	8	http://localhost:3000
74	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 02:09:20.545+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	6	http://localhost:3000
75	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 02:11:54.133+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
76	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 02:11:54.135+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	8	http://localhost:3000
77	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 02:12:35.601+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	8	http://localhost:3000
78	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 02:13:29.228+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	9	http://localhost:3000
79	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:09:26.449+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
81	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:09:26.473+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	8	http://localhost:3000
83	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:09:31.46+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	9	http://localhost:3000
87	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:09:33.563+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	8	http://localhost:3000
88	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:21:21.586+00	172.20.0.1	axios/1.13.6	menu_items	4	\N
89	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:23:19.618+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	8	http://localhost:3000
90	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:23:21.77+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	9	http://localhost:3000
1240	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:54:50.639+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	87338ef6-8811-4dff-b013-cf90eca11fb2	http://localhost:3000
1241	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:54:50.823+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Qualifications	5	http://localhost:3000
1242	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:55:02.34+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	11	http://localhost:3000
1278	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:15.539+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	9	http://localhost:3000
1280	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:15.584+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	15	http://localhost:3000
1284	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:15.633+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	20	http://localhost:3000
1289	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:19.828+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	15	http://localhost:3000
1293	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:19.873+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	21	http://localhost:3000
80	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:09:26.46+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	9	http://localhost:3000
82	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:09:31.452+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
84	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:09:31.462+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	8	http://localhost:3000
85	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:09:33.556+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
86	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:09:33.558+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	9	http://localhost:3000
91	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:36:37.368+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	17	http://localhost:8055
92	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:36:37.387+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	18	http://localhost:8055
93	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:36:37.406+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_collections	employees	http://localhost:8055
94	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:37:50.082+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	19	http://localhost:8055
95	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:38:22.488+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	directus_fields	20	http://localhost:8055
96	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:41:52.353+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
97	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:43:14.071+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
98	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:43:14.083+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
99	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:49:07.462+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
100	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:54:06.982+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
101	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:54:16.649+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
102	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:54:16.67+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
103	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:54:30.312+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
104	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:55:15.666+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
105	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:55:15.699+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
106	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:55:18.102+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
107	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 04:55:18.105+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
108	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:03:06.375+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
109	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:03:06.377+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
110	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:03:12.968+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
111	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:03:12.985+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
112	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:03:14.952+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
113	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:03:14.971+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
114	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:03:41.547+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
115	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:03:41.574+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
116	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:03:47.097+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
117	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:03:47.118+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
118	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:03:49.582+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
119	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:03:49.585+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
120	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:04:23.666+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
121	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:04:30.119+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
122	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:04:30.165+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
123	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:04:30.167+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
124	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:08:52.655+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
125	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:08:52.67+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
126	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:08:52.684+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
127	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:08:59.148+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
128	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:08:59.159+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
129	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:08:59.173+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
130	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:09:12.808+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
131	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:09:12.822+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
132	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:09:12.834+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
133	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:09:24.299+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
134	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:09:24.315+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
135	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:09:24.331+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
136	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:29:59.44+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
137	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:29:59.448+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
138	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 05:29:59.455+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
139	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:09:29.344+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
140	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:09:38.354+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
141	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:09:45.297+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
142	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:09:45.307+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
143	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:09:45.316+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
144	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:26:04.27+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
145	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:29:59.494+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
146	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:29:59.511+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
147	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:29:59.526+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
148	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:29:59.545+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
149	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:30:11.182+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
150	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:30:11.209+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
151	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:30:11.225+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
152	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:30:11.238+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
153	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:30:42.506+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
154	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:30:42.521+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
155	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:30:42.535+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
156	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:30:42.555+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
157	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:30:47.683+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
158	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:30:47.7+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
159	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:30:47.71+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
160	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:30:47.724+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
161	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:30:59.687+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
162	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:30:59.704+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
163	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:30:59.714+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
164	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:30:59.728+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
165	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:31:10.138+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
166	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:31:10.149+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
167	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:31:10.162+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
168	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:31:10.172+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
169	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:36:55.37+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
170	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:21.077+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
171	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:33.266+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
172	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:33.28+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
173	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:33.292+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
174	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:33.306+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
175	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:33.32+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
176	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:33.336+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
177	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:34.899+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
178	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:34.912+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
179	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:34.923+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
180	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:34.936+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
181	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:34.95+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
182	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:34.961+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
183	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:39.922+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
184	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:39.934+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
185	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:39.946+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
186	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:39.956+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
187	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:39.967+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
188	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:37:39.979+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
189	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:29.572+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
190	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:29.59+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
191	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:29.613+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
192	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:29.627+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
193	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:29.644+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
194	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:29.66+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
195	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:35.104+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
196	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:35.13+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
197	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:35.147+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
198	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:35.166+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
199	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:35.181+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
200	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:35.2+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
201	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:36.634+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
202	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:36.654+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
203	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:36.669+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
204	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:36.683+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
205	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:36.695+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
206	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:36.707+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
207	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:38.915+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
208	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:38.93+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
209	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:38.944+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
210	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:38.957+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
211	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:38.968+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
212	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:38.986+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
213	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:44.483+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
214	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:44.505+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
215	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:44.518+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
216	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:44.532+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
217	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:44.542+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
218	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:44.554+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
219	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:48.035+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
220	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:48.05+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
221	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:48.062+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
222	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:48.075+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
223	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:48.085+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
224	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:48.095+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
225	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:55.847+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
226	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:55.863+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
227	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:55.877+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
228	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:55.89+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
229	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:55.903+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
230	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:41:55.915+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
231	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:01.868+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
232	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:01.883+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
233	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:01.899+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
234	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:01.912+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
235	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:01.926+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
236	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:01.94+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
237	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:03.669+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
238	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:03.684+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
239	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:03.697+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
240	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:03.708+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
241	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:03.721+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
242	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:03.732+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
243	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:07.792+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
244	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:07.807+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
245	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:07.821+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
246	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:07.834+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
247	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:07.847+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
248	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:07.859+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
249	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:14.151+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
250	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:14.164+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
251	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:14.177+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
252	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:14.19+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
253	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:14.201+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
254	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:14.213+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
255	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:50.16+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
256	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:50.18+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
257	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:50.193+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
258	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:50.208+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
259	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:50.232+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
260	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:42:50.246+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
261	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:43:46.498+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
262	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:43:46.512+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
263	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:43:46.525+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
264	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:43:46.536+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
265	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:43:46.55+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
266	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:43:46.563+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
267	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:21.399+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
268	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:21.416+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
269	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:21.427+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
270	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:21.44+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
271	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:21.454+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
272	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:21.466+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
273	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:39.359+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
274	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:39.378+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
275	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:39.39+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
276	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:39.403+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
277	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:39.415+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
278	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:39.434+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
279	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:44.431+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
280	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:44.452+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
281	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:44.465+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
282	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:44.48+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
283	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:44.492+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
284	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:44.505+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
285	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:50.357+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
286	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:50.376+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
287	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:50.388+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
288	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:50.398+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
289	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:50.41+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
290	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:52:50.424+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
291	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:03.845+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
292	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:03.857+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
293	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:03.872+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
294	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:03.883+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
295	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:03.895+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
296	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:03.905+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
297	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:11.207+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
298	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:11.221+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
299	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:11.235+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
300	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:11.246+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
301	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:11.257+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
302	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:11.271+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
303	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:14.319+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
304	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:14.337+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
305	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:14.353+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
306	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:14.366+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
307	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:14.376+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
308	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:14.388+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
309	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:18.808+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
310	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:18.824+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
311	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:18.835+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
312	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:18.845+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
313	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:18.856+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
314	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:18.867+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
315	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:33.318+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
316	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:33.337+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
317	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:33.347+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
318	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:33.358+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
319	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:33.369+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
320	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:33.378+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
321	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:39.682+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
322	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:47.424+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
323	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:47.44+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
324	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:47.453+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
325	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:47.465+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
326	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:47.479+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
327	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:47.493+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
328	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:49.502+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
329	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:49.516+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
330	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:49.53+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
331	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:49.541+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
332	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:49.554+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
333	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:49.568+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
334	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:51.075+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
335	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:51.089+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
336	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:51.103+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
337	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:51.116+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
338	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:51.128+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
339	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:53:51.143+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
340	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:09.616+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
341	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:09.629+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
342	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:09.643+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
343	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:09.658+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
344	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:09.671+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
345	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:09.681+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
346	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:14.129+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
347	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:14.143+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
348	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:14.154+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
349	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:14.166+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
350	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:14.175+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
351	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:14.185+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
352	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:18.532+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
353	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:18.551+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
354	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:18.564+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
355	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:18.576+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
356	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:18.586+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
357	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:18.597+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
358	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:21.112+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
359	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:21.127+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
360	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:21.143+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
361	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:21.156+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
362	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:21.169+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
363	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 09:54:21.181+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
364	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:02:58.168+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
365	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:06:01.586+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
366	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:06:01.603+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
367	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:06:01.616+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
368	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:06:01.629+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
369	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:06:01.644+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
370	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:06:00.49+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
371	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:06:00.502+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
372	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:06:10.704+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
373	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:06:10.72+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
374	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:06:10.736+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
375	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:06:10.748+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
376	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:06:10.764+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
377	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:06:10.78+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
378	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:06:10.797+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
379	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:10:41.604+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
380	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:10:41.623+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
381	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:10:41.637+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
382	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:10:41.648+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
383	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:10:41.66+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
384	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:10:41.669+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
385	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:10:41.683+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
386	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:10:53.322+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
387	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:10:53.339+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
388	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:10:53.352+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
389	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:10:53.363+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
390	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:10:53.374+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
391	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:10:53.387+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
392	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:10:53.399+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
393	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:11:16.785+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	16	http://localhost:3000
394	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:11:41.163+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	16	http://localhost:3000
395	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:34:50.531+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	10	http://localhost:3000
396	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:34:58.086+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
397	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:34:58.111+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
398	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:34:58.132+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
399	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:34:58.146+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
400	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:34:58.165+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
401	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:34:58.179+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
402	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:35:13.201+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	12	http://localhost:3000
403	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:35:59.451+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
404	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:35:59.464+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
405	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:35:59.476+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
406	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:35:59.487+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
407	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:35:59.502+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
408	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:12.441+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
409	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:12.465+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
410	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:12.475+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
411	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:12.483+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
412	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:12.494+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
413	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:18.3+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
414	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:18.314+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
415	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:18.327+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
416	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:18.342+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
417	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:18.355+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
418	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:26.951+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
419	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:26.965+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
420	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:26.98+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
421	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:26.994+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
422	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:27.005+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
423	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:40.063+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
424	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:40.082+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
425	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:40.097+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
426	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:40.107+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
427	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:40.119+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
428	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:45.005+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	4	http://localhost:3000
429	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:52.266+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
430	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:52.284+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
431	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:52.297+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
432	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:48:52.31+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
433	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:49:06.154+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
434	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:49:06.171+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
435	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:49:06.182+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
436	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:49:06.194+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
437	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:49:43.803+00	172.20.0.1	node	directus_fields	24	\N
438	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:49:43.817+00	172.20.0.1	node	directus_fields	25	\N
439	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:49:43.837+00	172.20.0.1	node	directus_fields	26	\N
440	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:49:43.85+00	172.20.0.1	node	directus_collections	site_settings	\N
441	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:50:01.58+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
442	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:50:01.593+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
443	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:50:01.603+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
444	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:50:01.615+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
445	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:50:10.481+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
446	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:50:10.495+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
447	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:50:10.508+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
448	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:50:10.522+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
449	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:50:22.238+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
450	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:50:22.252+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
451	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:50:22.266+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
452	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:50:22.277+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
453	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:50:33.076+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
454	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:50:33.089+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
455	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:50:33.1+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
456	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:50:33.113+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
457	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:57:15.836+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	f44cf8c9-70d9-44c6-9c82-b0b24193201e	http://localhost:3000
458	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:57:20.481+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
459	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:57:51.71+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
460	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:00:04.923+00	172.20.0.1	curl/8.5.0	site_settings	1	\N
461	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:02:58.608+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	65a600a9-709c-4161-b530-e4bd101f41d4	http://localhost:3000
462	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:03:03.296+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
463	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:03:39.8+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
464	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:05:10.195+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
467	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:22:45.155+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
1243	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:24.341+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	11	http://localhost:3000
1245	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:24.363+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	9	http://localhost:3000
1247	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.073+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	10	http://localhost:3000
1249	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.112+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	8	http://localhost:3000
1252	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.145+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	15	http://localhost:3000
1259	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.265+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	20	http://localhost:3000
1279	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:15.571+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	14	http://localhost:3000
1281	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:15.61+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	16	http://localhost:3000
1291	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:19.836+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	19	http://localhost:3000
465	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:05:35.065+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
466	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:10:41.894+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
468	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:22:51.378+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
469	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:26:07.617+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
470	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:27:00.874+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
471	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:27:05.154+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
472	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:28:41.855+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
473	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:33:06.075+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
474	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:38:30.527+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
475	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:43:05.853+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	86f0ff79-a241-44b4-abf9-8f8f78ff16c8	http://localhost:3000
476	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:43:07.124+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
477	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:43:15.898+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
478	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:43:56.32+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
479	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:44:02.271+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
480	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:44:09.522+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	fcf6aa00-8857-44ed-a24a-f2da8cfe365e	http://localhost:3000
481	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:44:10.874+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
482	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:44:25.585+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
483	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:46:30.199+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
484	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:48:44.977+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
485	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 12:06:15.393+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	14	http://localhost:3000
486	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 12:06:32.896+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	13	http://localhost:3000
487	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 12:08:16.935+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	11	http://localhost:3000
488	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 12:08:16.937+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	15	http://localhost:3000
489	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 12:15:08.253+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
490	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 12:15:56.892+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
491	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 12:21:43.052+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
492	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 12:24:20.89+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
493	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 12:27:46.258+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
494	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 12:28:04.525+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
495	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 12:28:24.123+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
496	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 13:27:03.948+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
497	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 13:27:03.975+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	names	http://localhost:8055
498	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 13:27:27.04+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
499	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 13:27:39.08+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
1244	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:24.349+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	10	http://localhost:3000
1248	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.102+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	11	http://localhost:3000
1251	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.133+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	13	http://localhost:3000
1257	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.225+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	12	http://localhost:3000
1263	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.305+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	24	http://localhost:3000
1265	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:57:18.967+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	8	http://localhost:3000
1266	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:57:22.178+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	8	http://localhost:3000
1282	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:15.621+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	17	http://localhost:3000
1292	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:19.839+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	17	http://localhost:3000
1246	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.053+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	9	http://localhost:3000
1250	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.128+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	7	http://localhost:3000
1253	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.151+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	14	http://localhost:3000
1258	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.244+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	19	http://localhost:3000
1264	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.328+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	25	http://localhost:3000
1283	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:15.623+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	19	http://localhost:3000
1290	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:19.829+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	16	http://localhost:3000
508	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 13:40:36.137+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	cc319834-98cf-4844-a39f-97ab752db515	http://localhost:3000
509	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 13:40:37.291+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
1295	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:19.882+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	18	http://localhost:3000
511	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 13:52:44.463+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	names	http://localhost:8055
512	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:28.747+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
513	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:28.778+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
514	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:28.794+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
515	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:28.809+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
516	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:28.821+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
517	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:35.703+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
518	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:35.721+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
519	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:35.742+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
520	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:35.759+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
521	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:35.774+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
522	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:41.989+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
523	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:42.026+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
524	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:42.047+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
525	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:42.065+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
526	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:42.08+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
527	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:46.293+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
528	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:46.31+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
529	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:46.327+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
530	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:46.341+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
531	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:46.353+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
532	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:53.81+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
533	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:53.831+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
534	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:53.848+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
535	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:53.862+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
536	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:00:53.876+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
1254	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.168+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	16	http://localhost:3000
1260	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.269+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	22	http://localhost:3000
1285	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:15.662+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	21	http://localhost:3000
540	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:34:59.929+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_translations	37fc6834-8433-4a3d-9b9c-a72b55f45c5b	http://localhost:8055
541	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:35:02.326+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
542	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:35:26.841+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_translations	5c14aa45-c4c1-4f46-a806-476a7f451607	http://localhost:8055
543	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:35:28.132+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
544	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:36:28.07+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	names	http://localhost:8055
545	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:37:02.312+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
546	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:38:19.6+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
1288	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:19.827+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	14	http://localhost:3000
548	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:40:14.302+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
549	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:40:14.32+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
550	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:40:14.333+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
551	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:40:14.346+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
552	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 14:40:14.36+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
1294	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:19.878+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	20	http://localhost:3000
1297	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:58:45.926+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	10	http://localhost:3000
556	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:27:13.927+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
557	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:27:29.709+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
558	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:40.053+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
559	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:40.079+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
560	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:40.095+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
561	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:40.107+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
562	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:40.127+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
563	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:42.798+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
564	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:42.82+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
565	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:42.84+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
566	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:42.854+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
567	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:42.871+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
568	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:44.402+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
569	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:44.424+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
570	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:44.446+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
571	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:44.465+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
572	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:44.482+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
573	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:45.856+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
574	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:45.87+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
575	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:45.891+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
576	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:45.907+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
577	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:45.929+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
578	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:49.349+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
579	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:49.371+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
580	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:49.385+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
581	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:49.403+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
582	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:31:49.42+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
583	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:32:12.197+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
585	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:32:35.913+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
586	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:32:58.378+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
587	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:32:58.393+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
588	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:32:58.408+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
589	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:32:58.424+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
590	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:32:58.44+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
591	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:33:12.17+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
592	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:33:12.187+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
593	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:33:12.212+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
594	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:33:12.226+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
595	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:33:12.24+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
597	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:36:32.427+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
599	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:36:56.152+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
600	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:36:56.179+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
601	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:36:56.196+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
602	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:36:56.208+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
603	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:36:56.226+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
604	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:36:57.956+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
605	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:36:57.979+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
584	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:32:21.476+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
596	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:36:22.982+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
598	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:36:46.99+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
610	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:29.039+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
611	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:29.058+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
612	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:29.073+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
613	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:29.092+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
614	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:29.111+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
615	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:31.578+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
616	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:31.594+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
617	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:31.626+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
618	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:31.647+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
619	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:31.66+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
620	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:33.549+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
621	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:33.563+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
622	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:33.583+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
623	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:33.595+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
624	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:33.613+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
625	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:34.866+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
626	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:34.882+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
627	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:34.897+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
628	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:34.908+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
629	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:34.921+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
630	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:36.713+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
631	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:36.73+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
632	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:36.744+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
633	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:36.757+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
634	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:36.773+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
635	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:43.904+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
636	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:43.935+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
637	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:43.954+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
638	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:43.963+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
639	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:43.977+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
640	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:45.361+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
606	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:36:57.995+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
607	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:36:58.009+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
608	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:36:58.024+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
609	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:10.008+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
1255	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.19+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	18	http://localhost:3000
1261	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.292+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	21	http://localhost:3000
1286	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:15.664+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	18	http://localhost:3000
1287	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:47:19.818+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	9	http://localhost:3000
641	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:45.377+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
642	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:45.391+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
643	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:45.405+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
644	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:45.415+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
645	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:47.558+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
646	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:47.574+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
647	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:47.591+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
648	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:47.603+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
649	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:47.616+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
650	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:48.996+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
651	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:49.011+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
652	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:49.026+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
653	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:49.043+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
654	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:49.054+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
655	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:50.205+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
656	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:50.219+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
657	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:50.234+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
658	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:50.247+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
659	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:37:50.261+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
660	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:38:47.217+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
661	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:38:52.321+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
662	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:43:15.195+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
663	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:43:21.676+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
664	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:37.247+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
665	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:37.269+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
666	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:37.288+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
667	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:37.31+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
668	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:37.336+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
669	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:38.466+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
670	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:38.481+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
671	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:38.496+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
672	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:38.51+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
673	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:38.523+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
674	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:39.438+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
675	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:39.451+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
676	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:39.461+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
677	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:39.472+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
678	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:39.482+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
679	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:40.652+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
680	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:40.661+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
681	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:40.671+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
682	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:40.679+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
683	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:40.687+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
684	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:43.484+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
685	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:43.501+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
686	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:43.525+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
687	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:43.536+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
688	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:43.549+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
689	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:45.089+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
690	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:45.105+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
691	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:45.126+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
692	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:45.157+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
693	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:45.174+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
694	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:46.062+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
695	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:46.077+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
696	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:46.094+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
697	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:46.106+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
698	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:46.121+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
699	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:47.094+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
700	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:47.111+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
701	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:47.127+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
702	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:47.139+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
703	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:44:47.15+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
704	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:49:50.859+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
705	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:49:50.88+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
706	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:49:50.913+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
707	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:49:50.938+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
708	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:49:50.963+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
709	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:49:52.837+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
710	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:49:52.855+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
711	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:49:52.867+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
712	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:49:52.875+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
713	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:49:52.882+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
714	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:49:54.903+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
715	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:49:54.916+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
716	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:49:54.934+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
717	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:49:54.95+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
718	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:49:54.963+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
734	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:51:19.221+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
735	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:51:19.387+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
1256	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.201+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	17	http://localhost:3000
1262	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:56:31.301+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	23	http://localhost:3000
1296	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:58:45.925+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	9	http://localhost:3000
1298	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 19:15:13.149+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	24	http://localhost:3000
1299	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 19:15:14.065+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	24	http://localhost:3000
1300	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 19:15:17.563+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	24	http://localhost:3000
1301	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 19:15:18.427+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	24	http://localhost:3000
1302	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 19:15:24.426+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	24	http://localhost:3000
1304	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 19:15:28.25+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	24	http://localhost:3000
719	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:50:05.533+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
720	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:50:05.548+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
721	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:50:05.564+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
722	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:50:05.577+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
723	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:50:05.588+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
724	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:50:09.783+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
725	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:50:09.795+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
726	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:50:09.807+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
727	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:50:09.823+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
728	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:50:09.836+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
729	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:50:16.505+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	20	http://localhost:3000
730	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:50:16.525+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	19	http://localhost:3000
731	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:50:16.537+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
732	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:50:16.547+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
733	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:50:16.558+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
736	login	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:21.077+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_users	e7c14f87-5452-4b00-b431-3d407c9dceaa	http://localhost:8055
737	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:38.046+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	names	http://localhost:8055
738	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:38.061+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
739	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:38.064+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
740	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:38.067+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
741	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:47.665+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	jobs	http://localhost:8055
742	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:47.674+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	1	http://localhost:8055
743	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:47.678+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	2	http://localhost:8055
744	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:47.683+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	3	http://localhost:8055
745	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:50.972+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	employees	http://localhost:8055
746	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:50.981+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	17	http://localhost:8055
747	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:50.983+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	18	http://localhost:8055
748	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:50.988+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	19	http://localhost:8055
749	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:50.993+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	20	http://localhost:8055
750	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:56.403+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Jobs	http://localhost:8055
751	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:56.414+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	7	http://localhost:8055
752	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:56.417+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	8	http://localhost:8055
753	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:53:56.421+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	9	http://localhost:8055
754	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:54:25.547+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	18	http://localhost:3000
755	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:54:28.034+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	21	http://localhost:3000
756	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:57:46.187+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
757	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:57:46.205+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Structures	http://localhost:8055
758	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:58:04.935+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
759	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:58:04.947+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Jobs	http://localhost:8055
760	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:58:16.031+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Categories	http://localhost:8055
761	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:58:16.054+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Jobs	http://localhost:8055
762	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:58:16.078+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	menu_items	http://localhost:8055
763	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:58:16.096+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	site_settings	http://localhost:8055
764	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:58:16.115+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Structures	http://localhost:8055
765	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:58:18.527+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Categories	http://localhost:8055
766	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:58:18.543+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	menu_items	http://localhost:8055
767	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:58:18.56+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	site_settings	http://localhost:8055
768	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:58:18.577+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Structures	http://localhost:8055
769	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:58:18.595+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Jobs	http://localhost:8055
770	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:58:33.865+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
771	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:58:33.88+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Departments	http://localhost:8055
772	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:58:46.765+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
773	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:58:46.787+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Employees	http://localhost:8055
774	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:59:03.622+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
775	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:59:03.634+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Calendars	http://localhost:8055
776	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:59:10.744+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Categories	http://localhost:8055
777	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:59:10.764+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	menu_items	http://localhost:8055
778	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:59:10.783+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	site_settings	http://localhost:8055
779	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:59:10.802+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Structures	http://localhost:8055
780	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:59:10.821+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Jobs	http://localhost:8055
781	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:59:10.841+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Departments	http://localhost:8055
782	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:59:10.857+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Employees	http://localhost:8055
783	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 17:59:10.872+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Calendars	http://localhost:8055
784	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 18:00:18.021+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
785	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 18:01:08.421+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Structures	http://localhost:8055
786	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:01:44.048+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	37	http://localhost:8055
787	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:01:58.971+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	38	http://localhost:8055
788	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:02:24.363+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	37	http://localhost:8055
789	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:10:05.796+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	38	http://localhost:8055
790	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:10:55.003+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	39	http://localhost:8055
791	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:11:14.998+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	39	http://localhost:8055
792	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:12:14.253+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	40	http://localhost:8055
793	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:12:37.973+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	40	http://localhost:8055
794	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:13:50.013+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	41	http://localhost:8055
795	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:14:15.428+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	41	http://localhost:8055
796	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:17:31.134+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	42	http://localhost:8055
797	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:17:52.964+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	42	http://localhost:8055
798	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:18:52.74+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	1	http://localhost:3000
799	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:20:02.493+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	2	http://localhost:3000
800	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:22:39.045+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	1	http://localhost:3000
801	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:22:44.731+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	3	http://localhost:3000
802	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:23:15.831+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	3	http://localhost:3000
803	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:23:29.957+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	1	http://localhost:3000
804	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:23:41.716+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	1	http://localhost:3000
805	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:24:34.252+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	2	http://localhost:3000
806	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:27:38.433+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	1	http://localhost:3000
807	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:28:17.165+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	1	http://localhost:3000
808	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:28:20.256+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	3	http://localhost:3000
809	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:35:55.648+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
810	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:36:01.621+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
811	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:36:07.186+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
812	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:36:10.962+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
813	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:36:15.098+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
814	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:38:41.061+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
815	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:38:43.437+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
816	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:38:48.365+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
817	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:38:49.846+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
818	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:42:52.551+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
819	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:42:54.684+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
820	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:46:03.292+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
821	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:46:06.191+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
822	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:52:41.43+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	5	http://localhost:3000
823	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:52:52.737+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
824	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:52:52.748+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	5	http://localhost:3000
825	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:52:58.653+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	5	http://localhost:3000
826	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:52:58.654+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
827	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:53:22.447+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	5	http://localhost:3000
828	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:53:22.448+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
829	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:53:23.825+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
830	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:53:23.826+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	5	http://localhost:3000
831	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 19:53:36.925+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	5	http://localhost:3000
832	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:06:29.457+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
833	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:06:30.317+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
834	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:10:15.311+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	5	http://localhost:3000
835	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:12:41.985+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	5	http://localhost:3000
836	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:27:11.142+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	43	http://localhost:8055
837	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:27:11.149+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	designations	http://localhost:8055
838	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:27:42.109+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	44	http://localhost:8055
839	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:28:00.741+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	designations	http://localhost:8055
840	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:28:16.497+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	44	http://localhost:8055
841	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:28:44.919+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	45	http://localhost:8055
842	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:29:14.183+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	46	http://localhost:8055
843	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:30:14.607+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
844	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:35:31.139+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	1	http://localhost:3000
845	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:35:40.093+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	1	http://localhost:3000
846	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:35:47.292+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	1	http://localhost:3000
847	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:35:53.216+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	1	http://localhost:3000
848	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:40:34.073+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	5	http://localhost:3000
849	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:40:59.257+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	6	http://localhost:3000
850	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:41:03.947+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	6	http://localhost:3000
851	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:41:04.728+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	4	http://localhost:3000
852	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:43:03.223+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	2	http://localhost:3000
853	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:49:47.593+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	47	http://localhost:8055
854	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:49:47.599+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	job_types	http://localhost:8055
855	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:49:59.82+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	48	http://localhost:8055
856	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:50:16.86+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	49	http://localhost:8055
857	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:50:29.158+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	50	http://localhost:8055
858	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:51:08.071+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	51	http://localhost:8055
859	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:51:08.077+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	job_axes	http://localhost:8055
860	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:51:21.861+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	52	http://localhost:8055
861	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:51:30.764+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	53	http://localhost:8055
862	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:51:42.945+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	54	http://localhost:8055
863	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 20:59:20.527+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_types	1	http://localhost:3000
864	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:02:52.066+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_axes	1	http://localhost:3000
865	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:03:36.789+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_axes	2	http://localhost:3000
866	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:03:52.166+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	2	http://localhost:3000
867	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:03:56.072+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_types	1	http://localhost:3000
868	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:04:00.048+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_axes	1	http://localhost:3000
869	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:04:01.885+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_axes	2	http://localhost:3000
870	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:07:27.629+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	3	http://localhost:3000
871	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:07:47.293+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	4	http://localhost:3000
872	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:07:50.806+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	3	http://localhost:3000
873	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:07:50.816+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	4	http://localhost:3000
874	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:24:51.309+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
875	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:28:13.533+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	55	http://localhost:8055
876	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:28:36.087+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	56	http://localhost:8055
877	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:28:57.188+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	57	http://localhost:8055
878	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:29:11.413+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	58	http://localhost:8055
879	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:29:34.23+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	59	http://localhost:8055
880	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:44:58.219+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
881	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:48:18.005+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_axes	3	http://localhost:3000
882	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:48:36.619+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_axes	3	http://localhost:3000
883	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:51:12.563+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	5	http://localhost:3000
884	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:52:53.356+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_types	2	http://localhost:3000
885	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:54:31.233+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employees	1	http://localhost:3000
886	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:55:18.522+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employees	1	http://localhost:3000
887	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 21:57:30.532+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	5	http://localhost:3000
888	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 02:52:35.868+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	6	http://localhost:3000
889	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 02:52:40.789+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	7	http://localhost:3000
893	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 02:53:27.444+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employees	3	http://localhost:3000
894	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 02:53:35.251+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	6	http://localhost:3000
896	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:33.533+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
897	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:47.699+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
898	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:47.719+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
899	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:47.733+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
900	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:47.745+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
901	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:47.758+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
902	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:52.548+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
903	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:52.562+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
904	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:52.581+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
905	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:52.593+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
906	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:52.603+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
907	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:53.717+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
908	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:53.731+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
909	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:53.744+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
910	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:53.756+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
911	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:53.765+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
912	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:54.788+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
913	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:54.825+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
914	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:54.843+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
915	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:54.854+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
916	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:02:54.864+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
1267	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:00:10.208+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Assignments	6	http://localhost:3000
1268	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:00:13.41+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	11	http://localhost:3000
1269	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:00:16.047+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	11	http://localhost:3000
1303	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 19:15:24.429+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	25	http://localhost:3000
1305	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 19:15:28.253+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	25	http://localhost:3000
890	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 02:52:48.842+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employees	2	http://localhost:3000
891	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 02:53:21.52+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employees	3	http://localhost:3000
892	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 02:53:27.442+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employees	2	http://localhost:3000
895	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 02:53:35.277+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	7	http://localhost:3000
917	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:06:04.024+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	60	http://localhost:8055
918	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:13:46.168+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	60	http://localhost:8055
919	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:15:25.46+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	61	http://localhost:8055
920	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:16:06.093+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	62	http://localhost:8055
921	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:16:52.192+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	63	http://localhost:8055
922	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:17:38.24+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	64	http://localhost:8055
923	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:30:38.547+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	65	http://localhost:8055
924	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:31:22.374+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	66	http://localhost:8055
925	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:39:04.087+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_types	2	http://localhost:3000
926	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:52:55.201+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	7	http://localhost:3000
927	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:53:49.15+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	8	http://localhost:3000
928	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:54:06.467+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	9	http://localhost:3000
929	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:54:29.999+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	10	http://localhost:3000
930	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:54:38.989+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	9	http://localhost:3000
931	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:55:01.443+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	11	http://localhost:3000
932	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:55:27.177+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	12	http://localhost:3000
933	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:55:43.218+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	10	http://localhost:3000
934	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:56:15.249+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	13	http://localhost:3000
935	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:56:55.511+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	11	http://localhost:3000
936	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:57:00.553+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	11	http://localhost:3000
937	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:57:12.22+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	13	http://localhost:3000
938	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:57:12.246+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	8	http://localhost:3000
939	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:57:12.276+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	9	http://localhost:3000
940	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:57:12.329+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	10	http://localhost:3000
941	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:57:12.332+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	7	http://localhost:3000
942	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:57:12.34+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	11	http://localhost:3000
943	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:57:12.388+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	12	http://localhost:3000
944	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:57:15.708+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	7	http://localhost:3000
945	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:57:15.717+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	9	http://localhost:3000
946	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:57:15.719+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	10	http://localhost:3000
947	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:57:15.731+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	12	http://localhost:3000
1270	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:01:12.287+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Assignments	6	http://localhost:3000
1271	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:01:21.584+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Qualifications	5	http://localhost:3000
1272	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:01:37.323+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	11	http://localhost:3000
948	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:57:15.733+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	8	http://localhost:3000
949	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:57:15.741+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	11	http://localhost:3000
974	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:09:55.231+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employees	4	http://localhost:3000
975	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:10:03.919+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employees	4	http://localhost:3000
976	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:10:05.045+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employees	4	http://localhost:3000
1273	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:19:13.654+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	11	http://localhost:3000
950	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:57:15.813+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	13	http://localhost:3000
951	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:57:43.89+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	14	http://localhost:3000
952	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:58:01.481+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	15	http://localhost:3000
953	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:58:20.501+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	16	http://localhost:3000
954	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:58:48.781+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	17	http://localhost:3000
955	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 03:59:07.641+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	18	http://localhost:3000
956	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:00:59.467+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	19	http://localhost:3000
957	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:01:31.23+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	20	http://localhost:3000
958	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:01:52.637+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	21	http://localhost:3000
959	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:02:50.358+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	22	http://localhost:3000
960	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:03:11.371+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	23	http://localhost:3000
961	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:03:31.712+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	24	http://localhost:3000
962	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:03:58.234+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	25	http://localhost:3000
963	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:04:58.648+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	8	http://localhost:3000
964	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:05:29.18+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_types	3	http://localhost:3000
965	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:05:37.283+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_types	4	http://localhost:3000
966	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:06:05.693+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_types	5	http://localhost:3000
967	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:06:15.373+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_types	5	http://localhost:3000
968	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:06:17.82+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_types	5	http://localhost:3000
969	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:08:01.354+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_axes	4	http://localhost:3000
970	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:08:10.347+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_axes	5	http://localhost:3000
971	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:08:19.039+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_axes	6	http://localhost:3000
972	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:08:39.63+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	job_axes	7	http://localhost:3000
973	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:09:28.87+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	9	http://localhost:3000
977	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:14:12.79+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Departments	1	http://localhost:3000
978	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:14:35.279+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Departments	2	http://localhost:3000
979	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:16:14.972+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Departments	1	http://localhost:3000
980	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:16:33.435+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Departments	2	http://localhost:3000
981	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:18:35.816+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	8f81e039-1f0c-4af8-a58c-fcc5d427bbf8	http://localhost:3000
982	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:18:50.059+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	d85b8759-9e00-408b-ab09-a5afcf159a60	http://localhost:3000
983	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:18:51.621+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
984	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:20:14.179+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	7	http://localhost:3000
985	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:20:37.668+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	7	http://localhost:3000
986	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:38:54.091+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	8	http://localhost:3000
987	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:38:54.849+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	designations	8	http://localhost:3000
988	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:39:09.583+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	7	http://localhost:3000
989	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:39:20.653+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Departments	2	http://localhost:3000
990	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:39:48.851+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Departments	2	http://localhost:3000
991	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:44:29.68+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	7	http://localhost:3000
992	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:59:59.987+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	7	http://localhost:3000
993	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 05:00:14.007+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	7	http://localhost:3000
994	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 05:00:40.626+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	b61087ae-779d-46bc-9f06-99f480a4bab6	http://localhost:3000
995	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 05:00:41.658+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	site_settings	1	http://localhost:3000
996	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 05:53:28.343+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Departments	2	http://localhost:3000
997	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 05:53:35.321+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Departments	2	http://localhost:3000
998	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 05:54:08.268+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Departments	2	http://localhost:3000
999	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 05:59:46.723+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	67	http://localhost:8055
1000	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 05:59:46.731+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Personnel	http://localhost:8055
1001	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:00:07.173+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	68	http://localhost:8055
1002	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:00:19.482+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	69	http://localhost:8055
1003	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:00:38.198+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	70	http://localhost:8055
1004	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:00:51.349+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	71	http://localhost:8055
1005	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:02:25.906+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	72	http://localhost:8055
1006	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:03:20.105+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	73	http://localhost:8055
1007	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:03:33.373+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	74	http://localhost:8055
1008	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:08:31.968+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	26	http://localhost:3000
1009	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:08:45.337+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	27	http://localhost:3000
1010	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:08:50.477+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	27	http://localhost:3000
1011	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:08:55.551+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	26	http://localhost:3000
1012	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:09:06.198+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	26	http://localhost:3000
1013	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:09:06.23+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	13	http://localhost:3000
1014	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:09:10.091+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	26	http://localhost:3000
1015	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:09:10.113+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	9	http://localhost:3000
1016	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:09:53.036+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	26	http://localhost:3000
1017	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:09:53.038+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	7	http://localhost:3000
1018	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:09:55.067+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	26	http://localhost:3000
1019	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:10:19.447+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	7	http://localhost:3000
1020	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:12:55.064+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Departments	2	http://localhost:3000
1021	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:44:07.778+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	75	http://localhost:8055
1022	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:44:53.517+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	76	http://localhost:8055
1023	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:45:13.991+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	76	http://localhost:8055
1024	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:45:45.304+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	77	http://localhost:8055
1025	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:46:49.818+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	78	http://localhost:8055
1026	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 06:47:12.028+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	79	http://localhost:8055
1027	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:10:40.485+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	80	http://localhost:8055
1028	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:10:40.495+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Employee_Qualifications	http://localhost:8055
1029	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:12:08.958+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	81	http://localhost:8055
1030	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:12:33.971+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	82	http://localhost:8055
1031	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:12:46.324+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	83	http://localhost:8055
1032	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:13:48.149+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	84	http://localhost:8055
1033	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:14:05.704+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	85	http://localhost:8055
1034	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:14:40.662+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	86	http://localhost:8055
1035	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:16:23.61+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	87	http://localhost:8055
1036	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:17:06.199+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	88	http://localhost:8055
1037	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:17:06.213+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Employee_Assignments	http://localhost:8055
1038	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:18:04.392+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	89	http://localhost:8055
1039	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:18:21.887+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	90	http://localhost:8055
1040	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:18:40.862+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	91	http://localhost:8055
1041	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:19:03.375+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	92	http://localhost:8055
1042	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:19:22.396+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	93	http://localhost:8055
1043	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:19:55.579+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	94	http://localhost:8055
1044	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:20:16.645+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	95	http://localhost:8055
1045	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:20:29.305+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	96	http://localhost:8055
1046	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:21:28.762+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	97	http://localhost:8055
1047	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:22:27.116+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	98	http://localhost:8055
1048	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:22:27.406+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	99	http://localhost:8055
1049	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:22:27.422+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	Employee_Assignments_undefined	http://localhost:8055
1050	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:22:27.552+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	100	http://localhost:8055
1051	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:22:27.766+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	101	http://localhost:8055
1052	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:22:28.013+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	102	http://localhost:8055
1053	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:04.798+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1054	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:26.089+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1055	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:26.107+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
1056	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:26.125+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
1057	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:26.141+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
1058	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:26.16+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
1059	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:26.178+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
1060	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:33.164+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1061	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:33.181+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
1062	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:33.199+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
1063	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:33.217+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
1064	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:33.231+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
1065	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:33.245+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
1066	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:38.874+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1067	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:38.889+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
1068	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:38.905+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
1069	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:38.92+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
1070	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:38.933+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
1071	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:38.951+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
1072	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:43.058+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
1073	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:43.076+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
1074	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:43.092+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1075	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:43.112+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
1076	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:43.128+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
1077	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:43.141+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
1078	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:45.245+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
1079	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:45.262+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
1080	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:45.283+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
1081	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:45.301+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1082	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:45.32+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
1083	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:45.34+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
1084	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:47.987+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
1085	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:48.003+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
1086	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:48.026+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
1087	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:48.042+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
1088	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:48.056+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1089	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:48.067+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
1090	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:50.254+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
1091	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:50.276+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
1092	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:50.3+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
1093	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:50.327+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
1094	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:50.356+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
1095	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:50.392+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1096	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:32:57.67+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1274	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:21:00.488+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	11	http://localhost:3000
1275	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 18:21:01.408+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	11	http://localhost:3000
1097	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:07.291+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1098	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:13.906+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1099	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:13.922+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
1100	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:13.943+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
1101	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:13.967+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
1102	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:13.98+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
1103	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:13.994+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
1104	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:17.784+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
1105	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:17.798+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
1106	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:17.813+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1107	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:17.825+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
1108	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:17.838+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
1109	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:17.854+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
1110	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:22.375+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
1111	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:22.389+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
1112	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:22.405+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
1113	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:22.42+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1114	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:22.432+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
1115	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:22.444+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
1116	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:24.819+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
1117	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:24.833+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
1118	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:24.85+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
1119	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:24.862+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
1120	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:24.875+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1121	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:24.888+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
1122	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:25.936+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
1123	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:25.949+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
1124	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:25.966+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
1125	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:25.979+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
1126	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:25.995+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
1127	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:26.008+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1128	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:33:36.21+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1129	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:51:49.762+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	1	http://localhost:3000
1130	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:57:32.062+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	1	http://localhost:3000
1131	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 07:57:37.422+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	1	http://localhost:3000
1132	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 08:03:55.371+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	1	http://localhost:3000
1133	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 08:03:57.883+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	1	http://localhost:3000
1134	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 08:05:28.179+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	1	http://localhost:3000
1135	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 08:24:32.169+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	cbbb373a-12aa-4c05-9530-c1326ee5faf3	http://localhost:3000
1136	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 08:24:32.381+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Qualifications	1	http://localhost:3000
1137	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 08:25:36.322+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Assignments	1	http://localhost:3000
1138	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 08:26:57.46+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	1	http://localhost:3000
1139	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 08:28:27.01+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	2	http://localhost:3000
1140	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 08:39:43.655+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	6968e25f-66d4-4ce1-8e96-586c4d6b44c1	http://localhost:3000
1141	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 08:39:43.775+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Assignments	2	http://localhost:3000
1142	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 08:40:03.979+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	8f862860-719a-4681-8c2a-b9f1cf56bfd5	http://localhost:3000
1143	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 08:40:04.373+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Qualifications	2	http://localhost:3000
1144	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 09:15:23.637+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	9d97982c-5fe1-4924-9e0b-be59a42ed96c	http://localhost:3000
1145	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 09:29:25.571+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	65eabde8-cef7-4d36-b09c-1f80a263197e	http://localhost:3000
1146	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 09:29:25.642+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Assignments	2	http://localhost:3000
1147	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 09:29:35.556+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	dcd58de7-33b3-41a9-bf5a-f1166cb55b68	http://localhost:3000
1148	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 09:29:35.629+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Qualifications	2	http://localhost:3000
1149	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 10:16:57.659+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Assignments	2	http://localhost:3000
1150	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 10:17:02.815+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Qualifications	2	http://localhost:3000
1151	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 10:28:35.848+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	03fe1ecb-a9dc-4bde-9dc1-ec7994fe2f1b	http://localhost:3000
1152	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 10:28:35.971+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Qualifications	3	http://localhost:3000
1153	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 10:29:20.728+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	d853e0b9-748f-41b6-8894-54087f864138	http://localhost:3000
1154	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 10:29:20.818+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Assignments	3	http://localhost:3000
1155	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 10:36:29.255+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	0fe6bf52-9b16-48cf-9b6f-1e3f92fa453e	http://localhost:3000
1156	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 10:36:29.35+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Assignments	3	http://localhost:3000
1157	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 10:44:25.89+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	79df7045-f15b-46f4-bc0c-8831047c70af	http://localhost:3000
1158	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 10:44:26.241+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Assignments	3	http://localhost:3000
1159	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:03:36.369+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	3	http://localhost:3000
1160	login	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:12:37.77+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_users	e7c14f87-5452-4b00-b431-3d407c9dceaa	http://localhost:8055
1161	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:15:02.917+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	4	http://localhost:3000
1162	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:15:10.874+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	4	http://localhost:3000
1163	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:26:33.35+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Assignments	3	http://localhost:3000
1164	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:26:37.859+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Qualifications	3	http://localhost:3000
1165	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:26:47.575+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	2	http://localhost:3000
1166	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:27:00.993+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	2	http://localhost:3000
1167	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:27:10.367+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	2	http://localhost:3000
1168	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:33:29.956+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	2	http://localhost:3000
1169	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:33:37.38+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	4	http://localhost:3000
1170	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:33:37.382+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	3	http://localhost:3000
1171	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:34:42.733+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	5	http://localhost:3000
1172	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:34:50.219+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	6	http://localhost:3000
1173	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:34:57.167+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	5	http://localhost:3000
1174	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:34:57.169+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	6	http://localhost:3000
1175	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:37:26.961+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	7	http://localhost:3000
1176	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:37:33.32+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	7	http://localhost:3000
1177	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:38:19.298+00	172.20.0.1	curl/8.5.0	Personnel	14	\N
1178	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:42:35.884+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	8	http://localhost:3000
1179	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:44:01.167+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employees	5	http://localhost:3000
1180	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:44:13.453+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	8	http://localhost:3000
1181	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:55:09.447+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	8	http://localhost:3000
1182	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:55:15.081+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	8	http://localhost:3000
1183	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:55:25.686+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	8	http://localhost:3000
1184	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 11:55:44.518+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	9	http://localhost:3000
1185	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 14:58:56.597+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Structures	26	http://localhost:3000
1186	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 15:05:38.769+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	9	http://localhost:3000
1187	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 15:06:07.651+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	6e09e2ae-824f-4b34-9395-5f5350dc5e75	http://localhost:3000
1188	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 15:06:17.258+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	5c1c0582-3580-4498-bfb7-d4df3e6913ea	http://localhost:3000
1189	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 15:06:35.331+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	34ae60de-0f1b-45b5-8fbf-7c26617eb8c4	http://localhost:3000
1190	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 15:07:03.238+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Assignments	4	http://localhost:3000
1191	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 15:07:09.573+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	201eb4fa-6005-44ef-82b1-876aced976b3	http://localhost:3000
1192	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 15:07:09.661+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Assignments	4	http://localhost:3000
1193	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 15:07:18.823+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	9	http://localhost:3000
1194	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 15:59:59.977+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	9	http://localhost:3000
1195	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:22.762+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
1196	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:22.779+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
1197	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:22.788+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
1198	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:22.798+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
1199	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:22.809+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
1200	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:22.825+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1201	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:26.723+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
1202	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:26.731+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
1203	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:26.739+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
1204	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:26.744+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
1205	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:26.753+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
1206	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:26.759+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1207	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:45.777+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	27	http://localhost:3000
1208	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:53.136+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	27	http://localhost:3000
1209	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:53.143+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	17	http://localhost:3000
1210	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:53.153+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	22	http://localhost:3000
1211	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:53.159+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	23	http://localhost:3000
1212	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:53.164+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	24	http://localhost:3000
1213	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:53.17+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	25	http://localhost:3000
1214	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:00:53.176+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	26	http://localhost:3000
1215	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:01:21.915+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	28	http://localhost:3000
1216	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:01:50.64+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	104	http://localhost:8055
1217	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:01:50.648+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	home	http://localhost:8055
1218	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:02:41.058+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	105	http://localhost:8055
1222	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:04:28.534+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_collections	home	http://localhost:8055
1223	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:04:28.542+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	104	http://localhost:8055
1224	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:04:28.543+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_fields	105	http://localhost:8055
1225	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:04:41.365+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	28	http://localhost:3000
1226	delete	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:04:41.368+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	menu_items	27	http://localhost:3000
1227	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:06:18.858+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	10	http://localhost:3000
1228	update	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:17:14.286+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Personnel	10	http://localhost:3000
1229	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:21:27.459+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	153bf379-66a2-417a-99b6-35e671f0a49f	http://localhost:3000
1230	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:21:35.862+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	6abc79b8-2e6b-418d-bd18-d9f8ac2b31ed	http://localhost:3000
1231	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:25:57.757+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	directus_files	7c550851-cf69-48a2-93a8-09986e52d7f1	http://localhost:3000
1232	create	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:25:57.806+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	Employee_Qualifications	4	http://localhost:3000
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
Categories	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	\N	open	\N	f
menu_items	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	2	\N	open	\N	f
site_settings	settings	تخصيص الإعدادات العامة للنظام	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	3	\N	open	\N	f
Jobs	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	5	\N	open	\N	f
Departments	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	6	\N	open	\N	f
Employees	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	7	\N	open	\N	f
Calendars	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	8	\N	open	\N	f
Structures	\N	\N	\N	f	f	[{"language":"ar-SA","translation":"الهيكل"}]	\N	t	\N	\N	\N	all	\N	\N	4	\N	open	\N	f
designations	\N	\N	\N	f	f	[{"language":"ar-SA","translation":"المسميات"}]	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
job_types	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
job_axes	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
Personnel	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
Employee_Qualifications	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
Employee_Assignments	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
Employee_Assignments_undefined	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
\.


--
-- Data for Name: directus_comments; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_comments (id, collection, item, comment, date_created, date_updated, user_created, user_updated) FROM stdin;
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_deployment_projects; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_deployment_projects (id, deployment, external_id, name, date_created, user_created, url, framework, deployable) FROM stdin;
\.


--
-- Data for Name: directus_deployment_runs; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_deployment_runs (id, project, external_id, target, date_created, user_created, status, url, started_at, completed_at) FROM stdin;
\.


--
-- Data for Name: directus_deployments; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_deployments (id, provider, credentials, options, date_created, user_created, webhook_ids, webhook_secret, last_synced_at) FROM stdin;
\.


--
-- Data for Name: directus_extensions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message, searchable) FROM stdin;
4	Categories	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
5	Categories	name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
6	Categories	description	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
10	menu_items	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
11	menu_items	title	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
12	menu_items	url_path	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
15	menu_items	sort_order	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
16	menu_items	parent_id	m2o	select-dropdown-m2o	{"template":"{{title}}"}	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
24	site_settings	id	\N	input	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N	t
25	site_settings	site_name	\N	input	\N	raw	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
26	site_settings	logo	\N	file-image	\N	image	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
27	menu_items	icon	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N	t
28	site_settings	site_description	\N	input	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N	t
63	Departments	job_type	m2o	select-dropdown-m2o	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
64	Departments	employee_job	m2o	select-dropdown-m2o	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
65	Departments	job_status	\N	select-dropdown	{"choices":[{"text":"شاغرة","value":"شاغرة"},{"text":"مشغولة","value":"مشغولة"},{"text":"مجمدة","value":"مجمدة"}]}	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
32	Structures	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
33	Jobs	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
34	Departments	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
35	Employees	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
36	Calendars	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
37	Structures	name	\N	input	\N	\N	\N	f	f	2	full	[{"language":"ar-SA","translation":"الاسم"}]	\N	\N	f	\N	\N	\N	t
38	Structures	code	\N	input	\N	\N	\N	f	f	3	full	[{"language":"ar-SA","translation":"كود القسم"}]	\N	\N	f	\N	\N	\N	t
39	Structures	description	\N	input-multiline	\N	\N	\N	f	f	4	full	[{"language":"ar-SA","translation":"الوصف"}]	\N	\N	f	\N	\N	\N	t
40	Structures	is_active	cast-boolean	boolean	\N	\N	\N	f	f	5	full	[{"language":"ar-SA","translation":"مفعل؟"}]	\N	\N	f	\N	\N	\N	t
41	Structures	sort_order	\N	input	\N	\N	\N	f	f	6	full	[{"language":"ar-SA","translation":"رقم الترتيب"}]	\N	\N	f	\N	\N	\N	t
42	Structures	parent_id	m2o	select-dropdown-m2o	{"template":"{{name}}"}	\N	\N	f	f	7	full	[{"language":"ar-SA","translation":"جهة الارتباط"}]	\N	\N	f	\N	\N	\N	t
43	designations	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
44	designations	name	\N	input	\N	\N	\N	f	f	2	full	[{"language":"ar-SA","translation":"الاسم"}]	\N	\N	f	\N	\N	\N	t
45	designations	is_active	cast-boolean	boolean	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
46	designations	sort_order	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
47	job_types	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
48	job_types	name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
49	job_types	is_active	cast-boolean	boolean	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
50	job_types	sort_order	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
51	job_axes	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
52	job_axes	name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
53	job_axes	is_active	cast-boolean	boolean	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
54	job_axes	sort_order	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
55	Employees	designation	m2o	select-dropdown-m2o	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
56	Employees	job_title	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
57	Employees	job_description	\N	input-multiline	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
58	Employees	is_active	cast-boolean	boolean	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
59	Employees	sort_order	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
61	Departments	structure_id	m2o	select-dropdown-m2o	{"template":null}	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
62	Departments	designation	m2o	select-dropdown-m2o	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
66	Departments	sort_order	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
67	Personnel	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
68	Personnel	name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
69	Personnel	email	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
70	Personnel	mobile_number	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
71	Personnel	job_number	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
72	Personnel	department_id	m2o	select-dropdown-m2o	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
73	Personnel	primary_job_id	m2o	select-dropdown-m2o	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
74	Personnel	qualification	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
75	Personnel	graduation_entity	\N	input	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N	t
77	Personnel	graduation_year	\N	input	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N	t
78	Personnel	is_active	cast-boolean	boolean	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N	t
79	Personnel	sort_order	\N	input	\N	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N	t
80	Employee_Qualifications	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
81	Employee_Qualifications	personnel_id	m2o	select-dropdown-m2o	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
82	Employee_Qualifications	course_name	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
83	Employee_Qualifications	training_entity	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
84	Employee_Qualifications	start_date	\N	datetime	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
85	Employee_Qualifications	end_date	\N	datetime	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
86	Employee_Qualifications	score	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
87	Employee_Qualifications	attachment	file	file	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
88	Employee_Assignments	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
89	Employee_Assignments	personnel_id	m2o	select-dropdown-m2o	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
90	Employee_Assignments	subject	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
91	Employee_Assignments	decision_number	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
92	Employee_Assignments	decision_date	\N	datetime	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
93	Employee_Assignments	decision_summary	\N	input-multiline	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
94	Employee_Assignments	effective_from	\N	datetime	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
95	Employee_Assignments	effective_to	\N	datetime	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
96	Employee_Assignments	decision_source	\N	input	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N	t
97	Employee_Assignments	department_id	m2o	select-dropdown-m2o	{"template":null}	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N	t
98	Employee_Assignments	job_id	m2o	select-dropdown-m2o	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N	t
99	Employee_Assignments_undefined	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N	t
100	Employee_Assignments_undefined	Employee_Assignments_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N	t
101	Employee_Assignments_undefined	item	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N	t
102	Employee_Assignments_undefined	collection	\N	\N	\N	\N	\N	f	t	4	full	\N	\N	\N	f	\N	\N	\N	t
103	Employee_Assignments	attachment	file	file	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
f44cf8c9-70d9-44c6-9c82-b0b24193201e	local	f44cf8c9-70d9-44c6-9c82-b0b24193201e.png	logo.png	Logo	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 10:57:15.828+00	\N	2026-03-20 10:57:15.953+00	\N	1054034	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-20 10:57:15.951+00
65a600a9-709c-4161-b530-e4bd101f41d4	local	65a600a9-709c-4161-b530-e4bd101f41d4.png	Products.png	Products	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:02:58.599+00	\N	2026-03-20 11:02:58.998+00	\N	6527407	2816	1536	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-20 11:02:58.989+00
86f0ff79-a241-44b4-abf9-8f8f78ff16c8	local	86f0ff79-a241-44b4-abf9-8f8f78ff16c8.png	2030.png	2030	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:43:05.849+00	\N	2026-03-20 11:43:05.885+00	\N	42123	300	202	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-20 11:43:05.884+00
fcf6aa00-8857-44ed-a24a-f2da8cfe365e	local	fcf6aa00-8857-44ed-a24a-f2da8cfe365e.png	logo.png	Logo	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 11:44:09.52+00	\N	2026-03-20 11:44:09.582+00	\N	1054034	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-20 11:44:09.581+00
cc319834-98cf-4844-a39f-97ab752db515	local	cc319834-98cf-4844-a39f-97ab752db515.png	Products.png	Products	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-20 13:40:36.13+00	\N	2026-03-20 13:40:36.529+00	\N	6527407	2816	1536	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-20 13:40:36.527+00
8f81e039-1f0c-4af8-a58c-fcc5d427bbf8	local	8f81e039-1f0c-4af8-a58c-fcc5d427bbf8.png	2030.png	2030	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:18:35.809+00	\N	2026-03-21 04:18:35.933+00	\N	42123	300	202	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 04:18:35.931+00
d85b8759-9e00-408b-ab09-a5afcf159a60	local	d85b8759-9e00-408b-ab09-a5afcf159a60.png	hero.png	Hero	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 04:18:50.053+00	\N	2026-03-21 04:18:50.342+00	\N	5611329	2816	1536	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 04:18:50.34+00
b61087ae-779d-46bc-9f06-99f480a4bab6	local	b61087ae-779d-46bc-9f06-99f480a4bab6.png	logo.png	Logo	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 05:00:40.621+00	\N	2026-03-21 05:00:40.708+00	\N	1054034	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 05:00:40.706+00
cbbb373a-12aa-4c05-9530-c1326ee5faf3	local	cbbb373a-12aa-4c05-9530-c1326ee5faf3.png	logo.png	Logo	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 08:24:32.154+00	\N	2026-03-21 08:24:32.309+00	\N	1054034	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 08:24:32.305+00
6968e25f-66d4-4ce1-8e96-586c4d6b44c1	local	6968e25f-66d4-4ce1-8e96-586c4d6b44c1.png	logo.png	Logo	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 08:39:43.646+00	\N	2026-03-21 08:39:43.727+00	\N	1054034	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 08:39:43.725+00
8f862860-719a-4681-8c2a-b9f1cf56bfd5	local	8f862860-719a-4681-8c2a-b9f1cf56bfd5.png	about.png	About	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 08:40:03.969+00	\N	2026-03-21 08:40:04.298+00	\N	5225307	2760	1504	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 08:40:04.296+00
9d97982c-5fe1-4924-9e0b-be59a42ed96c	local	9d97982c-5fe1-4924-9e0b-be59a42ed96c.png	logo.png	Logo	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 09:15:23.633+00	\N	2026-03-21 09:15:23.669+00	\N	1054034	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 09:15:23.668+00
65eabde8-cef7-4d36-b09c-1f80a263197e	local	65eabde8-cef7-4d36-b09c-1f80a263197e.png	logo.png	Logo	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 09:29:25.567+00	\N	2026-03-21 09:29:25.617+00	\N	1054034	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 09:29:25.615+00
dcd58de7-33b3-41a9-bf5a-f1166cb55b68	local	dcd58de7-33b3-41a9-bf5a-f1166cb55b68.png	logo.png	Logo	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 09:29:35.553+00	\N	2026-03-21 09:29:35.598+00	\N	1054034	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 09:29:35.597+00
03fe1ecb-a9dc-4bde-9dc1-ec7994fe2f1b	local	03fe1ecb-a9dc-4bde-9dc1-ec7994fe2f1b.png	logo.png	Logo	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 10:28:35.84+00	\N	2026-03-21 10:28:35.922+00	\N	1054034	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 10:28:35.92+00
d853e0b9-748f-41b6-8894-54087f864138	local	d853e0b9-748f-41b6-8894-54087f864138.png	logo.png	Logo	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 10:29:20.725+00	\N	2026-03-21 10:29:20.768+00	\N	1054034	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 10:29:20.766+00
0fe6bf52-9b16-48cf-9b6f-1e3f92fa453e	local	0fe6bf52-9b16-48cf-9b6f-1e3f92fa453e.webp	gm.webp	Gm	image/webp	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 10:36:29.249+00	\N	2026-03-21 10:36:29.285+00	\N	10156	256	344	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 10:36:29.283+00
79df7045-f15b-46f4-bc0c-8831047c70af	local	79df7045-f15b-46f4-bc0c-8831047c70af.png	about.png	About	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 10:44:25.864+00	\N	2026-03-21 10:44:26.123+00	\N	5225307	2760	1504	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 10:44:26.116+00
6e09e2ae-824f-4b34-9395-5f5350dc5e75	local	6e09e2ae-824f-4b34-9395-5f5350dc5e75.png	logo.png	Logo	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 15:06:07.643+00	\N	2026-03-21 15:06:07.746+00	\N	1054034	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 15:06:07.744+00
5c1c0582-3580-4498-bfb7-d4df3e6913ea	local	5c1c0582-3580-4498-bfb7-d4df3e6913ea.png	logo.png	Logo	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 15:06:17.251+00	\N	2026-03-21 15:06:17.303+00	\N	1054034	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 15:06:17.301+00
34ae60de-0f1b-45b5-8fbf-7c26617eb8c4	local	34ae60de-0f1b-45b5-8fbf-7c26617eb8c4.png	logo.png	Logo	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 15:06:35.326+00	\N	2026-03-21 15:06:35.364+00	\N	1054034	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 15:06:35.361+00
201eb4fa-6005-44ef-82b1-876aced976b3	local	201eb4fa-6005-44ef-82b1-876aced976b3.png	logo.png	Logo	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 15:07:09.569+00	\N	2026-03-21 15:07:09.618+00	\N	1054034	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 15:07:09.616+00
153bf379-66a2-417a-99b6-35e671f0a49f	local	153bf379-66a2-417a-99b6-35e671f0a49f.png	logo.png	Logo	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:21:27.455+00	\N	2026-03-21 16:21:27.507+00	\N	1054034	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 16:21:27.506+00
6abc79b8-2e6b-418d-bd18-d9f8ac2b31ed	local	6abc79b8-2e6b-418d-bd18-d9f8ac2b31ed.png	logo.png	Logo	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:21:35.86+00	\N	2026-03-21 16:21:35.878+00	\N	1054034	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 16:21:35.878+00
7c550851-cf69-48a2-93a8-09986e52d7f1	local	7c550851-cf69-48a2-93a8-09986e52d7f1.png	logo.png	Logo	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:25:57.754+00	\N	2026-03-21 16:25:57.784+00	\N	1054034	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 16:25:57.783+00
996664a4-230d-4955-b6f1-7419e9ff0da9	local	996664a4-230d-4955-b6f1-7419e9ff0da9.pdf	التقرير السنوي 2025.pdf	التقرير السنوي 2025	application/pdf	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:53:07.865+00	\N	2026-03-21 16:53:09.602+00	\N	120581937	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-03-21 16:53:09.601+00
87338ef6-8811-4dff-b013-cf90eca11fb2	local	87338ef6-8811-4dff-b013-cf90eca11fb2.png	about.png	About	image/png	\N	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 17:54:50.635+00	\N	2026-03-21 17:54:50.781+00	\N	5225307	2760	1504	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2026-03-21 17:54:50.78+00
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2026-03-19 17:04:17.3597+00
20201029A	Remove System Relations	2026-03-19 17:04:17.386124+00
20201029B	Remove System Collections	2026-03-19 17:04:17.399116+00
20201029C	Remove System Fields	2026-03-19 17:04:17.41595+00
20201105A	Add Cascade System Relations	2026-03-19 17:04:17.507171+00
20201105B	Change Webhook URL Type	2026-03-19 17:04:17.525147+00
20210225A	Add Relations Sort Field	2026-03-19 17:04:17.53745+00
20210304A	Remove Locked Fields	2026-03-19 17:04:17.545213+00
20210312A	Webhooks Collections Text	2026-03-19 17:04:17.561006+00
20210331A	Add Refresh Interval	2026-03-19 17:04:17.568353+00
20210415A	Make Filesize Nullable	2026-03-19 17:04:17.584394+00
20210416A	Add Collections Accountability	2026-03-19 17:04:17.593751+00
20210422A	Remove Files Interface	2026-03-19 17:04:17.600662+00
20210506A	Rename Interfaces	2026-03-19 17:04:17.659214+00
20210510A	Restructure Relations	2026-03-19 17:04:17.691127+00
20210518A	Add Foreign Key Constraints	2026-03-19 17:04:17.705848+00
20210519A	Add System Fk Triggers	2026-03-19 17:04:17.758101+00
20210521A	Add Collections Icon Color	2026-03-19 17:04:17.765669+00
20210525A	Add Insights	2026-03-19 17:04:17.802235+00
20210608A	Add Deep Clone Config	2026-03-19 17:04:17.808665+00
20210626A	Change Filesize Bigint	2026-03-19 17:04:17.835036+00
20210716A	Add Conditions to Fields	2026-03-19 17:04:17.842672+00
20210721A	Add Default Folder	2026-03-19 17:04:17.855681+00
20210802A	Replace Groups	2026-03-19 17:04:17.866834+00
20210803A	Add Required to Fields	2026-03-19 17:04:17.874537+00
20210805A	Update Groups	2026-03-19 17:04:17.884276+00
20210805B	Change Image Metadata Structure	2026-03-19 17:04:17.893317+00
20210811A	Add Geometry Config	2026-03-19 17:04:17.901447+00
20210831A	Remove Limit Column	2026-03-19 17:04:17.910015+00
20210903A	Add Auth Provider	2026-03-19 17:04:17.949444+00
20210907A	Webhooks Collections Not Null	2026-03-19 17:04:17.966153+00
20210910A	Move Module Setup	2026-03-19 17:04:17.975619+00
20210920A	Webhooks URL Not Null	2026-03-19 17:04:17.992443+00
20210924A	Add Collection Organization	2026-03-19 17:04:18.005402+00
20210927A	Replace Fields Group	2026-03-19 17:04:18.025931+00
20210927B	Replace M2M Interface	2026-03-19 17:04:18.034311+00
20210929A	Rename Login Action	2026-03-19 17:04:18.040916+00
20211007A	Update Presets	2026-03-19 17:04:18.058254+00
20211009A	Add Auth Data	2026-03-19 17:04:18.066786+00
20211016A	Add Webhook Headers	2026-03-19 17:04:18.074299+00
20211103A	Set Unique to User Token	2026-03-19 17:04:18.087457+00
20211103B	Update Special Geometry	2026-03-19 17:04:18.092965+00
20211104A	Remove Collections Listing	2026-03-19 17:04:18.101421+00
20211118A	Add Notifications	2026-03-19 17:04:18.132053+00
20211211A	Add Shares	2026-03-19 17:04:18.169166+00
20211230A	Add Project Descriptor	2026-03-19 17:04:18.175942+00
20220303A	Remove Default Project Color	2026-03-19 17:04:18.191367+00
20220308A	Add Bookmark Icon and Color	2026-03-19 17:04:18.198507+00
20220314A	Add Translation Strings	2026-03-19 17:04:18.205152+00
20220322A	Rename Field Typecast Flags	2026-03-19 17:04:18.213116+00
20220323A	Add Field Validation	2026-03-19 17:04:18.21982+00
20220325A	Fix Typecast Flags	2026-03-19 17:04:18.228432+00
20220325B	Add Default Language	2026-03-19 17:04:18.246435+00
20220402A	Remove Default Value Panel Icon	2026-03-19 17:04:18.265072+00
20220429A	Add Flows	2026-03-19 17:04:18.324212+00
20220429B	Add Color to Insights Icon	2026-03-19 17:04:18.331314+00
20220429C	Drop Non Null From IP of Activity	2026-03-19 17:04:18.337808+00
20220429D	Drop Non Null From Sender of Notifications	2026-03-19 17:04:18.344166+00
20220614A	Rename Hook Trigger to Event	2026-03-19 17:04:18.350402+00
20220801A	Update Notifications Timestamp Column	2026-03-19 17:04:18.365952+00
20220802A	Add Custom Aspect Ratios	2026-03-19 17:04:18.372984+00
20220826A	Add Origin to Accountability	2026-03-19 17:04:18.382595+00
20230401A	Update Material Icons	2026-03-19 17:04:18.399481+00
20230525A	Add Preview Settings	2026-03-19 17:04:18.406271+00
20230526A	Migrate Translation Strings	2026-03-19 17:04:18.428717+00
20230721A	Require Shares Fields	2026-03-19 17:04:18.440619+00
20230823A	Add Content Versioning	2026-03-19 17:04:18.483606+00
20230927A	Themes	2026-03-19 17:04:18.517794+00
20231009A	Update CSV Fields to Text	2026-03-19 17:04:18.527236+00
20231009B	Update Panel Options	2026-03-19 17:04:18.533378+00
20231010A	Add Extensions	2026-03-19 17:04:18.545821+00
20231215A	Add Focalpoints	2026-03-19 17:04:18.553775+00
20240122A	Add Report URL Fields	2026-03-19 17:04:18.561384+00
20240204A	Marketplace	2026-03-19 17:04:18.621946+00
20240305A	Change Useragent Type	2026-03-19 17:04:18.645965+00
20240311A	Deprecate Webhooks	2026-03-19 17:04:18.6679+00
20240422A	Public Registration	2026-03-19 17:04:18.680208+00
20240515A	Add Session Window	2026-03-19 17:04:18.689357+00
20240701A	Add Tus Data	2026-03-19 17:04:18.697858+00
20240716A	Update Files Date Fields	2026-03-19 17:04:18.713058+00
20240806A	Permissions Policies	2026-03-19 17:04:18.831357+00
20240817A	Update Icon Fields Length	2026-03-19 17:04:18.895444+00
20240909A	Separate Comments	2026-03-19 17:04:18.920496+00
20240909B	Consolidate Content Versioning	2026-03-19 17:04:18.927192+00
20240924A	Migrate Legacy Comments	2026-03-19 17:04:18.939624+00
20240924B	Populate Versioning Deltas	2026-03-19 17:04:18.947961+00
20250224A	Visual Editor	2026-03-19 17:04:18.956945+00
20250609A	License Banner	2026-03-19 17:04:18.967634+00
20250613A	Add Project ID	2026-03-19 17:04:19.009022+00
20250718A	Add Direction	2026-03-19 17:04:19.016615+00
20250813A	Add MCP	2026-03-19 17:04:19.025849+00
20251012A	Add Field Searchable	2026-03-19 17:04:19.033033+00
20251014A	Add Project Owner	2026-03-19 17:04:19.104298+00
20251028A	Add Retention Indexes	2026-03-19 17:04:19.205547+00
20251103A	Add AI Settings	2026-03-19 17:04:19.21294+00
20251224A	Remove Webhooks	2026-03-19 17:04:19.221859+00
20260110A	Add AI Provider Settings	2026-03-19 17:04:19.232901+00
20260113A	Add Revisions Index	2026-03-19 17:04:19.267215+00
20260128A	Add Collaborative Editing	2026-03-19 17:04:19.274862+00
20260204A	Add Deployment	2026-03-19 17:04:19.337788+00
20260211A	Add Deployment Webhooks	2026-03-19 17:04:19.351693+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_permissions (id, collection, action, permissions, validation, presets, fields, policy) FROM stdin;
\.


--
-- Data for Name: directus_policies; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
abf8a154-5b1c-4a46-ac9c-7300570f4f17	$t:public_label	public	$t:public_description	\N	f	f	f
50947f50-4b94-4e8a-8c29-1bf8581b6295	Administrator	verified	$t:admin_description	\N	f	t	t
ac52433e-48f5-4161-aa8e-aa3a77abda8d	Administrator	badge	\N	\N	f	t	t
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
1	menu_items	parent_id	menu_items	\N	\N	\N	\N	\N	nullify
2	Structures	parent_id	Structures	\N	\N	\N	\N	\N	nullify
3	Employees	designation	designations	\N	\N	\N	\N	\N	nullify
4	Departments	structure_id	Structures	\N	\N	\N	\N	\N	nullify
5	Departments	designation	designations	\N	\N	\N	\N	\N	nullify
6	Departments	job_type	job_types	\N	\N	\N	\N	\N	nullify
7	Departments	employee_job	Employees	\N	\N	\N	\N	\N	nullify
8	Personnel	department_id	Structures	\N	\N	\N	\N	\N	nullify
9	Personnel	primary_job_id	Employees	\N	\N	\N	\N	\N	nullify
10	Employee_Qualifications	personnel_id	Personnel	\N	\N	\N	\N	\N	nullify
11	Employee_Qualifications	attachment	directus_files	\N	\N	\N	\N	\N	nullify
12	Employee_Assignments	personnel_id	Personnel	\N	\N	\N	\N	\N	nullify
13	Employee_Assignments	department_id	Structures	\N	\N	\N	\N	\N	nullify
14	Employee_Assignments	job_id	Employees	\N	collection		Employee_Assignments_id	\N	nullify
15	Employee_Assignments	attachment	directus_files	\N	\N	\N	\N	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
1	2	directus_users	e7c14f87-5452-4b00-b431-3d407c9dceaa	{"id":"e7c14f87-5452-4b00-b431-3d407c9dceaa","first_name":"Admin","last_name":"User","email":"admin@example.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"a5a97f5c-2db7-4627-aa8e-ce7c37fce106","token":"**********","last_access":"2026-03-19T17:06:13.465Z","last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":[]}	{"token":"**********"}	\N	\N
2	4	directus_users	e7c14f87-5452-4b00-b431-3d407c9dceaa	{"id":"e7c14f87-5452-4b00-b431-3d407c9dceaa","first_name":"Admin","last_name":"User","email":"admin@example.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"a5a97f5c-2db7-4627-aa8e-ce7c37fce106","token":"**********","last_access":"2026-03-19T17:07:20.961Z","last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":[]}	{"token":"**********"}	\N	\N
3	8	directus_users	e7c14f87-5452-4b00-b431-3d407c9dceaa	{"id":"e7c14f87-5452-4b00-b431-3d407c9dceaa","first_name":"Admin","last_name":"User","email":"admin@example.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"a5a97f5c-2db7-4627-aa8e-ce7c37fce106","token":"**********","last_access":"2026-03-19T18:32:24.587Z","last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":[]}	{"token":"**********"}	\N	\N
4	10	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019d070e-1e3d-734c-b1ca-2c63c395cef1","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"az.almalki.1996@gmail.com","project_usage":"personal","org_name":null,"product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null,"ai_google_api_key":null,"ai_openai_compatible_api_key":null,"ai_openai_compatible_base_url":null,"ai_openai_compatible_name":null,"ai_openai_compatible_models":null,"ai_openai_compatible_headers":null,"ai_openai_allowed_models":["gpt-5-nano","gpt-5-mini","gpt-5"],"ai_anthropic_allowed_models":["claude-haiku-4-5","claude-sonnet-4-5"],"ai_google_allowed_models":["gemini-3-pro-preview","gemini-3-flash-preview","gemini-2.5-pro","gemini-2.5-flash"],"collaborative_editing_enabled":false}	{"project_owner":"az.almalki.1996@gmail.com","project_usage":"personal","org_name":null,"product_updates":false,"project_status":null}	\N	\N
5	11	directus_fields	1	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jobs"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jobs"}	\N	\N
6	12	directus_collections	jobs	{"singleton":false,"collection":"jobs"}	{"singleton":false,"collection":"jobs"}	\N	\N
7	13	directus_fields	2	{"sort":2,"interface":"input","special":null,"collection":"jobs","field":"job_title"}	{"sort":2,"interface":"input","special":null,"collection":"jobs","field":"job_title"}	\N	\N
8	14	directus_fields	3	{"sort":3,"interface":"input","special":null,"collection":"jobs","field":"job_type"}	{"sort":3,"interface":"input","special":null,"collection":"jobs","field":"job_type"}	\N	\N
9	15	directus_permissions	1	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"jobs","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"jobs","action":"read"}	\N	\N
10	16	directus_permissions	2	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"jobs","action":"create"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"jobs","action":"create"}	\N	\N
11	17	directus_permissions	3	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"jobs","action":"update"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"jobs","action":"update"}	\N	\N
12	18	directus_permissions	4	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"jobs","action":"delete"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"jobs","action":"delete"}	\N	\N
13	20	directus_collections	jobs	{"collection":"jobs","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":["id","job_title","job_type"],"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"item_duplication_fields":["id","job_title","job_type"]}	\N	\N
14	21	directus_collections	jobs	{"collection":"jobs","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":[],"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"item_duplication_fields":[]}	\N	\N
15	22	directus_fields	4	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Categories"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Categories"}	\N	\N
16	23	directus_collections	Categories	{"singleton":false,"collection":"Categories"}	{"singleton":false,"collection":"Categories"}	\N	\N
82	148	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":3,"parent_id":4}	{"sort_order":3,"parent_id":4}	\N	\N
17	24	directus_fields	5	{"sort":2,"interface":"input","special":null,"collection":"Categories","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"Categories","field":"name"}	\N	\N
18	25	directus_fields	6	{"sort":3,"interface":"input","special":null,"collection":"Categories","field":"description"}	{"sort":3,"interface":"input","special":null,"collection":"Categories","field":"description"}	\N	\N
19	26	directus_fields	7	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Jobs"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Jobs"}	\N	\N
20	27	directus_collections	Jobs	{"singleton":false,"collection":"Jobs"}	{"singleton":false,"collection":"Jobs"}	\N	\N
21	28	directus_fields	8	{"sort":2,"interface":"input","special":null,"collection":"Jobs","field":"job_title"}	{"sort":2,"interface":"input","special":null,"collection":"Jobs","field":"job_title"}	\N	\N
22	29	directus_fields	9	{"sort":3,"interface":"input","special":null,"collection":"Jobs","field":"job_type"}	{"sort":3,"interface":"input","special":null,"collection":"Jobs","field":"job_type"}	\N	\N
25	32	directus_fields	10	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"menu_items"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"menu_items"}	\N	\N
26	33	directus_collections	menu_items	{"singleton":false,"collection":"menu_items"}	{"singleton":false,"collection":"menu_items"}	\N	\N
27	34	directus_fields	11	{"sort":2,"interface":"input","special":null,"collection":"menu_items","field":"title"}	{"sort":2,"interface":"input","special":null,"collection":"menu_items","field":"title"}	\N	\N
28	35	directus_fields	12	{"sort":3,"interface":"input","special":null,"collection":"menu_items","field":"url_path"}	{"sort":3,"interface":"input","special":null,"collection":"menu_items","field":"url_path"}	\N	\N
29	36	directus_fields	13	{"sort":4,"interface":"input","special":null,"collection":"menu_items","field":"sort_order"}	{"sort":4,"interface":"input","special":null,"collection":"menu_items","field":"sort_order"}	\N	\N
30	37	directus_fields	14	{"sort":5,"interface":"input","special":null,"collection":"menu_items","field":"parent_id"}	{"sort":5,"interface":"input","special":null,"collection":"menu_items","field":"parent_id"}	\N	\N
31	40	directus_fields	15	{"sort":4,"interface":"input","special":null,"collection":"menu_items","field":"sort_order"}	{"sort":4,"interface":"input","special":null,"collection":"menu_items","field":"sort_order"}	\N	\N
32	41	directus_fields	16	{"sort":5,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{title}}"},"collection":"menu_items","field":"parent_id"}	{"sort":5,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{title}}"},"collection":"menu_items","field":"parent_id"}	\N	\N
33	42	Categories	1	{"name":"main_db","description":"sdgs","parent_id":null,"jobs":[{"Jobs_id":2}]}	{"name":"main_db","description":"sdgs","parent_id":null,"jobs":[{"Jobs_id":2}]}	\N	\N
34	43	menu_items	1	{"parent_id":null,"sort_order":0,"title":"التهيئة التنظيمية","url_path":"t"}	{"parent_id":null,"sort_order":0,"title":"التهيئة التنظيمية","url_path":"t"}	\N	\N
35	44	menu_items	2	{"parent_id":1,"sort_order":0,"title":"sdg","url_path":"saf"}	{"parent_id":1,"sort_order":0,"title":"sdg","url_path":"saf"}	\N	\N
36	45	menu_items	3	{"parent_id":1,"sort_order":0,"title":"g,pm","url_path":"tee"}	{"parent_id":1,"sort_order":0,"title":"g,pm","url_path":"tee"}	\N	\N
37	46	Categories	2	{"name":"سيسل","description":"يبا","parent_id":null,"jobs":[]}	{"name":"سيسل","description":"يبا","parent_id":null,"jobs":[]}	\N	\N
38	47	Categories	3	{"name":"main_db","description":"سيلس","parent_id":2,"jobs":[]}	{"name":"main_db","description":"سيلس","parent_id":2,"jobs":[]}	\N	\N
39	48	Categories	4	{"name":"شسبسب","description":"شسلشل","parent_id":3,"jobs":[{"Jobs_id":2}]}	{"name":"شسبسب","description":"شسلشل","parent_id":3,"jobs":[{"Jobs_id":2}]}	\N	\N
40	58	menu_items	4	{"parent_id":null,"sort_order":0,"title":"لوحة التحكم","url_path":"dashboard"}	{"parent_id":null,"sort_order":0,"title":"لوحة التحكم","url_path":"dashboard"}	\N	\N
41	59	menu_items	5	{"parent_id":null,"sort_order":0,"title":"لوحة فرعية","url_path":"tee"}	{"parent_id":null,"sort_order":0,"title":"لوحة فرعية","url_path":"tee"}	\N	\N
42	60	menu_items	6	{"parent_id":4,"sort_order":0,"title":"شسبشسب","url_path":""}	{"parent_id":4,"sort_order":0,"title":"شسبشسب","url_path":""}	\N	\N
43	61	menu_items	7	{"parent_id":4,"sort_order":0,"title":"سيل","url_path":"dashboard"}	{"parent_id":4,"sort_order":0,"title":"سيل","url_path":"dashboard"}	\N	\N
44	70	menu_items	8	{"parent_id":null,"sort_order":0,"title":"القائمة 1","url_path":"das"}	{"parent_id":null,"sort_order":0,"title":"القائمة 1","url_path":"das"}	\N	\N
45	77	menu_items	8	{"id":8,"title":"القائمة 1","url_path":"das","sort_order":0,"parent_id":4}	{"title":"القائمة 1","url_path":"das","parent_id":4}	\N	\N
46	78	menu_items	9	{"parent_id":null,"sort_order":0,"title":"dgsdg","url_path":"aadsd"}	{"parent_id":null,"sort_order":0,"title":"dgsdg","url_path":"aadsd"}	\N	\N
47	88	menu_items	4	{"id":4,"title":"لوحة التحكم","url_path":"/dashboard","sort_order":0,"parent_id":null}	{"url_path":"/dashboard"}	\N	\N
48	91	directus_fields	17	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"employees"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"employees"}	\N	\N
83	149	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":11}	{"sort_order":0,"parent_id":11}	\N	\N
84	150	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":1,"parent_id":11}	{"sort_order":1,"parent_id":11}	\N	\N
85	151	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
86	152	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
87	153	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":0,"parent_id":12}	{"sort_order":0,"parent_id":12}	\N	\N
88	154	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":11}	{"sort_order":1,"parent_id":11}	\N	\N
89	155	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":2,"parent_id":11}	{"sort_order":2,"parent_id":11}	\N	\N
49	92	directus_fields	18	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"employees"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"employees"}	\N	\N
50	93	directus_collections	employees	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"employees"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"employees"}	\N	\N
51	94	directus_fields	19	{"sort":3,"interface":"input","special":null,"collection":"employees","field":"name"}	{"sort":3,"interface":"input","special":null,"collection":"employees","field":"name"}	\N	\N
52	95	directus_fields	20	{"sort":4,"interface":"input","special":null,"collection":"employees","field":"phone"}	{"sort":4,"interface":"input","special":null,"collection":"employees","field":"phone"}	\N	\N
53	96	menu_items	10	{"parent_id":null,"sort_order":0,"title":"الموظفين","url_path":"employees"}	{"parent_id":null,"sort_order":0,"title":"الموظفين","url_path":"employees"}	\N	\N
54	99	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":0,"parent_id":null}	{"title":"الموظفين","url_path":"/employees","parent_id":null}	\N	\N
55	100	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":0,"parent_id":null}	{"title":"التهيئة التنظيمية","url_path":"/dashboard","parent_id":null}	\N	\N
56	103	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":0,"parent_id":4}	{"title":"الموظفين","url_path":"/employees","parent_id":4}	\N	\N
57	120	menu_items	11	{"title":"تجريبي","url_path":"/tee","parent_id":null,"sort_order":0}	{"title":"تجريبي","url_path":"/tee","parent_id":null,"sort_order":0}	\N	\N
58	124	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
59	125	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":4}	{"sort_order":1,"parent_id":4}	\N	\N
60	126	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":2,"parent_id":4}	{"sort_order":2,"parent_id":4}	\N	\N
61	127	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
62	128	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
63	129	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":2,"parent_id":4}	{"sort_order":2,"parent_id":4}	\N	\N
64	130	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
65	131	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
66	132	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
67	133	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
68	134	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
69	135	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
70	136	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
71	137	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
72	138	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
73	139	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":0,"parent_id":4}	{"title":"الموظفين","url_path":"/employees","sort_order":0,"parent_id":4}	\N	\N
74	140	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":4}	{"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":4}	\N	\N
75	141	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
76	142	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":4}	{"sort_order":1,"parent_id":4}	\N	\N
77	143	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":2,"parent_id":4}	{"sort_order":2,"parent_id":4}	\N	\N
78	144	menu_items	12	{"title":"نلات","url_path":"/dashboard","parent_id":null,"sort_order":0}	{"title":"نلات","url_path":"/dashboard","parent_id":null,"sort_order":0}	\N	\N
79	145	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":0,"parent_id":11}	{"sort_order":0,"parent_id":11}	\N	\N
80	146	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
81	147	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
90	156	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
91	157	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":11}	{"sort_order":0,"parent_id":11}	\N	\N
92	158	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":1,"parent_id":11}	{"sort_order":1,"parent_id":11}	\N	\N
93	159	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
94	160	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
95	161	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":0,"parent_id":4}	{"sort_order":0,"parent_id":4}	\N	\N
96	162	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":11}	{"sort_order":1,"parent_id":11}	\N	\N
97	163	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":2,"parent_id":11}	{"sort_order":2,"parent_id":11}	\N	\N
98	164	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
99	165	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":0,"parent_id":12}	{"sort_order":0,"parent_id":12}	\N	\N
100	166	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":1,"parent_id":4}	{"sort_order":1,"parent_id":4}	\N	\N
101	167	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":2,"parent_id":11}	{"sort_order":2,"parent_id":11}	\N	\N
102	168	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":3,"parent_id":11}	{"sort_order":3,"parent_id":11}	\N	\N
103	169	menu_items	13	{"title":"الرئيسية","url_path":null,"parent_id":null,"sort_order":0}	{"title":"الرئيسية","url_path":null,"parent_id":null,"sort_order":0}	\N	\N
104	170	menu_items	14	{"title":"لوحة","url_path":"/panel","parent_id":13,"sort_order":0}	{"title":"لوحة","url_path":"/panel","parent_id":13,"sort_order":0}	\N	\N
105	171	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":0,"parent_id":13}	{"sort_order":0,"parent_id":13}	\N	\N
106	172	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":1,"parent_id":12}	{"sort_order":1,"parent_id":12}	\N	\N
107	173	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
108	174	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":3,"parent_id":4}	{"sort_order":3,"parent_id":4}	\N	\N
109	175	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":4,"parent_id":11}	{"sort_order":4,"parent_id":11}	\N	\N
110	176	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":5,"parent_id":11}	{"sort_order":5,"parent_id":11}	\N	\N
111	177	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":0,"parent_id":14}	{"sort_order":0,"parent_id":14}	\N	\N
112	178	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":1,"parent_id":12}	{"sort_order":1,"parent_id":12}	\N	\N
113	179	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
114	180	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":3,"parent_id":4}	{"sort_order":3,"parent_id":4}	\N	\N
115	181	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":4,"parent_id":11}	{"sort_order":4,"parent_id":11}	\N	\N
116	182	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":5,"parent_id":11}	{"sort_order":5,"parent_id":11}	\N	\N
117	183	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":0,"parent_id":13}	{"sort_order":0,"parent_id":13}	\N	\N
118	184	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":1,"parent_id":14}	{"sort_order":1,"parent_id":14}	\N	\N
119	185	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":2,"parent_id":12}	{"sort_order":2,"parent_id":12}	\N	\N
120	186	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":3,"parent_id":4}	{"sort_order":3,"parent_id":4}	\N	\N
121	187	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":4,"parent_id":11}	{"sort_order":4,"parent_id":11}	\N	\N
122	188	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":5,"parent_id":11}	{"sort_order":5,"parent_id":11}	\N	\N
123	189	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":0,"parent_id":12}	{"sort_order":0,"parent_id":12}	\N	\N
124	190	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
125	191	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
126	192	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
127	193	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
128	194	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":5,"parent_id":11}	{"sort_order":5,"parent_id":11}	\N	\N
129	195	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":0,"parent_id":12}	{"sort_order":0,"parent_id":12}	\N	\N
130	196	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
131	197	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
132	198	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
133	199	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
134	200	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":5,"parent_id":11}	{"sort_order":5,"parent_id":11}	\N	\N
135	201	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":0,"parent_id":12}	{"sort_order":0,"parent_id":12}	\N	\N
136	202	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
137	203	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
138	204	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
139	205	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
140	206	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":5,"parent_id":11}	{"sort_order":5,"parent_id":11}	\N	\N
141	207	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":0,"parent_id":13}	{"sort_order":0,"parent_id":13}	\N	\N
142	208	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
143	209	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
144	210	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
145	211	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
146	212	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":5,"parent_id":11}	{"sort_order":5,"parent_id":11}	\N	\N
147	213	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
148	214	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
149	215	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
150	216	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
151	217	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
152	218	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":5,"parent_id":11}	{"sort_order":5,"parent_id":11}	\N	\N
153	219	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
154	220	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
155	221	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
156	222	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
157	223	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
158	224	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
159	225	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":0,"parent_id":12}	{"sort_order":0,"parent_id":12}	\N	\N
160	226	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
161	227	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
162	228	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
163	229	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
164	230	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
165	231	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":0,"parent_id":12}	{"sort_order":0,"parent_id":12}	\N	\N
166	232	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
167	233	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
168	234	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
169	235	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
170	236	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
171	237	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":0,"parent_id":12}	{"sort_order":0,"parent_id":12}	\N	\N
172	238	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
173	239	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
174	240	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
175	241	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
176	242	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
177	243	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
178	244	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
179	245	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
180	246	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
181	247	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
182	248	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
183	249	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
184	250	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
185	251	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
186	252	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
187	253	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
188	254	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
189	255	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
190	256	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
191	257	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
192	258	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
193	259	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
194	260	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
195	261	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":0,"parent_id":11}	{"sort_order":0,"parent_id":11}	\N	\N
196	262	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
197	263	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
198	264	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
199	265	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
200	266	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
201	267	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":14}	{"sort_order":0,"parent_id":14}	\N	\N
202	268	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":1,"parent_id":11}	{"sort_order":1,"parent_id":11}	\N	\N
203	269	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
204	270	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
205	271	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
206	272	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
207	273	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":0,"parent_id":13}	{"sort_order":0,"parent_id":13}	\N	\N
208	274	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":14}	{"sort_order":1,"parent_id":14}	\N	\N
209	275	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":2,"parent_id":11}	{"sort_order":2,"parent_id":11}	\N	\N
210	276	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
211	277	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
212	278	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
213	279	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
214	280	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":1,"parent_id":13}	{"sort_order":1,"parent_id":13}	\N	\N
215	281	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":2,"parent_id":14}	{"sort_order":2,"parent_id":14}	\N	\N
216	282	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":3,"parent_id":11}	{"sort_order":3,"parent_id":11}	\N	\N
217	283	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
218	284	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
219	285	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":0,"parent_id":13}	{"sort_order":0,"parent_id":13}	\N	\N
220	286	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":14}	{"sort_order":1,"parent_id":14}	\N	\N
221	287	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":2,"parent_id":11}	{"sort_order":2,"parent_id":11}	\N	\N
222	288	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
223	289	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
224	290	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
225	291	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
226	292	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":1,"parent_id":13}	{"sort_order":1,"parent_id":13}	\N	\N
227	293	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":2,"parent_id":14}	{"sort_order":2,"parent_id":14}	\N	\N
228	294	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":3,"parent_id":11}	{"sort_order":3,"parent_id":11}	\N	\N
229	295	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
230	296	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
231	297	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
232	298	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
233	299	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":2,"parent_id":13}	{"sort_order":2,"parent_id":13}	\N	\N
234	300	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":3,"parent_id":11}	{"sort_order":3,"parent_id":11}	\N	\N
235	301	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
236	302	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
237	303	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
238	304	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
239	305	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
240	306	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":3,"parent_id":13}	{"sort_order":3,"parent_id":13}	\N	\N
241	307	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
242	308	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
243	309	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
244	310	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
245	311	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
246	312	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
247	313	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
248	314	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
249	315	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
250	316	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
251	317	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
252	318	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
253	319	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
254	320	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
255	321	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":null}	{"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":null}	\N	\N
256	322	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":0,"parent_id":11}	{"sort_order":0,"parent_id":11}	\N	\N
257	323	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
258	324	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
259	325	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
260	326	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
261	327	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
262	328	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":0,"parent_id":12}	{"sort_order":0,"parent_id":12}	\N	\N
263	329	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":1,"parent_id":11}	{"sort_order":1,"parent_id":11}	\N	\N
264	330	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
265	331	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
266	332	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
267	333	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
268	334	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":0,"parent_id":4}	{"sort_order":0,"parent_id":4}	\N	\N
269	335	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":1,"parent_id":12}	{"sort_order":1,"parent_id":12}	\N	\N
270	336	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":2,"parent_id":11}	{"sort_order":2,"parent_id":11}	\N	\N
271	337	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
272	338	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
319	385	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":6,"parent_id":null}	{"sort_order":6,"parent_id":null}	\N	\N
273	339	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
274	340	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":0,"parent_id":4}	{"sort_order":0,"parent_id":4}	\N	\N
275	341	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":1,"parent_id":12}	{"sort_order":1,"parent_id":12}	\N	\N
276	342	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":2,"parent_id":11}	{"sort_order":2,"parent_id":11}	\N	\N
277	343	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
278	344	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
279	345	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
280	346	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":0,"parent_id":12}	{"sort_order":0,"parent_id":12}	\N	\N
281	347	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":1,"parent_id":11}	{"sort_order":1,"parent_id":11}	\N	\N
282	348	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
283	349	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
284	350	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
285	351	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
286	352	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":0,"parent_id":11}	{"sort_order":0,"parent_id":11}	\N	\N
287	353	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
288	354	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
289	355	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
290	356	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
291	357	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
292	358	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
293	359	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
294	360	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
295	361	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
296	362	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
297	363	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
298	364	menu_items	15	{"title":"شششش","url_path":null,"parent_id":null,"sort_order":0}	{"title":"شششش","url_path":null,"parent_id":null,"sort_order":0}	\N	\N
299	365	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":0,"parent_id":14}	{"sort_order":0,"parent_id":14}	\N	\N
300	366	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
301	367	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
302	368	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
303	369	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
304	370	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
305	371	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":6,"parent_id":null}	{"sort_order":6,"parent_id":null}	\N	\N
306	372	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
307	373	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
308	374	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
309	375	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
310	376	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
311	377	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
312	378	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":6,"parent_id":null}	{"sort_order":6,"parent_id":null}	\N	\N
313	379	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
314	380	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
315	381	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
316	382	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
317	383	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
318	384	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
320	386	menu_items	10	{"id":10,"title":"الموظفين","url_path":"/employees","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
321	387	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
322	388	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
323	389	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
324	390	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
325	391	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
326	392	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":6,"parent_id":null}	{"sort_order":6,"parent_id":null}	\N	\N
327	393	menu_items	16	{"title":"صصص","url_path":null,"parent_id":10,"sort_order":0}	{"title":"صصص","url_path":null,"parent_id":10,"sort_order":0}	\N	\N
328	396	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":0,"parent_id":11}	{"sort_order":0,"parent_id":11}	\N	\N
329	397	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
330	398	menu_items	12	{"id":12,"title":"نلات","url_path":"/dashboard","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
331	399	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
332	400	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
333	401	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":5,"parent_id":null}	{"sort_order":5,"parent_id":null}	\N	\N
334	403	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":0,"parent_id":11}	{"sort_order":0,"parent_id":11}	\N	\N
335	404	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
336	405	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
337	406	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
338	407	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
339	408	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":4}	{"sort_order":0,"parent_id":4}	\N	\N
340	409	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":1,"parent_id":11}	{"sort_order":1,"parent_id":11}	\N	\N
341	410	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
342	411	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
343	412	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
344	413	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
345	414	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":4}	{"sort_order":1,"parent_id":4}	\N	\N
346	415	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":2,"parent_id":11}	{"sort_order":2,"parent_id":11}	\N	\N
347	416	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
348	417	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
349	418	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
350	419	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
351	420	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":2,"parent_id":11}	{"sort_order":2,"parent_id":11}	\N	\N
352	421	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
353	422	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
354	423	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
355	424	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":1,"parent_id":11}	{"sort_order":1,"parent_id":11}	\N	\N
356	425	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
357	426	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
358	427	menu_items	4	{"id":4,"title":"التهيئة التنظيمية","url_path":"/dashboard","sort_order":4,"parent_id":null}	{"sort_order":4,"parent_id":null}	\N	\N
359	429	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
360	430	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
361	431	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":2,"parent_id":11}	{"sort_order":2,"parent_id":11}	\N	\N
362	432	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
363	433	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
364	434	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
365	435	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
366	436	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
367	437	directus_fields	24	{"sort":1,"hidden":true,"interface":"input","field":"id","collection":"site_settings"}	{"sort":1,"hidden":true,"interface":"input","field":"id","collection":"site_settings"}	\N	\N
368	438	directus_fields	25	{"sort":2,"interface":"input","display":"raw","field":"site_name","collection":"site_settings"}	{"sort":2,"interface":"input","display":"raw","field":"site_name","collection":"site_settings"}	\N	\N
369	439	directus_fields	26	{"sort":3,"interface":"file-image","display":"image","field":"logo","collection":"site_settings"}	{"sort":3,"interface":"file-image","display":"image","field":"logo","collection":"site_settings"}	\N	\N
370	440	directus_collections	site_settings	{"icon":"settings","note":"تخصيص الإعدادات العامة للنظام","singleton":true,"collection":"site_settings"}	{"icon":"settings","note":"تخصيص الإعدادات العامة للنظام","singleton":true,"collection":"site_settings"}	\N	\N
371	441	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":0,"parent_id":null}	{"sort_order":0,"parent_id":null}	\N	\N
372	442	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
373	443	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
374	444	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
375	445	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":15}	{"sort_order":0,"parent_id":15}	\N	\N
376	446	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
377	447	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
378	448	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
379	449	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":15}	{"sort_order":0,"parent_id":15}	\N	\N
380	450	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
381	451	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
382	452	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
383	453	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":15}	{"sort_order":0,"parent_id":15}	\N	\N
384	454	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":1,"parent_id":null}	{"sort_order":1,"parent_id":null}	\N	\N
385	455	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":2,"parent_id":null}	{"sort_order":2,"parent_id":null}	\N	\N
386	456	menu_items	13	{"id":13,"title":"الرئيسية","url_path":null,"sort_order":3,"parent_id":null}	{"sort_order":3,"parent_id":null}	\N	\N
387	457	directus_files	f44cf8c9-70d9-44c6-9c82-b0b24193201e	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	\N	\N
388	458	site_settings	1	{"site_name":"ينابع الحلول لتقنية المعلومات","logo":"f44cf8c9-70d9-44c6-9c82-b0b24193201e"}	{"site_name":"ينابع الحلول لتقنية المعلومات","logo":"f44cf8c9-70d9-44c6-9c82-b0b24193201e"}	\N	\N
389	459	site_settings	1	{"id":1,"site_name":"ينابع الحلول لتقنية المعلومات","logo":"f44cf8c9-70d9-44c6-9c82-b0b24193201e"}	{"site_name":"ينابع الحلول لتقنية المعلومات","logo":"f44cf8c9-70d9-44c6-9c82-b0b24193201e"}	\N	\N
390	460	site_settings	1	{"id":1,"site_name":"Test","logo":"f44cf8c9-70d9-44c6-9c82-b0b24193201e"}	{"site_name":"Test"}	\N	\N
391	461	directus_files	65a600a9-709c-4161-b530-e4bd101f41d4	{"title":"Products","filename_download":"Products.png","type":"image/png","storage":"local"}	{"title":"Products","filename_download":"Products.png","type":"image/png","storage":"local"}	\N	\N
392	462	site_settings	1	{"id":1,"site_name":"Test","logo":"65a600a9-709c-4161-b530-e4bd101f41d4"}	{"site_name":"Test","logo":"65a600a9-709c-4161-b530-e4bd101f41d4"}	\N	\N
393	463	site_settings	1	{"id":1,"site_name":"Test","logo":"65a600a9-709c-4161-b530-e4bd101f41d4"}	{"site_name":"Test","logo":"65a600a9-709c-4161-b530-e4bd101f41d4"}	\N	\N
394	464	site_settings	1	{"id":1,"site_name":"Test","logo":"65a600a9-709c-4161-b530-e4bd101f41d4"}	{"site_name":"Test","logo":"65a600a9-709c-4161-b530-e4bd101f41d4"}	\N	\N
395	465	site_settings	1	{"id":1,"site_name":"ينابع الحلول لتقنية المعلومات","logo":"65a600a9-709c-4161-b530-e4bd101f41d4"}	{"site_name":"ينابع الحلول لتقنية المعلومات","logo":"65a600a9-709c-4161-b530-e4bd101f41d4"}	\N	\N
396	466	site_settings	1	{"id":1,"site_name":"ينابع الحلول لتقنية المعلومات","logo":"65a600a9-709c-4161-b530-e4bd101f41d4"}	{"site_name":"ينابع الحلول لتقنية المعلومات","logo":"65a600a9-709c-4161-b530-e4bd101f41d4"}	\N	\N
397	467	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":2,"parent_id":null}	{"title":"شششش","url_path":null,"sort_order":2,"parent_id":null}	\N	\N
398	468	menu_items	11	{"id":11,"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":15}	{"title":"تجريبي","url_path":"/tee","sort_order":0,"parent_id":15}	\N	\N
399	469	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":1,"parent_id":null}	{"title":"لوحة","url_path":"/panel","sort_order":1,"parent_id":null}	\N	\N
400	470	menu_items	14	{"id":14,"title":"لوحة","url_path":"/panel","sort_order":1,"parent_id":null,"icon":"Home"}	{"title":"لوحة","url_path":"/panel","sort_order":1,"parent_id":null,"icon":"Home"}	\N	\N
401	471	menu_items	15	{"id":15,"title":"شششش","url_path":null,"sort_order":2,"parent_id":null,"icon":"Activity"}	{"title":"شششش","url_path":null,"sort_order":2,"parent_id":null,"icon":"Activity"}	\N	\N
402	472	site_settings	1	{"id":1,"site_name":" ","logo":"65a600a9-709c-4161-b530-e4bd101f41d4"}	{"site_name":" ","logo":"65a600a9-709c-4161-b530-e4bd101f41d4"}	\N	\N
403	473	site_settings	1	{"id":1,"site_name":" اااا","logo":"65a600a9-709c-4161-b530-e4bd101f41d4"}	{"site_name":" اااا","logo":"65a600a9-709c-4161-b530-e4bd101f41d4"}	\N	\N
404	474	site_settings	1	{"id":1,"site_name":" اااا","logo":"65a600a9-709c-4161-b530-e4bd101f41d4"}	{"site_name":" اااا","logo":"65a600a9-709c-4161-b530-e4bd101f41d4"}	\N	\N
446	524	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":2,"parent_id":null,"icon":"BarChart"}	{"sort_order":2,"parent_id":null}	\N	\N
405	475	directus_files	86f0ff79-a241-44b4-abf9-8f8f78ff16c8	{"title":"2030","filename_download":"2030.png","type":"image/png","storage":"local"}	{"title":"2030","filename_download":"2030.png","type":"image/png","storage":"local"}	\N	\N
406	476	site_settings	1	{"id":1,"site_name":" اااا","logo":"86f0ff79-a241-44b4-abf9-8f8f78ff16c8"}	{"site_name":" اااا","logo":"86f0ff79-a241-44b4-abf9-8f8f78ff16c8"}	\N	\N
407	477	site_settings	1	{"id":1,"site_name":" اااا","logo":"86f0ff79-a241-44b4-abf9-8f8f78ff16c8"}	{"site_name":" اااا","logo":"86f0ff79-a241-44b4-abf9-8f8f78ff16c8"}	\N	\N
408	478	site_settings	1	{"id":1,"site_name":" اااا","logo":"86f0ff79-a241-44b4-abf9-8f8f78ff16c8"}	{"site_name":" اااا","logo":"86f0ff79-a241-44b4-abf9-8f8f78ff16c8"}	\N	\N
409	479	site_settings	1	{"id":1,"site_name":" اااا","logo":null}	{"site_name":" اااا","logo":null}	\N	\N
410	480	directus_files	fcf6aa00-8857-44ed-a24a-f2da8cfe365e	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	\N	\N
411	481	site_settings	1	{"id":1,"site_name":" اااا","logo":"fcf6aa00-8857-44ed-a24a-f2da8cfe365e"}	{"site_name":" اااا","logo":"fcf6aa00-8857-44ed-a24a-f2da8cfe365e"}	\N	\N
412	482	site_settings	1	{"id":1,"site_name":" جامعة الملك خالد","logo":"fcf6aa00-8857-44ed-a24a-f2da8cfe365e"}	{"site_name":" جامعة الملك خالد","logo":"fcf6aa00-8857-44ed-a24a-f2da8cfe365e"}	\N	\N
413	483	site_settings	1	{"id":1,"site_name":" جامعة الملك خالد","logo":"fcf6aa00-8857-44ed-a24a-f2da8cfe365e"}	{"site_name":" جامعة الملك خالد","logo":"fcf6aa00-8857-44ed-a24a-f2da8cfe365e"}	\N	\N
414	484	site_settings	1	{"id":1,"site_name":" جامعة الملك خالد","logo":"fcf6aa00-8857-44ed-a24a-f2da8cfe365e","site_description":"بوابة السجلات "}	{"site_name":" جامعة الملك خالد","logo":"fcf6aa00-8857-44ed-a24a-f2da8cfe365e","site_description":"بوابة السجلات "}	\N	\N
415	489	menu_items	17	{"title":"التهيئة التنظيمية","url_path":null,"parent_id":null,"icon":"Folder","sort_order":0}	{"title":"التهيئة التنظيمية","url_path":null,"parent_id":null,"icon":"Folder","sort_order":0}	\N	\N
416	490	menu_items	18	{"title":"الهيكل","url_path":"/panel","parent_id":17,"icon":"Map","sort_order":0}	{"title":"الهيكل","url_path":"/panel","parent_id":17,"icon":"Map","sort_order":0}	\N	\N
417	491	menu_items	19	{"title":"الخطط الاستراتيجية","url_path":null,"parent_id":null,"icon":"BarChart","sort_order":0}	{"title":"الخطط الاستراتيجية","url_path":null,"parent_id":null,"icon":"BarChart","sort_order":0}	\N	\N
418	492	menu_items	20	{"title":"المسميات","url_path":"/names","parent_id":17,"icon":"names","sort_order":0}	{"title":"المسميات","url_path":"/names","parent_id":17,"icon":"names","sort_order":0}	\N	\N
419	493	menu_items	21	{"title":"الوظائف","url_path":"/Jobs","parent_id":17,"icon":"Jobs","sort_order":0}	{"title":"الوظائف","url_path":"/Jobs","parent_id":17,"icon":"Jobs","sort_order":0}	\N	\N
420	494	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":17,"icon":"Job"}	{"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":17,"icon":"Job"}	\N	\N
421	495	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":17,"icon":"Users"}	{"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":17,"icon":"Users"}	\N	\N
422	496	directus_fields	29	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"names"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"names"}	\N	\N
423	497	directus_collections	names	{"singleton":false,"collection":"names"}	{"singleton":false,"collection":"names"}	\N	\N
424	498	directus_fields	30	{"sort":2,"interface":"input","special":null,"collection":"names","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"names","field":"name"}	\N	\N
425	499	directus_fields	31	{"sort":3,"interface":"input","special":null,"collection":"names","field":"age"}	{"sort":3,"interface":"input","special":null,"collection":"names","field":"age"}	\N	\N
430	508	directus_files	cc319834-98cf-4844-a39f-97ab752db515	{"title":"Products","filename_download":"Products.png","type":"image/png","storage":"local"}	{"title":"Products","filename_download":"Products.png","type":"image/png","storage":"local"}	\N	\N
431	509	site_settings	1	{"id":1,"site_name":" جامعة الملك خالد","logo":"cc319834-98cf-4844-a39f-97ab752db515","site_description":"بوابة السجلات "}	{"site_name":" جامعة الملك خالد","logo":"cc319834-98cf-4844-a39f-97ab752db515","site_description":"بوابة السجلات "}	\N	\N
433	511	directus_collections	names	{"collection":"names","icon":"account_circle","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#BE6464","item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"icon":"account_circle","color":"#BE6464"}	\N	\N
434	512	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":0,"parent_id":17,"icon":"Map"}	{"sort_order":0,"parent_id":17}	\N	\N
435	513	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
436	514	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":2,"parent_id":null,"icon":"Folder"}	{"sort_order":2,"parent_id":null}	\N	\N
437	515	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":3,"parent_id":17,"icon":"names"}	{"sort_order":3,"parent_id":17}	\N	\N
438	516	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":4,"parent_id":17,"icon":"Users"}	{"sort_order":4,"parent_id":17}	\N	\N
439	517	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":0,"parent_id":null,"icon":"Map"}	{"sort_order":0,"parent_id":null}	\N	\N
440	518	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
441	519	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":2,"parent_id":null,"icon":"Folder"}	{"sort_order":2,"parent_id":null}	\N	\N
442	520	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":3,"parent_id":17,"icon":"names"}	{"sort_order":3,"parent_id":17}	\N	\N
443	521	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":4,"parent_id":17,"icon":"Users"}	{"sort_order":4,"parent_id":17}	\N	\N
444	522	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":null,"icon":"names"}	{"sort_order":0,"parent_id":null}	\N	\N
445	523	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":1,"parent_id":null,"icon":"Map"}	{"sort_order":1,"parent_id":null}	\N	\N
447	525	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":3,"parent_id":null,"icon":"Folder"}	{"sort_order":3,"parent_id":null}	\N	\N
448	526	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":4,"parent_id":17,"icon":"Users"}	{"sort_order":4,"parent_id":17}	\N	\N
449	527	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
450	528	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":1,"parent_id":null,"icon":"names"}	{"sort_order":1,"parent_id":null}	\N	\N
451	529	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":2,"parent_id":null,"icon":"Map"}	{"sort_order":2,"parent_id":null}	\N	\N
452	530	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":3,"parent_id":null,"icon":"BarChart"}	{"sort_order":3,"parent_id":null}	\N	\N
453	531	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
454	532	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":21,"icon":"names"}	{"sort_order":0,"parent_id":21}	\N	\N
455	533	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":1,"parent_id":null,"icon":"Users"}	{"sort_order":1,"parent_id":null}	\N	\N
456	534	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":2,"parent_id":null,"icon":"Map"}	{"sort_order":2,"parent_id":null}	\N	\N
457	535	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":3,"parent_id":null,"icon":"BarChart"}	{"sort_order":3,"parent_id":null}	\N	\N
458	536	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
461	540	directus_translations	37fc6834-8433-4a3d-9b9c-a72b55f45c5b	{"language":"ar-SA","value":"الاسم","key":"الاسم"}	{"language":"ar-SA","value":"الاسم","key":"الاسم"}	\N	\N
462	541	directus_fields	30	{"id":30,"collection":"names","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":"$t:الاسم","searchable":true}	{"collection":"names","field":"name","validation_message":"$t:الاسم"}	\N	\N
463	542	directus_translations	5c14aa45-c4c1-4f46-a806-476a7f451607	{"language":"ar-SA","key":"العمر","value":"العمر"}	{"language":"ar-SA","key":"العمر","value":"العمر"}	\N	\N
464	543	directus_fields	31	{"id":31,"collection":"names","field":"age","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":"$t:العمر","searchable":true}	{"collection":"names","field":"age","validation_message":"$t:العمر"}	\N	\N
465	544	directus_collections	names	{"collection":"names","icon":"account_circle","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"ar-SA","translation":"المسميات"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#BE6464","item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"translations":[{"language":"ar-SA","translation":"المسميات"}]}	\N	\N
466	545	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"ar-SA","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019d070e-1e3d-734c-b1ca-2c63c395cef1","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"az.almalki.1996@gmail.com","project_usage":"personal","org_name":null,"product_updates":false,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null,"ai_google_api_key":null,"ai_openai_compatible_api_key":null,"ai_openai_compatible_base_url":null,"ai_openai_compatible_name":null,"ai_openai_compatible_models":null,"ai_openai_compatible_headers":null,"ai_openai_allowed_models":["gpt-5-nano","gpt-5-mini","gpt-5"],"ai_anthropic_allowed_models":["claude-haiku-4-5","claude-sonnet-4-5"],"ai_google_allowed_models":["gemini-3-pro-preview","gemini-3-flash-preview","gemini-2.5-pro","gemini-2.5-flash"],"collaborative_editing_enabled":false}	{"default_language":"ar-SA"}	\N	\N
467	546	directus_fields	30	{"id":30,"collection":"names","field":"name","special":null,"interface":"input","options":{"placeholder":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":[{"language":"ar-SA","translation":"الاسم"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"names","field":"name","options":{"placeholder":null},"translations":[{"language":"ar-SA","translation":"الاسم"}],"validation_message":null}	\N	\N
468	548	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":null,"icon":"names"}	{"sort_order":0,"parent_id":null}	\N	\N
469	549	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":1,"parent_id":null,"icon":"Users"}	{"sort_order":1,"parent_id":null}	\N	\N
470	550	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":2,"parent_id":null,"icon":"Map"}	{"sort_order":2,"parent_id":null}	\N	\N
471	551	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":3,"parent_id":null,"icon":"BarChart"}	{"sort_order":3,"parent_id":null}	\N	\N
472	552	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
475	556	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":3,"parent_id":null,"icon":"Users"}	{"title":"الوظائف","url_path":"/Jobs","sort_order":3,"parent_id":null,"icon":"Users"}	\N	\N
476	557	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":1,"parent_id":null,"icon":"Users"}	{"title":"الوظائف","url_path":"/Jobs","sort_order":1,"parent_id":null,"icon":"Users"}	\N	\N
477	558	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
478	559	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":1,"parent_id":null,"icon":"names"}	{"sort_order":1,"parent_id":null}	\N	\N
479	560	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":2,"parent_id":null,"icon":"Map"}	{"sort_order":2,"parent_id":null}	\N	\N
480	561	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":3,"parent_id":null,"icon":"BarChart"}	{"sort_order":3,"parent_id":null}	\N	\N
481	562	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
482	563	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
483	564	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":1,"parent_id":null,"icon":"Map"}	{"sort_order":1,"parent_id":null}	\N	\N
484	565	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":2,"parent_id":null,"icon":"names"}	{"sort_order":2,"parent_id":null}	\N	\N
485	566	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":3,"parent_id":null,"icon":"BarChart"}	{"sort_order":3,"parent_id":null}	\N	\N
486	567	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
487	568	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
488	569	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":1,"parent_id":null,"icon":"Map"}	{"sort_order":1,"parent_id":null}	\N	\N
489	570	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":2,"parent_id":null,"icon":"BarChart"}	{"sort_order":2,"parent_id":null}	\N	\N
490	571	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":3,"parent_id":null,"icon":"names"}	{"sort_order":3,"parent_id":null}	\N	\N
491	572	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
492	573	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
493	574	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":1,"parent_id":null,"icon":"Map"}	{"sort_order":1,"parent_id":null}	\N	\N
494	575	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":2,"parent_id":null,"icon":"BarChart"}	{"sort_order":2,"parent_id":null}	\N	\N
495	576	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":3,"parent_id":null,"icon":"Folder"}	{"sort_order":3,"parent_id":null}	\N	\N
496	577	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":4,"parent_id":null,"icon":"names"}	{"sort_order":4,"parent_id":null}	\N	\N
497	578	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
498	579	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":1,"parent_id":null,"icon":"Map"}	{"sort_order":1,"parent_id":null}	\N	\N
499	580	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":2,"parent_id":null,"icon":"BarChart"}	{"sort_order":2,"parent_id":null}	\N	\N
500	581	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":3,"parent_id":null,"icon":"names"}	{"sort_order":3,"parent_id":null}	\N	\N
501	582	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
502	583	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	\N	\N
503	584	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":0,"parent_id":null,"icon":"BarChart"}	{"title":"الخطط الاستراتيجية","url_path":null,"sort_order":0,"parent_id":null,"icon":"BarChart"}	\N	\N
504	585	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	\N	\N
505	586	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
506	587	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
507	588	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":2,"parent_id":null,"icon":"Users"}	{"sort_order":2,"parent_id":null}	\N	\N
508	589	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":3,"parent_id":null,"icon":"names"}	{"sort_order":3,"parent_id":null}	\N	\N
509	590	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":4,"parent_id":null,"icon":"Map"}	{"sort_order":4,"parent_id":null}	\N	\N
510	591	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
511	592	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
512	593	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":2,"parent_id":null,"icon":"names"}	{"sort_order":2,"parent_id":null}	\N	\N
513	594	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":3,"parent_id":null,"icon":"Users"}	{"sort_order":3,"parent_id":null}	\N	\N
514	595	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":4,"parent_id":null,"icon":"Map"}	{"sort_order":4,"parent_id":null}	\N	\N
515	596	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":0,"parent_id":null,"icon":"BarChart"}	{"title":"الخطط الاستراتيجية","url_path":null,"sort_order":0,"parent_id":null,"icon":"BarChart"}	\N	\N
516	597	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":null,"icon":"names"}	{"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":null,"icon":"names"}	\N	\N
517	598	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":null,"icon":"names"}	{"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":null,"icon":"names"}	\N	\N
518	599	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
519	600	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":1,"parent_id":null,"icon":"names"}	{"sort_order":1,"parent_id":null}	\N	\N
520	601	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":2,"parent_id":null,"icon":"BarChart"}	{"sort_order":2,"parent_id":null}	\N	\N
521	602	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":3,"parent_id":null,"icon":"Users"}	{"sort_order":3,"parent_id":null}	\N	\N
522	603	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":4,"parent_id":null,"icon":"Map"}	{"sort_order":4,"parent_id":null}	\N	\N
523	604	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":null,"icon":"names"}	{"sort_order":0,"parent_id":null}	\N	\N
524	605	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":1,"parent_id":null,"icon":"Folder"}	{"sort_order":1,"parent_id":null}	\N	\N
525	606	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":2,"parent_id":null,"icon":"BarChart"}	{"sort_order":2,"parent_id":null}	\N	\N
526	607	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":3,"parent_id":null,"icon":"Users"}	{"sort_order":3,"parent_id":null}	\N	\N
527	608	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":4,"parent_id":null,"icon":"Map"}	{"sort_order":4,"parent_id":null}	\N	\N
528	609	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":3,"parent_id":null,"icon":"names"}	{"title":"المسميات","url_path":"/names","sort_order":3,"parent_id":null,"icon":"names"}	\N	\N
529	610	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
530	611	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
531	612	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":2,"parent_id":null,"icon":"names"}	{"sort_order":2,"parent_id":null}	\N	\N
532	613	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":3,"parent_id":null,"icon":"Map"}	{"sort_order":3,"parent_id":null}	\N	\N
533	614	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":4,"parent_id":null,"icon":"Users"}	{"sort_order":4,"parent_id":null}	\N	\N
534	615	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
535	616	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
536	617	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":2,"parent_id":null,"icon":"names"}	{"sort_order":2,"parent_id":null}	\N	\N
537	618	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":3,"parent_id":null,"icon":"Users"}	{"sort_order":3,"parent_id":null}	\N	\N
538	619	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":4,"parent_id":null,"icon":"Map"}	{"sort_order":4,"parent_id":null}	\N	\N
539	620	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
540	621	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
541	622	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":2,"parent_id":null,"icon":"Users"}	{"sort_order":2,"parent_id":null}	\N	\N
542	623	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":3,"parent_id":null,"icon":"names"}	{"sort_order":3,"parent_id":null}	\N	\N
543	624	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":4,"parent_id":null,"icon":"Map"}	{"sort_order":4,"parent_id":null}	\N	\N
544	625	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
545	626	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":1,"parent_id":null,"icon":"Users"}	{"sort_order":1,"parent_id":null}	\N	\N
546	627	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":2,"parent_id":null,"icon":"BarChart"}	{"sort_order":2,"parent_id":null}	\N	\N
547	628	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":3,"parent_id":null,"icon":"names"}	{"sort_order":3,"parent_id":null}	\N	\N
548	629	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":4,"parent_id":null,"icon":"Map"}	{"sort_order":4,"parent_id":null}	\N	\N
549	630	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
550	631	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":1,"parent_id":null,"icon":"Folder"}	{"sort_order":1,"parent_id":null}	\N	\N
551	632	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":2,"parent_id":null,"icon":"BarChart"}	{"sort_order":2,"parent_id":null}	\N	\N
552	633	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":3,"parent_id":null,"icon":"names"}	{"sort_order":3,"parent_id":null}	\N	\N
553	634	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":4,"parent_id":null,"icon":"Map"}	{"sort_order":4,"parent_id":null}	\N	\N
554	635	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
555	636	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":1,"parent_id":null,"icon":"Users"}	{"sort_order":1,"parent_id":null}	\N	\N
556	637	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":2,"parent_id":null,"icon":"BarChart"}	{"sort_order":2,"parent_id":null}	\N	\N
557	638	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":3,"parent_id":null,"icon":"names"}	{"sort_order":3,"parent_id":null}	\N	\N
558	639	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":4,"parent_id":null,"icon":"Map"}	{"sort_order":4,"parent_id":null}	\N	\N
559	640	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
560	641	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":1,"parent_id":null,"icon":"Folder"}	{"sort_order":1,"parent_id":null}	\N	\N
561	642	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":2,"parent_id":null,"icon":"BarChart"}	{"sort_order":2,"parent_id":null}	\N	\N
562	643	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":3,"parent_id":null,"icon":"names"}	{"sort_order":3,"parent_id":null}	\N	\N
563	644	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":4,"parent_id":null,"icon":"Map"}	{"sort_order":4,"parent_id":null}	\N	\N
564	645	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
565	646	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
566	647	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":2,"parent_id":null,"icon":"Folder"}	{"sort_order":2,"parent_id":null}	\N	\N
567	648	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":3,"parent_id":null,"icon":"names"}	{"sort_order":3,"parent_id":null}	\N	\N
568	649	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":4,"parent_id":null,"icon":"Map"}	{"sort_order":4,"parent_id":null}	\N	\N
569	650	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
570	651	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
571	652	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":2,"parent_id":null,"icon":"names"}	{"sort_order":2,"parent_id":null}	\N	\N
572	653	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":3,"parent_id":null,"icon":"Folder"}	{"sort_order":3,"parent_id":null}	\N	\N
573	654	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":4,"parent_id":null,"icon":"Map"}	{"sort_order":4,"parent_id":null}	\N	\N
574	655	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
575	656	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
576	657	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":2,"parent_id":null,"icon":"names"}	{"sort_order":2,"parent_id":null}	\N	\N
577	658	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":3,"parent_id":null,"icon":"Map"}	{"sort_order":3,"parent_id":null}	\N	\N
578	659	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
579	660	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":null,"icon":"names"}	{"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":null,"icon":"names"}	\N	\N
580	661	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":4,"parent_id":null,"icon":"names"}	{"title":"المسميات","url_path":"/names","sort_order":4,"parent_id":null,"icon":"names"}	\N	\N
581	662	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":2,"parent_id":null,"icon":"names"}	{"title":"المسميات","url_path":"/names","sort_order":2,"parent_id":null,"icon":"names"}	\N	\N
582	663	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":null,"icon":"names"}	{"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":null,"icon":"names"}	\N	\N
583	664	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
584	665	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":1,"parent_id":null,"icon":"names"}	{"sort_order":1,"parent_id":null}	\N	\N
585	666	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":2,"parent_id":null,"icon":"BarChart"}	{"sort_order":2,"parent_id":null}	\N	\N
586	667	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":3,"parent_id":null,"icon":"Map"}	{"sort_order":3,"parent_id":null}	\N	\N
587	668	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
588	669	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
589	670	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
590	671	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":2,"parent_id":null,"icon":"names"}	{"sort_order":2,"parent_id":null}	\N	\N
591	672	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":3,"parent_id":null,"icon":"Map"}	{"sort_order":3,"parent_id":null}	\N	\N
592	673	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
593	674	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
594	675	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
595	676	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":2,"parent_id":null,"icon":"Map"}	{"sort_order":2,"parent_id":null}	\N	\N
596	677	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":3,"parent_id":null,"icon":"names"}	{"sort_order":3,"parent_id":null}	\N	\N
597	678	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
598	679	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
599	680	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
600	681	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":2,"parent_id":null,"icon":"Map"}	{"sort_order":2,"parent_id":null}	\N	\N
601	682	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":3,"parent_id":null,"icon":"Folder"}	{"sort_order":3,"parent_id":null}	\N	\N
602	683	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":4,"parent_id":null,"icon":"names"}	{"sort_order":4,"parent_id":null}	\N	\N
603	684	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
604	685	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
605	686	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":2,"parent_id":null,"icon":"Map"}	{"sort_order":2,"parent_id":null}	\N	\N
606	687	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":3,"parent_id":null,"icon":"names"}	{"sort_order":3,"parent_id":null}	\N	\N
607	688	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
608	689	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
609	690	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
610	691	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":2,"parent_id":null,"icon":"names"}	{"sort_order":2,"parent_id":null}	\N	\N
611	692	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":3,"parent_id":null,"icon":"Map"}	{"sort_order":3,"parent_id":null}	\N	\N
612	693	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
613	694	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":0,"parent_id":null,"icon":"Users"}	{"sort_order":0,"parent_id":null}	\N	\N
614	695	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":1,"parent_id":null,"icon":"names"}	{"sort_order":1,"parent_id":null}	\N	\N
615	696	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":2,"parent_id":null,"icon":"BarChart"}	{"sort_order":2,"parent_id":null}	\N	\N
616	697	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":3,"parent_id":null,"icon":"Map"}	{"sort_order":3,"parent_id":null}	\N	\N
617	698	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
618	699	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":null,"icon":"names"}	{"sort_order":0,"parent_id":null}	\N	\N
619	700	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":1,"parent_id":null,"icon":"Users"}	{"sort_order":1,"parent_id":null}	\N	\N
620	701	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":2,"parent_id":null,"icon":"BarChart"}	{"sort_order":2,"parent_id":null}	\N	\N
621	702	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":3,"parent_id":null,"icon":"Map"}	{"sort_order":3,"parent_id":null}	\N	\N
622	703	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
623	704	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":null,"icon":"names"}	{"sort_order":0,"parent_id":null}	\N	\N
624	705	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
625	706	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":2,"parent_id":null,"icon":"Users"}	{"sort_order":2,"parent_id":null}	\N	\N
626	707	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":3,"parent_id":null,"icon":"Map"}	{"sort_order":3,"parent_id":null}	\N	\N
627	708	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
628	709	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":0,"parent_id":null,"icon":"BarChart"}	{"sort_order":0,"parent_id":null}	\N	\N
629	710	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":1,"parent_id":null,"icon":"names"}	{"sort_order":1,"parent_id":null}	\N	\N
630	711	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":2,"parent_id":null,"icon":"Users"}	{"sort_order":2,"parent_id":null}	\N	\N
631	712	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":3,"parent_id":null,"icon":"Map"}	{"sort_order":3,"parent_id":null}	\N	\N
632	713	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
633	714	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":null,"icon":"names"}	{"sort_order":0,"parent_id":null}	\N	\N
634	715	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
635	716	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":2,"parent_id":null,"icon":"Users"}	{"sort_order":2,"parent_id":null}	\N	\N
636	717	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":3,"parent_id":null,"icon":"Map"}	{"sort_order":3,"parent_id":null}	\N	\N
637	718	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
638	719	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":19,"icon":"names"}	{"sort_order":0,"parent_id":19}	\N	\N
639	720	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":0,"parent_id":null,"icon":"BarChart"}	{"sort_order":0,"parent_id":null}	\N	\N
640	721	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":1,"parent_id":null,"icon":"Users"}	{"sort_order":1,"parent_id":null}	\N	\N
641	722	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":2,"parent_id":null,"icon":"Map"}	{"sort_order":2,"parent_id":null}	\N	\N
642	723	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":3,"parent_id":null,"icon":"Folder"}	{"sort_order":3,"parent_id":null}	\N	\N
643	724	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":19,"icon":"names"}	{"sort_order":0,"parent_id":19}	\N	\N
644	725	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":0,"parent_id":null,"icon":"BarChart"}	{"sort_order":0,"parent_id":null}	\N	\N
645	726	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":1,"parent_id":null,"icon":"Users"}	{"sort_order":1,"parent_id":null}	\N	\N
646	727	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":2,"parent_id":null,"icon":"Map"}	{"sort_order":2,"parent_id":null}	\N	\N
647	728	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":3,"parent_id":null,"icon":"Folder"}	{"sort_order":3,"parent_id":null}	\N	\N
648	729	menu_items	20	{"id":20,"title":"المسميات","url_path":"/names","sort_order":0,"parent_id":null,"icon":"names"}	{"sort_order":0,"parent_id":null}	\N	\N
649	730	menu_items	19	{"id":19,"title":"الخطط الاستراتيجية","url_path":null,"sort_order":1,"parent_id":null,"icon":"BarChart"}	{"sort_order":1,"parent_id":null}	\N	\N
650	731	menu_items	21	{"id":21,"title":"الوظائف","url_path":"/Jobs","sort_order":2,"parent_id":null,"icon":"Users"}	{"sort_order":2,"parent_id":null}	\N	\N
651	732	menu_items	18	{"id":18,"title":"الهيكل","url_path":"/panel","sort_order":3,"parent_id":null,"icon":"Map"}	{"sort_order":3,"parent_id":null}	\N	\N
652	733	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":4,"parent_id":null,"icon":"Folder"}	{"sort_order":4,"parent_id":null}	\N	\N
653	756	directus_fields	32	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Structures"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Structures"}	\N	\N
654	757	directus_collections	Structures	{"singleton":false,"collection":"Structures"}	{"singleton":false,"collection":"Structures"}	\N	\N
655	758	directus_fields	33	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Jobs"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Jobs"}	\N	\N
656	759	directus_collections	Jobs	{"singleton":false,"collection":"Jobs"}	{"singleton":false,"collection":"Jobs"}	\N	\N
657	760	directus_collections	Categories	{"collection":"Categories","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
658	761	directus_collections	Jobs	{"collection":"Jobs","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
659	762	directus_collections	menu_items	{"collection":"menu_items","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
660	763	directus_collections	site_settings	{"collection":"site_settings","icon":"settings","note":"تخصيص الإعدادات العامة للنظام","display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
661	764	directus_collections	Structures	{"collection":"Structures","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
662	765	directus_collections	Categories	{"collection":"Categories","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
663	766	directus_collections	menu_items	{"collection":"menu_items","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
664	767	directus_collections	site_settings	{"collection":"site_settings","icon":"settings","note":"تخصيص الإعدادات العامة للنظام","display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
669	772	directus_fields	35	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Employees"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Employees"}	\N	\N
670	773	directus_collections	Employees	{"singleton":false,"collection":"Employees"}	{"singleton":false,"collection":"Employees"}	\N	\N
665	768	directus_collections	Structures	{"collection":"Structures","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
666	769	directus_collections	Jobs	{"collection":"Jobs","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
667	770	directus_fields	34	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Departments"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Departments"}	\N	\N
668	771	directus_collections	Departments	{"singleton":false,"collection":"Departments"}	{"singleton":false,"collection":"Departments"}	\N	\N
671	774	directus_fields	36	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Calendars"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Calendars"}	\N	\N
672	775	directus_collections	Calendars	{"singleton":false,"collection":"Calendars"}	{"singleton":false,"collection":"Calendars"}	\N	\N
673	776	directus_collections	Categories	{"collection":"Categories","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
674	777	directus_collections	menu_items	{"collection":"menu_items","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
675	778	directus_collections	site_settings	{"collection":"site_settings","icon":"settings","note":"تخصيص الإعدادات العامة للنظام","display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
676	779	directus_collections	Structures	{"collection":"Structures","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
677	780	directus_collections	Jobs	{"collection":"Jobs","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
678	781	directus_collections	Departments	{"collection":"Departments","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
679	782	directus_collections	Employees	{"collection":"Employees","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
680	783	directus_collections	Calendars	{"collection":"Calendars","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
681	784	menu_items	22	{"title":"الهيكل","sort_order":0,"url_path":"/Structures","parent_id":17,"icon":"Box"}	{"title":"الهيكل","sort_order":0,"url_path":"/Structures","parent_id":17,"icon":"Box"}	\N	\N
682	785	directus_collections	Structures	{"collection":"Structures","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"ar-SA","translation":"الهيكل"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"translations":[{"language":"ar-SA","translation":"الهيكل"}]}	\N	\N
683	786	directus_fields	37	{"sort":2,"interface":"input","special":null,"collection":"Structures","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"Structures","field":"name"}	\N	\N
684	787	directus_fields	38	{"sort":3,"interface":"input","special":null,"collection":"Structures","field":"code"}	{"sort":3,"interface":"input","special":null,"collection":"Structures","field":"code"}	\N	\N
685	788	directus_fields	37	{"id":37,"collection":"Structures","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":[{"language":"ar-SA","translation":"الاسم"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"Structures","field":"name","translations":[{"language":"ar-SA","translation":"الاسم"}]}	\N	\N
686	789	directus_fields	38	{"id":38,"collection":"Structures","field":"code","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":[{"language":"ar-SA","translation":"كود القسم"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"Structures","field":"code","translations":[{"language":"ar-SA","translation":"كود القسم"}]}	\N	\N
687	790	directus_fields	39	{"sort":4,"interface":"input-multiline","special":null,"collection":"Structures","field":"description"}	{"sort":4,"interface":"input-multiline","special":null,"collection":"Structures","field":"description"}	\N	\N
688	791	directus_fields	39	{"id":39,"collection":"Structures","field":"description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":[{"language":"ar-SA","translation":"الوصف"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"Structures","field":"description","translations":[{"language":"ar-SA","translation":"الوصف"}]}	\N	\N
689	792	directus_fields	40	{"sort":5,"interface":"boolean","special":["cast-boolean"],"collection":"Structures","field":"is_active"}	{"sort":5,"interface":"boolean","special":["cast-boolean"],"collection":"Structures","field":"is_active"}	\N	\N
690	793	directus_fields	40	{"id":40,"collection":"Structures","field":"is_active","special":["cast-boolean"],"interface":"boolean","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":[{"language":"ar-SA","translation":"مفعل؟"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"Structures","field":"is_active","translations":[{"language":"ar-SA","translation":"مفعل؟"}]}	\N	\N
691	794	directus_fields	41	{"sort":6,"interface":"input","special":null,"collection":"Structures","field":"sort_order"}	{"sort":6,"interface":"input","special":null,"collection":"Structures","field":"sort_order"}	\N	\N
692	795	directus_fields	41	{"id":41,"collection":"Structures","field":"sort_order","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":[{"language":"ar-SA","translation":"رقم الترتيب"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"Structures","field":"sort_order","translations":[{"language":"ar-SA","translation":"رقم الترتيب"}]}	\N	\N
693	796	directus_fields	42	{"sort":7,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{name}}"},"collection":"Structures","field":"parent_id"}	{"sort":7,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{name}}"},"collection":"Structures","field":"parent_id"}	\N	\N
694	797	directus_fields	42	{"id":42,"collection":"Structures","field":"parent_id","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":[{"language":"ar-SA","translation":"جهة الارتباط"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"Structures","field":"parent_id","translations":[{"language":"ar-SA","translation":"جهة الارتباط"}]}	\N	\N
695	798	Structures	1	{"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"اللل","is_active":true,"sort_order":1,"parent_id":null}	{"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"اللل","is_active":true,"sort_order":1,"parent_id":null}	\N	\N
696	799	Structures	2	{"name":"ل","code":"شسبشسب","description":"سيل","is_active":true,"sort_order":0,"parent_id":null}	{"name":"ل","code":"شسبشسب","description":"سيل","is_active":true,"sort_order":0,"parent_id":null}	\N	\N
697	800	Structures	1	{"id":1,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"اللل","is_active":true,"sort_order":0,"parent_id":null}	{"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"اللل","is_active":true,"sort_order":0,"parent_id":null}	\N	\N
698	801	Structures	3	{"is_active":true,"sort_order":2,"parent_id":1}	{"is_active":true,"sort_order":2,"parent_id":1}	\N	\N
699	802	Structures	3	{"id":3,"name":null,"code":null,"description":null,"is_active":true,"sort_order":2,"parent_id":null}	{"name":null,"code":null,"description":null,"is_active":true,"sort_order":2,"parent_id":null}	\N	\N
700	803	Structures	1	{"id":1,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"اللل","is_active":true,"sort_order":4,"parent_id":null}	{"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"اللل","is_active":true,"sort_order":4,"parent_id":null}	\N	\N
701	804	Structures	1	{"id":1,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"اللل","is_active":false,"sort_order":4,"parent_id":null}	{"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"اللل","is_active":false,"sort_order":4,"parent_id":null}	\N	\N
702	806	Structures	1	{"id":1,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"اللل","is_active":true,"sort_order":4,"parent_id":null}	{"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"اللل","is_active":true,"sort_order":4,"parent_id":null}	\N	\N
703	809	Structures	4	{"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":true,"sort_order":0,"parent_id":null}	{"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":true,"sort_order":0,"parent_id":null}	\N	\N
704	810	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":false,"sort_order":0,"parent_id":null}	{"is_active":false}	\N	\N
705	811	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":true,"sort_order":0,"parent_id":null}	{"is_active":true}	\N	\N
706	812	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":false,"sort_order":0,"parent_id":null}	{"is_active":false}	\N	\N
707	813	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":true,"sort_order":0,"parent_id":null}	{"is_active":true}	\N	\N
708	814	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":false,"sort_order":0,"parent_id":null}	{"is_active":false}	\N	\N
709	815	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":true,"sort_order":0,"parent_id":null}	{"is_active":true}	\N	\N
710	816	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":false,"sort_order":0,"parent_id":null}	{"is_active":false}	\N	\N
711	817	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":true,"sort_order":0,"parent_id":null}	{"is_active":true}	\N	\N
712	818	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":false,"sort_order":0,"parent_id":null}	{"is_active":false}	\N	\N
713	819	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":true,"sort_order":0,"parent_id":null}	{"is_active":true}	\N	\N
714	820	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":false,"sort_order":0,"parent_id":null}	{"is_active":false}	\N	\N
715	821	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":true,"sort_order":0,"parent_id":null}	{"is_active":true}	\N	\N
716	822	Structures	5	{"name":"الل","code":"150","is_active":true,"sort_order":0,"parent_id":null}	{"name":"الل","code":"150","is_active":true,"sort_order":0,"parent_id":null}	\N	\N
717	823	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":false,"sort_order":0,"parent_id":null}	{"is_active":false}	\N	\N
718	824	Structures	5	{"id":5,"name":"الل","code":"150","description":null,"is_active":false,"sort_order":0,"parent_id":null}	{"is_active":false}	\N	\N
719	825	Structures	5	{"id":5,"name":"الل","code":"150","description":null,"is_active":true,"sort_order":0,"parent_id":null}	{"is_active":true}	\N	\N
722	828	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":true,"sort_order":0,"parent_id":null}	{"sort_order":0}	\N	\N
724	830	Structures	5	{"id":5,"name":"الل","code":"150","description":null,"is_active":true,"sort_order":0,"parent_id":null}	{"sort_order":0}	\N	\N
725	831	Structures	5	{"id":5,"name":"الل","code":"150","description":null,"is_active":true,"sort_order":0,"parent_id":4}	{"name":"الل","code":"150","description":null,"is_active":true,"sort_order":0,"parent_id":4}	\N	\N
726	832	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":false,"sort_order":-1,"parent_id":null}	{"is_active":false}	\N	\N
727	833	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":true,"sort_order":-1,"parent_id":null}	{"is_active":true}	\N	\N
728	834	Structures	5	{"id":5,"name":"الل","code":"150","description":null,"is_active":false,"sort_order":0,"parent_id":4}	{"is_active":false}	\N	\N
720	826	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":true,"sort_order":0,"parent_id":null}	{"is_active":true}	\N	\N
721	827	Structures	5	{"id":5,"name":"الل","code":"150","description":null,"is_active":true,"sort_order":-1,"parent_id":null}	{"sort_order":-1}	\N	\N
723	829	Structures	4	{"id":4,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"الكلية","is_active":true,"sort_order":-1,"parent_id":null}	{"sort_order":-1}	\N	\N
729	835	Structures	5	{"id":5,"name":"الل","code":"150","description":null,"is_active":true,"sort_order":0,"parent_id":4}	{"is_active":true}	\N	\N
730	836	directus_fields	43	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"designations"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"designations"}	\N	\N
731	837	directus_collections	designations	{"singleton":false,"collection":"designations"}	{"singleton":false,"collection":"designations"}	\N	\N
732	838	directus_fields	44	{"sort":2,"interface":"input","special":null,"collection":"designations","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"designations","field":"name"}	\N	\N
733	839	directus_collections	designations	{"collection":"designations","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"ar-SA","translation":"المسميات"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"translations":[{"language":"ar-SA","translation":"المسميات"}]}	\N	\N
734	840	directus_fields	44	{"id":44,"collection":"designations","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":[{"language":"ar-SA","translation":"الاسم"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"designations","field":"name","translations":[{"language":"ar-SA","translation":"الاسم"}]}	\N	\N
735	841	directus_fields	45	{"sort":3,"interface":"boolean","special":["cast-boolean"],"collection":"designations","field":"is_active"}	{"sort":3,"interface":"boolean","special":["cast-boolean"],"collection":"designations","field":"is_active"}	\N	\N
736	842	directus_fields	46	{"sort":4,"interface":"input","special":null,"collection":"designations","field":"sort_order"}	{"sort":4,"interface":"input","special":null,"collection":"designations","field":"sort_order"}	\N	\N
737	843	menu_items	23	{"title":"المسميات","sort_order":0,"url_path":"/designations","parent_id":17,"icon":"Users"}	{"title":"المسميات","sort_order":0,"url_path":"/designations","parent_id":17,"icon":"Users"}	\N	\N
738	844	designations	1	{"name":"وظائف","is_active":true,"sort_order":0}	{"name":"وظائف","is_active":true,"sort_order":0}	\N	\N
739	845	designations	1	{"id":1,"name":"وظائف","is_active":false,"sort_order":0}	{"is_active":false}	\N	\N
740	846	designations	1	{"id":1,"name":"وظائف","is_active":true,"sort_order":0}	{"is_active":true}	\N	\N
741	849	Structures	6	{"name":"سيلسيل","code":"يبا","is_active":true,"sort_order":0,"parent_id":4}	{"name":"سيلسيل","code":"يبا","is_active":true,"sort_order":0,"parent_id":4}	\N	\N
742	852	designations	2	{"name":"لبابلا","is_active":true,"sort_order":0}	{"name":"لبابلا","is_active":true,"sort_order":0}	\N	\N
743	853	directus_fields	47	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"job_types"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"job_types"}	\N	\N
744	854	directus_collections	job_types	{"singleton":false,"collection":"job_types"}	{"singleton":false,"collection":"job_types"}	\N	\N
745	855	directus_fields	48	{"sort":2,"interface":"input","special":null,"collection":"job_types","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"job_types","field":"name"}	\N	\N
746	856	directus_fields	49	{"sort":3,"interface":"boolean","special":["cast-boolean"],"collection":"job_types","field":"is_active"}	{"sort":3,"interface":"boolean","special":["cast-boolean"],"collection":"job_types","field":"is_active"}	\N	\N
747	857	directus_fields	50	{"sort":4,"interface":"input","special":null,"collection":"job_types","field":"sort_order"}	{"sort":4,"interface":"input","special":null,"collection":"job_types","field":"sort_order"}	\N	\N
748	858	directus_fields	51	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"job_axes"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"job_axes"}	\N	\N
749	859	directus_collections	job_axes	{"singleton":false,"collection":"job_axes"}	{"singleton":false,"collection":"job_axes"}	\N	\N
750	860	directus_fields	52	{"sort":2,"interface":"input","special":null,"collection":"job_axes","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"job_axes","field":"name"}	\N	\N
751	861	directus_fields	53	{"sort":3,"interface":"boolean","special":["cast-boolean"],"collection":"job_axes","field":"is_active"}	{"sort":3,"interface":"boolean","special":["cast-boolean"],"collection":"job_axes","field":"is_active"}	\N	\N
752	862	directus_fields	54	{"sort":4,"interface":"input","special":null,"collection":"job_axes","field":"sort_order"}	{"sort":4,"interface":"input","special":null,"collection":"job_axes","field":"sort_order"}	\N	\N
753	863	job_types	1	{"name":"أساسية","is_active":true,"sort_order":0}	{"name":"أساسية","is_active":true,"sort_order":0}	\N	\N
754	864	job_axes	1	{"name":"مدرب","is_active":true,"sort_order":0}	{"name":"مدرب","is_active":true,"sort_order":0}	\N	\N
755	865	job_axes	2	{"name":"سواق","is_active":true,"sort_order":0}	{"name":"سواق","is_active":true,"sort_order":0}	\N	\N
756	870	designations	3	{"name":"ش","is_active":true,"sort_order":0}	{"name":"ش","is_active":true,"sort_order":0}	\N	\N
757	871	designations	4	{"name":"سي","is_active":true,"sort_order":0}	{"name":"سي","is_active":true,"sort_order":0}	\N	\N
758	874	menu_items	24	{"title":"الوظائف","sort_order":0,"url_path":"/Employees","parent_id":17,"icon":"Briefcase"}	{"title":"الوظائف","sort_order":0,"url_path":"/Employees","parent_id":17,"icon":"Briefcase"}	\N	\N
759	875	directus_fields	55	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Employees","field":"designation"}	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Employees","field":"designation"}	\N	\N
760	876	directus_fields	56	{"sort":3,"interface":"input","special":null,"collection":"Employees","field":"job_title"}	{"sort":3,"interface":"input","special":null,"collection":"Employees","field":"job_title"}	\N	\N
761	877	directus_fields	57	{"sort":4,"interface":"input-multiline","special":null,"collection":"Employees","field":"job_description"}	{"sort":4,"interface":"input-multiline","special":null,"collection":"Employees","field":"job_description"}	\N	\N
762	878	directus_fields	58	{"sort":5,"interface":"boolean","special":["cast-boolean"],"collection":"Employees","field":"is_active"}	{"sort":5,"interface":"boolean","special":["cast-boolean"],"collection":"Employees","field":"is_active"}	\N	\N
763	879	directus_fields	59	{"sort":6,"interface":"input","special":null,"collection":"Employees","field":"sort_order"}	{"sort":6,"interface":"input","special":null,"collection":"Employees","field":"sort_order"}	\N	\N
764	880	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":0,"parent_id":17,"icon":"Briefcase"}	{"title":"الوظائف","url_path":"/employees","sort_order":0,"parent_id":17,"icon":"Briefcase"}	\N	\N
765	881	job_axes	3	{"name":"hgkghk","is_active":true,"sort_order":0}	{"name":"hgkghk","is_active":true,"sort_order":0}	\N	\N
766	883	designations	5	{"name":"sdsdg","is_active":true,"sort_order":0}	{"name":"sdsdg","is_active":true,"sort_order":0}	\N	\N
767	884	job_types	2	{"name":"dfssss","is_active":true,"sort_order":0}	{"name":"dfssss","is_active":true,"sort_order":0}	\N	\N
768	885	Employees	1	{"job_title":"sd","job_description":"asfas","designation":5,"is_active":true,"sort_order":0}	{"job_title":"sd","job_description":"asfas","designation":5,"is_active":true,"sort_order":0}	\N	\N
769	888	designations	6	{"name":"sdfsfh","is_active":true,"sort_order":0}	{"name":"sdfsfh","is_active":true,"sort_order":0}	\N	\N
770	889	designations	7	{"name":"sdsg","is_active":true,"sort_order":0}	{"name":"sdsg","is_active":true,"sort_order":0}	\N	\N
771	890	Employees	2	{"job_title":"sdgg","job_description":"sdg","designation":6,"is_active":true,"sort_order":0}	{"job_title":"sdgg","job_description":"sdg","designation":6,"is_active":true,"sort_order":0}	\N	\N
772	891	Employees	3	{"job_title":"sdgfsd","job_description":"","designation":6,"is_active":true,"sort_order":0}	{"job_title":"sdgfsd","job_description":"","designation":6,"is_active":true,"sort_order":0}	\N	\N
773	896	menu_items	25	{"title":"الأقسام","sort_order":0,"url_path":"/departments","parent_id":null,"icon":"departments"}	{"title":"الأقسام","sort_order":0,"url_path":"/departments","parent_id":null,"icon":"departments"}	\N	\N
774	897	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":0,"parent_id":17,"icon":"departments"}	{"sort_order":0,"parent_id":17}	\N	\N
775	898	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
776	899	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":1,"parent_id":17,"icon":"Box"}	{"sort_order":1,"parent_id":17}	\N	\N
777	900	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":2,"parent_id":17,"icon":"Users"}	{"sort_order":2,"parent_id":17}	\N	\N
778	901	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":3,"parent_id":17,"icon":"Briefcase"}	{"sort_order":3,"parent_id":17}	\N	\N
779	902	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
780	903	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":0,"parent_id":17,"icon":"Box"}	{"sort_order":0,"parent_id":17}	\N	\N
781	904	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":1,"parent_id":17,"icon":"departments"}	{"sort_order":1,"parent_id":17}	\N	\N
782	905	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":2,"parent_id":17,"icon":"Users"}	{"sort_order":2,"parent_id":17}	\N	\N
783	906	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":3,"parent_id":17,"icon":"Briefcase"}	{"sort_order":3,"parent_id":17}	\N	\N
784	907	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
785	908	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":0,"parent_id":17,"icon":"Box"}	{"sort_order":0,"parent_id":17}	\N	\N
786	909	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":1,"parent_id":17,"icon":"Users"}	{"sort_order":1,"parent_id":17}	\N	\N
787	910	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":2,"parent_id":17,"icon":"departments"}	{"sort_order":2,"parent_id":17}	\N	\N
788	911	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":3,"parent_id":17,"icon":"Briefcase"}	{"sort_order":3,"parent_id":17}	\N	\N
789	912	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
790	913	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":0,"parent_id":17,"icon":"Box"}	{"sort_order":0,"parent_id":17}	\N	\N
791	914	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":1,"parent_id":17,"icon":"Users"}	{"sort_order":1,"parent_id":17}	\N	\N
792	915	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":2,"parent_id":17,"icon":"Briefcase"}	{"sort_order":2,"parent_id":17}	\N	\N
793	916	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":3,"parent_id":17,"icon":"departments"}	{"sort_order":3,"parent_id":17}	\N	\N
794	917	directus_fields	60	{"sort":2,"interface":"input","special":null,"collection":"Departments","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"Departments","field":"name"}	\N	\N
795	919	directus_fields	61	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":null},"collection":"Departments","field":"structure_id"}	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":null},"collection":"Departments","field":"structure_id"}	\N	\N
796	920	directus_fields	62	{"sort":3,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Departments","field":"designation"}	{"sort":3,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Departments","field":"designation"}	\N	\N
797	921	directus_fields	63	{"sort":4,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Departments","field":"job_type"}	{"sort":4,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Departments","field":"job_type"}	\N	\N
798	922	directus_fields	64	{"sort":5,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Departments","field":"employee_job"}	{"sort":5,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Departments","field":"employee_job"}	\N	\N
799	923	directus_fields	65	{"sort":6,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"شاغرة","value":"شاغرة"},{"text":"مشغولة","value":"مشغولة"},{"text":"مجمدة","value":"مجمدة"}]},"collection":"Departments","field":"job_status"}	{"sort":6,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"شاغرة","value":"شاغرة"},{"text":"مشغولة","value":"مشغولة"},{"text":"مجمدة","value":"مجمدة"}]},"collection":"Departments","field":"job_status"}	\N	\N
800	924	directus_fields	66	{"sort":7,"interface":"input","special":null,"collection":"Departments","field":"sort_order"}	{"sort":7,"interface":"input","special":null,"collection":"Departments","field":"sort_order"}	\N	\N
801	926	Structures	7	{"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"كلية","is_active":true,"sort_order":0,"parent_id":null}	{"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"كلية","is_active":true,"sort_order":0,"parent_id":null}	\N	\N
802	927	Structures	8	{"name":"مجلس الكلية","code":"185","is_active":true,"sort_order":0,"parent_id":7}	{"name":"مجلس الكلية","code":"185","is_active":true,"sort_order":0,"parent_id":7}	\N	\N
803	928	Structures	9	{"name":"العمادة","is_active":true,"sort_order":0,"parent_id":8}	{"name":"العمادة","is_active":true,"sort_order":0,"parent_id":8}	\N	\N
804	929	Structures	10	{"name":"وكالة شؤون المتدربين","code":"140","is_active":true,"sort_order":0,"parent_id":8}	{"name":"وكالة شؤون المتدربين","code":"140","is_active":true,"sort_order":0,"parent_id":8}	\N	\N
805	930	Structures	9	{"id":9,"name":"العمادة","code":"148","description":null,"is_active":true,"sort_order":0,"parent_id":8}	{"name":"العمادة","code":"148","description":null,"is_active":true,"sort_order":0,"parent_id":8}	\N	\N
806	931	Structures	11	{"name":"وكالة الجودة","code":"200","is_active":true,"sort_order":0,"parent_id":8}	{"name":"وكالة الجودة","code":"200","is_active":true,"sort_order":0,"parent_id":8}	\N	\N
807	932	Structures	12	{"name":"وكالة شؤون المتدربين","code":"700","is_active":true,"sort_order":0,"parent_id":8}	{"name":"وكالة شؤون المتدربين","code":"700","is_active":true,"sort_order":0,"parent_id":8}	\N	\N
808	933	Structures	10	{"id":10,"name":"وكالة شؤون المدربين","code":"140","description":null,"is_active":true,"sort_order":0,"parent_id":8}	{"name":"وكالة شؤون المدربين","code":"140","description":null,"is_active":true,"sort_order":0,"parent_id":8}	\N	\N
809	934	Structures	13	{"name":"إدارة الخدمات المساندة","code":"451","is_active":true,"sort_order":0,"parent_id":8}	{"name":"إدارة الخدمات المساندة","code":"451","is_active":true,"sort_order":0,"parent_id":8}	\N	\N
810	935	Structures	11	{"id":11,"name":"وكالة الجودة","code":"200","description":null,"is_active":false,"sort_order":0,"parent_id":8}	{"is_active":false}	\N	\N
811	936	Structures	11	{"id":11,"name":"وكالة الجودة","code":"200","description":null,"is_active":true,"sort_order":0,"parent_id":8}	{"is_active":true}	\N	\N
812	937	Structures	13	{"id":13,"name":"إدارة الخدمات المساندة","code":"451","description":null,"is_active":false,"sort_order":0,"parent_id":8}	{"is_active":false}	\N	\N
813	938	Structures	8	{"id":8,"name":"مجلس الكلية","code":"185","description":null,"is_active":false,"sort_order":0,"parent_id":7}	{"is_active":false}	\N	\N
814	939	Structures	9	{"id":9,"name":"العمادة","code":"148","description":null,"is_active":false,"sort_order":0,"parent_id":8}	{"is_active":false}	\N	\N
815	940	Structures	10	{"id":10,"name":"وكالة شؤون المدربين","code":"140","description":null,"is_active":false,"sort_order":0,"parent_id":8}	{"is_active":false}	\N	\N
816	941	Structures	7	{"id":7,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"كلية","is_active":false,"sort_order":0,"parent_id":null}	{"is_active":false}	\N	\N
817	942	Structures	11	{"id":11,"name":"وكالة الجودة","code":"200","description":null,"is_active":false,"sort_order":0,"parent_id":8}	{"is_active":false}	\N	\N
818	943	Structures	12	{"id":12,"name":"وكالة شؤون المتدربين","code":"700","description":null,"is_active":false,"sort_order":0,"parent_id":8}	{"is_active":false}	\N	\N
819	944	Structures	7	{"id":7,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"كلية","is_active":true,"sort_order":0,"parent_id":null}	{"is_active":true}	\N	\N
820	945	Structures	9	{"id":9,"name":"العمادة","code":"148","description":null,"is_active":true,"sort_order":0,"parent_id":8}	{"is_active":true}	\N	\N
821	946	Structures	10	{"id":10,"name":"وكالة شؤون المدربين","code":"140","description":null,"is_active":true,"sort_order":0,"parent_id":8}	{"is_active":true}	\N	\N
822	947	Structures	12	{"id":12,"name":"وكالة شؤون المتدربين","code":"700","description":null,"is_active":true,"sort_order":0,"parent_id":8}	{"is_active":true}	\N	\N
823	949	Structures	11	{"id":11,"name":"وكالة الجودة","code":"200","description":null,"is_active":true,"sort_order":0,"parent_id":8}	{"is_active":true}	\N	\N
824	948	Structures	8	{"id":8,"name":"مجلس الكلية","code":"185","description":null,"is_active":true,"sort_order":0,"parent_id":7}	{"is_active":true}	\N	\N
825	950	Structures	13	{"id":13,"name":"إدارة الخدمات المساندة","code":"451","description":null,"is_active":true,"sort_order":0,"parent_id":8}	{"is_active":true}	\N	\N
826	951	Structures	14	{"name":"مكتب العميد","code":"410","is_active":true,"sort_order":0,"parent_id":9}	{"name":"مكتب العميد","code":"410","is_active":true,"sort_order":0,"parent_id":9}	\N	\N
827	952	Structures	15	{"name":"السكرتارية","code":"4512","is_active":true,"sort_order":0,"parent_id":9}	{"name":"السكرتارية","code":"4512","is_active":true,"sort_order":0,"parent_id":9}	\N	\N
828	953	Structures	16	{"name":"وحدة الرقابة","code":"7546","is_active":true,"sort_order":0,"parent_id":9}	{"name":"وحدة الرقابة","code":"7546","is_active":true,"sort_order":0,"parent_id":9}	\N	\N
829	954	Structures	17	{"name":"وجدة الاتصال المؤسسي","code":"784","is_active":true,"sort_order":0,"parent_id":9}	{"name":"وجدة الاتصال المؤسسي","code":"784","is_active":true,"sort_order":0,"parent_id":9}	\N	\N
830	955	Structures	18	{"name":"قسم التدريبات العامة","is_active":true,"sort_order":0,"parent_id":17}	{"name":"قسم التدريبات العامة","is_active":true,"sort_order":0,"parent_id":17}	\N	\N
831	956	Structures	19	{"name":"مركز خدمة المجتمع","code":"5846","is_active":true,"sort_order":0,"parent_id":9}	{"name":"مركز خدمة المجتمع","code":"5846","is_active":true,"sort_order":0,"parent_id":9}	\N	\N
832	957	Structures	20	{"name":"وحدة تقنية المعلومات","code":"1231","is_active":true,"sort_order":0,"parent_id":9}	{"name":"وحدة تقنية المعلومات","code":"1231","is_active":true,"sort_order":0,"parent_id":9}	\N	\N
833	958	Structures	21	{"name":"قسم التنسيق الوظيفي","code":"87888","is_active":true,"sort_order":0,"parent_id":9}	{"name":"قسم التنسيق الوظيفي","code":"87888","is_active":true,"sort_order":0,"parent_id":9}	\N	\N
834	959	Structures	22	{"name":"قسم التديب الإلكتروني","is_active":true,"sort_order":0,"parent_id":10}	{"name":"قسم التديب الإلكتروني","is_active":true,"sort_order":0,"parent_id":10}	\N	\N
835	960	Structures	23	{"name":"الأقسام التدريبية","code":"95","is_active":true,"sort_order":0,"parent_id":10}	{"name":"الأقسام التدريبية","code":"95","is_active":true,"sort_order":0,"parent_id":10}	\N	\N
836	961	Structures	24	{"name":"أمانة مجلس الكلية","is_active":true,"sort_order":0,"parent_id":10}	{"name":"أمانة مجلس الكلية","is_active":true,"sort_order":0,"parent_id":10}	\N	\N
837	962	Structures	25	{"name":"وحدة الاتصال المؤسسي","is_active":true,"sort_order":0,"parent_id":10}	{"name":"وحدة الاتصال المؤسسي","is_active":true,"sort_order":0,"parent_id":10}	\N	\N
838	963	designations	8	{"name":"الوظائف الإدارية والفنية","is_active":true,"sort_order":0}	{"name":"الوظائف الإدارية والفنية","is_active":true,"sort_order":0}	\N	\N
839	964	job_types	3	{"name":"أساسية","is_active":true,"sort_order":0}	{"name":"أساسية","is_active":true,"sort_order":0}	\N	\N
840	965	job_types	4	{"name":"تكليف","is_active":true,"sort_order":0}	{"name":"تكليف","is_active":true,"sort_order":0}	\N	\N
841	966	job_types	5	{"name":"بند الأجور","is_active":true,"sort_order":0}	{"name":"بند الأجور","is_active":true,"sort_order":0}	\N	\N
842	967	job_types	5	{"id":5,"name":"بند الأجور","is_active":false,"sort_order":0}	{"is_active":false}	\N	\N
843	968	job_types	5	{"id":5,"name":"بند الأجور","is_active":true,"sort_order":0}	{"is_active":true}	\N	\N
844	969	job_axes	4	{"name":"المدرب","is_active":true,"sort_order":0}	{"name":"المدرب","is_active":true,"sort_order":0}	\N	\N
845	970	job_axes	5	{"name":"كفاءة تشغيل","is_active":true,"sort_order":0}	{"name":"كفاءة تشغيل","is_active":true,"sort_order":0}	\N	\N
846	971	job_axes	6	{"name":"متدرب","is_active":true,"sort_order":0}	{"name":"متدرب","is_active":true,"sort_order":0}	\N	\N
847	972	job_axes	7	{"name":"مشاركة السوق","is_active":true,"sort_order":0}	{"name":"مشاركة السوق","is_active":true,"sort_order":0}	\N	\N
848	973	designations	9	{"name":"الوظائف تجريبي 1","is_active":true,"sort_order":0}	{"name":"الوظائف تجريبي 1","is_active":true,"sort_order":0}	\N	\N
849	974	Employees	4	{"job_title":"منسق قسم","job_description":"بسم الله نبدأ","designation":8,"is_active":true,"sort_order":0}	{"job_title":"منسق قسم","job_description":"بسم الله نبدأ","designation":8,"is_active":true,"sort_order":0}	\N	\N
850	975	Employees	4	{"id":4,"designation":8,"job_title":"منسق قسم","job_description":"بسم الله نبدأ","is_active":false,"sort_order":0}	{"is_active":false}	\N	\N
851	976	Employees	4	{"id":4,"designation":8,"job_title":"منسق قسم","job_description":"بسم الله نبدأ","is_active":true,"sort_order":0}	{"is_active":true}	\N	\N
852	977	Departments	1	{"sort_order":0,"job_status":"شاغرة","structure_id":7,"designation":8,"job_type":4,"employee_job":4}	{"sort_order":0,"job_status":"شاغرة","structure_id":7,"designation":8,"job_type":4,"employee_job":4}	\N	\N
853	978	Departments	2	{"sort_order":0,"job_status":"شاغرة","structure_id":7,"designation":8,"job_type":3,"employee_job":4}	{"sort_order":0,"job_status":"شاغرة","structure_id":7,"designation":8,"job_type":3,"employee_job":4}	\N	\N
854	980	Departments	2	{"id":2,"structure_id":7,"designation":8,"job_type":3,"employee_job":4,"job_status":"مشغولة","sort_order":0}	{"structure_id":7,"designation":8,"job_type":3,"employee_job":4,"job_status":"مشغولة","sort_order":0}	\N	\N
855	981	directus_files	8f81e039-1f0c-4af8-a58c-fcc5d427bbf8	{"title":"2030","filename_download":"2030.png","type":"image/png","storage":"local"}	{"title":"2030","filename_download":"2030.png","type":"image/png","storage":"local"}	\N	\N
856	982	directus_files	d85b8759-9e00-408b-ab09-a5afcf159a60	{"title":"Hero","filename_download":"hero.png","type":"image/png","storage":"local"}	{"title":"Hero","filename_download":"hero.png","type":"image/png","storage":"local"}	\N	\N
857	983	site_settings	1	{"id":1,"site_name":"أتمتة الخطط الاستراتيجية","logo":"d85b8759-9e00-408b-ab09-a5afcf159a60","site_description":"المؤسسة العامة للتدريب التقني والمهني"}	{"site_name":"أتمتة الخطط الاستراتيجية","logo":"d85b8759-9e00-408b-ab09-a5afcf159a60","site_description":"المؤسسة العامة للتدريب التقني والمهني"}	\N	\N
858	984	Structures	7	{"id":7,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"كلية","is_active":false,"sort_order":0,"parent_id":null}	{"is_active":false}	\N	\N
859	985	Structures	7	{"id":7,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"كلية","is_active":true,"sort_order":0,"parent_id":null}	{"is_active":true}	\N	\N
860	986	designations	8	{"id":8,"name":"الوظائف الإدارية والفنية","is_active":false,"sort_order":0}	{"is_active":false}	\N	\N
861	987	designations	8	{"id":8,"name":"الوظائف الإدارية والفنية","is_active":true,"sort_order":0}	{"is_active":true}	\N	\N
862	988	Structures	7	{"id":7,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"كلية","is_active":false,"sort_order":0,"parent_id":null}	{"is_active":false}	\N	\N
863	989	Departments	2	{"id":2,"structure_id":7,"designation":8,"job_type":3,"employee_job":4,"job_status":"مشغولة","sort_order":0}	{"structure_id":7,"designation":8,"job_type":3,"employee_job":4,"job_status":"مشغولة","sort_order":0}	\N	\N
864	990	Departments	2	{"id":2,"structure_id":7,"designation":8,"job_type":3,"employee_job":4,"job_status":"شاغرة","sort_order":0}	{"job_status":"شاغرة"}	\N	\N
865	991	Structures	7	{"id":7,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"كلية","is_active":true,"sort_order":0,"parent_id":null}	{"is_active":true}	\N	\N
866	992	Structures	7	{"id":7,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"كلية","is_active":false,"sort_order":0,"parent_id":null}	{"is_active":false}	\N	\N
867	993	Structures	7	{"id":7,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"كلية","is_active":true,"sort_order":0,"parent_id":null}	{"is_active":true}	\N	\N
868	994	directus_files	b61087ae-779d-46bc-9f06-99f480a4bab6	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	\N	\N
869	995	site_settings	1	{"id":1,"site_name":"أتمتة الخطط الاستراتيجية","logo":"b61087ae-779d-46bc-9f06-99f480a4bab6","site_description":"المؤسسة العامة للتدريب التقني والمهني"}	{"site_name":"أتمتة الخطط الاستراتيجية","logo":"b61087ae-779d-46bc-9f06-99f480a4bab6","site_description":"المؤسسة العامة للتدريب التقني والمهني"}	\N	\N
870	996	Departments	2	{"id":2,"structure_id":7,"designation":8,"job_type":3,"employee_job":4,"job_status":"مجمدة","sort_order":0}	{"job_status":"مجمدة"}	\N	\N
871	997	Departments	2	{"id":2,"structure_id":7,"designation":8,"job_type":3,"employee_job":4,"job_status":"مجمدة","sort_order":0}	{"job_status":"مجمدة"}	\N	\N
872	998	Departments	2	{"id":2,"structure_id":7,"designation":8,"job_type":3,"employee_job":4,"job_status":"شاغرة","sort_order":0}	{"job_status":"شاغرة"}	\N	\N
873	999	directus_fields	67	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Personnel"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Personnel"}	\N	\N
874	1000	directus_collections	Personnel	{"singleton":false,"collection":"Personnel"}	{"singleton":false,"collection":"Personnel"}	\N	\N
875	1001	directus_fields	68	{"sort":2,"interface":"input","special":null,"collection":"Personnel","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"Personnel","field":"name"}	\N	\N
876	1002	directus_fields	69	{"sort":3,"interface":"input","special":null,"collection":"Personnel","field":"email"}	{"sort":3,"interface":"input","special":null,"collection":"Personnel","field":"email"}	\N	\N
877	1003	directus_fields	70	{"sort":4,"interface":"input","special":null,"collection":"Personnel","field":"mobile_number"}	{"sort":4,"interface":"input","special":null,"collection":"Personnel","field":"mobile_number"}	\N	\N
878	1004	directus_fields	71	{"sort":5,"interface":"input","special":null,"collection":"Personnel","field":"job_number"}	{"sort":5,"interface":"input","special":null,"collection":"Personnel","field":"job_number"}	\N	\N
879	1005	directus_fields	72	{"sort":6,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Personnel","field":"department_id"}	{"sort":6,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Personnel","field":"department_id"}	\N	\N
880	1006	directus_fields	73	{"sort":7,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Personnel","field":"primary_job_id"}	{"sort":7,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Personnel","field":"primary_job_id"}	\N	\N
881	1007	directus_fields	74	{"sort":8,"interface":"input","special":null,"collection":"Personnel","field":"qualification"}	{"sort":8,"interface":"input","special":null,"collection":"Personnel","field":"qualification"}	\N	\N
882	1008	Structures	26	{"name":"hhhh","is_active":true,"sort_order":0,"parent_id":8}	{"name":"hhhh","is_active":true,"sort_order":0,"parent_id":8}	\N	\N
883	1009	Structures	27	{"code":"15000","is_active":true,"sort_order":0,"parent_id":26}	{"code":"15000","is_active":true,"sort_order":0,"parent_id":26}	\N	\N
884	1011	Structures	26	{"id":26,"name":"hhhh","code":"1500","description":null,"is_active":true,"sort_order":0,"parent_id":8}	{"name":"hhhh","code":"1500","description":null,"is_active":true,"sort_order":0,"parent_id":8}	\N	\N
885	1012	Structures	26	{"id":26,"name":"hhhh","code":"1500","description":null,"is_active":true,"sort_order":-1,"parent_id":8}	{"sort_order":-1}	\N	\N
886	1013	Structures	13	{"id":13,"name":"إدارة الخدمات المساندة","code":"451","description":null,"is_active":true,"sort_order":0,"parent_id":8}	{"sort_order":0}	\N	\N
887	1014	Structures	26	{"id":26,"name":"hhhh","code":"1500","description":null,"is_active":true,"sort_order":0,"parent_id":8}	{"sort_order":0}	\N	\N
888	1015	Structures	9	{"id":9,"name":"العمادة","code":"148","description":null,"is_active":true,"sort_order":-1,"parent_id":8}	{"sort_order":-1}	\N	\N
889	1016	Structures	26	{"id":26,"name":"hhhh","code":"1500","description":null,"is_active":false,"sort_order":0,"parent_id":8}	{"is_active":false}	\N	\N
890	1017	Structures	7	{"id":7,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"كلية","is_active":false,"sort_order":0,"parent_id":null}	{"is_active":false}	\N	\N
891	1018	Structures	26	{"id":26,"name":"hhhh","code":"1500","description":null,"is_active":true,"sort_order":0,"parent_id":8}	{"is_active":true}	\N	\N
892	1019	Structures	7	{"id":7,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"كلية","is_active":true,"sort_order":0,"parent_id":null}	{"is_active":true}	\N	\N
893	1020	Departments	2	{"id":2,"structure_id":7,"designation":8,"job_type":3,"employee_job":4,"job_status":"مشغولة","sort_order":0}	{"job_status":"مشغولة"}	\N	\N
894	1021	directus_fields	75	{"sort":9,"interface":"input","special":null,"collection":"Personnel","field":"graduation_entity"}	{"sort":9,"interface":"input","special":null,"collection":"Personnel","field":"graduation_entity"}	\N	\N
895	1022	directus_fields	76	{"sort":10,"interface":"input","special":null,"collection":"Personnel","field":"graduation_year"}	{"sort":10,"interface":"input","special":null,"collection":"Personnel","field":"graduation_year"}	\N	\N
896	1024	directus_fields	77	{"sort":10,"interface":"input","special":null,"collection":"Personnel","field":"graduation_year"}	{"sort":10,"interface":"input","special":null,"collection":"Personnel","field":"graduation_year"}	\N	\N
897	1025	directus_fields	78	{"sort":11,"interface":"boolean","special":["cast-boolean"],"collection":"Personnel","field":"is_active"}	{"sort":11,"interface":"boolean","special":["cast-boolean"],"collection":"Personnel","field":"is_active"}	\N	\N
898	1026	directus_fields	79	{"sort":12,"interface":"input","special":null,"collection":"Personnel","field":"sort_order"}	{"sort":12,"interface":"input","special":null,"collection":"Personnel","field":"sort_order"}	\N	\N
899	1027	directus_fields	80	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Employee_Qualifications"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Employee_Qualifications"}	\N	\N
900	1028	directus_collections	Employee_Qualifications	{"singleton":false,"collection":"Employee_Qualifications"}	{"singleton":false,"collection":"Employee_Qualifications"}	\N	\N
901	1029	directus_fields	81	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Employee_Qualifications","field":"personnel_id"}	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Employee_Qualifications","field":"personnel_id"}	\N	\N
902	1030	directus_fields	82	{"sort":3,"interface":"input","special":null,"collection":"Employee_Qualifications","field":"course_name"}	{"sort":3,"interface":"input","special":null,"collection":"Employee_Qualifications","field":"course_name"}	\N	\N
903	1031	directus_fields	83	{"sort":4,"interface":"input","special":null,"collection":"Employee_Qualifications","field":"training_entity"}	{"sort":4,"interface":"input","special":null,"collection":"Employee_Qualifications","field":"training_entity"}	\N	\N
904	1032	directus_fields	84	{"sort":5,"interface":"datetime","special":null,"collection":"Employee_Qualifications","field":"start_date"}	{"sort":5,"interface":"datetime","special":null,"collection":"Employee_Qualifications","field":"start_date"}	\N	\N
905	1033	directus_fields	85	{"sort":6,"interface":"datetime","special":null,"collection":"Employee_Qualifications","field":"end_date"}	{"sort":6,"interface":"datetime","special":null,"collection":"Employee_Qualifications","field":"end_date"}	\N	\N
906	1034	directus_fields	86	{"sort":7,"interface":"input","special":null,"collection":"Employee_Qualifications","field":"score"}	{"sort":7,"interface":"input","special":null,"collection":"Employee_Qualifications","field":"score"}	\N	\N
907	1035	directus_fields	87	{"sort":8,"interface":"file","special":["file"],"collection":"Employee_Qualifications","field":"attachment"}	{"sort":8,"interface":"file","special":["file"],"collection":"Employee_Qualifications","field":"attachment"}	\N	\N
908	1036	directus_fields	88	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Employee_Assignments"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"Employee_Assignments"}	\N	\N
909	1037	directus_collections	Employee_Assignments	{"singleton":false,"collection":"Employee_Assignments"}	{"singleton":false,"collection":"Employee_Assignments"}	\N	\N
910	1038	directus_fields	89	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Employee_Assignments","field":"personnel_id"}	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Employee_Assignments","field":"personnel_id"}	\N	\N
911	1039	directus_fields	90	{"sort":3,"interface":"input","special":null,"collection":"Employee_Assignments","field":"subject"}	{"sort":3,"interface":"input","special":null,"collection":"Employee_Assignments","field":"subject"}	\N	\N
912	1040	directus_fields	91	{"sort":4,"interface":"input","special":null,"collection":"Employee_Assignments","field":"decision_number"}	{"sort":4,"interface":"input","special":null,"collection":"Employee_Assignments","field":"decision_number"}	\N	\N
913	1041	directus_fields	92	{"sort":5,"interface":"datetime","special":null,"collection":"Employee_Assignments","field":"decision_date"}	{"sort":5,"interface":"datetime","special":null,"collection":"Employee_Assignments","field":"decision_date"}	\N	\N
950	1078	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
914	1042	directus_fields	93	{"sort":6,"interface":"input-multiline","special":null,"collection":"Employee_Assignments","field":"decision_summary"}	{"sort":6,"interface":"input-multiline","special":null,"collection":"Employee_Assignments","field":"decision_summary"}	\N	\N
915	1043	directus_fields	94	{"sort":7,"interface":"datetime","special":null,"collection":"Employee_Assignments","field":"effective_from"}	{"sort":7,"interface":"datetime","special":null,"collection":"Employee_Assignments","field":"effective_from"}	\N	\N
916	1044	directus_fields	95	{"sort":8,"interface":"datetime","special":null,"collection":"Employee_Assignments","field":"effective_to"}	{"sort":8,"interface":"datetime","special":null,"collection":"Employee_Assignments","field":"effective_to"}	\N	\N
917	1045	directus_fields	96	{"sort":9,"interface":"input","special":null,"collection":"Employee_Assignments","field":"decision_source"}	{"sort":9,"interface":"input","special":null,"collection":"Employee_Assignments","field":"decision_source"}	\N	\N
918	1046	directus_fields	97	{"sort":10,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":null},"collection":"Employee_Assignments","field":"department_id"}	{"sort":10,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":null},"collection":"Employee_Assignments","field":"department_id"}	\N	\N
919	1047	directus_fields	98	{"sort":11,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Employee_Assignments","field":"job_id"}	{"sort":11,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"Employee_Assignments","field":"job_id"}	\N	\N
920	1048	directus_fields	99	{"sort":1,"hidden":true,"field":"id","collection":"Employee_Assignments_undefined"}	{"sort":1,"hidden":true,"field":"id","collection":"Employee_Assignments_undefined"}	\N	\N
921	1049	directus_collections	Employee_Assignments_undefined	{"hidden":true,"icon":"import_export","collection":"Employee_Assignments_undefined"}	{"hidden":true,"icon":"import_export","collection":"Employee_Assignments_undefined"}	\N	\N
922	1050	directus_fields	100	{"sort":2,"hidden":true,"collection":"Employee_Assignments_undefined","field":"Employee_Assignments_id"}	{"sort":2,"hidden":true,"collection":"Employee_Assignments_undefined","field":"Employee_Assignments_id"}	\N	\N
923	1051	directus_fields	101	{"sort":3,"hidden":true,"collection":"Employee_Assignments_undefined","field":"item"}	{"sort":3,"hidden":true,"collection":"Employee_Assignments_undefined","field":"item"}	\N	\N
924	1052	directus_fields	102	{"sort":4,"hidden":true,"collection":"Employee_Assignments_undefined","field":"collection"}	{"sort":4,"hidden":true,"collection":"Employee_Assignments_undefined","field":"collection"}	\N	\N
925	1053	menu_items	26	{"title":"بيانات الموظفين","sort_order":0,"url_path":"/personnel","parent_id":17,"icon":"Briefcase"}	{"title":"بيانات الموظفين","sort_order":0,"url_path":"/personnel","parent_id":17,"icon":"Briefcase"}	\N	\N
926	1054	menu_items	26	{"id":26,"title":"بيانات الموظفين","url_path":"/personnel","sort_order":0,"parent_id":17,"icon":"Briefcase"}	{"sort_order":0,"parent_id":17}	\N	\N
927	1055	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
928	1056	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":1,"parent_id":17,"icon":"Box"}	{"sort_order":1,"parent_id":17}	\N	\N
929	1057	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":2,"parent_id":17,"icon":"Users"}	{"sort_order":2,"parent_id":17}	\N	\N
930	1058	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":3,"parent_id":17,"icon":"Briefcase"}	{"sort_order":3,"parent_id":17}	\N	\N
931	1059	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":4,"parent_id":17,"icon":"departments"}	{"sort_order":4,"parent_id":17}	\N	\N
932	1060	menu_items	26	{"id":26,"title":"بيانات الموظفين","url_path":"/personnel","sort_order":0,"parent_id":17,"icon":"Briefcase"}	{"sort_order":0,"parent_id":17}	\N	\N
933	1061	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
934	1062	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":1,"parent_id":17,"icon":"Box"}	{"sort_order":1,"parent_id":17}	\N	\N
935	1063	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":2,"parent_id":17,"icon":"Users"}	{"sort_order":2,"parent_id":17}	\N	\N
936	1064	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":3,"parent_id":17,"icon":"Briefcase"}	{"sort_order":3,"parent_id":17}	\N	\N
937	1065	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":4,"parent_id":17,"icon":"departments"}	{"sort_order":4,"parent_id":17}	\N	\N
938	1066	menu_items	26	{"id":26,"title":"بيانات الموظفين","url_path":"/personnel","sort_order":0,"parent_id":17,"icon":"Briefcase"}	{"sort_order":0,"parent_id":17}	\N	\N
939	1067	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
940	1068	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":1,"parent_id":17,"icon":"Box"}	{"sort_order":1,"parent_id":17}	\N	\N
941	1069	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":2,"parent_id":17,"icon":"Users"}	{"sort_order":2,"parent_id":17}	\N	\N
942	1070	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":3,"parent_id":17,"icon":"Briefcase"}	{"sort_order":3,"parent_id":17}	\N	\N
943	1071	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":4,"parent_id":17,"icon":"departments"}	{"sort_order":4,"parent_id":17}	\N	\N
944	1072	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
945	1073	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":0,"parent_id":17,"icon":"Box"}	{"sort_order":0,"parent_id":17}	\N	\N
946	1074	menu_items	26	{"id":26,"title":"بيانات الموظفين","url_path":"/personnel","sort_order":1,"parent_id":17,"icon":"Briefcase"}	{"sort_order":1,"parent_id":17}	\N	\N
947	1075	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":2,"parent_id":17,"icon":"Users"}	{"sort_order":2,"parent_id":17}	\N	\N
948	1076	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":3,"parent_id":17,"icon":"Briefcase"}	{"sort_order":3,"parent_id":17}	\N	\N
949	1077	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":4,"parent_id":17,"icon":"departments"}	{"sort_order":4,"parent_id":17}	\N	\N
951	1079	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":0,"parent_id":17,"icon":"Box"}	{"sort_order":0,"parent_id":17}	\N	\N
952	1080	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":1,"parent_id":17,"icon":"Users"}	{"sort_order":1,"parent_id":17}	\N	\N
953	1081	menu_items	26	{"id":26,"title":"بيانات الموظفين","url_path":"/personnel","sort_order":2,"parent_id":17,"icon":"Briefcase"}	{"sort_order":2,"parent_id":17}	\N	\N
954	1082	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":3,"parent_id":17,"icon":"Briefcase"}	{"sort_order":3,"parent_id":17}	\N	\N
955	1083	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":4,"parent_id":17,"icon":"departments"}	{"sort_order":4,"parent_id":17}	\N	\N
956	1084	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
957	1085	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":0,"parent_id":17,"icon":"Box"}	{"sort_order":0,"parent_id":17}	\N	\N
958	1086	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":1,"parent_id":17,"icon":"Users"}	{"sort_order":1,"parent_id":17}	\N	\N
959	1087	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":2,"parent_id":17,"icon":"Briefcase"}	{"sort_order":2,"parent_id":17}	\N	\N
960	1088	menu_items	26	{"id":26,"title":"بيانات الموظفين","url_path":"/personnel","sort_order":3,"parent_id":17,"icon":"Briefcase"}	{"sort_order":3,"parent_id":17}	\N	\N
961	1089	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":4,"parent_id":17,"icon":"departments"}	{"sort_order":4,"parent_id":17}	\N	\N
962	1090	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
963	1091	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":0,"parent_id":17,"icon":"Box"}	{"sort_order":0,"parent_id":17}	\N	\N
964	1092	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":1,"parent_id":17,"icon":"Users"}	{"sort_order":1,"parent_id":17}	\N	\N
965	1093	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":2,"parent_id":17,"icon":"Briefcase"}	{"sort_order":2,"parent_id":17}	\N	\N
966	1094	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":3,"parent_id":17,"icon":"departments"}	{"sort_order":3,"parent_id":17}	\N	\N
967	1095	menu_items	26	{"id":26,"title":"بيانات الموظفين","url_path":"/personnel","sort_order":4,"parent_id":17,"icon":"Briefcase"}	{"sort_order":4,"parent_id":17}	\N	\N
968	1096	menu_items	26	{"id":26,"title":"بيانات الموظفين","url_path":"/personnel","sort_order":3,"parent_id":null,"icon":"Briefcase"}	{"title":"بيانات الموظفين","url_path":"/personnel","sort_order":3,"parent_id":null,"icon":"Briefcase"}	\N	\N
969	1097	menu_items	26	{"id":26,"title":"بيانات الموظفين","url_path":"/personnel","sort_order":2,"parent_id":null,"icon":"Briefcase"}	{"title":"بيانات الموظفين","url_path":"/personnel","sort_order":2,"parent_id":null,"icon":"Briefcase"}	\N	\N
970	1098	menu_items	26	{"id":26,"title":"بيانات الموظفين","url_path":"/personnel","sort_order":0,"parent_id":17,"icon":"Briefcase"}	{"sort_order":0,"parent_id":17}	\N	\N
971	1099	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
972	1100	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":1,"parent_id":17,"icon":"Box"}	{"sort_order":1,"parent_id":17}	\N	\N
973	1101	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":2,"parent_id":17,"icon":"Users"}	{"sort_order":2,"parent_id":17}	\N	\N
974	1102	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":3,"parent_id":17,"icon":"Briefcase"}	{"sort_order":3,"parent_id":17}	\N	\N
975	1103	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":4,"parent_id":17,"icon":"departments"}	{"sort_order":4,"parent_id":17}	\N	\N
976	1104	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
977	1105	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":0,"parent_id":17,"icon":"Box"}	{"sort_order":0,"parent_id":17}	\N	\N
978	1106	menu_items	26	{"id":26,"title":"بيانات الموظفين","url_path":"/personnel","sort_order":1,"parent_id":17,"icon":"Briefcase"}	{"sort_order":1,"parent_id":17}	\N	\N
979	1107	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":2,"parent_id":17,"icon":"Users"}	{"sort_order":2,"parent_id":17}	\N	\N
980	1108	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":3,"parent_id":17,"icon":"Briefcase"}	{"sort_order":3,"parent_id":17}	\N	\N
981	1109	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":4,"parent_id":17,"icon":"departments"}	{"sort_order":4,"parent_id":17}	\N	\N
982	1110	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
983	1111	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":0,"parent_id":17,"icon":"Box"}	{"sort_order":0,"parent_id":17}	\N	\N
984	1112	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":1,"parent_id":17,"icon":"Users"}	{"sort_order":1,"parent_id":17}	\N	\N
985	1113	menu_items	26	{"id":26,"title":"بيانات الموظفين","url_path":"/personnel","sort_order":2,"parent_id":17,"icon":"Briefcase"}	{"sort_order":2,"parent_id":17}	\N	\N
986	1114	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":3,"parent_id":17,"icon":"Briefcase"}	{"sort_order":3,"parent_id":17}	\N	\N
987	1115	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":4,"parent_id":17,"icon":"departments"}	{"sort_order":4,"parent_id":17}	\N	\N
988	1116	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
989	1117	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":0,"parent_id":17,"icon":"Box"}	{"sort_order":0,"parent_id":17}	\N	\N
990	1118	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":1,"parent_id":17,"icon":"Users"}	{"sort_order":1,"parent_id":17}	\N	\N
991	1119	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":2,"parent_id":17,"icon":"Briefcase"}	{"sort_order":2,"parent_id":17}	\N	\N
992	1120	menu_items	26	{"id":26,"title":"بيانات الموظفين","url_path":"/personnel","sort_order":3,"parent_id":17,"icon":"Briefcase"}	{"sort_order":3,"parent_id":17}	\N	\N
993	1121	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":4,"parent_id":17,"icon":"departments"}	{"sort_order":4,"parent_id":17}	\N	\N
994	1122	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
995	1123	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":0,"parent_id":17,"icon":"Box"}	{"sort_order":0,"parent_id":17}	\N	\N
996	1124	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":1,"parent_id":17,"icon":"Users"}	{"sort_order":1,"parent_id":17}	\N	\N
997	1125	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":2,"parent_id":17,"icon":"Briefcase"}	{"sort_order":2,"parent_id":17}	\N	\N
998	1126	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":3,"parent_id":17,"icon":"departments"}	{"sort_order":3,"parent_id":17}	\N	\N
999	1127	menu_items	26	{"id":26,"title":"بيانات الموظفين","url_path":"/personnel","sort_order":4,"parent_id":17,"icon":"Briefcase"}	{"sort_order":4,"parent_id":17}	\N	\N
1000	1128	menu_items	26	{"id":26,"title":"الموظفين","url_path":"/personnel","sort_order":3,"parent_id":17,"icon":"Briefcase"}	{"title":"الموظفين","url_path":"/personnel","sort_order":3,"parent_id":17,"icon":"Briefcase"}	\N	\N
1001	1129	Personnel	1	{"name":"عبدالعزيز محمد المالكي","email":"almalki@hotmail.com","mobile_number":"0593008572","job_number":"5247","department_id":7,"primary_job_id":4,"graduation_entity":"جامعة الملك خالد","graduation_year":2019,"is_active":true,"sort_order":0}	{"name":"عبدالعزيز محمد المالكي","email":"almalki@hotmail.com","mobile_number":"0593008572","job_number":"5247","department_id":7,"primary_job_id":4,"graduation_entity":"جامعة الملك خالد","graduation_year":2019,"is_active":true,"sort_order":0}	\N	\N
1002	1130	Personnel	1	{"id":1,"name":"عبدالعزيز محمد المالكي","email":"almalki@hotmail.com","mobile_number":"0593008572","job_number":"5247","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":"جامعة الملك خالد","graduation_year":2019,"is_active":false,"sort_order":0}	{"is_active":false}	\N	\N
1003	1131	Personnel	1	{"id":1,"name":"عبدالعزيز محمد المالكي","email":"almalki@hotmail.com","mobile_number":"0593008572","job_number":"5247","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":"جامعة الملك خالد","graduation_year":2019,"is_active":true,"sort_order":0}	{"is_active":true}	\N	\N
1004	1132	Personnel	1	{"id":1,"name":"عبدالعزيز محمد المالكي","email":"almalki@hotmail.com","mobile_number":"0593008572","job_number":"5247","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":"جامعة الملك خالد","graduation_year":2019,"is_active":false,"sort_order":0}	{"is_active":false}	\N	\N
1005	1133	Personnel	1	{"id":1,"name":"عبدالعزيز محمد المالكي","email":"almalki@hotmail.com","mobile_number":"0593008572","job_number":"5247","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":"جامعة الملك خالد","graduation_year":2019,"is_active":true,"sort_order":0}	{"is_active":true}	\N	\N
1006	1134	Personnel	1	{"id":1,"name":"عبدالعزيز محمد المالكي","email":"almalki@hotmail.com","mobile_number":"0593008572","job_number":"5247","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":"جامعة الملك خالد","graduation_year":2019,"is_active":false,"sort_order":0}	{"is_active":false}	\N	\N
1007	1135	directus_files	cbbb373a-12aa-4c05-9530-c1326ee5faf3	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	\N	\N
1008	1136	Employee_Qualifications	1	{"personnel_id":1,"start_date":"2026-03-21","end_date":"2026-03-21","course_name":"hh","venue":"rhdfh","days_count":5,"hours_count":20,"attachment":"cbbb373a-12aa-4c05-9530-c1326ee5faf3"}	{"personnel_id":1,"start_date":"2026-03-21","end_date":"2026-03-21","course_name":"hh","venue":"rhdfh","days_count":5,"hours_count":20,"attachment":"cbbb373a-12aa-4c05-9530-c1326ee5faf3"}	\N	\N
1009	1137	Employee_Assignments	1	{"personnel_id":1,"decision_date":"2026-03-21","effective_from":"2026-03-21","subject":"dfhfdhfd","decision_number":"sdgsgd","decision_summary":"sdgsdg","decision_source":"vxcvxcb","department_id":7,"job_id":4}	{"personnel_id":1,"decision_date":"2026-03-21","effective_from":"2026-03-21","subject":"dfhfdhfd","decision_number":"sdgsgd","decision_summary":"sdgsdg","decision_source":"vxcvxcb","department_id":7,"job_id":4}	\N	\N
1010	1139	Personnel	2	{"name":"سيلسل","email":"az.almalki.1996@gmail.com","mobile_number":"يسل3546","job_number":"654ثسلسي","department_id":7,"primary_job_id":4,"qualification":"بكالوريوس","graduation_entity":"12000","graduation_year":2015,"is_active":true,"sort_order":0}	{"name":"سيلسل","email":"az.almalki.1996@gmail.com","mobile_number":"يسل3546","job_number":"654ثسلسي","department_id":7,"primary_job_id":4,"qualification":"بكالوريوس","graduation_entity":"12000","graduation_year":2015,"is_active":true,"sort_order":0}	\N	\N
1011	1140	directus_files	6968e25f-66d4-4ce1-8e96-586c4d6b44c1	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	\N	\N
1012	1141	Employee_Assignments	2	{"personnel_id":2,"decision_date":"2026-03-21","effective_from":"2026-03-21","subject":"يبايب","decision_number":"بيايب","decision_summary":"بيايب","decision_source":"سبياسي","department_id":8,"job_id":4,"attachment":"6968e25f-66d4-4ce1-8e96-586c4d6b44c1"}	{"personnel_id":2,"decision_date":"2026-03-21","effective_from":"2026-03-21","subject":"يبايب","decision_number":"بيايب","decision_summary":"بيايب","decision_source":"سبياسي","department_id":8,"job_id":4,"attachment":"6968e25f-66d4-4ce1-8e96-586c4d6b44c1"}	\N	\N
1013	1142	directus_files	8f862860-719a-4681-8c2a-b9f1cf56bfd5	{"title":"About","filename_download":"about.png","type":"image/png","storage":"local"}	{"title":"About","filename_download":"about.png","type":"image/png","storage":"local"}	\N	\N
1014	1143	Employee_Qualifications	2	{"personnel_id":2,"start_date":"2026-03-21","end_date":"2026-03-21","course_name":"يببيا","venue":"يبايبا","days_count":10,"hours_count":150,"attachment":"8f862860-719a-4681-8c2a-b9f1cf56bfd5"}	{"personnel_id":2,"start_date":"2026-03-21","end_date":"2026-03-21","course_name":"يببيا","venue":"يبايبا","days_count":10,"hours_count":150,"attachment":"8f862860-719a-4681-8c2a-b9f1cf56bfd5"}	\N	\N
1015	1144	directus_files	9d97982c-5fe1-4924-9e0b-be59a42ed96c	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	\N	\N
1016	1145	directus_files	65eabde8-cef7-4d36-b09c-1f80a263197e	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	\N	\N
1017	1146	Employee_Assignments	2	{"id":2,"personnel_id":2,"subject":"يبايب","decision_number":"بيايب","decision_date":"2026-03-21","decision_summary":"بيايب","effective_from":"2026-03-21","effective_to":null,"decision_source":"سبياسي","department_id":8,"job_id":4}	{"personnel_id":2,"subject":"يبايب","decision_number":"بيايب","decision_date":"2026-03-21","effective_from":"2026-03-21","effective_to":null,"department_id":8,"job_id":4}	\N	\N
1018	1147	directus_files	dcd58de7-33b3-41a9-bf5a-f1166cb55b68	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	\N	\N
1019	1148	Employee_Qualifications	2	{"id":2,"personnel_id":2,"course_name":"يببيا","training_entity":null,"start_date":"2026-03-21","end_date":"2026-03-21","score":null,"attachment":"dcd58de7-33b3-41a9-bf5a-f1166cb55b68"}	{"personnel_id":2,"course_name":"يببيا","start_date":"2026-03-21","end_date":"2026-03-21","attachment":"dcd58de7-33b3-41a9-bf5a-f1166cb55b68"}	\N	\N
1020	1151	directus_files	03fe1ecb-a9dc-4bde-9dc1-ec7994fe2f1b	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	\N	\N
1021	1152	Employee_Qualifications	3	{"personnel_id":2,"course_name":"بلتبلت","venue":"بلتيتي","days_count":30,"hours_count":150,"start_date":"2026-03-21","end_date":"2026-03-21","attachment":"03fe1ecb-a9dc-4bde-9dc1-ec7994fe2f1b"}	{"personnel_id":2,"course_name":"بلتبلت","venue":"بلتيتي","days_count":30,"hours_count":150,"start_date":"2026-03-21","end_date":"2026-03-21","attachment":"03fe1ecb-a9dc-4bde-9dc1-ec7994fe2f1b"}	\N	\N
1022	1153	directus_files	d853e0b9-748f-41b6-8894-54087f864138	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	\N	\N
1023	1154	Employee_Assignments	3	{"personnel_id":2,"subject":"يببيسا","decision_number":"بيايا","decision_summary":"يبايب","decision_source":"يبايبا","department_id":7,"decision_date":"2026-03-21","effective_from":"2025-08-21","effective_to":"2026-03-21","job_id":4,"attachment":"d853e0b9-748f-41b6-8894-54087f864138"}	{"personnel_id":2,"subject":"يببيسا","decision_number":"بيايا","decision_summary":"يبايب","decision_source":"يبايبا","department_id":7,"decision_date":"2026-03-21","effective_from":"2025-08-21","effective_to":"2026-03-21","job_id":4,"attachment":"d853e0b9-748f-41b6-8894-54087f864138"}	\N	\N
1024	1155	directus_files	0fe6bf52-9b16-48cf-9b6f-1e3f92fa453e	{"title":"Gm","filename_download":"gm.webp","type":"image/webp","storage":"local"}	{"title":"Gm","filename_download":"gm.webp","type":"image/webp","storage":"local"}	\N	\N
1025	1156	Employee_Assignments	3	{"id":3,"personnel_id":2,"subject":"يببيسا","decision_number":"بيايا","decision_date":"2026-03-21","decision_summary":"يبايب","effective_from":"2025-08-21","effective_to":"2026-03-21","decision_source":"يبايبا","department_id":7,"job_id":4}	{"personnel_id":2,"subject":"يببيسا","decision_number":"بيايا","decision_date":"2026-03-21","effective_from":"2025-08-21","effective_to":"2026-03-21","department_id":7,"job_id":4}	\N	\N
1026	1157	directus_files	79df7045-f15b-46f4-bc0c-8831047c70af	{"title":"About","filename_download":"about.png","type":"image/png","storage":"local"}	{"title":"About","filename_download":"about.png","type":"image/png","storage":"local"}	\N	\N
1027	1158	Employee_Assignments	3	{"id":3,"personnel_id":2,"subject":"يببيسا","decision_number":"بيايا","decision_date":"2026-03-21","decision_summary":"يبايب","effective_from":"2025-08-21","effective_to":"2026-03-21","decision_source":"يبايبا","department_id":7,"job_id":4,"attachment":"79df7045-f15b-46f4-bc0c-8831047c70af"}	{"personnel_id":2,"subject":"يببيسا","decision_number":"بيايا","decision_date":"2026-03-21","effective_from":"2025-08-21","effective_to":"2026-03-21","department_id":7,"job_id":4,"attachment":"79df7045-f15b-46f4-bc0c-8831047c70af"}	\N	\N
1028	1159	Personnel	3	{"first_name":"يبا","last_name":"يباب","email":"يسل","qualification":"دكتوراة","graduation_entity":"1يببايب","mobile_number":"0554","job_number":"35456","graduation_year":2025}	{"first_name":"يبا","last_name":"يباب","email":"يسل","qualification":"دكتوراة","graduation_entity":"1يببايب","mobile_number":"0554","job_number":"35456","graduation_year":2025}	\N	\N
1029	1161	Personnel	4	{"name":"dsgs","email":"asfa","mobile_number":"asfafs","department_id":7,"job_number":"sdgdgs"}	{"name":"dsgs","email":"asfa","mobile_number":"asfafs","department_id":7,"job_number":"sdgdgs"}	\N	\N
1030	1165	Personnel	2	{"id":2,"name":"سيلسل","email":"az.almalki.1996@gmail.com","mobile_number":"يسل3546","job_number":"654ثسلسي","department_id":7,"primary_job_id":4,"qualification":"بكالوريوس","graduation_entity":"12000","graduation_year":2015,"is_active":true,"sort_order":0}	{"name":"سيلسل","email":"az.almalki.1996@gmail.com","mobile_number":"يسل3546","job_number":"654ثسلسي","department_id":7,"primary_job_id":4,"qualification":"بكالوريوس","graduation_entity":"12000","graduation_year":2015,"is_active":true,"sort_order":0}	\N	\N
1031	1171	Personnel	5	{"name":"سيل","email":"سيلسلي"}	{"name":"سيل","email":"سيلسلي"}	\N	\N
1032	1172	Personnel	6	{"name":"سسس","email":"شششش"}	{"name":"سسس","email":"شششش"}	\N	\N
1033	1175	Personnel	7	{"name":"ؤاىي","email":"سيلس"}	{"name":"ؤاىي","email":"سيلس"}	\N	\N
1034	1178	Personnel	8	{"name":"قغثغ","email":"سيليل"}	{"name":"قغثغ","email":"سيليل"}	\N	\N
1035	1179	Employees	5	{"job_title":"اللل","job_description":"","designation":8,"is_active":true,"sort_order":0}	{"job_title":"اللل","job_description":"","designation":8,"is_active":true,"sort_order":0}	\N	\N
1036	1180	Personnel	8	{"id":8,"name":"قغثغ","email":"سيليل","mobile_number":null,"job_number":null,"department_id":null,"primary_job_id":null,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":true,"sort_order":null}	{"is_active":true}	\N	\N
1037	1181	Personnel	8	{"id":8,"name":"قغثغ","email":"سيليل","mobile_number":null,"job_number":null,"department_id":null,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":true,"sort_order":null}	{"name":"قغثغ","email":"سيليل","mobile_number":null,"job_number":null,"department_id":null,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":true,"sort_order":null}	\N	\N
1098	1252	Structures	15	{"id":15,"name":"السكرتارية","code":"4512","description":null,"is_active":true,"sort_order":0,"parent_id":9}	{"is_active":true}	\N	\N
1038	1182	Personnel	8	{"id":8,"name":"قغثغ","email":"سيليل","mobile_number":null,"job_number":null,"department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":true,"sort_order":null}	{"name":"قغثغ","email":"سيليل","mobile_number":null,"job_number":null,"department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":true,"sort_order":null}	\N	\N
1039	1184	Personnel	9	{"name":"بلتبلتب","email":"سيلسلسي","mobile_number":"سيلسيل","job_number":"سيلسيل","department_id":7,"primary_job_id":4}	{"name":"بلتبلتب","email":"سيلسلسي","mobile_number":"سيلسيل","job_number":"سيلسيل","department_id":7,"primary_job_id":4}	\N	\N
1040	1186	Personnel	9	{"id":9,"name":"بلتبلتب","email":"سيلسلسي","mobile_number":"سيلسيل","job_number":"سيلسيل","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":true,"sort_order":null}	{"is_active":true}	\N	\N
1041	1187	directus_files	6e09e2ae-824f-4b34-9395-5f5350dc5e75	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	\N	\N
1042	1188	directus_files	5c1c0582-3580-4498-bfb7-d4df3e6913ea	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	\N	\N
1043	1189	directus_files	34ae60de-0f1b-45b5-8fbf-7c26617eb8c4	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	\N	\N
1044	1190	Employee_Assignments	4	{"subject":"sgdfsd","decision_number":"sdgsd","decision_summary":"sdgsdg","decision_source":"sdgsdg","department_id":7,"decision_date":"2026-03-21","effective_from":"2026-03-21","effective_to":"2026-03-21","job_id":4,"personnel_id":9}	{"subject":"sgdfsd","decision_number":"sdgsd","decision_summary":"sdgsdg","decision_source":"sdgsdg","department_id":7,"decision_date":"2026-03-21","effective_from":"2026-03-21","effective_to":"2026-03-21","job_id":4,"personnel_id":9}	\N	\N
1045	1191	directus_files	201eb4fa-6005-44ef-82b1-876aced976b3	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	\N	\N
1046	1192	Employee_Assignments	4	{"id":4,"personnel_id":9,"subject":"sgdfsd","decision_number":"sdgsd","decision_date":"2026-03-21","decision_summary":"sdgsdg","effective_from":"2026-03-21","effective_to":"2026-03-21","decision_source":"sdgsdg","department_id":7,"job_id":4,"attachment":"201eb4fa-6005-44ef-82b1-876aced976b3"}	{"personnel_id":9,"subject":"sgdfsd","decision_number":"sdgsd","decision_date":"2026-03-21","effective_from":"2026-03-21","effective_to":"2026-03-21","department_id":7,"job_id":4,"attachment":"201eb4fa-6005-44ef-82b1-876aced976b3"}	\N	\N
1047	1193	Personnel	9	{"id":9,"name":"بلتبلتب","email":"سيلسلسي","mobile_number":"سيلسيل","job_number":"سيلسيل","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":true,"sort_order":null}	{"name":"بلتبلتب","email":"سيلسلسي","mobile_number":"سيلسيل","job_number":"سيلسيل","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":true,"sort_order":null}	\N	\N
1048	1195	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
1049	1196	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":0,"parent_id":17,"icon":"Users"}	{"sort_order":0,"parent_id":17}	\N	\N
1050	1197	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":1,"parent_id":17,"icon":"Box"}	{"sort_order":1,"parent_id":17}	\N	\N
1051	1198	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":2,"parent_id":17,"icon":"Briefcase"}	{"sort_order":2,"parent_id":17}	\N	\N
1052	1199	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":3,"parent_id":17,"icon":"departments"}	{"sort_order":3,"parent_id":17}	\N	\N
1053	1200	menu_items	26	{"id":26,"title":"الموظفين","url_path":"/personnel","sort_order":4,"parent_id":17,"icon":"Briefcase"}	{"sort_order":4,"parent_id":17}	\N	\N
1054	1201	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
1055	1202	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":0,"parent_id":17,"icon":"Box"}	{"sort_order":0,"parent_id":17}	\N	\N
1056	1203	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":1,"parent_id":17,"icon":"Users"}	{"sort_order":1,"parent_id":17}	\N	\N
1057	1204	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":2,"parent_id":17,"icon":"Briefcase"}	{"sort_order":2,"parent_id":17}	\N	\N
1058	1205	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":3,"parent_id":17,"icon":"departments"}	{"sort_order":3,"parent_id":17}	\N	\N
1059	1206	menu_items	26	{"id":26,"title":"الموظفين","url_path":"/personnel","sort_order":4,"parent_id":17,"icon":"Briefcase"}	{"sort_order":4,"parent_id":17}	\N	\N
1060	1207	menu_items	27	{"title":"تجريبي","sort_order":0,"url_path":null,"parent_id":null,"icon":"Folder"}	{"title":"تجريبي","sort_order":0,"url_path":null,"parent_id":null,"icon":"Folder"}	\N	\N
1061	1208	menu_items	27	{"id":27,"title":"تجريبي","url_path":null,"sort_order":0,"parent_id":null,"icon":"Folder"}	{"sort_order":0,"parent_id":null}	\N	\N
1062	1209	menu_items	17	{"id":17,"title":"التهيئة التنظيمية","url_path":null,"sort_order":1,"parent_id":null,"icon":"Folder"}	{"sort_order":1,"parent_id":null}	\N	\N
1063	1210	menu_items	22	{"id":22,"title":"الهيكل","url_path":"/Structures","sort_order":0,"parent_id":17,"icon":"Box"}	{"sort_order":0,"parent_id":17}	\N	\N
1064	1211	menu_items	23	{"id":23,"title":"المسميات","url_path":"/designations","sort_order":1,"parent_id":17,"icon":"Users"}	{"sort_order":1,"parent_id":17}	\N	\N
1065	1212	menu_items	24	{"id":24,"title":"الوظائف","url_path":"/employees","sort_order":2,"parent_id":17,"icon":"Briefcase"}	{"sort_order":2,"parent_id":17}	\N	\N
1066	1213	menu_items	25	{"id":25,"title":"الأقسام","url_path":"/departments","sort_order":3,"parent_id":17,"icon":"departments"}	{"sort_order":3,"parent_id":17}	\N	\N
1067	1214	menu_items	26	{"id":26,"title":"الموظفين","url_path":"/personnel","sort_order":4,"parent_id":17,"icon":"Briefcase"}	{"sort_order":4,"parent_id":17}	\N	\N
1068	1215	menu_items	28	{"title":"الرئيسية","sort_order":0,"url_path":"/home","parent_id":27,"icon":"Users"}	{"title":"الرئيسية","sort_order":0,"url_path":"/home","parent_id":27,"icon":"Users"}	\N	\N
1069	1216	directus_fields	104	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"home"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"home"}	\N	\N
1070	1217	directus_collections	home	{"singleton":false,"collection":"home"}	{"singleton":false,"collection":"home"}	\N	\N
1071	1218	directus_fields	105	{"sort":2,"interface":"input","special":null,"translations":[{"language":"ar-SA","translation":"الاسم"}],"collection":"home","field":"name"}	{"sort":2,"interface":"input","special":null,"translations":[{"language":"ar-SA","translation":"الاسم"}],"collection":"home","field":"name"}	\N	\N
1074	1227	Personnel	10	{"name":"سيسل","email":"يسسيل","mobile_number":"يلسيل","job_number":"يسلس","department_id":7,"primary_job_id":4}	{"name":"سيسل","email":"يسسيل","mobile_number":"يلسيل","job_number":"يسلس","department_id":7,"primary_job_id":4}	\N	\N
1075	1228	Personnel	10	{"id":10,"name":"سيسل","email":"يسسيل","mobile_number":"يلسيل","job_number":"يسلس","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":true,"sort_order":null}	{"is_active":true}	\N	\N
1076	1229	directus_files	153bf379-66a2-417a-99b6-35e671f0a49f	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	\N	\N
1077	1230	directus_files	6abc79b8-2e6b-418d-bd18-d9f8ac2b31ed	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	\N	\N
1078	1231	directus_files	7c550851-cf69-48a2-93a8-09986e52d7f1	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	{"title":"Logo","filename_download":"logo.png","type":"image/png","storage":"local"}	\N	\N
1079	1232	Employee_Qualifications	4	{"course_name":"سيلس","training_entity":"بشسب","start_date":"2026-03-21","end_date":"2026-03-21","score":99,"personnel_id":10,"attachment":"7c550851-cf69-48a2-93a8-09986e52d7f1"}	{"course_name":"سيلس","training_entity":"بشسب","start_date":"2026-03-21","end_date":"2026-03-21","score":99,"personnel_id":10,"attachment":"7c550851-cf69-48a2-93a8-09986e52d7f1"}	\N	\N
1080	1233	directus_files	996664a4-230d-4955-b6f1-7419e9ff0da9	{"title":"التقرير السنوي 2025","filename_download":"التقرير السنوي 2025.pdf","type":"application/pdf","storage":"local"}	{"title":"التقرير السنوي 2025","filename_download":"التقرير السنوي 2025.pdf","type":"application/pdf","storage":"local"}	\N	\N
1081	1234	Employee_Assignments	5	{"subject":"بيبيل","decision_number":"يبايب","decision_summary":"يبل","decision_source":"سيلسيل","department_id":7,"job_id":4,"decision_date":"2026-03-21","effective_from":null,"effective_to":null,"personnel_id":10,"attachment":"996664a4-230d-4955-b6f1-7419e9ff0da9"}	{"subject":"بيبيل","decision_number":"يبايب","decision_summary":"يبل","decision_source":"سيلسيل","department_id":7,"job_id":4,"decision_date":"2026-03-21","effective_from":null,"effective_to":null,"personnel_id":10,"attachment":"996664a4-230d-4955-b6f1-7419e9ff0da9"}	\N	\N
1082	1236	Personnel	11	{"name":"عبدالعزيز","email":"شيشسي","department_id":7,"primary_job_id":4,"mobile_number":"0593008572","job_number":"4545"}	{"name":"عبدالعزيز","email":"شيشسي","department_id":7,"primary_job_id":4,"mobile_number":"0593008572","job_number":"4545"}	\N	\N
1083	1237	Personnel	11	{"id":11,"name":"عبدالعزيز","email":"شيشسي","mobile_number":"0593008572","job_number":"4545","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":true,"sort_order":null}	{"is_active":true}	\N	\N
1084	1238	Personnel	11	{"id":11,"name":"عبدالعزيز","email":"شيشسي","mobile_number":"0593008572","job_number":"4545","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":false,"sort_order":null}	{"is_active":false}	\N	\N
1085	1239	Personnel	11	{"id":11,"name":"عبدالعزيز","email":"az.almalki.1996@gmail.com","mobile_number":"0593008572","job_number":"4545","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":false,"sort_order":null}	{"name":"عبدالعزيز","email":"az.almalki.1996@gmail.com","mobile_number":"0593008572","job_number":"4545","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":false,"sort_order":null}	\N	\N
1086	1240	directus_files	87338ef6-8811-4dff-b013-cf90eca11fb2	{"title":"About","filename_download":"about.png","type":"image/png","storage":"local"}	{"title":"About","filename_download":"about.png","type":"image/png","storage":"local"}	\N	\N
1087	1241	Employee_Qualifications	5	{"course_name":"a","training_entity":"a","start_date":"2026-03-30","end_date":"2026-04-07","score":50,"personnel_id":11,"attachment":"87338ef6-8811-4dff-b013-cf90eca11fb2"}	{"course_name":"a","training_entity":"a","start_date":"2026-03-30","end_date":"2026-04-07","score":50,"personnel_id":11,"attachment":"87338ef6-8811-4dff-b013-cf90eca11fb2"}	\N	\N
1088	1242	Personnel	11	{"id":11,"name":"عبدالعزيز","email":"az.almalki.1996@gmail.com","mobile_number":"0593008572","job_number":"4545","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":false,"sort_order":null}	{"name":"عبدالعزيز","email":"az.almalki.1996@gmail.com","mobile_number":"0593008572","job_number":"4545","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":false,"sort_order":null}	\N	\N
1089	1243	Structures	11	{"id":11,"name":"وكالة الجودة","code":"200","description":null,"is_active":false,"sort_order":0,"parent_id":8}	{"is_active":false}	\N	\N
1090	1244	Structures	10	{"id":10,"name":"وكالة شؤون المدربين","code":"140","description":null,"is_active":false,"sort_order":0,"parent_id":8}	{"is_active":false}	\N	\N
1091	1245	Structures	9	{"id":9,"name":"العمادة","code":"148","description":null,"is_active":false,"sort_order":-1,"parent_id":8}	{"is_active":false}	\N	\N
1092	1246	Structures	9	{"id":9,"name":"العمادة","code":"148","description":null,"is_active":true,"sort_order":-1,"parent_id":8}	{"is_active":true}	\N	\N
1093	1247	Structures	10	{"id":10,"name":"وكالة شؤون المدربين","code":"140","description":null,"is_active":true,"sort_order":0,"parent_id":8}	{"is_active":true}	\N	\N
1094	1248	Structures	11	{"id":11,"name":"وكالة الجودة","code":"200","description":null,"is_active":true,"sort_order":0,"parent_id":8}	{"is_active":true}	\N	\N
1095	1249	Structures	8	{"id":8,"name":"مجلس الكلية","code":"185","description":null,"is_active":true,"sort_order":0,"parent_id":7}	{"is_active":true}	\N	\N
1096	1250	Structures	7	{"id":7,"name":"الكلية التقنية بظهران الجنوب","code":"258","description":"كلية","is_active":true,"sort_order":0,"parent_id":null}	{"is_active":true}	\N	\N
1099	1253	Structures	14	{"id":14,"name":"مكتب العميد","code":"410","description":null,"is_active":true,"sort_order":0,"parent_id":9}	{"is_active":true}	\N	\N
1104	1258	Structures	19	{"id":19,"name":"مركز خدمة المجتمع","code":"5846","description":null,"is_active":true,"sort_order":0,"parent_id":9}	{"is_active":true}	\N	\N
1110	1264	Structures	25	{"id":25,"name":"وحدة الاتصال المؤسسي","code":null,"description":null,"is_active":true,"sort_order":0,"parent_id":10}	{"is_active":true}	\N	\N
1097	1251	Structures	13	{"id":13,"name":"إدارة الخدمات المساندة","code":"451","description":null,"is_active":true,"sort_order":0,"parent_id":8}	{"is_active":true}	\N	\N
1100	1254	Structures	16	{"id":16,"name":"وحدة الرقابة","code":"7546","description":null,"is_active":true,"sort_order":0,"parent_id":9}	{"is_active":true}	\N	\N
1101	1255	Structures	18	{"id":18,"name":"قسم التدريبات العامة","code":null,"description":null,"is_active":true,"sort_order":0,"parent_id":17}	{"is_active":true}	\N	\N
1102	1256	Structures	17	{"id":17,"name":"وجدة الاتصال المؤسسي","code":"784","description":null,"is_active":true,"sort_order":0,"parent_id":9}	{"is_active":true}	\N	\N
1103	1257	Structures	12	{"id":12,"name":"وكالة شؤون المتدربين","code":"700","description":null,"is_active":true,"sort_order":0,"parent_id":8}	{"is_active":true}	\N	\N
1106	1260	Structures	22	{"id":22,"name":"قسم التديب الإلكتروني","code":null,"description":null,"is_active":true,"sort_order":0,"parent_id":10}	{"is_active":true}	\N	\N
1107	1261	Structures	21	{"id":21,"name":"قسم التنسيق الوظيفي","code":"87888","description":null,"is_active":true,"sort_order":0,"parent_id":9}	{"is_active":true}	\N	\N
1108	1263	Structures	24	{"id":24,"name":"أمانة مجلس الكلية","code":null,"description":null,"is_active":true,"sort_order":0,"parent_id":10}	{"is_active":true}	\N	\N
1109	1262	Structures	23	{"id":23,"name":"الأقسام التدريبية","code":"95","description":null,"is_active":true,"sort_order":0,"parent_id":10}	{"is_active":true}	\N	\N
1111	1265	Structures	8	{"id":8,"name":"مجلس الكلية","code":"185","description":null,"is_active":false,"sort_order":0,"parent_id":7}	{"is_active":false}	\N	\N
1112	1266	Structures	8	{"id":8,"name":"مجلس الكلية","code":"185","description":null,"is_active":true,"sort_order":0,"parent_id":7}	{"is_active":true}	\N	\N
1105	1259	Structures	20	{"id":20,"name":"وحدة تقنية المعلومات","code":"1231","description":null,"is_active":true,"sort_order":0,"parent_id":9}	{"is_active":true}	\N	\N
1113	1267	Employee_Assignments	6	{"subject":"ششش","decision_number":"شسش","decision_summary":"سيبسب","decision_source":"سيلسيل","department_id":7,"job_id":4,"decision_date":"2026-03-02","effective_from":"2026-03-12","effective_to":"2026-04-10","personnel_id":11}	{"subject":"ششش","decision_number":"شسش","decision_summary":"سيبسب","decision_source":"سيلسيل","department_id":7,"job_id":4,"decision_date":"2026-03-02","effective_from":"2026-03-12","effective_to":"2026-04-10","personnel_id":11}	\N	\N
1114	1268	Personnel	11	{"id":11,"name":"عبدالعزيز","email":"az.almalki.1996@gmail.com","mobile_number":"0593008572","job_number":"4545","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":false,"sort_order":null}	{"name":"عبدالعزيز","email":"az.almalki.1996@gmail.com","mobile_number":"0593008572","job_number":"4545","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":false,"sort_order":null}	\N	\N
1115	1269	Personnel	11	{"id":11,"name":"عبدالعزيز","email":"az.almalki.1996@gmail.com","mobile_number":"0593008572","job_number":"4545","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":true,"sort_order":null}	{"is_active":true}	\N	\N
1116	1272	Personnel	11	{"id":11,"name":"عبدالعزيز","email":"az.almalki.1996@gmail.com","mobile_number":"0593008572","job_number":"4545","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":true,"sort_order":null}	{"name":"عبدالعزيز","email":"az.almalki.1996@gmail.com","mobile_number":"0593008572","job_number":"4545","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":true,"sort_order":null}	\N	\N
1117	1273	Personnel	11	{"id":11,"name":"عبدالعزيز","email":"az.almalki.1996@gmail.com","mobile_number":"0593008572","job_number":"4545","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":false,"sort_order":null}	{"is_active":false}	\N	\N
1118	1274	Personnel	11	{"id":11,"name":"عبدالعزيز","email":"az.almalki.1996@gmail.com","mobile_number":"0593008572","job_number":"4545","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":true,"sort_order":null}	{"is_active":true}	\N	\N
1119	1275	Personnel	11	{"id":11,"name":"عبدالعزيز","email":"az.almalki.1996@gmail.com","mobile_number":"0593008572","job_number":"4545","department_id":7,"primary_job_id":4,"qualification":null,"graduation_entity":null,"graduation_year":null,"is_active":false,"sort_order":null}	{"is_active":false}	\N	\N
1120	1276	designations	10	{"name":"بيليبل","is_active":true,"sort_order":0}	{"name":"بيليبل","is_active":true,"sort_order":0}	\N	\N
1121	1277	Employees	6	{"job_title":"سيليس","job_description":"يبلسل","designation":8,"is_active":true,"sort_order":0}	{"job_title":"سيليس","job_description":"يبلسل","designation":8,"is_active":true,"sort_order":0}	\N	\N
1122	1278	Structures	9	{"id":9,"name":"العمادة","code":"148","description":null,"is_active":false,"sort_order":-1,"parent_id":8}	{"is_active":false}	\N	\N
1123	1279	Structures	14	{"id":14,"name":"مكتب العميد","code":"410","description":null,"is_active":false,"sort_order":0,"parent_id":9}	{"is_active":false}	\N	\N
1124	1280	Structures	15	{"id":15,"name":"السكرتارية","code":"4512","description":null,"is_active":false,"sort_order":0,"parent_id":9}	{"is_active":false}	\N	\N
1125	1281	Structures	16	{"id":16,"name":"وحدة الرقابة","code":"7546","description":null,"is_active":false,"sort_order":0,"parent_id":9}	{"is_active":false}	\N	\N
1126	1282	Structures	17	{"id":17,"name":"وجدة الاتصال المؤسسي","code":"784","description":null,"is_active":false,"sort_order":0,"parent_id":9}	{"is_active":false}	\N	\N
1127	1283	Structures	19	{"id":19,"name":"مركز خدمة المجتمع","code":"5846","description":null,"is_active":false,"sort_order":0,"parent_id":9}	{"is_active":false}	\N	\N
1128	1284	Structures	20	{"id":20,"name":"وحدة تقنية المعلومات","code":"1231","description":null,"is_active":false,"sort_order":0,"parent_id":9}	{"is_active":false}	\N	\N
1129	1285	Structures	21	{"id":21,"name":"قسم التنسيق الوظيفي","code":"87888","description":null,"is_active":false,"sort_order":0,"parent_id":9}	{"is_active":false}	\N	\N
1130	1286	Structures	18	{"id":18,"name":"قسم التدريبات العامة","code":null,"description":null,"is_active":false,"sort_order":0,"parent_id":17}	{"is_active":false}	\N	\N
1131	1287	Structures	9	{"id":9,"name":"العمادة","code":"148","description":null,"is_active":true,"sort_order":-1,"parent_id":8}	{"is_active":true}	\N	\N
1132	1288	Structures	14	{"id":14,"name":"مكتب العميد","code":"410","description":null,"is_active":true,"sort_order":0,"parent_id":9}	{"is_active":true}	\N	\N
1133	1289	Structures	15	{"id":15,"name":"السكرتارية","code":"4512","description":null,"is_active":true,"sort_order":0,"parent_id":9}	{"is_active":true}	\N	\N
1134	1290	Structures	16	{"id":16,"name":"وحدة الرقابة","code":"7546","description":null,"is_active":true,"sort_order":0,"parent_id":9}	{"is_active":true}	\N	\N
1135	1292	Structures	17	{"id":17,"name":"وجدة الاتصال المؤسسي","code":"784","description":null,"is_active":true,"sort_order":0,"parent_id":9}	{"is_active":true}	\N	\N
1136	1291	Structures	19	{"id":19,"name":"مركز خدمة المجتمع","code":"5846","description":null,"is_active":true,"sort_order":0,"parent_id":9}	{"is_active":true}	\N	\N
1137	1293	Structures	21	{"id":21,"name":"قسم التنسيق الوظيفي","code":"87888","description":null,"is_active":true,"sort_order":0,"parent_id":9}	{"is_active":true}	\N	\N
1138	1294	Structures	20	{"id":20,"name":"وحدة تقنية المعلومات","code":"1231","description":null,"is_active":true,"sort_order":0,"parent_id":9}	{"is_active":true}	\N	\N
1139	1295	Structures	18	{"id":18,"name":"قسم التدريبات العامة","code":null,"description":null,"is_active":true,"sort_order":0,"parent_id":17}	{"is_active":true}	\N	\N
1140	1296	Structures	9	{"id":9,"name":"العمادة","code":"148","description":null,"is_active":true,"sort_order":0,"parent_id":8}	{"sort_order":0}	\N	\N
1141	1297	Structures	10	{"id":10,"name":"وكالة شؤون المدربين","code":"140","description":null,"is_active":true,"sort_order":-1,"parent_id":8}	{"sort_order":-1}	\N	\N
1142	1298	Structures	24	{"id":24,"name":"أمانة مجلس الكلية","code":null,"description":null,"is_active":false,"sort_order":0,"parent_id":10}	{"is_active":false}	\N	\N
1143	1299	Structures	24	{"id":24,"name":"أمانة مجلس الكلية","code":null,"description":null,"is_active":true,"sort_order":0,"parent_id":10}	{"is_active":true}	\N	\N
1144	1300	Structures	24	{"id":24,"name":"أمانة مجلس الكلية","code":null,"description":null,"is_active":false,"sort_order":0,"parent_id":10}	{"is_active":false}	\N	\N
1145	1301	Structures	24	{"id":24,"name":"أمانة مجلس الكلية","code":null,"description":null,"is_active":true,"sort_order":0,"parent_id":10}	{"is_active":true}	\N	\N
1146	1302	Structures	24	{"id":24,"name":"أمانة مجلس الكلية","code":null,"description":null,"is_active":false,"sort_order":0,"parent_id":10}	{"is_active":false}	\N	\N
1148	1304	Structures	24	{"id":24,"name":"أمانة مجلس الكلية","code":null,"description":null,"is_active":true,"sort_order":0,"parent_id":10}	{"is_active":true}	\N	\N
1147	1303	Structures	25	{"id":25,"name":"وحدة الاتصال المؤسسي","code":null,"description":null,"is_active":false,"sort_order":0,"parent_id":10}	{"is_active":false}	\N	\N
1149	1305	Structures	25	{"id":25,"name":"وحدة الاتصال المؤسسي","code":null,"description":null,"is_active":true,"sort_order":0,"parent_id":10}	{"is_active":true}	\N	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_roles (id, name, icon, description, parent) FROM stdin;
a5a97f5c-2db7-4627-aa8e-ce7c37fce106	Administrator	verified	$t:admin_description	\N
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token) FROM stdin;
RD7tfZQhN6Qn4SNnPGJQPXdkpkYfG80eCwhvcDzAebrg51GGVscSx1itKs_6PzEj	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-26 17:06:13.437+00	172.20.0.1	node	\N	\N	\N
tF6UBDkbtaloJc9UYSdXDtdg4YLFa2Q9GyUb6DsRYl8VzBACfEIjKrY7U78UGAb4	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-26 17:07:20.949+00	172.20.0.1	node	\N	\N	\N
Vr_D6UGX-0tFEjCSgKDoDdBONH0CEDzck4QF43QLPQ-2oQjzFDvkhNNTAnoF-LvU	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-26 17:09:53.758+00	172.20.0.1	curl/8.5.0	\N	\N	\N
m0Jc_CtmiCXedh0yqcHSmrHy8rfLDDsxJl8jLfINRWB1-Mwz1IIjVhM5DWFOJmfv	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-26 17:11:12.084+00	172.20.0.1	curl/8.5.0	\N	\N	\N
HrhBSXhEGGcOj-XN92olHHuyHzaXgYmWmS2NEDs1DyF7Yaqccygjts3eefItDM9Q	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-26 18:32:24.562+00	172.20.0.1	node	\N	\N	\N
E_GHLGQom1pGKlzGmNCsGXGXEIkmC9CItYo3YzgfRt6kCFXCJmgIcAT4s_vu2uAN	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 21:54:38.495+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	\N	http://localhost:8055	\N
N_Vk4p5n0Gt2G8e_Er6G_4Wtv-Aps3scw1XFFWybkQDw2UpbXllRzI3hZQvOscJF	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-21 16:01:50.505+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	\N	http://localhost:8055	O22lZT4HcSjuICk1ffqH38GY4n5ljt8nHTxkTCMRP1b4zAQbXhhrmuA4xFtUz9pR
O22lZT4HcSjuICk1ffqH38GY4n5ljt8nHTxkTCMRP1b4zAQbXhhrmuA4xFtUz9pR	e7c14f87-5452-4b00-b431-3d407c9dceaa	2026-03-22 16:01:40.505+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	\N	http://localhost:8055	\N
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, report_error_url, report_bug_url, report_feature_url, public_registration, public_registration_verify_email, public_registration_role, public_registration_email_filter, visual_editor_urls, project_id, mcp_enabled, mcp_allow_deletes, mcp_prompts_collection, mcp_system_prompt_enabled, mcp_system_prompt, project_owner, project_usage, org_name, product_updates, project_status, ai_openai_api_key, ai_anthropic_api_key, ai_system_prompt, ai_google_api_key, ai_openai_compatible_api_key, ai_openai_compatible_base_url, ai_openai_compatible_name, ai_openai_compatible_models, ai_openai_compatible_headers, ai_openai_allowed_models, ai_anthropic_allowed_models, ai_google_allowed_models, collaborative_editing_enabled) FROM stdin;
1	Directus	\N	#6644FF	\N	\N	\N	\N	25	\N	all	\N	\N	\N	\N	\N	\N	\N	ar-SA	\N	\N	auto	\N	\N	\N	\N	\N	\N	\N	f	t	\N	\N	\N	019d070e-1e3d-734c-b1ca-2c63c395cef1	f	f	\N	t	\N	az.almalki.1996@gmail.com	personal	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	["gpt-5-nano","gpt-5-mini","gpt-5"]	["claude-haiku-4-5","claude-sonnet-4-5"]	["gemini-3-pro-preview","gemini-3-flash-preview","gemini-2.5-pro","gemini-2.5-flash"]	f
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
37fc6834-8433-4a3d-9b9c-a72b55f45c5b	ar-SA	الاسم	الاسم
5c14aa45-c4c1-4f46-a806-476a7f451607	ar-SA	العمر	العمر
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides, text_direction) FROM stdin;
e7c14f87-5452-4b00-b431-3d407c9dceaa	Admin	User	admin@example.com	$argon2id$v=19$m=65536,t=3,p=4$As7a42X6ZGtxZvk5tlqKpg$VcJE5TCZov/JHq8C0ePDFHhexFF25bIOuvBBz7qC47w	\N	\N	\N	\N	\N	\N	\N	active	a5a97f5c-2db7-4627-aa8e-ce7c37fce106	strategic_plans_super_secure_admin_token	2026-03-21 16:01:40.516+00	/settings/data-model/Employee_Assignments	default	\N	\N	t	\N	\N	\N	\N	\N	auto
\.


--
-- Data for Name: directus_versions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated, delta) FROM stdin;
\.


--
-- Data for Name: job_axes; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.job_axes (id, name, is_active, sort_order) FROM stdin;
4	المدرب	t	0
5	كفاءة تشغيل	t	0
6	متدرب	t	0
7	مشاركة السوق	t	0
\.


--
-- Data for Name: job_types; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.job_types (id, name, is_active, sort_order) FROM stdin;
3	أساسية	t	0
4	تكليف	t	0
5	بند الأجور	t	0
\.


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.menu_items (id, title, url_path, sort_order, parent_id, icon) FROM stdin;
17	التهيئة التنظيمية	\N	1	\N	Folder
22	الهيكل	/Structures	0	17	Box
23	المسميات	/designations	1	17	Users
24	الوظائف	/employees	2	17	Briefcase
25	الأقسام	/departments	3	17	departments
26	الموظفين	/personnel	4	17	Briefcase
\.


--
-- Data for Name: site_settings; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.site_settings (id, site_name, logo, site_description) FROM stdin;
1	أتمتة الخطط الاستراتيجية	b61087ae-779d-46bc-9f06-99f480a4bab6	المؤسسة العامة للتدريب التقني والمهني
\.


--
-- Name: Calendars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public."Calendars_id_seq"', 1, false);


--
-- Name: Categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public."Categories_id_seq"', 4, true);


--
-- Name: Departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public."Departments_id_seq"', 2, true);


--
-- Name: Employee_Assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public."Employee_Assignments_id_seq"', 6, true);


--
-- Name: Employee_Assignments_undefined_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public."Employee_Assignments_undefined_id_seq"', 1, false);


--
-- Name: Employee_Qualifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public."Employee_Qualifications_id_seq"', 5, true);


--
-- Name: Employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public."Employees_id_seq"', 6, true);


--
-- Name: Jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public."Jobs_id_seq"', 1, false);


--
-- Name: Personnel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public."Personnel_id_seq"', 11, true);


--
-- Name: Structures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public."Structures_id_seq"', 27, true);


--
-- Name: designations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.designations_id_seq', 10, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 1305, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 105, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 4, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 2, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 15, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 1149, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: job_axes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.job_axes_id_seq', 7, true);


--
-- Name: job_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.job_types_id_seq', 5, true);


--
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.menu_items_id_seq', 28, true);


--
-- Name: site_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.site_settings_id_seq', 1, true);


--
-- Name: Calendars Calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Calendars"
    ADD CONSTRAINT "Calendars_pkey" PRIMARY KEY (id);


--
-- Name: Categories Categories_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "Categories_pkey" PRIMARY KEY (id);


--
-- Name: Departments Departments_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_pkey" PRIMARY KEY (id);


--
-- Name: Employee_Assignments Employee_Assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Employee_Assignments"
    ADD CONSTRAINT "Employee_Assignments_pkey" PRIMARY KEY (id);


--
-- Name: Employee_Assignments_undefined Employee_Assignments_undefined_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Employee_Assignments_undefined"
    ADD CONSTRAINT "Employee_Assignments_undefined_pkey" PRIMARY KEY (id);


--
-- Name: Employee_Qualifications Employee_Qualifications_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Employee_Qualifications"
    ADD CONSTRAINT "Employee_Qualifications_pkey" PRIMARY KEY (id);


--
-- Name: Employees Employees_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "Employees_pkey" PRIMARY KEY (id);


--
-- Name: Jobs Jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Jobs"
    ADD CONSTRAINT "Jobs_pkey" PRIMARY KEY (id);


--
-- Name: Personnel Personnel_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Personnel"
    ADD CONSTRAINT "Personnel_pkey" PRIMARY KEY (id);


--
-- Name: Structures Structures_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Structures"
    ADD CONSTRAINT "Structures_pkey" PRIMARY KEY (id);


--
-- Name: designations designations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT designations_pkey PRIMARY KEY (id);


--
-- Name: directus_access directus_access_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_comments directus_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_pkey PRIMARY KEY (id);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_deployment_projects directus_deployment_projects_deployment_external_id_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_deployment_projects
    ADD CONSTRAINT directus_deployment_projects_deployment_external_id_unique UNIQUE (deployment, external_id);


--
-- Name: directus_deployment_projects directus_deployment_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_deployment_projects
    ADD CONSTRAINT directus_deployment_projects_pkey PRIMARY KEY (id);


--
-- Name: directus_deployment_runs directus_deployment_runs_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_deployment_runs
    ADD CONSTRAINT directus_deployment_runs_pkey PRIMARY KEY (id);


--
-- Name: directus_deployments directus_deployments_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_deployments
    ADD CONSTRAINT directus_deployments_pkey PRIMARY KEY (id);


--
-- Name: directus_deployments directus_deployments_provider_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_deployments
    ADD CONSTRAINT directus_deployments_provider_unique UNIQUE (provider);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_policies directus_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: job_axes job_axes_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.job_axes
    ADD CONSTRAINT job_axes_pkey PRIMARY KEY (id);


--
-- Name: job_types job_types_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.job_types
    ADD CONSTRAINT job_types_pkey PRIMARY KEY (id);


--
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- Name: site_settings site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_activity_timestamp_index; Type: INDEX; Schema: public; Owner: directus
--

CREATE INDEX directus_activity_timestamp_index ON public.directus_activity USING btree ("timestamp");


--
-- Name: directus_revisions_activity_index; Type: INDEX; Schema: public; Owner: directus
--

CREATE INDEX directus_revisions_activity_index ON public.directus_revisions USING btree (activity);


--
-- Name: directus_revisions_parent_index; Type: INDEX; Schema: public; Owner: directus
--

CREATE INDEX directus_revisions_parent_index ON public.directus_revisions USING btree (parent);


--
-- Name: Departments departments_designation_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT departments_designation_foreign FOREIGN KEY (designation) REFERENCES public.designations(id) ON DELETE SET NULL;


--
-- Name: Departments departments_employee_job_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT departments_employee_job_foreign FOREIGN KEY (employee_job) REFERENCES public."Employees"(id) ON DELETE SET NULL;


--
-- Name: Departments departments_job_type_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT departments_job_type_foreign FOREIGN KEY (job_type) REFERENCES public.job_types(id) ON DELETE SET NULL;


--
-- Name: Departments departments_structure_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT departments_structure_id_foreign FOREIGN KEY (structure_id) REFERENCES public."Structures"(id) ON DELETE SET NULL;


--
-- Name: directus_access directus_access_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_comments directus_comments_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_comments directus_comments_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_deployment_projects directus_deployment_projects_deployment_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_deployment_projects
    ADD CONSTRAINT directus_deployment_projects_deployment_foreign FOREIGN KEY (deployment) REFERENCES public.directus_deployments(id) ON DELETE CASCADE;


--
-- Name: directus_deployment_projects directus_deployment_projects_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_deployment_projects
    ADD CONSTRAINT directus_deployment_projects_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_deployment_runs directus_deployment_runs_project_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_deployment_runs
    ADD CONSTRAINT directus_deployment_runs_project_foreign FOREIGN KEY (project) REFERENCES public.directus_deployment_projects(id) ON DELETE CASCADE;


--
-- Name: directus_deployment_runs directus_deployment_runs_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_deployment_runs
    ADD CONSTRAINT directus_deployment_runs_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_deployments directus_deployments_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_deployments
    ADD CONSTRAINT directus_deployments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_revisions directus_revisions_version_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;


--
-- Name: directus_roles directus_roles_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_roles(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_registration_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_registration_role_foreign FOREIGN KEY (public_registration_role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_versions directus_versions_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: Employee_Assignments employee_assignments_department_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Employee_Assignments"
    ADD CONSTRAINT employee_assignments_department_id_foreign FOREIGN KEY (department_id) REFERENCES public."Structures"(id) ON DELETE SET NULL;


--
-- Name: Employee_Assignments employee_assignments_job_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Employee_Assignments"
    ADD CONSTRAINT employee_assignments_job_id_foreign FOREIGN KEY (job_id) REFERENCES public."Employees"(id) ON DELETE SET NULL;


--
-- Name: Employee_Assignments employee_assignments_personnel_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Employee_Assignments"
    ADD CONSTRAINT employee_assignments_personnel_id_foreign FOREIGN KEY (personnel_id) REFERENCES public."Personnel"(id) ON DELETE SET NULL;


--
-- Name: Employee_Qualifications employee_qualifications_attachment_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Employee_Qualifications"
    ADD CONSTRAINT employee_qualifications_attachment_foreign FOREIGN KEY (attachment) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: Employee_Qualifications employee_qualifications_personnel_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Employee_Qualifications"
    ADD CONSTRAINT employee_qualifications_personnel_id_foreign FOREIGN KEY (personnel_id) REFERENCES public."Personnel"(id) ON DELETE SET NULL;


--
-- Name: Employees employees_designation_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT employees_designation_foreign FOREIGN KEY (designation) REFERENCES public.designations(id) ON DELETE SET NULL;


--
-- Name: Employee_Assignments fk_employee_assignments_attachment; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Employee_Assignments"
    ADD CONSTRAINT fk_employee_assignments_attachment FOREIGN KEY (attachment) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: menu_items menu_items_parent_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES public.menu_items(id);


--
-- Name: Personnel personnel_department_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Personnel"
    ADD CONSTRAINT personnel_department_id_foreign FOREIGN KEY (department_id) REFERENCES public."Structures"(id) ON DELETE SET NULL;


--
-- Name: Personnel personnel_primary_job_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Personnel"
    ADD CONSTRAINT personnel_primary_job_id_foreign FOREIGN KEY (primary_job_id) REFERENCES public."Employees"(id) ON DELETE SET NULL;


--
-- Name: Structures structures_parent_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."Structures"
    ADD CONSTRAINT structures_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES public."Structures"(id);


--
-- PostgreSQL database dump complete
--

\unrestrict jC3Jtrb00FO2NeBtpWBeaHXkrUD3WpCoHJ9iBeKh17HGZvEu6BzE6XKabiTJ2EV

