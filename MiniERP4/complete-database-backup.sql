--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9
-- Dumped by pg_dump version 16.5

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

DROP DATABASE neondb;
--
-- Name: neondb; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE neondb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';


\connect neondb

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

--
-- Name: approval_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.approval_status AS ENUM (
    'draft',
    'pending_approval',
    'approved',
    'rejected',
    'superseded'
);


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts_payable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accounts_payable (
    id integer NOT NULL,
    vendor_id integer,
    invoice_number character varying(50) NOT NULL,
    invoice_date date NOT NULL,
    due_date date NOT NULL,
    amount numeric(15,2) NOT NULL,
    currency_id integer,
    company_code_id integer,
    plant_id integer,
    purchase_order_id integer,
    payment_terms character varying(50),
    status character varying(20) DEFAULT 'Open'::character varying,
    payment_date date,
    payment_reference character varying(100),
    discount_amount numeric(15,2) DEFAULT 0,
    tax_amount numeric(15,2) DEFAULT 0,
    net_amount numeric(15,2) NOT NULL,
    notes text,
    created_by integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: accounts_payable_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.accounts_payable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accounts_payable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.accounts_payable_id_seq OWNED BY public.accounts_payable.id;


--
-- Name: accounts_receivable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accounts_receivable (
    id integer NOT NULL,
    customer_id integer,
    invoice_number character varying(50) NOT NULL,
    invoice_date date NOT NULL,
    due_date date NOT NULL,
    amount numeric(15,2) NOT NULL,
    currency_id integer,
    company_code_id integer,
    plant_id integer,
    sales_order_id integer,
    payment_terms character varying(50),
    status character varying(20) DEFAULT 'Open'::character varying,
    payment_date date,
    payment_reference character varying(100),
    discount_amount numeric(15,2) DEFAULT 0,
    tax_amount numeric(15,2) DEFAULT 0,
    net_amount numeric(15,2) NOT NULL,
    notes text,
    created_by integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: accounts_receivable_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.accounts_receivable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accounts_receivable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.accounts_receivable_id_seq OWNED BY public.accounts_receivable.id;


--
-- Name: activity_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.activity_types (
    id integer NOT NULL,
    activity_type character varying(10) NOT NULL,
    description character varying(100) NOT NULL,
    unit_of_measure character varying(3) NOT NULL,
    category character varying(20) NOT NULL,
    controlling_area character varying(4) NOT NULL,
    allocation_method character varying(20),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: activity_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.activity_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activity_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.activity_types_id_seq OWNED BY public.activity_types.id;


--
-- Name: ai_agent_analytics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_agent_analytics (
    id integer NOT NULL,
    module_type character varying(50) NOT NULL,
    date date DEFAULT CURRENT_DATE,
    total_queries integer DEFAULT 0,
    successful_queries integer DEFAULT 0,
    failed_queries integer DEFAULT 0,
    avg_response_time numeric(10,2),
    total_tokens_used integer DEFAULT 0,
    unique_users integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: ai_agent_analytics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ai_agent_analytics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ai_agent_analytics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ai_agent_analytics_id_seq OWNED BY public.ai_agent_analytics.id;


--
-- Name: ai_agent_configs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_agent_configs (
    id integer NOT NULL,
    module_type character varying(50) NOT NULL,
    module_name character varying(100) NOT NULL,
    agent_name character varying(100) NOT NULL,
    role_description text NOT NULL,
    system_prompt text NOT NULL,
    expertise_areas jsonb NOT NULL,
    capabilities jsonb NOT NULL,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: ai_agent_configs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ai_agent_configs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ai_agent_configs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ai_agent_configs_id_seq OWNED BY public.ai_agent_configs.id;


--
-- Name: ai_agent_health; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_agent_health (
    id integer NOT NULL,
    check_timestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    openai_status character varying(20) NOT NULL,
    api_key_status character varying(20) NOT NULL,
    total_agents integer NOT NULL,
    active_agents integer NOT NULL,
    response_time integer,
    error_details jsonb
);


--
-- Name: ai_agent_health_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ai_agent_health_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ai_agent_health_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ai_agent_health_id_seq OWNED BY public.ai_agent_health.id;


--
-- Name: ai_chat_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_chat_messages (
    id integer NOT NULL,
    session_id uuid NOT NULL,
    message_type character varying(20) NOT NULL,
    content text NOT NULL,
    agent_name character varying(100),
    context_data jsonb,
    api_response_time integer,
    tokens_used integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ai_chat_messages_message_type_check CHECK (((message_type)::text = ANY ((ARRAY['user'::character varying, 'agent'::character varying])::text[])))
);


--
-- Name: ai_chat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ai_chat_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ai_chat_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ai_chat_messages_id_seq OWNED BY public.ai_chat_messages.id;


--
-- Name: ai_chat_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_chat_sessions (
    id integer NOT NULL,
    session_id uuid DEFAULT gen_random_uuid(),
    module_type character varying(50) NOT NULL,
    user_id integer,
    user_role character varying(50),
    context_data jsonb,
    session_start timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    session_end timestamp with time zone,
    is_active boolean DEFAULT true
);


--
-- Name: ai_chat_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ai_chat_sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ai_chat_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ai_chat_sessions_id_seq OWNED BY public.ai_chat_sessions.id;


--
-- Name: ai_data_analysis_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_data_analysis_sessions (
    id integer NOT NULL,
    session_id uuid DEFAULT gen_random_uuid(),
    module_type character varying(50) NOT NULL,
    analysis_type character varying(50) NOT NULL,
    input_data jsonb NOT NULL,
    analysis_result text,
    insights jsonb,
    recommendations jsonb,
    user_id integer,
    processing_time integer,
    status character varying(20) DEFAULT 'pending'::character varying,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    completed_at timestamp with time zone,
    CONSTRAINT ai_data_analysis_sessions_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'completed'::character varying, 'failed'::character varying])::text[])))
);


--
-- Name: ai_data_analysis_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ai_data_analysis_sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ai_data_analysis_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ai_data_analysis_sessions_id_seq OWNED BY public.ai_data_analysis_sessions.id;


--
-- Name: api_keys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.api_keys (
    id integer NOT NULL,
    service_name character varying(100) NOT NULL,
    key_name character varying(100) NOT NULL,
    key_value text NOT NULL,
    description text,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    last_used timestamp with time zone
);


--
-- Name: TABLE api_keys; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.api_keys IS 'Secure storage for API keys and external service credentials';


--
-- Name: COLUMN api_keys.service_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.api_keys.service_name IS 'Name of the service (e.g., openai, stripe, twilio)';


--
-- Name: COLUMN api_keys.key_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.api_keys.key_name IS 'Environment variable name for the key';


--
-- Name: COLUMN api_keys.key_value; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.api_keys.key_value IS 'Encrypted API key value';


--
-- Name: COLUMN api_keys.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.api_keys.is_active IS 'Whether the key is currently active and should be used';


--
-- Name: api_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.api_keys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: api_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.api_keys_id_seq OWNED BY public.api_keys.id;


--
-- Name: approval_levels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.approval_levels (
    id integer NOT NULL,
    level integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    value_limit numeric(15,2),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: approval_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.approval_levels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: approval_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.approval_levels_id_seq OWNED BY public.approval_levels.id;


--
-- Name: asset_master; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.asset_master (
    id integer NOT NULL,
    asset_number character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    asset_class character varying(50),
    acquisition_date date,
    acquisition_cost numeric(15,2),
    current_value numeric(15,2),
    depreciation_method character varying(50),
    useful_life_years integer,
    company_code_id integer,
    cost_center_id integer,
    location character varying(100),
    status character varying(20),
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: asset_master_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.asset_master_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: asset_master_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.asset_master_id_seq OWNED BY public.asset_master.id;


--
-- Name: batch_master; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.batch_master (
    id integer NOT NULL,
    batch_number character varying(50) NOT NULL,
    material_id integer,
    plant_id integer,
    production_date date,
    expiry_date date,
    shelf_life_days integer,
    vendor_batch_number character varying(50),
    quality_status character varying(20) DEFAULT 'UNRESTRICTED'::character varying,
    available_quantity numeric(15,3),
    reserved_quantity numeric(15,3),
    blocked_quantity numeric(15,3),
    unit_of_measure character varying(10),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: batch_master_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.batch_master_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: batch_master_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.batch_master_id_seq OWNED BY public.batch_master.id;


--
-- Name: bill_of_materials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bill_of_materials (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    material_id integer NOT NULL,
    description text,
    version character varying(10) DEFAULT '1.0'::character varying,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: bill_of_materials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bill_of_materials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bill_of_materials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bill_of_materials_id_seq OWNED BY public.bill_of_materials.id;


--
-- Name: bom_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bom_items (
    id integer NOT NULL,
    bom_id integer NOT NULL,
    material_id integer NOT NULL,
    quantity numeric(10,3) NOT NULL,
    unit_cost numeric(15,2),
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: bom_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bom_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bom_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bom_items_id_seq OWNED BY public.bom_items.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    user_id integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: chart_of_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chart_of_accounts (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    account_type character varying(30) NOT NULL,
    account_subtype character varying(50),
    account_group character varying(50),
    balance_sheet_category character varying(50),
    income_statement_category character varying(50),
    debit_credit character varying(10),
    is_balance_sheet boolean DEFAULT true,
    is_income_statement boolean DEFAULT false,
    is_cash_flow boolean DEFAULT false,
    is_tax_relevant boolean DEFAULT false,
    is_control_account boolean DEFAULT false,
    is_reconciliation_required boolean DEFAULT false,
    is_active boolean DEFAULT true,
    company_code_id integer NOT NULL,
    parent_account_id integer,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    created_by integer,
    updated_by integer,
    version integer DEFAULT 1 NOT NULL,
    notes text
);


--
-- Name: chart_of_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chart_of_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chart_of_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chart_of_accounts_id_seq OWNED BY public.chart_of_accounts.id;


--
-- Name: company_code_chart_assignments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.company_code_chart_assignments (
    id integer NOT NULL,
    company_code_id integer,
    chart_of_accounts_id integer,
    fiscal_year_variant_id integer,
    assigned_date timestamp without time zone DEFAULT now() NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: company_code_chart_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.company_code_chart_assignments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: company_code_chart_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.company_code_chart_assignments_id_seq OWNED BY public.company_code_chart_assignments.id;


--
-- Name: company_codes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.company_codes (
    id integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    currency text NOT NULL,
    country text NOT NULL,
    tax_id text,
    fiscal_year text NOT NULL,
    address text,
    city text,
    state text,
    postal_code text,
    phone text,
    email text,
    website text,
    logo_url text,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_by integer,
    version integer DEFAULT 1 NOT NULL,
    notes text
);


--
-- Name: company_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.company_codes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: company_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.company_codes_id_seq OWNED BY public.company_codes.id;


--
-- Name: copa_actuals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.copa_actuals (
    id integer NOT NULL,
    operating_concern character varying(4) NOT NULL,
    fiscal_year integer NOT NULL,
    period integer NOT NULL,
    record_type character varying(1) NOT NULL,
    customer character varying(10),
    material character varying(18),
    product_group character varying(10),
    customer_group character varying(5),
    sales_organization character varying(4),
    distribution_channel character varying(2),
    division character varying(2),
    region character varying(10),
    country character varying(3),
    profit_center character varying(10),
    value_field character varying(5) NOT NULL,
    amount numeric(15,2) NOT NULL,
    quantity numeric(15,3) DEFAULT 0,
    currency character varying(3) DEFAULT 'USD'::character varying,
    unit_of_measure character varying(3),
    posting_date date NOT NULL,
    document_number character varying(20),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    customer_id integer,
    material_id integer,
    profit_center_id integer,
    sales_org_id integer,
    company_code_id integer,
    currency_id integer
);


--
-- Name: copa_actuals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.copa_actuals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: copa_actuals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.copa_actuals_id_seq OWNED BY public.copa_actuals.id;


--
-- Name: cost_allocations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cost_allocations (
    id integer NOT NULL,
    allocation_id character varying(20) NOT NULL,
    allocation_type character varying(20) NOT NULL,
    sender_object_type character varying(20) NOT NULL,
    sender_object character varying(20) NOT NULL,
    receiver_object_type character varying(20) NOT NULL,
    receiver_object character varying(20) NOT NULL,
    fiscal_year integer NOT NULL,
    period integer NOT NULL,
    allocation_base character varying(20),
    percentage numeric(5,2),
    amount numeric(15,2) NOT NULL,
    currency character varying(3) DEFAULT 'USD'::character varying,
    posting_date date NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: cost_allocations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cost_allocations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cost_allocations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cost_allocations_id_seq OWNED BY public.cost_allocations.id;


--
-- Name: cost_center_actuals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cost_center_actuals (
    id integer NOT NULL,
    cost_center character varying(10) NOT NULL,
    fiscal_year integer NOT NULL,
    period integer NOT NULL,
    account character varying(10) NOT NULL,
    activity_type character varying(10),
    actual_amount numeric(15,2) DEFAULT 0,
    actual_quantity numeric(15,3) DEFAULT 0,
    currency character varying(3) DEFAULT 'USD'::character varying,
    unit_of_measure character varying(3),
    posting_date date NOT NULL,
    document_number character varying(20),
    reference character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    cost_center_id integer,
    company_code_id integer,
    currency_id integer
);


--
-- Name: cost_center_actuals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cost_center_actuals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cost_center_actuals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cost_center_actuals_id_seq OWNED BY public.cost_center_actuals.id;


--
-- Name: cost_center_planning; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cost_center_planning (
    id integer NOT NULL,
    cost_center character varying(10) NOT NULL,
    fiscal_year integer NOT NULL,
    period integer NOT NULL,
    version character varying(10) DEFAULT '000'::character varying,
    account character varying(10) NOT NULL,
    activity_type character varying(10),
    planned_amount numeric(15,2) DEFAULT 0,
    planned_quantity numeric(15,3) DEFAULT 0,
    currency character varying(3) DEFAULT 'USD'::character varying,
    unit_of_measure character varying(3),
    created_by integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: cost_center_planning_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cost_center_planning_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cost_center_planning_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cost_center_planning_id_seq OWNED BY public.cost_center_planning.id;


--
-- Name: cost_centers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cost_centers (
    id integer NOT NULL,
    cost_center character varying(10) NOT NULL,
    description character varying(100) NOT NULL,
    cost_center_category character varying(20) NOT NULL,
    company_code character varying(4) NOT NULL,
    controlling_area character varying(4) NOT NULL,
    hierarchy_area character varying(20),
    responsible_person character varying(50),
    valid_from date NOT NULL,
    valid_to date,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    company_code_id integer,
    plant_id integer,
    responsible_person_id integer
);


--
-- Name: cost_centers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cost_centers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cost_centers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cost_centers_id_seq OWNED BY public.cost_centers.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    code character varying(2) NOT NULL,
    name character varying(100) NOT NULL,
    region_id integer,
    currency_code character varying(3),
    language_code character varying(5),
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: credit_control_areas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.credit_control_areas (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    company_code_id integer NOT NULL,
    credit_checking_group character varying(50),
    credit_period integer DEFAULT 30,
    grace_percentage numeric DEFAULT 10,
    blocking_reason character varying(100),
    review_frequency character varying(20) DEFAULT 'monthly'::character varying,
    currency character varying(3) DEFAULT 'USD'::character varying,
    credit_approver character varying(100),
    status character varying(20) DEFAULT 'active'::character varying,
    is_active boolean DEFAULT true,
    notes text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    created_by integer,
    updated_by integer
);


--
-- Name: credit_control_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.credit_control_areas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: credit_control_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.credit_control_areas_id_seq OWNED BY public.credit_control_areas.id;


--
-- Name: currencies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.currencies (
    id integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    symbol text NOT NULL,
    decimal_places text NOT NULL,
    conversion_rate text NOT NULL,
    base_currency boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    notes text
);


--
-- Name: currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.currencies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.currencies_id_seq OWNED BY public.currencies.id;


--
-- Name: custom_reports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_reports (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    sql_query text NOT NULL,
    chart_config jsonb DEFAULT '{}'::jsonb,
    parameters jsonb DEFAULT '[]'::jsonb,
    category character varying(100) DEFAULT 'custom'::character varying,
    is_shared boolean DEFAULT false,
    created_by character varying(100) DEFAULT 'system'::character varying,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


--
-- Name: custom_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.custom_reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: custom_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.custom_reports_id_seq OWNED BY public.custom_reports.id;


--
-- Name: customer_contacts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_contacts (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    "position" character varying(100),
    department character varying(100),
    email character varying(100),
    phone character varying(30),
    mobile character varying(30),
    is_primary boolean DEFAULT false,
    is_billing boolean DEFAULT false,
    is_shipping boolean DEFAULT false,
    is_technical boolean DEFAULT false,
    is_marketing boolean DEFAULT false,
    preferred_language character varying(50) DEFAULT 'English'::character varying,
    notes text,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    created_by integer,
    updated_by integer
);


--
-- Name: customer_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customer_contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customer_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customer_contacts_id_seq OWNED BY public.customer_contacts.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    phone text NOT NULL,
    address text NOT NULL,
    notes text,
    user_id integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: dashboard_configs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dashboard_configs (
    id integer NOT NULL,
    user_id integer NOT NULL,
    config jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: dashboard_configs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dashboard_configs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dashboard_configs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dashboard_configs_id_seq OWNED BY public.dashboard_configs.id;


--
-- Name: employee_master; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.employee_master (
    id integer NOT NULL,
    employee_number character varying(20) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    middle_name character varying(50),
    date_of_birth date,
    gender character varying(10),
    hire_date date NOT NULL,
    employment_type character varying(20),
    employment_status character varying(20) DEFAULT 'ACTIVE'::character varying,
    company_code_id integer,
    cost_center_id integer,
    manager_id integer,
    work_email character varying(100),
    work_phone character varying(20),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: employee_master_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.employee_master_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: employee_master_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.employee_master_id_seq OWNED BY public.employee_master.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    employee_id character varying(20) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100),
    phone character varying(20),
    department character varying(100),
    "position" character varying(100),
    company_code_id integer,
    cost_center_id integer,
    join_date date,
    manager_id integer,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- Name: environment_config; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.environment_config (
    id integer NOT NULL,
    environment character varying(10) NOT NULL,
    database_url text,
    is_active boolean DEFAULT true,
    last_transport_date timestamp without time zone,
    description text
);


--
-- Name: environment_config_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.environment_config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: environment_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.environment_config_id_seq OWNED BY public.environment_config.id;


--
-- Name: erp_customer_contacts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.erp_customer_contacts (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    "position" character varying(100),
    department character varying(100),
    email character varying(100),
    phone character varying(30),
    mobile character varying(30),
    is_primary boolean DEFAULT false,
    is_billing boolean DEFAULT false,
    is_shipping boolean DEFAULT false,
    is_technical boolean DEFAULT false,
    is_marketing boolean DEFAULT false,
    preferred_language character varying(50) DEFAULT 'English'::character varying,
    notes text,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    created_by integer,
    updated_by integer
);


--
-- Name: erp_customer_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.erp_customer_contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: erp_customer_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.erp_customer_contacts_id_seq OWNED BY public.erp_customer_contacts.id;


--
-- Name: erp_customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.erp_customers (
    id integer NOT NULL,
    customer_code character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    description text,
    tax_id character varying(50),
    industry character varying(50),
    segment character varying(50),
    address text,
    city character varying(100),
    state character varying(50),
    country character varying(50),
    postal_code character varying(20),
    region character varying(50),
    phone character varying(30),
    alt_phone character varying(30),
    email character varying(100),
    website character varying(255),
    currency character varying(10),
    payment_terms character varying(50),
    payment_method character varying(50),
    credit_limit numeric,
    credit_rating character varying(10),
    discount_group character varying(50),
    price_group character varying(50),
    incoterms character varying(20),
    shipping_method character varying(50),
    delivery_terms character varying(100),
    delivery_route character varying(100),
    sales_rep_id integer,
    parent_customer_id integer,
    status character varying(20) DEFAULT 'active'::character varying NOT NULL,
    is_b2b boolean DEFAULT true,
    is_b2c boolean DEFAULT false,
    is_vip boolean DEFAULT false,
    notes text,
    tags text[],
    company_code_id integer,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    created_by integer,
    updated_by integer,
    version integer DEFAULT 1 NOT NULL
);


--
-- Name: erp_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.erp_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: erp_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.erp_customers_id_seq OWNED BY public.erp_customers.id;


--
-- Name: erp_vendor_contacts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.erp_vendor_contacts (
    id integer NOT NULL,
    vendor_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    "position" character varying(100),
    department character varying(100),
    email character varying(100),
    phone character varying(30),
    mobile character varying(30),
    is_primary boolean DEFAULT false,
    is_order_contact boolean DEFAULT false,
    is_purchase_contact boolean DEFAULT false,
    is_quality_contact boolean DEFAULT false,
    is_accounts_contact boolean DEFAULT false,
    preferred_language character varying(50) DEFAULT 'English'::character varying,
    notes text,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    created_by integer,
    updated_by integer
);


--
-- Name: erp_vendor_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.erp_vendor_contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: erp_vendor_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.erp_vendor_contacts_id_seq OWNED BY public.erp_vendor_contacts.id;


--
-- Name: erp_vendors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.erp_vendors (
    id integer NOT NULL,
    vendor_code character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    description text,
    tax_id character varying(50),
    industry character varying(50),
    address text,
    city character varying(100),
    state character varying(50),
    country character varying(50),
    postal_code character varying(20),
    region character varying(50),
    phone character varying(30),
    alt_phone character varying(30),
    email character varying(100),
    website character varying(255),
    currency character varying(10),
    payment_terms character varying(50),
    payment_method character varying(50),
    supplier_type character varying(50),
    category character varying(50),
    order_frequency character varying(50),
    minimum_order_value numeric,
    evaluation_score numeric,
    lead_time integer,
    purchasing_group_id integer,
    status character varying(20) DEFAULT 'active'::character varying NOT NULL,
    blacklisted boolean DEFAULT false,
    blacklist_reason text,
    notes text,
    tags text[],
    company_code_id integer,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    created_by integer,
    updated_by integer,
    version integer DEFAULT 1 NOT NULL
);


--
-- Name: erp_vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.erp_vendors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: erp_vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.erp_vendors_id_seq OWNED BY public.erp_vendors.id;


--
-- Name: expenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.expenses (
    id integer NOT NULL,
    date timestamp without time zone DEFAULT now() NOT NULL,
    amount double precision NOT NULL,
    category text NOT NULL,
    description text NOT NULL,
    payment_method text NOT NULL,
    reference text,
    user_id integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.expenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.expenses_id_seq OWNED BY public.expenses.id;


--
-- Name: fiscal_periods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fiscal_periods (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    version integer DEFAULT 1,
    year integer NOT NULL,
    period integer NOT NULL,
    name character varying(255) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    status character varying(50) DEFAULT 'Open'::character varying,
    company_code_id integer
);


--
-- Name: fiscal_periods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fiscal_periods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fiscal_periods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.fiscal_periods_id_seq OWNED BY public.fiscal_periods.id;


--
-- Name: fiscal_year_variants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fiscal_year_variants (
    id integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    start_month integer NOT NULL,
    periods_count integer DEFAULT 12 NOT NULL,
    short_year boolean DEFAULT false NOT NULL,
    calendar_year boolean DEFAULT true NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: fiscal_year_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fiscal_year_variants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fiscal_year_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.fiscal_year_variants_id_seq OWNED BY public.fiscal_year_variants.id;


--
-- Name: general_ledger_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.general_ledger_accounts (
    id integer NOT NULL,
    account_number character varying(20) NOT NULL,
    account_name character varying(100) NOT NULL,
    account_type character varying(20) NOT NULL,
    account_group character varying(50),
    parent_account_id integer,
    company_code_id integer,
    currency_id integer,
    balance_sheet_item boolean DEFAULT false,
    profit_loss_item boolean DEFAULT false,
    reconciliation_account boolean DEFAULT false,
    tax_relevant boolean DEFAULT false,
    posting_allowed boolean DEFAULT true,
    blocked boolean DEFAULT false,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: general_ledger_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.general_ledger_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: general_ledger_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.general_ledger_accounts_id_seq OWNED BY public.general_ledger_accounts.id;


--
-- Name: gl_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gl_accounts (
    id integer NOT NULL,
    account_number text NOT NULL,
    account_name text NOT NULL,
    chart_of_accounts_id integer,
    account_type text NOT NULL,
    account_group text,
    balance_sheet_account boolean DEFAULT false NOT NULL,
    pl_account boolean DEFAULT false NOT NULL,
    block_posting boolean DEFAULT false NOT NULL,
    reconciliation_account boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: gl_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.gl_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gl_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.gl_accounts_id_seq OWNED BY public.gl_accounts.id;


--
-- Name: internal_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.internal_orders (
    id integer NOT NULL,
    order_number character varying(20) NOT NULL,
    order_type character varying(10) NOT NULL,
    description character varying(100) NOT NULL,
    company_code character varying(4) NOT NULL,
    controlling_area character varying(4) NOT NULL,
    responsible_cost_center character varying(10),
    profit_center character varying(10),
    order_status character varying(20) DEFAULT 'CREATED'::character varying,
    planned_costs numeric(15,2) DEFAULT 0,
    actual_costs numeric(15,2) DEFAULT 0,
    committed_costs numeric(15,2) DEFAULT 0,
    budget_amount numeric(15,2) DEFAULT 0,
    start_date date,
    end_date date,
    created_by integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: internal_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.internal_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: internal_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.internal_orders_id_seq OWNED BY public.internal_orders.id;


--
-- Name: inventory_transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_transactions (
    id integer NOT NULL,
    transaction_number character varying(20) NOT NULL,
    transaction_type character varying(20) NOT NULL,
    material_id integer,
    plant_id integer,
    storage_location_id integer,
    movement_type character varying(10) NOT NULL,
    quantity numeric(15,3) NOT NULL,
    unit_of_measure character varying(10),
    unit_price numeric(15,2),
    total_value numeric(15,2),
    batch_number character varying(50),
    serial_number character varying(50),
    reference_document character varying(50),
    posting_date date NOT NULL,
    document_date date NOT NULL,
    cost_center_id integer,
    reason_code character varying(10),
    notes text,
    created_by integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: inventory_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.inventory_transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inventory_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.inventory_transactions_id_seq OWNED BY public.inventory_transactions.id;


--
-- Name: invoices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invoices (
    id integer NOT NULL,
    invoice_number text NOT NULL,
    order_id integer,
    issue_date timestamp without time zone DEFAULT now() NOT NULL,
    due_date timestamp without time zone NOT NULL,
    amount double precision NOT NULL,
    status text DEFAULT 'Due'::text NOT NULL,
    paid_date timestamp without time zone,
    user_id integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.invoices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.invoices_id_seq OWNED BY public.invoices.id;


--
-- Name: journal_entries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.journal_entries (
    id integer NOT NULL,
    document_number character varying(20) NOT NULL,
    company_code_id integer,
    document_type character varying(10) NOT NULL,
    posting_date date NOT NULL,
    document_date date NOT NULL,
    fiscal_period character varying(7) NOT NULL,
    fiscal_year integer NOT NULL,
    currency_id integer,
    exchange_rate numeric(10,4) DEFAULT 1.0,
    reference_document character varying(50),
    header_text text,
    total_debit_amount numeric(15,2) NOT NULL,
    total_credit_amount numeric(15,2) NOT NULL,
    created_by integer,
    posted_by integer,
    posting_time timestamp without time zone,
    status character varying(20) DEFAULT 'POSTED'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    entry_date date
);


--
-- Name: journal_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.journal_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: journal_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.journal_entries_id_seq OWNED BY public.journal_entries.id;


--
-- Name: leads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.leads (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    company_name character varying(200),
    job_title character varying(100),
    email character varying(200) NOT NULL,
    phone character varying(50),
    status character varying(50) DEFAULT 'New'::character varying NOT NULL,
    source character varying(100),
    industry character varying(100),
    annual_revenue numeric(15,2),
    employee_count integer,
    website character varying(200),
    address text,
    city character varying(100),
    state character varying(100),
    country character varying(100),
    postal_code character varying(20),
    description text,
    last_contacted timestamp without time zone,
    next_followup timestamp without time zone,
    assigned_to integer,
    lead_score integer,
    is_converted boolean DEFAULT false,
    notes text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: leads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.leads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: leads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.leads_id_seq OWNED BY public.leads.id;


--
-- Name: material_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.material_categories (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    parent_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: material_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.material_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: material_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.material_categories_id_seq OWNED BY public.material_categories.id;


--
-- Name: materials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.materials (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    long_description text,
    type character varying(50) NOT NULL,
    uom_id integer NOT NULL,
    category_id integer,
    weight numeric,
    weight_uom_id integer,
    dimensions jsonb,
    base_unit_price numeric,
    cost numeric,
    min_order_qty numeric,
    order_multiple numeric,
    procurement_type character varying(20),
    min_stock numeric DEFAULT 0,
    max_stock numeric,
    reorder_point numeric,
    lead_time integer,
    shelf_life integer,
    lot_size character varying(20),
    mrp_type character varying(30),
    planning_policy character varying(30),
    is_active boolean DEFAULT true,
    is_sellable boolean DEFAULT false,
    is_purchasable boolean DEFAULT false,
    is_manufactured boolean DEFAULT false,
    is_stockable boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    created_by integer,
    updated_by integer,
    version integer DEFAULT 1 NOT NULL
);


--
-- Name: materials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.materials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: materials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.materials_id_seq OWNED BY public.materials.id;


--
-- Name: opportunities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opportunities (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    lead_id integer,
    customer_id integer,
    status character varying(50) DEFAULT 'Prospecting'::character varying NOT NULL,
    stage character varying(50) NOT NULL,
    amount numeric(15,2),
    expected_revenue numeric(15,2),
    probability integer,
    close_date timestamp without time zone,
    next_step character varying(200),
    type character varying(100),
    source character varying(100),
    campaign_source character varying(100),
    description text,
    assigned_to integer,
    is_closed boolean DEFAULT false,
    is_won boolean DEFAULT false,
    notes text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: opportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opportunities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opportunities_id_seq OWNED BY public.opportunities.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer NOT NULL,
    unit_price double precision NOT NULL,
    total double precision NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    order_number text NOT NULL,
    customer_id integer,
    date timestamp without time zone DEFAULT now() NOT NULL,
    status text DEFAULT 'Processing'::text NOT NULL,
    total double precision NOT NULL,
    notes text,
    shipping_address text,
    user_id integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: plants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plants (
    id integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    company_code_id integer NOT NULL,
    type text NOT NULL,
    category text,
    address text,
    city text,
    state text,
    country text,
    postal_code text,
    phone text,
    email text,
    manager text,
    timezone text,
    operating_hours text,
    coordinates text,
    status text DEFAULT 'active'::text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_by integer,
    version integer DEFAULT 1 NOT NULL,
    notes text
);


--
-- Name: plants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.plants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.plants_id_seq OWNED BY public.plants.id;


--
-- Name: production_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.production_orders (
    id integer NOT NULL,
    order_number character varying(20) NOT NULL,
    material_id integer,
    bom_id integer,
    plant_id integer,
    work_center_id integer,
    order_type character varying(20) NOT NULL,
    planned_quantity numeric(15,3) NOT NULL,
    actual_quantity numeric(15,3) DEFAULT 0,
    scrap_quantity numeric(15,3) DEFAULT 0,
    unit_of_measure character varying(10),
    planned_start_date date NOT NULL,
    planned_end_date date NOT NULL,
    actual_start_date date,
    actual_end_date date,
    priority character varying(10) DEFAULT 'NORMAL'::character varying,
    status character varying(20) DEFAULT 'CREATED'::character varying,
    cost_center_id integer,
    created_by integer,
    released_by integer,
    release_date timestamp without time zone,
    notes text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: production_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.production_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: production_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.production_orders_id_seq OWNED BY public.production_orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text NOT NULL,
    sku text NOT NULL,
    description text,
    price double precision NOT NULL,
    cost double precision NOT NULL,
    stock integer DEFAULT 0 NOT NULL,
    min_stock integer DEFAULT 10 NOT NULL,
    category_id integer,
    user_id integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: profit_centers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profit_centers (
    id integer NOT NULL,
    profit_center character varying(10) NOT NULL,
    description character varying(100) NOT NULL,
    profit_center_group character varying(20),
    company_code character varying(4) NOT NULL,
    controlling_area character varying(4) NOT NULL,
    segment character varying(10),
    hierarchy_area character varying(20),
    responsible_person character varying(50),
    valid_from date NOT NULL,
    valid_to date,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    company_code_id integer,
    plant_id integer,
    responsible_person_id integer
);


--
-- Name: profit_centers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.profit_centers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profit_centers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.profit_centers_id_seq OWNED BY public.profit_centers.id;


--
-- Name: purchase_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_groups (
    id integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    created_by text,
    updated_by text,
    version integer DEFAULT 1 NOT NULL,
    valid_from timestamp without time zone DEFAULT now() NOT NULL,
    valid_to timestamp without time zone
);


--
-- Name: purchase_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchase_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchase_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchase_groups_id_seq OWNED BY public.purchase_groups.id;


--
-- Name: purchase_order_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_order_items (
    id integer NOT NULL,
    purchase_order_id integer,
    line_number integer NOT NULL,
    material_id integer,
    description text,
    quantity numeric(15,3) NOT NULL,
    unit_price numeric(15,2) NOT NULL,
    total_price numeric(15,2) NOT NULL,
    delivery_date date,
    plant_id integer,
    storage_location_id integer,
    tax_code character varying(10),
    discount_percent numeric(5,2),
    received_quantity numeric(15,3) DEFAULT 0,
    invoiced_quantity numeric(15,3) DEFAULT 0,
    status character varying(20) DEFAULT 'OPEN'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: purchase_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchase_order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchase_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchase_order_items_id_seq OWNED BY public.purchase_order_items.id;


--
-- Name: purchase_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_orders (
    id integer NOT NULL,
    order_number character varying(20) NOT NULL,
    vendor_id integer,
    purchase_organization_id integer,
    company_code_id integer,
    plant_id integer,
    order_date date NOT NULL,
    delivery_date date,
    payment_terms character varying(50),
    currency_id integer,
    exchange_rate numeric(10,4) DEFAULT 1.0,
    total_amount numeric(15,2),
    tax_amount numeric(15,2),
    discount_amount numeric(15,2),
    net_amount numeric(15,2),
    status character varying(20) DEFAULT 'OPEN'::character varying,
    created_by integer,
    approved_by integer,
    approval_date timestamp without time zone,
    notes text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: purchase_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchase_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchase_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchase_orders_id_seq OWNED BY public.purchase_orders.id;


--
-- Name: purchase_organizations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_organizations (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    company_code_id integer NOT NULL,
    currency character varying(3) DEFAULT 'USD'::character varying,
    purchasing_manager character varying(100),
    email character varying(100),
    phone character varying(50),
    address text,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    created_by integer,
    updated_by integer,
    version integer DEFAULT 1,
    valid_from date DEFAULT CURRENT_DATE,
    valid_to date,
    purchasing_group text,
    supply_type text,
    approval_level text,
    city text,
    state text,
    country text,
    postal_code text,
    status text DEFAULT 'active'::text NOT NULL,
    notes text,
    manager text
);


--
-- Name: purchase_organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchase_organizations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchase_organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchase_organizations_id_seq OWNED BY public.purchase_organizations.id;


--
-- Name: quote_approvals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.quote_approvals (
    id integer NOT NULL,
    quote_id integer,
    requested_by integer NOT NULL,
    requested_at timestamp without time zone DEFAULT now() NOT NULL,
    status character varying(50) DEFAULT 'Pending'::character varying NOT NULL,
    current_approver integer,
    approved_by integer,
    approved_at timestamp without time zone,
    rejected_by integer,
    rejected_at timestamp without time zone,
    rejection_reason text,
    comments text,
    approval_level character varying(50),
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: quote_approvals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.quote_approvals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quote_approvals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.quote_approvals_id_seq OWNED BY public.quote_approvals.id;


--
-- Name: quote_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.quote_items (
    id integer NOT NULL,
    quote_id integer,
    product_id integer,
    description text NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(15,2) NOT NULL,
    discount_percent numeric(5,2) DEFAULT 0,
    tax_percent numeric(5,2) DEFAULT 0,
    line_total numeric(15,2) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: quote_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.quote_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quote_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.quote_items_id_seq OWNED BY public.quote_items.id;


--
-- Name: quotes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.quotes (
    id integer NOT NULL,
    quote_number character varying(50) NOT NULL,
    opportunity_id integer,
    customer_id integer,
    status character varying(50) DEFAULT 'Draft'::character varying NOT NULL,
    valid_until timestamp without time zone,
    total_amount numeric(15,2) NOT NULL,
    discount_amount numeric(15,2) DEFAULT 0,
    tax_amount numeric(15,2) DEFAULT 0,
    grand_total numeric(15,2) NOT NULL,
    terms text,
    notes text,
    assigned_to integer,
    approval_status character varying(50) DEFAULT 'Pending'::character varying,
    approved_by integer,
    approved_at timestamp without time zone,
    rejected_reason text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: quotes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.quotes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.quotes_id_seq OWNED BY public.quotes.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reports (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    sql_query text NOT NULL,
    chart_config jsonb,
    category character varying(100) DEFAULT 'custom'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- Name: sales_customer_contacts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_customer_contacts (
    id integer NOT NULL,
    customer_id integer,
    name character varying(255) NOT NULL,
    "position" character varying(100),
    email character varying(255),
    phone character varying(50),
    is_primary boolean DEFAULT false,
    notes text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: sales_customer_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sales_customer_contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_customer_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sales_customer_contacts_id_seq OWNED BY public.sales_customer_contacts.id;


--
-- Name: sales_customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_customers (
    id integer NOT NULL,
    customer_number character varying(50) NOT NULL,
    company_name character varying(255) NOT NULL,
    contact_person character varying(255),
    email character varying(255),
    phone character varying(50),
    website character varying(255),
    industry character varying(100),
    customer_type character varying(50) DEFAULT 'Business'::character varying,
    billing_address text,
    shipping_address text,
    tax_id character varying(100),
    payment_terms character varying(100),
    credit_limit numeric(15,2),
    status character varying(50) DEFAULT 'Active'::character varying,
    notes text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: sales_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sales_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sales_customers_id_seq OWNED BY public.sales_customers.id;


--
-- Name: sales_invoice_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_invoice_items (
    id integer NOT NULL,
    invoice_id integer,
    product_name character varying(255) NOT NULL,
    description text,
    quantity integer NOT NULL,
    unit_price numeric(15,2) NOT NULL,
    discount_percent numeric(5,2) DEFAULT 0,
    tax_percent numeric(5,2) DEFAULT 0,
    subtotal numeric(15,2) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: sales_invoice_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sales_invoice_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_invoice_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sales_invoice_items_id_seq OWNED BY public.sales_invoice_items.id;


--
-- Name: sales_invoices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_invoices (
    id integer NOT NULL,
    invoice_number character varying(50) NOT NULL,
    order_id integer,
    customer_name character varying(255) NOT NULL,
    invoice_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    due_date timestamp with time zone,
    status character varying(50) DEFAULT 'Pending'::character varying,
    total_amount numeric(15,2) DEFAULT 0,
    discount_amount numeric(15,2) DEFAULT 0,
    tax_amount numeric(15,2) DEFAULT 0,
    grand_total numeric(15,2) DEFAULT 0,
    paid_amount numeric(15,2) DEFAULT 0,
    payment_method character varying(50),
    payment_date timestamp with time zone,
    notes text,
    created_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: sales_invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sales_invoices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sales_invoices_id_seq OWNED BY public.sales_invoices.id;


--
-- Name: sales_order_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_order_items (
    id integer NOT NULL,
    order_id integer,
    product_id integer,
    product_name character varying(255) NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(15,2) NOT NULL,
    discount_percent numeric(5,2) DEFAULT 0,
    tax_percent numeric(5,2) DEFAULT 0,
    subtotal numeric(15,2) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: sales_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sales_order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sales_order_items_id_seq OWNED BY public.sales_order_items.id;


--
-- Name: sales_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_orders (
    id integer NOT NULL,
    order_number character varying(50) NOT NULL,
    customer_id integer,
    customer_name character varying(255) NOT NULL,
    order_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    delivery_date timestamp with time zone,
    status character varying(50) DEFAULT 'Pending'::character varying,
    total_amount numeric(15,2) DEFAULT 0,
    payment_status character varying(50) DEFAULT 'Unpaid'::character varying,
    shipping_address text,
    billing_address text,
    notes text,
    created_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    plant_id integer,
    sales_org_id integer,
    company_code_id integer,
    currency_id integer
);


--
-- Name: sales_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sales_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sales_orders_id_seq OWNED BY public.sales_orders.id;


--
-- Name: sales_organizations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_organizations (
    id integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    company_code_id integer NOT NULL,
    currency text DEFAULT 'USD'::text,
    region text,
    distribution_channel text,
    industry text,
    address text,
    city text,
    state text,
    country text,
    postal_code text,
    phone text,
    email text,
    manager text,
    status text DEFAULT 'active'::text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    notes text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_by integer,
    version integer DEFAULT 1 NOT NULL
);


--
-- Name: sales_organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sales_organizations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sales_organizations_id_seq OWNED BY public.sales_organizations.id;


--
-- Name: sales_quote_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_quote_items (
    id integer NOT NULL,
    quote_id integer,
    product_name character varying(255) NOT NULL,
    description text,
    quantity integer NOT NULL,
    unit_price numeric(15,2) NOT NULL,
    discount_percent numeric(5,2) DEFAULT 0,
    tax_percent numeric(5,2) DEFAULT 0,
    subtotal numeric(15,2) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: sales_quote_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sales_quote_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_quote_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sales_quote_items_id_seq OWNED BY public.sales_quote_items.id;


--
-- Name: sales_quotes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_quotes (
    id integer NOT NULL,
    quote_number character varying(50) NOT NULL,
    opportunity_id integer,
    customer_name character varying(255) NOT NULL,
    quote_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    valid_until timestamp with time zone,
    status character varying(50) DEFAULT 'Draft'::character varying,
    total_amount numeric(15,2) DEFAULT 0,
    discount_amount numeric(15,2) DEFAULT 0,
    tax_amount numeric(15,2) DEFAULT 0,
    grand_total numeric(15,2) DEFAULT 0,
    notes text,
    terms_conditions text,
    created_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: sales_quotes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sales_quotes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_quotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sales_quotes_id_seq OWNED BY public.sales_quotes.id;


--
-- Name: sales_return_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_return_items (
    id integer NOT NULL,
    return_id integer,
    product_name character varying(255) NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(15,2) NOT NULL,
    subtotal numeric(15,2) NOT NULL,
    return_reason text,
    condition character varying(50),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: sales_return_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sales_return_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_return_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sales_return_items_id_seq OWNED BY public.sales_return_items.id;


--
-- Name: sales_returns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_returns (
    id integer NOT NULL,
    return_number character varying(50) NOT NULL,
    order_id integer,
    invoice_id integer,
    customer_name character varying(255) NOT NULL,
    return_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(50) DEFAULT 'Pending'::character varying,
    total_amount numeric(15,2) DEFAULT 0,
    return_reason text,
    notes text,
    created_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: sales_returns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sales_returns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_returns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sales_returns_id_seq OWNED BY public.sales_returns.id;


--
-- Name: stock_movements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stock_movements (
    id integer NOT NULL,
    product_id integer,
    type text NOT NULL,
    quantity integer NOT NULL,
    reason text NOT NULL,
    date timestamp without time zone DEFAULT now() NOT NULL,
    user_id integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: stock_movements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stock_movements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stock_movements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stock_movements_id_seq OWNED BY public.stock_movements.id;


--
-- Name: storage_locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.storage_locations (
    id integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    plant_id integer NOT NULL,
    type text NOT NULL,
    is_mrp_relevant boolean DEFAULT true NOT NULL,
    is_negative_stock_allowed boolean DEFAULT false NOT NULL,
    is_goods_receipt_relevant boolean DEFAULT true NOT NULL,
    is_goods_issue_relevant boolean DEFAULT true NOT NULL,
    is_interim_storage boolean DEFAULT false NOT NULL,
    is_transit_storage boolean DEFAULT false NOT NULL,
    is_restricted_use boolean DEFAULT false NOT NULL,
    status text DEFAULT 'active'::text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_by integer,
    version integer DEFAULT 1 NOT NULL,
    notes text
);


--
-- Name: storage_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.storage_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: storage_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.storage_locations_id_seq OWNED BY public.storage_locations.id;


--
-- Name: supply_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.supply_types (
    id integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    created_by text,
    updated_by text,
    version integer DEFAULT 1 NOT NULL,
    valid_from timestamp without time zone DEFAULT now() NOT NULL,
    valid_to timestamp without time zone
);


--
-- Name: supply_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.supply_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: supply_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.supply_types_id_seq OWNED BY public.supply_types.id;


--
-- Name: tax_codes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tax_codes (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    country character varying(2) NOT NULL,
    tax_type character varying(20) NOT NULL,
    percentage numeric(5,2) NOT NULL,
    description text,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: tax_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tax_codes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tax_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tax_codes_id_seq OWNED BY public.tax_codes.id;


--
-- Name: transport_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transport_logs (
    id integer NOT NULL,
    request_id integer,
    environment character varying(10) NOT NULL,
    action character varying(50) NOT NULL,
    status character varying(20) NOT NULL,
    message text,
    executed_by character varying(100),
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: transport_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transport_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transport_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transport_logs_id_seq OWNED BY public.transport_logs.id;


--
-- Name: transport_number_ranges; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transport_number_ranges (
    id integer NOT NULL,
    range_prefix character varying(2) NOT NULL,
    range_type character varying(50) NOT NULL,
    description text,
    current_number integer DEFAULT 100000,
    max_number integer DEFAULT 999999,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: transport_number_ranges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transport_number_ranges_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transport_number_ranges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transport_number_ranges_id_seq OWNED BY public.transport_number_ranges.id;


--
-- Name: transport_objects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transport_objects (
    id integer NOT NULL,
    request_id integer,
    object_type character varying(50) NOT NULL,
    object_name character varying(100) NOT NULL,
    table_name character varying(100) NOT NULL,
    record_id integer,
    action character varying(20) NOT NULL,
    data_snapshot jsonb,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: transport_objects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transport_objects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transport_objects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transport_objects_id_seq OWNED BY public.transport_objects.id;


--
-- Name: transport_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transport_requests (
    id integer NOT NULL,
    request_number character varying(20) NOT NULL,
    request_type character varying(20) NOT NULL,
    description text,
    owner character varying(100) NOT NULL,
    status character varying(20) DEFAULT 'CREATED'::character varying,
    source_environment character varying(10) DEFAULT 'DEV'::character varying,
    target_environment character varying(10),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    released_at timestamp without time zone,
    imported_at timestamp without time zone,
    release_notes text
);


--
-- Name: transport_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transport_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transport_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transport_requests_id_seq OWNED BY public.transport_requests.id;


--
-- Name: units_of_measure; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.units_of_measure (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    is_active boolean DEFAULT true,
    dimension character varying(50),
    conversion_factor numeric(15,5) DEFAULT 1.0,
    base_uom_id integer,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    version integer DEFAULT 1
);


--
-- Name: units_of_measure_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.units_of_measure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: units_of_measure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.units_of_measure_id_seq OWNED BY public.units_of_measure.id;


--
-- Name: uom; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.uom (
    id integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    category text NOT NULL,
    is_base boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_by integer,
    version integer DEFAULT 1 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    notes text
);


--
-- Name: uom_conversions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.uom_conversions (
    id integer NOT NULL,
    from_uom_id integer NOT NULL,
    to_uom_id integer NOT NULL,
    conversion_factor numeric NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    created_by integer,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_by integer,
    version integer DEFAULT 1 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    notes text
);


--
-- Name: uom_conversions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.uom_conversions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uom_conversions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.uom_conversions_id_seq OWNED BY public.uom_conversions.id;


--
-- Name: uom_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.uom_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.uom_id_seq OWNED BY public.uom.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    role text DEFAULT 'user'::text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: variance_analysis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.variance_analysis (
    id integer NOT NULL,
    variance_type character varying(20) NOT NULL,
    object_type character varying(20) NOT NULL,
    object_number character varying(20) NOT NULL,
    fiscal_year integer NOT NULL,
    period integer NOT NULL,
    account character varying(10),
    cost_element character varying(10),
    planned_amount numeric(15,2) DEFAULT 0,
    actual_amount numeric(15,2) DEFAULT 0,
    variance_amount numeric(15,2) DEFAULT 0,
    variance_percentage numeric(5,2) DEFAULT 0,
    currency character varying(3) DEFAULT 'USD'::character varying,
    analysis_date date NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: variance_analysis_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.variance_analysis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: variance_analysis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.variance_analysis_id_seq OWNED BY public.variance_analysis.id;


--
-- Name: vendor_contacts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vendor_contacts (
    id integer NOT NULL,
    vendor_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    "position" character varying(100),
    department character varying(100),
    email character varying(100),
    phone character varying(30),
    mobile character varying(30),
    is_primary boolean DEFAULT false,
    is_order_contact boolean DEFAULT false,
    is_purchase_contact boolean DEFAULT false,
    is_quality_contact boolean DEFAULT false,
    is_accounts_contact boolean DEFAULT false,
    preferred_language character varying(50) DEFAULT 'English'::character varying,
    notes text,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    created_by integer,
    updated_by integer
);


--
-- Name: vendor_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vendor_contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vendor_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vendor_contacts_id_seq OWNED BY public.vendor_contacts.id;


--
-- Name: vendors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vendors (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    description text,
    tax_id character varying(50),
    industry character varying(50),
    address text,
    city character varying(100),
    state character varying(50),
    country character varying(50),
    postal_code character varying(20),
    region character varying(50),
    phone character varying(30),
    alt_phone character varying(30),
    email character varying(100),
    website character varying(255),
    currency character varying(10),
    payment_terms character varying(50),
    payment_method character varying(50),
    supplier_type character varying(50),
    category character varying(50),
    order_frequency character varying(50),
    minimum_order_value numeric,
    evaluation_score numeric,
    lead_time integer,
    purchasing_group_id integer,
    status character varying(20) DEFAULT 'active'::character varying NOT NULL,
    blacklisted boolean DEFAULT false,
    blacklist_reason text,
    notes text,
    tags text[],
    company_code_id integer,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    created_by integer,
    updated_by integer,
    version integer DEFAULT 1 NOT NULL
);


--
-- Name: vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vendors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vendors_id_seq OWNED BY public.vendors.id;


--
-- Name: warehouse_bins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.warehouse_bins (
    id integer NOT NULL,
    bin_code character varying(20) NOT NULL,
    bin_name character varying(100),
    storage_location_id integer,
    bin_type character varying(20) NOT NULL,
    zone character varying(20),
    aisle character varying(20),
    shelf character varying(20),
    capacity_volume numeric(10,3),
    capacity_weight numeric(10,3),
    current_volume numeric(10,3) DEFAULT 0,
    current_weight numeric(10,3) DEFAULT 0,
    status character varying(20) DEFAULT 'ACTIVE'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: warehouse_bins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.warehouse_bins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: warehouse_bins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.warehouse_bins_id_seq OWNED BY public.warehouse_bins.id;


--
-- Name: work_centers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_centers (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    plant_id integer,
    description text,
    capacity numeric(10,2),
    capacity_unit character varying(20),
    cost_rate numeric(15,2),
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(20) DEFAULT 'active'::character varying,
    cost_center_id integer,
    company_code_id integer
);


--
-- Name: work_centers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.work_centers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: work_centers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.work_centers_id_seq OWNED BY public.work_centers.id;


--
-- Name: accounts_payable id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_payable ALTER COLUMN id SET DEFAULT nextval('public.accounts_payable_id_seq'::regclass);


--
-- Name: accounts_receivable id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_receivable ALTER COLUMN id SET DEFAULT nextval('public.accounts_receivable_id_seq'::regclass);


--
-- Name: activity_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_types ALTER COLUMN id SET DEFAULT nextval('public.activity_types_id_seq'::regclass);


--
-- Name: ai_agent_analytics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_analytics ALTER COLUMN id SET DEFAULT nextval('public.ai_agent_analytics_id_seq'::regclass);


--
-- Name: ai_agent_configs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_configs ALTER COLUMN id SET DEFAULT nextval('public.ai_agent_configs_id_seq'::regclass);


--
-- Name: ai_agent_health id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_health ALTER COLUMN id SET DEFAULT nextval('public.ai_agent_health_id_seq'::regclass);


--
-- Name: ai_chat_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_chat_messages ALTER COLUMN id SET DEFAULT nextval('public.ai_chat_messages_id_seq'::regclass);


--
-- Name: ai_chat_sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_chat_sessions ALTER COLUMN id SET DEFAULT nextval('public.ai_chat_sessions_id_seq'::regclass);


--
-- Name: ai_data_analysis_sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_data_analysis_sessions ALTER COLUMN id SET DEFAULT nextval('public.ai_data_analysis_sessions_id_seq'::regclass);


--
-- Name: api_keys id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.api_keys ALTER COLUMN id SET DEFAULT nextval('public.api_keys_id_seq'::regclass);


--
-- Name: approval_levels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.approval_levels ALTER COLUMN id SET DEFAULT nextval('public.approval_levels_id_seq'::regclass);


--
-- Name: asset_master id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asset_master ALTER COLUMN id SET DEFAULT nextval('public.asset_master_id_seq'::regclass);


--
-- Name: batch_master id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batch_master ALTER COLUMN id SET DEFAULT nextval('public.batch_master_id_seq'::regclass);


--
-- Name: bill_of_materials id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bill_of_materials ALTER COLUMN id SET DEFAULT nextval('public.bill_of_materials_id_seq'::regclass);


--
-- Name: bom_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bom_items ALTER COLUMN id SET DEFAULT nextval('public.bom_items_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: chart_of_accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chart_of_accounts ALTER COLUMN id SET DEFAULT nextval('public.chart_of_accounts_id_seq'::regclass);


--
-- Name: company_code_chart_assignments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_code_chart_assignments ALTER COLUMN id SET DEFAULT nextval('public.company_code_chart_assignments_id_seq'::regclass);


--
-- Name: company_codes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_codes ALTER COLUMN id SET DEFAULT nextval('public.company_codes_id_seq'::regclass);


--
-- Name: copa_actuals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.copa_actuals ALTER COLUMN id SET DEFAULT nextval('public.copa_actuals_id_seq'::regclass);


--
-- Name: cost_allocations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_allocations ALTER COLUMN id SET DEFAULT nextval('public.cost_allocations_id_seq'::regclass);


--
-- Name: cost_center_actuals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_center_actuals ALTER COLUMN id SET DEFAULT nextval('public.cost_center_actuals_id_seq'::regclass);


--
-- Name: cost_center_planning id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_center_planning ALTER COLUMN id SET DEFAULT nextval('public.cost_center_planning_id_seq'::regclass);


--
-- Name: cost_centers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_centers ALTER COLUMN id SET DEFAULT nextval('public.cost_centers_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: credit_control_areas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credit_control_areas ALTER COLUMN id SET DEFAULT nextval('public.credit_control_areas_id_seq'::regclass);


--
-- Name: currencies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.currencies ALTER COLUMN id SET DEFAULT nextval('public.currencies_id_seq'::regclass);


--
-- Name: custom_reports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_reports ALTER COLUMN id SET DEFAULT nextval('public.custom_reports_id_seq'::regclass);


--
-- Name: customer_contacts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_contacts ALTER COLUMN id SET DEFAULT nextval('public.customer_contacts_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: dashboard_configs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboard_configs ALTER COLUMN id SET DEFAULT nextval('public.dashboard_configs_id_seq'::regclass);


--
-- Name: employee_master id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee_master ALTER COLUMN id SET DEFAULT nextval('public.employee_master_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- Name: environment_config id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.environment_config ALTER COLUMN id SET DEFAULT nextval('public.environment_config_id_seq'::regclass);


--
-- Name: erp_customer_contacts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.erp_customer_contacts ALTER COLUMN id SET DEFAULT nextval('public.erp_customer_contacts_id_seq'::regclass);


--
-- Name: erp_customers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.erp_customers ALTER COLUMN id SET DEFAULT nextval('public.erp_customers_id_seq'::regclass);


--
-- Name: erp_vendor_contacts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.erp_vendor_contacts ALTER COLUMN id SET DEFAULT nextval('public.erp_vendor_contacts_id_seq'::regclass);


--
-- Name: erp_vendors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.erp_vendors ALTER COLUMN id SET DEFAULT nextval('public.erp_vendors_id_seq'::regclass);


--
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expenses ALTER COLUMN id SET DEFAULT nextval('public.expenses_id_seq'::regclass);


--
-- Name: fiscal_periods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fiscal_periods ALTER COLUMN id SET DEFAULT nextval('public.fiscal_periods_id_seq'::regclass);


--
-- Name: fiscal_year_variants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fiscal_year_variants ALTER COLUMN id SET DEFAULT nextval('public.fiscal_year_variants_id_seq'::regclass);


--
-- Name: general_ledger_accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.general_ledger_accounts ALTER COLUMN id SET DEFAULT nextval('public.general_ledger_accounts_id_seq'::regclass);


--
-- Name: gl_accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gl_accounts ALTER COLUMN id SET DEFAULT nextval('public.gl_accounts_id_seq'::regclass);


--
-- Name: internal_orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.internal_orders ALTER COLUMN id SET DEFAULT nextval('public.internal_orders_id_seq'::regclass);


--
-- Name: inventory_transactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_transactions ALTER COLUMN id SET DEFAULT nextval('public.inventory_transactions_id_seq'::regclass);


--
-- Name: invoices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices ALTER COLUMN id SET DEFAULT nextval('public.invoices_id_seq'::regclass);


--
-- Name: journal_entries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.journal_entries ALTER COLUMN id SET DEFAULT nextval('public.journal_entries_id_seq'::regclass);


--
-- Name: leads id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leads ALTER COLUMN id SET DEFAULT nextval('public.leads_id_seq'::regclass);


--
-- Name: material_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material_categories ALTER COLUMN id SET DEFAULT nextval('public.material_categories_id_seq'::regclass);


--
-- Name: materials id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.materials ALTER COLUMN id SET DEFAULT nextval('public.materials_id_seq'::regclass);


--
-- Name: opportunities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opportunities ALTER COLUMN id SET DEFAULT nextval('public.opportunities_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: plants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plants ALTER COLUMN id SET DEFAULT nextval('public.plants_id_seq'::regclass);


--
-- Name: production_orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_orders ALTER COLUMN id SET DEFAULT nextval('public.production_orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: profit_centers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profit_centers ALTER COLUMN id SET DEFAULT nextval('public.profit_centers_id_seq'::regclass);


--
-- Name: purchase_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_groups ALTER COLUMN id SET DEFAULT nextval('public.purchase_groups_id_seq'::regclass);


--
-- Name: purchase_order_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_order_items ALTER COLUMN id SET DEFAULT nextval('public.purchase_order_items_id_seq'::regclass);


--
-- Name: purchase_orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_orders ALTER COLUMN id SET DEFAULT nextval('public.purchase_orders_id_seq'::regclass);


--
-- Name: purchase_organizations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_organizations ALTER COLUMN id SET DEFAULT nextval('public.purchase_organizations_id_seq'::regclass);


--
-- Name: quote_approvals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quote_approvals ALTER COLUMN id SET DEFAULT nextval('public.quote_approvals_id_seq'::regclass);


--
-- Name: quote_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quote_items ALTER COLUMN id SET DEFAULT nextval('public.quote_items_id_seq'::regclass);


--
-- Name: quotes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quotes ALTER COLUMN id SET DEFAULT nextval('public.quotes_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- Name: sales_customer_contacts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_customer_contacts ALTER COLUMN id SET DEFAULT nextval('public.sales_customer_contacts_id_seq'::regclass);


--
-- Name: sales_customers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_customers ALTER COLUMN id SET DEFAULT nextval('public.sales_customers_id_seq'::regclass);


--
-- Name: sales_invoice_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_invoice_items ALTER COLUMN id SET DEFAULT nextval('public.sales_invoice_items_id_seq'::regclass);


--
-- Name: sales_invoices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_invoices ALTER COLUMN id SET DEFAULT nextval('public.sales_invoices_id_seq'::regclass);


--
-- Name: sales_order_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_order_items ALTER COLUMN id SET DEFAULT nextval('public.sales_order_items_id_seq'::regclass);


--
-- Name: sales_orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_orders ALTER COLUMN id SET DEFAULT nextval('public.sales_orders_id_seq'::regclass);


--
-- Name: sales_organizations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_organizations ALTER COLUMN id SET DEFAULT nextval('public.sales_organizations_id_seq'::regclass);


--
-- Name: sales_quote_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_quote_items ALTER COLUMN id SET DEFAULT nextval('public.sales_quote_items_id_seq'::regclass);


--
-- Name: sales_quotes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_quotes ALTER COLUMN id SET DEFAULT nextval('public.sales_quotes_id_seq'::regclass);


--
-- Name: sales_return_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_return_items ALTER COLUMN id SET DEFAULT nextval('public.sales_return_items_id_seq'::regclass);


--
-- Name: sales_returns id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_returns ALTER COLUMN id SET DEFAULT nextval('public.sales_returns_id_seq'::regclass);


--
-- Name: stock_movements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_movements ALTER COLUMN id SET DEFAULT nextval('public.stock_movements_id_seq'::regclass);


--
-- Name: storage_locations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.storage_locations ALTER COLUMN id SET DEFAULT nextval('public.storage_locations_id_seq'::regclass);


--
-- Name: supply_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.supply_types ALTER COLUMN id SET DEFAULT nextval('public.supply_types_id_seq'::regclass);


--
-- Name: tax_codes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_codes ALTER COLUMN id SET DEFAULT nextval('public.tax_codes_id_seq'::regclass);


--
-- Name: transport_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_logs ALTER COLUMN id SET DEFAULT nextval('public.transport_logs_id_seq'::regclass);


--
-- Name: transport_number_ranges id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_number_ranges ALTER COLUMN id SET DEFAULT nextval('public.transport_number_ranges_id_seq'::regclass);


--
-- Name: transport_objects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_objects ALTER COLUMN id SET DEFAULT nextval('public.transport_objects_id_seq'::regclass);


--
-- Name: transport_requests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_requests ALTER COLUMN id SET DEFAULT nextval('public.transport_requests_id_seq'::regclass);


--
-- Name: units_of_measure id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.units_of_measure ALTER COLUMN id SET DEFAULT nextval('public.units_of_measure_id_seq'::regclass);


--
-- Name: uom id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uom ALTER COLUMN id SET DEFAULT nextval('public.uom_id_seq'::regclass);


--
-- Name: uom_conversions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uom_conversions ALTER COLUMN id SET DEFAULT nextval('public.uom_conversions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: variance_analysis id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variance_analysis ALTER COLUMN id SET DEFAULT nextval('public.variance_analysis_id_seq'::regclass);


--
-- Name: vendor_contacts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_contacts ALTER COLUMN id SET DEFAULT nextval('public.vendor_contacts_id_seq'::regclass);


--
-- Name: vendors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendors ALTER COLUMN id SET DEFAULT nextval('public.vendors_id_seq'::regclass);


--
-- Name: warehouse_bins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse_bins ALTER COLUMN id SET DEFAULT nextval('public.warehouse_bins_id_seq'::regclass);


--
-- Name: work_centers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_centers ALTER COLUMN id SET DEFAULT nextval('public.work_centers_id_seq'::regclass);


--
-- Data for Name: accounts_payable; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.accounts_payable (id, vendor_id, invoice_number, invoice_date, due_date, amount, currency_id, company_code_id, plant_id, purchase_order_id, payment_terms, status, payment_date, payment_reference, discount_amount, tax_amount, net_amount, notes, created_by, created_at, updated_at) FROM stdin;
1	1	AP000001	2025-05-30	2025-06-24	47838.36	1	1	1	\N	Net 60	Paid	\N	\N	0.00	0.00	5567.37	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
2	1	AP000002	2025-03-31	2025-06-22	9250.10	1	2	1	\N	2/10 Net 30	Paid	\N	\N	0.00	0.00	42812.95	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
3	1	AP000003	2025-05-22	2025-07-01	32224.00	1	1	2	\N	2/10 Net 30	Paid	\N	\N	0.00	0.00	3820.84	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
4	1	AP000004	2025-03-22	2025-06-24	22337.39	1	2	2	\N	Net 60	Paid	\N	\N	0.00	0.00	13850.49	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
5	2	AP000005	2025-04-08	2025-06-10	14588.97	1	1	1	\N	2/10 Net 30	Paid	\N	\N	0.00	0.00	20777.60	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
6	2	AP000006	2025-05-11	2025-06-11	21228.90	1	2	1	\N	Net 60	Open	\N	\N	0.00	0.00	5461.03	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
7	2	AP000007	2025-05-07	2025-06-10	4409.29	1	1	2	\N	Net 60	Paid	\N	\N	0.00	0.00	31608.47	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
8	2	AP000008	2025-06-01	2025-06-14	35983.42	1	2	2	\N	2/10 Net 30	Paid	\N	\N	0.00	0.00	36771.91	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
9	3	AP000009	2025-03-25	2025-06-14	13713.36	1	1	1	\N	2/10 Net 30	Paid	\N	\N	0.00	0.00	9380.00	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
10	3	AP000010	2025-05-22	2025-06-22	17510.14	1	2	1	\N	2/10 Net 30	Paid	\N	\N	0.00	0.00	9086.99	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
11	3	AP000011	2025-03-22	2025-06-29	12341.88	1	1	2	\N	2/10 Net 30	Open	\N	\N	0.00	0.00	44419.24	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
12	3	AP000012	2025-05-29	2025-06-27	6162.53	1	2	2	\N	2/10 Net 30	Paid	\N	\N	0.00	0.00	45212.87	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
13	4	AP000013	2025-05-24	2025-06-17	6752.22	1	1	1	\N	2/10 Net 30	Paid	\N	\N	0.00	0.00	31644.39	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
14	4	AP000014	2025-05-02	2025-06-28	45753.24	1	2	1	\N	2/10 Net 30	Open	\N	\N	0.00	0.00	2142.99	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
15	4	AP000015	2025-05-29	2025-06-21	27214.71	1	1	2	\N	Net 30	Paid	\N	\N	0.00	0.00	12299.88	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
16	4	AP000016	2025-03-26	2025-06-30	7709.25	1	2	2	\N	Net 60	Open	\N	\N	0.00	0.00	28709.80	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
17	5	AP000017	2025-06-03	2025-06-16	37654.25	1	1	1	\N	Net 60	Paid	\N	\N	0.00	0.00	1122.16	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
18	5	AP000018	2025-03-15	2025-06-22	23692.87	1	2	1	\N	Net 30	Paid	\N	\N	0.00	0.00	23897.81	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
19	5	AP000019	2025-03-17	2025-06-21	20784.48	1	1	2	\N	Net 30	Paid	\N	\N	0.00	0.00	23198.00	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
20	5	AP000020	2025-05-29	2025-06-26	16975.29	1	2	2	\N	2/10 Net 30	Paid	\N	\N	0.00	0.00	3105.77	\N	1	2025-06-04 00:44:42.884195	2025-06-04 00:44:42.884195
\.


--
-- Data for Name: accounts_receivable; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.accounts_receivable (id, customer_id, invoice_number, invoice_date, due_date, amount, currency_id, company_code_id, plant_id, sales_order_id, payment_terms, status, payment_date, payment_reference, discount_amount, tax_amount, net_amount, notes, created_by, created_at, updated_at) FROM stdin;
1	1	AR000001	2025-04-09	2025-07-08	45565.28	1	1	1	\N	Net 60	Overdue	\N	\N	0.00	0.00	96575.56	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
2	2	AR000002	2025-05-05	2025-06-30	70579.07	1	1	1	\N	Net 60	Overdue	\N	\N	0.00	0.00	53968.12	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
3	3	AR000003	2025-05-16	2025-06-29	90806.55	1	1	1	\N	Net 60	Overdue	\N	\N	0.00	0.00	7895.64	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
4	4	AR000004	2025-06-03	2025-07-09	53773.31	1	1	1	\N	Net 45	Paid	\N	\N	0.00	0.00	31983.21	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
5	5	AR000005	2025-04-14	2025-06-17	14521.86	1	1	1	\N	Net 30	Paid	\N	\N	0.00	0.00	76067.68	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
6	1	AR000006	2025-04-27	2025-07-09	88330.44	1	2	1	\N	Net 60	Paid	\N	\N	0.00	0.00	72908.98	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
7	2	AR000007	2025-05-14	2025-07-07	9146.44	1	2	1	\N	Net 30	Overdue	\N	\N	0.00	0.00	41336.64	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
8	3	AR000008	2025-05-28	2025-06-16	42630.56	1	2	1	\N	Net 45	Open	\N	\N	0.00	0.00	39717.42	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
9	4	AR000009	2025-05-24	2025-07-04	69552.52	1	2	1	\N	Net 60	Paid	\N	\N	0.00	0.00	48387.89	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
10	5	AR000010	2025-04-17	2025-06-22	15146.02	1	2	1	\N	Net 60	Open	\N	\N	0.00	0.00	97124.72	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
11	1	AR000011	2025-05-11	2025-06-09	22085.06	1	1	2	\N	Net 60	Overdue	\N	\N	0.00	0.00	65227.88	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
12	2	AR000012	2025-05-02	2025-06-20	28185.91	1	1	2	\N	Net 60	Overdue	\N	\N	0.00	0.00	74679.11	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
13	3	AR000013	2025-04-09	2025-06-21	16533.58	1	1	2	\N	Net 45	Overdue	\N	\N	0.00	0.00	85472.65	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
14	4	AR000014	2025-06-02	2025-06-26	42584.48	1	1	2	\N	Net 45	Paid	\N	\N	0.00	0.00	14340.11	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
15	5	AR000015	2025-05-24	2025-06-06	7901.24	1	1	2	\N	Net 60	Overdue	\N	\N	0.00	0.00	81366.85	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
16	1	AR000016	2025-04-22	2025-06-22	16068.79	1	2	2	\N	Net 60	Overdue	\N	\N	0.00	0.00	15011.23	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
17	2	AR000017	2025-04-20	2025-07-16	52841.49	1	2	2	\N	Net 45	Paid	\N	\N	0.00	0.00	25781.58	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
18	3	AR000018	2025-05-29	2025-06-07	9468.52	1	2	2	\N	Net 45	Overdue	\N	\N	0.00	0.00	86568.69	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
19	4	AR000019	2025-05-31	2025-06-30	99156.13	1	2	2	\N	Net 45	Open	\N	\N	0.00	0.00	31387.58	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
20	5	AR000020	2025-05-03	2025-07-13	52978.43	1	2	2	\N	Net 30	Open	\N	\N	0.00	0.00	16317.79	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
21	1	AR000021	2025-05-13	2025-06-09	6883.61	2	1	1	\N	Net 45	Paid	\N	\N	0.00	0.00	16939.39	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
22	2	AR000022	2025-05-06	2025-07-09	63651.40	2	1	1	\N	Net 60	Overdue	\N	\N	0.00	0.00	56058.37	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
23	3	AR000023	2025-04-18	2025-06-24	88658.27	2	1	1	\N	Net 30	Overdue	\N	\N	0.00	0.00	25210.15	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
24	4	AR000024	2025-04-09	2025-06-04	50958.76	2	1	1	\N	Net 30	Overdue	\N	\N	0.00	0.00	72221.26	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
25	5	AR000025	2025-04-06	2025-07-06	78462.86	2	1	1	\N	Net 60	Overdue	\N	\N	0.00	0.00	38983.94	\N	1	2025-06-04 00:44:46.291765	2025-06-04 00:44:46.291765
\.


--
-- Data for Name: activity_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.activity_types (id, activity_type, description, unit_of_measure, category, controlling_area, allocation_method, created_at) FROM stdin;
1	MACH-HR	Machine Hours	HR	MACHINE	US01	\N	2025-06-03 17:58:50.654812
2	LABOR-HR	Labor Hours	HR	LABOR	US01	\N	2025-06-03 17:58:50.654812
3	SETUP-HR	Setup Hours	HR	SETUP	US01	\N	2025-06-03 17:58:50.654812
4	QC-HR	Quality Control Hours	HR	QUALITY	US01	\N	2025-06-03 17:58:50.654812
5	MAINT-HR	Maintenance Hours	HR	MAINTENANCE	US01	\N	2025-06-03 17:58:50.654812
\.


--
-- Data for Name: ai_agent_analytics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ai_agent_analytics (id, module_type, date, total_queries, successful_queries, failed_queries, avg_response_time, total_tokens_used, unique_users, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ai_agent_configs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ai_agent_configs (id, module_type, module_name, agent_name, role_description, system_prompt, expertise_areas, capabilities, is_active, created_at, updated_at) FROM stdin;
1	masterData	Master Data Management	Master Data Specialist	Expert in organizational structures, material management, customer/vendor data, and reference data maintenance	You are a Master Data Management specialist with deep expertise in Enterprise-standard organizational structures and reference data. You help users navigate complex master data relationships, ensure data integrity, and optimize organizational hierarchies. You understand the critical importance of accurate master data for all business processes.	["Organizational Structures", "Material Master", "Customer Master", "Vendor Master", "Chart of Accounts", "Cost Centers", "Profit Centers", "Plant Maintenance", "Units of Measure", "Number Ranges", "Data Governance"]	["Data Structure Analysis", "Master Data Creation Guidance", "Organizational Hierarchy Design", "Data Quality Assessment", "Reference Data Management", "Integration Mapping", "Compliance Checking", "Migration Planning"]	t	2025-06-04 04:33:55.202225+00	2025-06-04 04:33:55.202225+00
2	sales	Sales Management	Sales Operations Expert	Specialist in sales processes, customer relationship management, pricing strategies, and revenue optimization	You are a Sales Operations expert with comprehensive knowledge of sales processes, customer lifecycle management, and revenue optimization strategies. You help users maximize sales performance, improve customer relationships, and streamline sales operations from lead generation to order fulfillment.	["Lead Management", "Opportunity Tracking", "Quote Generation", "Order Processing", "Customer Relationship Management", "Sales Analytics", "Pricing Strategies", "Sales Forecasting", "Territory Management", "Commission Management"]	["Sales Process Optimization", "Lead Qualification", "Revenue Analysis", "Customer Segmentation", "Sales Performance Metrics", "Pipeline Management", "Pricing Strategy", "Sales Forecasting"]	t	2025-06-04 04:34:02.73724+00	2025-06-04 04:34:02.73724+00
3	inventory	Inventory Management	Inventory Control Specialist	Expert in stock management, warehouse operations, material movements, and inventory optimization	You are an Inventory Management specialist with deep knowledge of stock control, warehouse operations, and supply chain optimization. You help users maintain optimal inventory levels, reduce carrying costs, and ensure material availability for production and sales.	["Stock Management", "Warehouse Operations", "Material Movements", "Inventory Valuation", "ABC Analysis", "Cycle Counting", "Safety Stock Planning", "Demand Forecasting", "Supplier Management", "Inventory Optimization"]	["Stock Level Analysis", "Inventory Turnover Optimization", "Demand Planning", "Warehouse Layout Design", "Material Flow Analysis", "Cost Reduction Strategies", "Supply Chain Optimization", "Inventory Reporting"]	t	2025-06-04 04:34:14.229792+00	2025-06-04 04:34:14.229792+00
4	purchase	Purchase Management	Procurement Specialist	Expert in procurement processes, vendor management, sourcing strategies, and purchase optimization	You are a Procurement specialist with extensive experience in strategic sourcing, vendor management, and purchase process optimization. You help users achieve cost savings, ensure supply security, and maintain high-quality supplier relationships.	["Strategic Sourcing", "Vendor Management", "Purchase Requisitions", "Purchase Orders", "Contract Management", "Supplier Evaluation", "Cost Analysis", "Procurement Analytics", "Risk Management", "Compliance"]	["Sourcing Strategy Development", "Vendor Performance Analysis", "Cost Optimization", "Contract Negotiation Support", "Supplier Risk Assessment", "Procurement Process Improvement", "Spend Analysis", "Market Research"]	t	2025-06-04 04:34:14.229792+00	2025-06-04 04:34:14.229792+00
5	production	Production Management	Manufacturing Operations Expert	Specialist in production planning, manufacturing execution, quality control, and operational efficiency	You are a Manufacturing Operations expert with comprehensive knowledge of production planning, shop floor management, and manufacturing excellence. You help users optimize production processes, improve quality, and maximize operational efficiency.	["Production Planning", "Manufacturing Execution", "Quality Control", "Capacity Planning", "Bill of Materials", "Work Center Management", "Shop Floor Control", "Lean Manufacturing", "Equipment Maintenance", "Performance Monitoring"]	["Production Schedule Optimization", "Capacity Analysis", "Quality Improvement", "Process Optimization", "Equipment Efficiency", "Bottleneck Analysis", "Cost Reduction", "Performance Metrics"]	t	2025-06-04 04:34:14.229792+00	2025-06-04 04:34:14.229792+00
6	finance	Finance Management	Financial Operations Expert	Expert in financial accounting, treasury management, accounts payable/receivable, and financial reporting	You are a Financial Operations expert with deep knowledge of accounting principles, financial processes, and regulatory compliance. You help users manage financial transactions, optimize cash flow, and ensure accurate financial reporting.	["General Ledger", "Accounts Payable", "Accounts Receivable", "Asset Accounting", "Bank Management", "Financial Reporting", "Tax Management", "Compliance", "Cash Flow Management", "Financial Analysis"]	["Financial Process Optimization", "Cash Flow Analysis", "Financial Reporting", "Compliance Monitoring", "Risk Assessment", "Budget Analysis", "Financial Performance Metrics", "Audit Support"]	t	2025-06-04 04:34:23.866021+00	2025-06-04 04:34:23.866021+00
7	controlling	Controlling	Management Accounting Specialist	Specialist in cost accounting, profitability analysis, budgeting, and management reporting	You are a Management Accounting specialist with expertise in cost control, profitability analysis, and performance management. You help users understand cost structures, analyze profitability, and make data-driven business decisions.	["Cost Center Accounting", "Profit Center Accounting", "Product Costing", "Profitability Analysis", "Budget Planning", "Variance Analysis", "Activity-Based Costing", "Performance Management", "Management Reporting", "Business Intelligence"]	["Cost Analysis", "Profitability Assessment", "Budget Planning", "Variance Analysis", "Performance Monitoring", "Cost Optimization", "Management Reporting", "Business Intelligence"]	t	2025-06-04 04:34:23.866021+00	2025-06-04 04:34:23.866021+00
\.


--
-- Data for Name: ai_agent_health; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ai_agent_health (id, check_timestamp, openai_status, api_key_status, total_agents, active_agents, response_time, error_details) FROM stdin;
\.


--
-- Data for Name: ai_chat_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ai_chat_messages (id, session_id, message_type, content, agent_name, context_data, api_response_time, tokens_used, created_at) FROM stdin;
\.


--
-- Data for Name: ai_chat_sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ai_chat_sessions (id, session_id, module_type, user_id, user_role, context_data, session_start, session_end, is_active) FROM stdin;
\.


--
-- Data for Name: ai_data_analysis_sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ai_data_analysis_sessions (id, session_id, module_type, analysis_type, input_data, analysis_result, insights, recommendations, user_id, processing_time, status, created_at, completed_at) FROM stdin;
\.


--
-- Data for Name: api_keys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.api_keys (id, service_name, key_name, key_value, description, is_active, created_at, updated_at, last_used) FROM stdin;
1	openai	OPENAI_API_KEY	c2stcHJvai0ybVVsOVJleFQ4Z3B2TXAtSkJLMXI3RTlhR0xyd050RXk1Wk41V3YwYWNPX1h0eURfY3B4WU1rWWwzUFh3Y3MybmwxQ0hFYnRuMFQzQmxia0ZKQUM1QWV1OFZjXzFHb3R5bEh3aHY0TjBfTXMyLTc2ZHFtMVV5T3BHSFh1d1RWdVVZS0F4Y2lEcGljb0d0RDlnZGJ4TEtDV25Gc0E=	OpenAI API key for AI agent functionality	t	2025-06-04 13:29:59.56228+00	2025-06-04 13:34:44.013221+00	\N
\.


--
-- Data for Name: approval_levels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.approval_levels (id, level, name, description, value_limit, created_at, updated_at) FROM stdin;
1	1	Team Lead	First level approval - up to $5,000	5000.00	2025-05-20 22:09:21.912924	2025-05-20 22:09:21.912924
2	2	Department Manager	Second level approval - up to $25,000	25000.00	2025-05-20 22:09:21.912924	2025-05-20 22:09:21.912924
3	3	Director	Third level approval - up to $100,000	100000.00	2025-05-20 22:09:21.912924	2025-05-20 22:09:21.912924
4	4	VP	Fourth level approval - up to $500,000	500000.00	2025-05-20 22:09:21.912924	2025-05-20 22:09:21.912924
5	5	CFO	Fifth level approval - unlimited	\N	2025-05-20 22:09:21.912924	2025-05-20 22:09:21.912924
6	1	Solutions		500.00	2025-05-21 01:42:12.929446	2025-05-21 01:42:12.929446
7	1	Team Lead Approval	First level approval for small purchases	1000.00	2025-05-21 15:12:43.075801	2025-05-21 15:12:43.075801
8	2	Manager Approval	Second level approval for medium purchases	10000.00	2025-05-21 15:12:43.075801	2025-05-21 15:12:43.075801
9	3	Director Approval	Third level approval for large purchases	50000.00	2025-05-21 15:12:43.075801	2025-05-21 15:12:43.075801
10	4	Executive Approval	Fourth level approval for very large purchases	250000.00	2025-05-21 15:12:43.075801	2025-05-21 15:12:43.075801
11	5	Board Approval	Highest level approval for major expenditures	1000000.00	2025-05-21 15:12:43.075801	2025-05-21 15:12:43.075801
\.


--
-- Data for Name: asset_master; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.asset_master (id, asset_number, name, description, asset_class, acquisition_date, acquisition_cost, current_value, depreciation_method, useful_life_years, company_code_id, cost_center_id, location, status, is_active, created_at, updated_at) FROM stdin;
1	A10001	CNC Machine - Haas VF-2	Vertical machining center	MACHINERY	2019-03-15	85000.00	65000.00	STRAIGHT_LINE	10	1	\N	Plant NY - Building A	ACTIVE	t	2025-05-20 22:11:02.428858	2025-05-20 22:11:02.428858
2	A10002	Forklift - Toyota 8FGCU25	Material handling equipment	EQUIPMENT	2019-05-01	28000.00	21000.00	STRAIGHT_LINE	7	1	\N	Plant NY - Warehouse	ACTIVE	t	2025-05-20 22:11:02.428858	2025-05-20 22:11:02.428858
3	A10003	Injection Molding Machine - Engel	Plastic injection molding	MACHINERY	2019-08-15	120000.00	96000.00	STRAIGHT_LINE	12	1	\N	Plant NY - Building B	ACTIVE	t	2025-05-20 22:11:02.428858	2025-05-20 22:11:02.428858
4	A10004	Server System - Dell PowerEdge	Data center servers	IT_EQUIPMENT	2020-01-10	45000.00	27000.00	ACCELERATED	5	1	\N	NY Headquarters - Server Room	ACTIVE	t	2025-05-20 22:11:02.428858	2025-05-20 22:11:02.428858
5	A10005	Office Building - NY HQ	Main office building	REAL_ESTATE	2015-11-30	3500000.00	3200000.00	STRAIGHT_LINE	40	1	\N	Manhattan, NY	ACTIVE	t	2025-05-20 22:11:02.428858	2025-05-20 22:11:02.428858
6	CN01-AST001	Production Machinery #1	Heavy-duty manufacturing equipment for main production line	MACHINERY	2022-05-15	125000.00	110000.00	STRAIGHT_LINE	10	10	9	Main Factory Floor	ACTIVE	t	2025-05-21 15:11:52.062215	2025-05-21 15:11:52.062215
7	DE01-AST001	Production Machinery #1	Heavy-duty manufacturing equipment for main production line	MACHINERY	2022-05-15	125000.00	110000.00	STRAIGHT_LINE	10	9	5	Main Factory Floor	ACTIVE	t	2025-05-21 15:11:52.062215	2025-05-21 15:11:52.062215
8	IN01-AST001	Production Machinery #1	Heavy-duty manufacturing equipment for main production line	MACHINERY	2022-05-15	125000.00	110000.00	STRAIGHT_LINE	10	6	14	Main Factory Floor	ACTIVE	t	2025-05-21 15:11:52.062215	2025-05-21 15:11:52.062215
9	GA01-AST001	Production Machinery #1	Heavy-duty manufacturing equipment for main production line	MACHINERY	2022-05-15	125000.00	110000.00	STRAIGHT_LINE	10	7	15	Main Factory Floor	ACTIVE	t	2025-05-21 15:11:52.062215	2025-05-21 15:11:52.062215
10	UK01-AST001	Production Machinery #1	Heavy-duty manufacturing equipment for main production line	MACHINERY	2022-05-15	125000.00	110000.00	STRAIGHT_LINE	10	11	6	Main Factory Floor	ACTIVE	t	2025-05-21 15:11:52.062215	2025-05-21 15:11:52.062215
11	TEST02-AST002	Company Vehicle #1	Executive transportation vehicle	VEHICLES	2021-10-01	45000.00	33750.00	DECLINING_BALANCE	5	4	8	Corporate Garage	ACTIVE	t	2025-05-21 15:12:00.81308	2025-05-21 15:12:00.81308
12	DE01-AST002	Company Vehicle #1	Executive transportation vehicle	VEHICLES	2021-10-01	45000.00	33750.00	DECLINING_BALANCE	5	9	5	Corporate Garage	ACTIVE	t	2025-05-21 15:12:00.81308	2025-05-21 15:12:00.81308
13	CA01-AST002	Company Vehicle #1	Executive transportation vehicle	VEHICLES	2021-10-01	45000.00	33750.00	DECLINING_BALANCE	5	5	13	Corporate Garage	ACTIVE	t	2025-05-21 15:12:00.81308	2025-05-21 15:12:00.81308
14	US01-AST002	Company Vehicle #1	Executive transportation vehicle	VEHICLES	2021-10-01	45000.00	33750.00	DECLINING_BALANCE	5	1	1	Corporate Garage	ACTIVE	t	2025-05-21 15:12:00.81308	2025-05-21 15:12:00.81308
15	EU01-AST002	Company Vehicle #1	Executive transportation vehicle	VEHICLES	2021-10-01	45000.00	33750.00	DECLINING_BALANCE	5	2	10	Corporate Garage	ACTIVE	t	2025-05-21 15:12:00.81308	2025-05-21 15:12:00.81308
\.


--
-- Data for Name: batch_master; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.batch_master (id, batch_number, material_id, plant_id, production_date, expiry_date, shelf_life_days, vendor_batch_number, quality_status, available_quantity, reserved_quantity, blocked_quantity, unit_of_measure, created_at) FROM stdin;
\.


--
-- Data for Name: bill_of_materials; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bill_of_materials (id, code, name, material_id, description, version, is_active, created_at, updated_at) FROM stdin;
1	BOM-FG-3001	BOM for Smart Thermostat	9	Bill of Materials for Smart Thermostat	1.0	t	2025-05-20 22:09:48.919983	2025-05-20 22:09:48.919983
2	BOM-FG-3002	BOM for Industrial Control Panel	10	Bill of Materials for Industrial Control Panel	1.0	t	2025-05-20 22:09:48.919983	2025-05-20 22:09:48.919983
3	BOM-FG-3003	BOM for LED Light Fixture	11	Bill of Materials for LED Light Fixture	1.0	t	2025-05-20 22:09:48.919983	2025-05-20 22:09:48.919983
4	BOM-PM-4001	BOM for Cardboard Box - Small	14	Bill of materials for manufacturing Cardboard Box - Small	1.0	t	2025-05-21 15:13:02.975118	2025-05-21 15:13:02.975118
5	BOM-FG-3004	BOM for Wireless Router	12	Bill of materials for manufacturing Wireless Router	1.0	t	2025-05-21 15:13:02.975118	2025-05-21 15:13:02.975118
6	BOM-SF-2003	BOM for Injection Molded Housing	8	Bill of materials for manufacturing Injection Molded Housing	1.0	t	2025-05-21 15:13:02.975118	2025-05-21 15:13:02.975118
7	BOM-FG-3005	BOM for Electric Motor	13	Bill of materials for manufacturing Electric Motor	1.0	t	2025-05-21 15:13:02.975118	2025-05-21 15:13:02.975118
8	BOM-SF-2001	BOM for Aluminum Frame	6	Bill of materials for manufacturing Aluminum Frame	1.0	t	2025-05-21 15:13:02.975118	2025-05-21 15:13:02.975118
\.


--
-- Data for Name: bom_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bom_items (id, bom_id, material_id, quantity, unit_cost, is_active, created_at, updated_at) FROM stdin;
1	1	1	5.850	24.95	t	2025-05-20 22:09:48.919983	2025-05-20 22:09:48.919983
2	2	1	13.890	12.59	t	2025-05-20 22:09:48.919983	2025-05-20 22:09:48.919983
3	3	1	10.720	12.07	t	2025-05-20 22:09:48.919983	2025-05-20 22:09:48.919983
4	1	2	11.780	38.61	t	2025-05-20 22:09:48.919983	2025-05-20 22:09:48.919983
5	2	2	14.810	58.75	t	2025-05-20 22:09:48.919983	2025-05-20 22:09:48.919983
6	3	2	5.700	36.81	t	2025-05-20 22:09:48.919983	2025-05-20 22:09:48.919983
7	1	3	11.460	12.73	t	2025-05-20 22:09:48.919983	2025-05-20 22:09:48.919983
8	2	3	5.100	36.66	t	2025-05-20 22:09:48.919983	2025-05-20 22:09:48.919983
9	1	4	3.500	12.50	t	2025-05-21 15:13:22.453554	2025-05-21 15:13:22.453554
10	1	5	3.500	12.50	t	2025-05-21 15:13:22.453554	2025-05-21 15:13:22.453554
11	1	6	3.500	12.50	t	2025-05-21 15:13:22.453554	2025-05-21 15:13:22.453554
12	1	7	3.500	12.50	t	2025-05-21 15:13:22.453554	2025-05-21 15:13:22.453554
13	1	8	3.500	12.50	t	2025-05-21 15:13:22.453554	2025-05-21 15:13:22.453554
14	1	10	3.500	12.50	t	2025-05-21 15:13:22.453554	2025-05-21 15:13:22.453554
15	1	11	3.500	12.50	t	2025-05-21 15:13:22.453554	2025-05-21 15:13:22.453554
16	1	12	3.500	12.50	t	2025-05-21 15:13:22.453554	2025-05-21 15:13:22.453554
17	1	13	3.500	12.50	t	2025-05-21 15:13:22.453554	2025-05-21 15:13:22.453554
18	1	14	3.500	12.50	t	2025-05-21 15:13:22.453554	2025-05-21 15:13:22.453554
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories (id, name, description, user_id, created_at, updated_at) FROM stdin;
1	General	General category for materials	\N	2025-05-20 14:35:23.847433	2025-05-20 14:35:23.847433
\.


--
-- Data for Name: chart_of_accounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.chart_of_accounts (id, code, name, description, account_type, account_subtype, account_group, balance_sheet_category, income_statement_category, debit_credit, is_balance_sheet, is_income_statement, is_cash_flow, is_tax_relevant, is_control_account, is_reconciliation_required, is_active, company_code_id, parent_account_id, created_at, updated_at, created_by, updated_by, version, notes) FROM stdin;
1	10000	ASSETS	Parent account for all assets	asset	\N	Assets	Assets	\N	debit	t	f	f	f	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
2	10100	Cash and Cash Equivalents	Liquid assets	asset	current_asset	Cash	Current Assets	\N	debit	t	f	t	f	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
3	10101	Cash on Hand	Physical cash	asset	current_asset	Cash	Current Assets	\N	debit	t	f	t	f	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
4	10102	Bank Account - Operations	Main operating account	asset	current_asset	Cash	Current Assets	\N	debit	t	f	t	f	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
5	10200	Accounts Receivable	Amounts owed by customers	asset	current_asset	Receivables	Current Assets	\N	debit	t	f	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
6	10300	Inventory	Inventory control account	asset	current_asset	Inventory	Current Assets	\N	debit	t	f	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
7	10301	Raw Materials Inventory	Raw materials in stock	asset	current_asset	Inventory	Current Assets	\N	debit	t	f	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
8	10302	Work in Process Inventory	Partially completed goods	asset	current_asset	Inventory	Current Assets	\N	debit	t	f	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
9	10303	Finished Goods Inventory	Completed products ready for sale	asset	current_asset	Inventory	Current Assets	\N	debit	t	f	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
10	10400	Fixed Assets	Long-term tangible assets	asset	non_current_asset	Fixed Assets	Non-Current Assets	\N	debit	t	f	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
11	10401	Machinery and Equipment	Production equipment	asset	non_current_asset	Fixed Assets	Non-Current Assets	\N	debit	t	f	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
12	10402	Buildings	Company-owned buildings	asset	non_current_asset	Fixed Assets	Non-Current Assets	\N	debit	t	f	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
13	10403	Accumulated Depreciation	Accumulated depreciation of fixed assets	asset	non_current_asset	Fixed Assets	Non-Current Assets	\N	credit	t	f	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
14	20000	LIABILITIES	Parent account for all liabilities	liability	\N	Liabilities	Liabilities	\N	credit	t	f	f	f	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
15	20100	Accounts Payable	Amounts owed to suppliers	liability	current_liability	Payables	Current Liabilities	\N	credit	t	f	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
16	20200	Accrued Expenses	Expenses incurred but not yet paid	liability	current_liability	Accruals	Current Liabilities	\N	credit	t	f	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
17	20300	Short-term Loans	Loans due within one year	liability	current_liability	Loans	Current Liabilities	\N	credit	t	f	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
18	20400	Long-term Loans	Loans due beyond one year	liability	non_current_liability	Loans	Non-Current Liabilities	\N	credit	t	f	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
19	20500	Deferred Revenue	Payments received for goods/services not yet provided	liability	current_liability	Deferred	Current Liabilities	\N	credit	t	f	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
20	30000	EQUITY	Parent account for all equity	equity	\N	Equity	Equity	\N	credit	t	f	f	f	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
21	30100	Share Capital	Capital from shareholders	equity	owner_equity	Capital	Equity	\N	credit	t	f	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
22	30200	Retained Earnings	Accumulated earnings	equity	retained_earnings	Earnings	Equity	\N	credit	t	f	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
23	30300	Current Year Earnings	Current year profit/loss	equity	retained_earnings	Earnings	Equity	\N	credit	t	f	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
24	40000	REVENUE	Parent account for all revenue	revenue	\N	Revenue	\N	Revenue	credit	f	t	f	f	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
25	40100	Sales Revenue - Products	Revenue from product sales	revenue	operating_revenue	Sales	\N	Operating Revenue	credit	f	t	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
26	40200	Sales Revenue - Services	Revenue from service delivery	revenue	operating_revenue	Sales	\N	Operating Revenue	credit	f	t	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
27	40300	Other Revenue	Miscellaneous revenue sources	revenue	other_revenue	Other	\N	Other Revenue	credit	f	t	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
28	50000	EXPENSES	Parent account for all expenses	expense	\N	Expenses	\N	Expenses	debit	f	t	f	f	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
29	50100	Cost of Goods Sold	Direct costs of products sold	expense	operating_expense	COGS	\N	Cost of Sales	debit	f	t	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
30	50101	Raw Materials Consumed	Cost of raw materials used in production	expense	operating_expense	COGS	\N	Cost of Sales	debit	f	t	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
31	50102	Direct Labor	Cost of direct production labor	expense	operating_expense	COGS	\N	Cost of Sales	debit	f	t	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
32	50103	Manufacturing Overhead	Indirect production costs	expense	operating_expense	COGS	\N	Cost of Sales	debit	f	t	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
33	50200	Selling Expenses	Costs related to sales activities	expense	operating_expense	Selling	\N	Operating Expenses	debit	f	t	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
34	50300	Administrative Expenses	General business operation costs	expense	operating_expense	Admin	\N	Operating Expenses	debit	f	t	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
35	50400	Research and Development	R&D expenses	expense	operating_expense	R&D	\N	Operating Expenses	debit	f	t	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
36	50500	Finance Costs	Interest and other financial expenses	expense	other_expense	Finance	\N	Other Expenses	debit	f	t	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
37	50600	Depreciation Expense	Depreciation of fixed assets	expense	operating_expense	Depreciation	\N	Operating Expenses	debit	f	t	f	t	f	f	t	2	\N	2025-05-17 15:12:41.573183	2025-05-17 15:12:41.573183	\N	\N	1	\N
39	US-GAAP	US Generally Accepted Accounting Principles	Standard US GAAP Chart of Accounts for manufacturing companies	CHART	\N	STANDARD	\N	\N	\N	f	f	f	f	f	f	t	1	\N	2025-06-04 02:37:30.635647	2025-06-04 02:37:30.635647	\N	\N	1	\N
40	IFRS-STD	International Financial Reporting Standards	IFRS compliant chart of accounts for international operations	CHART	\N	INTERNATIONAL	\N	\N	\N	f	f	f	f	f	f	t	1	\N	2025-06-04 02:37:30.635647	2025-06-04 02:37:30.635647	\N	\N	1	\N
41	MFG-COA	Manufacturing Company Chart of Accounts	Specialized chart of accounts for manufacturing operations	CHART	\N	MANUFACTURING	\N	\N	\N	f	f	f	f	f	f	t	1	\N	2025-06-04 02:37:30.635647	2025-06-04 02:37:30.635647	\N	\N	1	\N
\.


--
-- Data for Name: company_code_chart_assignments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.company_code_chart_assignments (id, company_code_id, chart_of_accounts_id, fiscal_year_variant_id, assigned_date, is_active, created_at) FROM stdin;
1	1	39	1	2025-06-04 02:39:58.298261	t	2025-06-04 02:39:58.298261
\.


--
-- Data for Name: company_codes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.company_codes (id, code, name, description, currency, country, tax_id, fiscal_year, address, city, state, postal_code, phone, email, website, logo_url, is_active, created_at, created_by, updated_at, updated_by, version, notes) FROM stdin;
1	US01	ACME Corporation USA	\N	USD	United States	\N	Calendar Year (Jan-Dec)	\N	\N	\N	\N	\N	\N	\N	\N	t	2025-05-17 13:43:44.835584	\N	2025-05-17 13:43:44.835584	\N	1	\N
2	EU01	ACME Europe GmbH	\N	EUR	Germany	\N	Calendar Year (Jan-Dec)	\N	\N	\N	\N	\N	\N	\N	\N	t	2025-05-17 13:43:44.835584	\N	2025-05-17 13:43:44.835584	\N	1	\N
4	TEST02	Test Company 2	\N	USD	United States	\N	Calendar Year (Jan-Dec)	\N	\N	\N	\N	\N	\N	https://example.com	\N	t	2025-05-18 00:40:52.466	\N	2025-05-18 00:40:52.466	\N	1	\N
5	CA01	CMIS Association	CMIS Canada	CAD	Canada		Calendar Year (Jan-Dec)						\N	\N	\N	t	2025-05-18 01:05:01.453	\N	2025-05-18 01:05:01.453	\N	1	\N
7	GA01	Germany		EUR	Germany		Calendar Year (Jan-Dec)						\N	\N	\N	t	2025-05-19 21:59:41.861	\N	2025-05-19 22:00:29.936	\N	1	\N
6	IN01	India Company Code	India Company Code	INR	United States		Calendar Year (Jan-Dec)	Gandhi Road	Bangalore				\N	\N	\N	t	2025-05-19 21:48:54.52	\N	2025-05-19 22:31:18.93	\N	1	\N
3	TEST01	Mexico Company		MXN	Mexico		Calendar Year (Jan-Dec)						\N	\N	\N	t	2025-05-18 00:35:00.714	\N	2025-05-19 22:50:46.093	\N	1	\N
9	DE01	Germany Operations	European manufacturing hub	EUR	Germany	\N	2025	\N	\N	\N	\N	\N	\N	\N	\N	t	2025-05-20 03:55:35.337909	\N	2025-05-20 03:55:35.337909	\N	1	\N
10	CN01	China Operations	Asian production facility	CNY	China	\N	2025	\N	\N	\N	\N	\N	\N	\N	\N	t	2025-05-20 03:55:35.337909	\N	2025-05-20 03:55:35.337909	\N	1	\N
11	UK01	United Kingdom Branch	UK sales and distribution	GBP	United Kingdom	\N	2025	\N	\N	\N	\N	\N	\N	\N	\N	t	2025-05-20 03:55:35.337909	\N	2025-05-20 03:55:35.337909	\N	1	\N
\.


--
-- Data for Name: copa_actuals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.copa_actuals (id, operating_concern, fiscal_year, period, record_type, customer, material, product_group, customer_group, sales_organization, distribution_channel, division, region, country, profit_center, value_field, amount, quantity, currency, unit_of_measure, posting_date, document_number, created_at, customer_id, material_id, profit_center_id, sales_org_id, company_code_id, currency_id) FROM stdin;
\.


--
-- Data for Name: cost_allocations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cost_allocations (id, allocation_id, allocation_type, sender_object_type, sender_object, receiver_object_type, receiver_object, fiscal_year, period, allocation_base, percentage, amount, currency, posting_date, created_at) FROM stdin;
\.


--
-- Data for Name: cost_center_actuals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cost_center_actuals (id, cost_center, fiscal_year, period, account, activity_type, actual_amount, actual_quantity, currency, unit_of_measure, posting_date, document_number, reference, created_at, cost_center_id, company_code_id, currency_id) FROM stdin;
73	CC001	2025	6	400000	\N	15458.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.655769	\N	\N	\N
74	CC001	2025	6	410000	\N	6496.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.655769	\N	\N	\N
75	CC001	2025	6	420000	\N	4239.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.655769	\N	\N	\N
76	CC002	2025	6	400000	\N	12745.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.681496	\N	\N	\N
77	CC002	2025	6	410000	\N	5217.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.681496	\N	\N	\N
78	CC002	2025	6	420000	\N	4493.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.681496	\N	\N	\N
79	CC003	2025	6	400000	\N	12433.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.700578	\N	\N	\N
80	CC003	2025	6	410000	\N	5814.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.700578	\N	\N	\N
81	CC003	2025	6	420000	\N	4665.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.700578	\N	\N	\N
82	CC101	2025	6	400000	\N	12661.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.719733	\N	\N	\N
83	CC101	2025	6	410000	\N	5950.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.719733	\N	\N	\N
84	CC101	2025	6	420000	\N	3854.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.719733	\N	\N	\N
85	CC102	2025	6	400000	\N	11254.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.738956	\N	\N	\N
86	CC102	2025	6	410000	\N	5562.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.738956	\N	\N	\N
87	CC102	2025	6	420000	\N	4225.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.738956	\N	\N	\N
88	CC103	2025	6	400000	\N	12331.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.757979	\N	\N	\N
89	CC103	2025	6	410000	\N	5990.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.757979	\N	\N	\N
90	CC103	2025	6	420000	\N	3248.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.757979	\N	\N	\N
91	CC201	2025	6	400000	\N	13570.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.776904	\N	\N	\N
92	CC201	2025	6	410000	\N	5203.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.776904	\N	\N	\N
93	CC201	2025	6	420000	\N	3285.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.776904	\N	\N	\N
94	CC202	2025	6	400000	\N	13551.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.796299	\N	\N	\N
95	CC202	2025	6	410000	\N	6018.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.796299	\N	\N	\N
96	CC202	2025	6	420000	\N	4622.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.796299	\N	\N	\N
97	CC203	2025	6	400000	\N	13779.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.815951	\N	\N	\N
98	CC203	2025	6	410000	\N	5969.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.815951	\N	\N	\N
99	CC203	2025	6	420000	\N	4124.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.815951	\N	\N	\N
100	PROD001	2025	6	400000	\N	14128.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.834899	\N	\N	\N
101	PROD001	2025	6	410000	\N	6719.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.834899	\N	\N	\N
102	PROD001	2025	6	420000	\N	4275.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.834899	\N	\N	\N
103	PROD002	2025	6	400000	\N	11436.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.854024	\N	\N	\N
104	PROD002	2025	6	410000	\N	4838.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.854024	\N	\N	\N
105	PROD002	2025	6	420000	\N	3207.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.854024	\N	\N	\N
106	QC001	2025	6	400000	\N	17617.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.87299	\N	\N	\N
107	QC001	2025	6	410000	\N	5227.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.87299	\N	\N	\N
108	QC001	2025	6	420000	\N	4378.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.87299	\N	\N	\N
109	MAINT001	2025	6	400000	\N	14777.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.892291	\N	\N	\N
110	MAINT001	2025	6	410000	\N	4942.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.892291	\N	\N	\N
111	MAINT001	2025	6	420000	\N	4167.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.892291	\N	\N	\N
112	ADMIN001	2025	6	400000	\N	16667.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.911419	\N	\N	\N
113	ADMIN001	2025	6	410000	\N	5882.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.911419	\N	\N	\N
114	ADMIN001	2025	6	420000	\N	3381.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.911419	\N	\N	\N
115	SALES001	2025	6	400000	\N	11242.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.930376	\N	\N	\N
116	SALES001	2025	6	410000	\N	4897.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.930376	\N	\N	\N
117	SALES001	2025	6	420000	\N	4373.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.930376	\N	\N	\N
118	MKTG001	2025	6	400000	\N	14653.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.949313	\N	\N	\N
119	MKTG001	2025	6	410000	\N	5983.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.949313	\N	\N	\N
120	MKTG001	2025	6	420000	\N	4271.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.949313	\N	\N	\N
121	HR001	2025	6	400000	\N	16021.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.968249	\N	\N	\N
122	HR001	2025	6	410000	\N	6506.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.968249	\N	\N	\N
123	HR001	2025	6	420000	\N	4061.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.968249	\N	\N	\N
124	IT001	2025	6	400000	\N	12825.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.98889	\N	\N	\N
125	IT001	2025	6	410000	\N	4983.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.98889	\N	\N	\N
126	IT001	2025	6	420000	\N	3086.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:46.98889	\N	\N	\N
127	WHSE001	2025	6	400000	\N	12759.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:47.007928	\N	\N	\N
128	WHSE001	2025	6	410000	\N	5878.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:47.007928	\N	\N	\N
129	WHSE001	2025	6	420000	\N	3668.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:47.007928	\N	\N	\N
130	PURCH001	2025	6	400000	\N	12884.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:47.027	\N	\N	\N
131	PURCH001	2025	6	410000	\N	6815.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:47.027	\N	\N	\N
132	PURCH001	2025	6	420000	\N	3939.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:47.027	\N	\N	\N
133	FIN001	2025	6	400000	\N	16354.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:47.046322	\N	\N	\N
134	FIN001	2025	6	410000	\N	6939.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:47.046322	\N	\N	\N
135	FIN001	2025	6	420000	\N	4041.00	0.000	USD	\N	2025-06-01	\N	\N	2025-06-04 03:47:47.046322	\N	\N	\N
\.


--
-- Data for Name: cost_center_planning; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cost_center_planning (id, cost_center, fiscal_year, period, version, account, activity_type, planned_amount, planned_quantity, currency, unit_of_measure, created_by, created_at) FROM stdin;
76	CC001	2025	6	000	400000	\N	17842.00	0.000	USD	\N	\N	2025-06-04 03:47:46.209456
77	CC001	2025	6	000	410000	\N	5563.00	0.000	USD	\N	\N	2025-06-04 03:47:46.209456
78	CC001	2025	6	000	420000	\N	4055.00	0.000	USD	\N	\N	2025-06-04 03:47:46.209456
79	CC002	2025	6	000	400000	\N	18925.00	0.000	USD	\N	\N	2025-06-04 03:47:46.230534
80	CC002	2025	6	000	410000	\N	5017.00	0.000	USD	\N	\N	2025-06-04 03:47:46.230534
81	CC002	2025	6	000	420000	\N	3302.00	0.000	USD	\N	\N	2025-06-04 03:47:46.230534
82	CC003	2025	6	000	400000	\N	18392.00	0.000	USD	\N	\N	2025-06-04 03:47:46.249348
83	CC003	2025	6	000	410000	\N	6902.00	0.000	USD	\N	\N	2025-06-04 03:47:46.249348
84	CC003	2025	6	000	420000	\N	3241.00	0.000	USD	\N	\N	2025-06-04 03:47:46.249348
85	CC101	2025	6	000	400000	\N	14712.00	0.000	USD	\N	\N	2025-06-04 03:47:46.268569
86	CC101	2025	6	000	410000	\N	5501.00	0.000	USD	\N	\N	2025-06-04 03:47:46.268569
87	CC101	2025	6	000	420000	\N	3737.00	0.000	USD	\N	\N	2025-06-04 03:47:46.268569
88	CC102	2025	6	000	400000	\N	13910.00	0.000	USD	\N	\N	2025-06-04 03:47:46.288525
89	CC102	2025	6	000	410000	\N	5501.00	0.000	USD	\N	\N	2025-06-04 03:47:46.288525
90	CC102	2025	6	000	420000	\N	3805.00	0.000	USD	\N	\N	2025-06-04 03:47:46.288525
91	CC103	2025	6	000	400000	\N	12115.00	0.000	USD	\N	\N	2025-06-04 03:47:46.307972
92	CC103	2025	6	000	410000	\N	5136.00	0.000	USD	\N	\N	2025-06-04 03:47:46.307972
93	CC103	2025	6	000	420000	\N	4658.00	0.000	USD	\N	\N	2025-06-04 03:47:46.307972
94	CC201	2025	6	000	400000	\N	15398.00	0.000	USD	\N	\N	2025-06-04 03:47:46.328525
95	CC201	2025	6	000	410000	\N	7382.00	0.000	USD	\N	\N	2025-06-04 03:47:46.328525
96	CC201	2025	6	000	420000	\N	4363.00	0.000	USD	\N	\N	2025-06-04 03:47:46.328525
97	CC202	2025	6	000	400000	\N	14957.00	0.000	USD	\N	\N	2025-06-04 03:47:46.351233
98	CC202	2025	6	000	410000	\N	5501.00	0.000	USD	\N	\N	2025-06-04 03:47:46.351233
99	CC202	2025	6	000	420000	\N	3547.00	0.000	USD	\N	\N	2025-06-04 03:47:46.351233
100	CC203	2025	6	000	400000	\N	18233.00	0.000	USD	\N	\N	2025-06-04 03:47:46.370862
101	CC203	2025	6	000	410000	\N	7605.00	0.000	USD	\N	\N	2025-06-04 03:47:46.370862
102	CC203	2025	6	000	420000	\N	4669.00	0.000	USD	\N	\N	2025-06-04 03:47:46.370862
103	PROD001	2025	6	000	400000	\N	13597.00	0.000	USD	\N	\N	2025-06-04 03:47:46.389604
104	PROD001	2025	6	000	410000	\N	5406.00	0.000	USD	\N	\N	2025-06-04 03:47:46.389604
105	PROD001	2025	6	000	420000	\N	4078.00	0.000	USD	\N	\N	2025-06-04 03:47:46.389604
106	PROD002	2025	6	000	400000	\N	15111.00	0.000	USD	\N	\N	2025-06-04 03:47:46.40845
107	PROD002	2025	6	000	410000	\N	6545.00	0.000	USD	\N	\N	2025-06-04 03:47:46.40845
108	PROD002	2025	6	000	420000	\N	4268.00	0.000	USD	\N	\N	2025-06-04 03:47:46.40845
109	QC001	2025	6	000	400000	\N	18547.00	0.000	USD	\N	\N	2025-06-04 03:47:46.427524
110	QC001	2025	6	000	410000	\N	7379.00	0.000	USD	\N	\N	2025-06-04 03:47:46.427524
111	QC001	2025	6	000	420000	\N	4779.00	0.000	USD	\N	\N	2025-06-04 03:47:46.427524
112	MAINT001	2025	6	000	400000	\N	14610.00	0.000	USD	\N	\N	2025-06-04 03:47:46.44636
113	MAINT001	2025	6	000	410000	\N	5918.00	0.000	USD	\N	\N	2025-06-04 03:47:46.44636
114	MAINT001	2025	6	000	420000	\N	4384.00	0.000	USD	\N	\N	2025-06-04 03:47:46.44636
115	ADMIN001	2025	6	000	400000	\N	14995.00	0.000	USD	\N	\N	2025-06-04 03:47:46.4653
116	ADMIN001	2025	6	000	410000	\N	5449.00	0.000	USD	\N	\N	2025-06-04 03:47:46.4653
117	ADMIN001	2025	6	000	420000	\N	3547.00	0.000	USD	\N	\N	2025-06-04 03:47:46.4653
118	SALES001	2025	6	000	400000	\N	15655.00	0.000	USD	\N	\N	2025-06-04 03:47:46.484297
119	SALES001	2025	6	000	410000	\N	5067.00	0.000	USD	\N	\N	2025-06-04 03:47:46.484297
120	SALES001	2025	6	000	420000	\N	3466.00	0.000	USD	\N	\N	2025-06-04 03:47:46.484297
121	MKTG001	2025	6	000	400000	\N	16753.00	0.000	USD	\N	\N	2025-06-04 03:47:46.503356
122	MKTG001	2025	6	000	410000	\N	5081.00	0.000	USD	\N	\N	2025-06-04 03:47:46.503356
123	MKTG001	2025	6	000	420000	\N	4975.00	0.000	USD	\N	\N	2025-06-04 03:47:46.503356
124	HR001	2025	6	000	400000	\N	17167.00	0.000	USD	\N	\N	2025-06-04 03:47:46.522386
125	HR001	2025	6	000	410000	\N	6228.00	0.000	USD	\N	\N	2025-06-04 03:47:46.522386
126	HR001	2025	6	000	420000	\N	3479.00	0.000	USD	\N	\N	2025-06-04 03:47:46.522386
127	IT001	2025	6	000	400000	\N	12315.00	0.000	USD	\N	\N	2025-06-04 03:47:46.542082
128	IT001	2025	6	000	410000	\N	6723.00	0.000	USD	\N	\N	2025-06-04 03:47:46.542082
129	IT001	2025	6	000	420000	\N	3600.00	0.000	USD	\N	\N	2025-06-04 03:47:46.542082
130	WHSE001	2025	6	000	400000	\N	17339.00	0.000	USD	\N	\N	2025-06-04 03:47:46.561664
131	WHSE001	2025	6	000	410000	\N	6535.00	0.000	USD	\N	\N	2025-06-04 03:47:46.561664
132	WHSE001	2025	6	000	420000	\N	4338.00	0.000	USD	\N	\N	2025-06-04 03:47:46.561664
133	PURCH001	2025	6	000	400000	\N	17253.00	0.000	USD	\N	\N	2025-06-04 03:47:46.580983
134	PURCH001	2025	6	000	410000	\N	6565.00	0.000	USD	\N	\N	2025-06-04 03:47:46.580983
135	PURCH001	2025	6	000	420000	\N	3441.00	0.000	USD	\N	\N	2025-06-04 03:47:46.580983
136	FIN001	2025	6	000	400000	\N	16024.00	0.000	USD	\N	\N	2025-06-04 03:47:46.60021
137	FIN001	2025	6	000	410000	\N	5831.00	0.000	USD	\N	\N	2025-06-04 03:47:46.60021
138	FIN001	2025	6	000	420000	\N	3808.00	0.000	USD	\N	\N	2025-06-04 03:47:46.60021
\.


--
-- Data for Name: cost_centers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cost_centers (id, cost_center, description, cost_center_category, company_code, controlling_area, hierarchy_area, responsible_person, valid_from, valid_to, created_at, updated_at, company_code_id, plant_id, responsible_person_id) FROM stdin;
1	CC001	Manufacturing Line 1	PRODUCTION	US01	US01	PRODUCTION	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	2025-06-03 17:58:50.654812	1	\N	\N
2	CC002	Manufacturing Line 2	PRODUCTION	US01	US01	PRODUCTION	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	2025-06-03 17:58:50.654812	1	\N	\N
3	CC003	Quality Control	PRODUCTION	US01	US01	PRODUCTION	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	2025-06-03 17:58:50.654812	1	\N	\N
4	CC101	Human Resources	ADMINISTRATIVE	US01	US01	ADMIN	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	2025-06-03 17:58:50.654812	1	\N	\N
5	CC102	IT Department	SERVICE	US01	US01	ADMIN	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	2025-06-03 17:58:50.654812	1	\N	\N
6	CC103	Finance Department	ADMINISTRATIVE	US01	US01	ADMIN	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	2025-06-03 17:58:50.654812	1	\N	\N
7	CC201	Sales North	SALES	US01	US01	SALES	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	2025-06-03 17:58:50.654812	1	\N	\N
8	CC202	Sales South	SALES	US01	US01	SALES	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	2025-06-03 17:58:50.654812	1	\N	\N
9	CC203	Sales International	SALES	US01	US01	SALES	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	2025-06-03 17:58:50.654812	1	\N	\N
11	PROD001	Production Line 1 - Manufacturing line for main products	PRODUCTION	US01	US01	\N	John Smith	2025-01-01	\N	2025-06-04 02:39:01.679531	2025-06-04 02:39:01.679531	1	\N	\N
12	PROD002	Production Line 2 - Secondary manufacturing line	PRODUCTION	US01	US01	\N	Jane Doe	2025-01-01	\N	2025-06-04 02:39:01.679531	2025-06-04 02:39:01.679531	1	\N	\N
13	QC001	Quality Control - Quality assurance and testing	QUALITY	US01	US01	\N	Mike Johnson	2025-01-01	\N	2025-06-04 02:39:01.679531	2025-06-04 02:39:01.679531	1	\N	\N
14	MAINT001	Maintenance - Equipment maintenance and repairs	MAINTENANCE	US01	US01	\N	Bob Wilson	2025-01-01	\N	2025-06-04 02:39:01.679531	2025-06-04 02:39:01.679531	1	\N	\N
15	ADMIN001	Administration - General administrative functions	ADMIN	US01	US01	\N	Sarah Davis	2025-01-01	\N	2025-06-04 02:39:01.679531	2025-06-04 02:39:01.679531	1	\N	\N
16	SALES001	Sales Department - Sales and customer relations	SALES	US01	US01	\N	Tom Brown	2025-01-01	\N	2025-06-04 02:39:01.679531	2025-06-04 02:39:01.679531	1	\N	\N
17	MKTG001	Marketing - Marketing and advertising	MARKETING	US01	US01	\N	Lisa Garcia	2025-01-01	\N	2025-06-04 02:39:01.679531	2025-06-04 02:39:01.679531	1	\N	\N
18	HR001	Human Resources - HR administration and payroll	HR	US01	US01	\N	David Miller	2025-01-01	\N	2025-06-04 02:39:01.679531	2025-06-04 02:39:01.679531	1	\N	\N
19	IT001	Information Technology - IT support and infrastructure	IT	US01	US01	\N	Chris Lee	2025-01-01	\N	2025-06-04 02:39:01.679531	2025-06-04 02:39:01.679531	1	\N	\N
20	WHSE001	Warehouse Operations - Inventory and logistics	WAREHOUSE	US01	US01	\N	Emily Chen	2025-01-01	\N	2025-06-04 02:39:01.679531	2025-06-04 02:39:01.679531	1	\N	\N
21	PURCH001	Purchasing Department - Procurement and vendor management	PURCHASING	US01	US01	\N	Mark Wilson	2025-01-01	\N	2025-06-04 02:39:01.679531	2025-06-04 02:39:01.679531	1	\N	\N
22	FIN001	Finance Department - Financial planning and accounting	FINANCE	US01	US01	\N	Jennifer Brown	2025-01-01	\N	2025-06-04 02:39:01.679531	2025-06-04 02:39:01.679531	1	\N	\N
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.countries (id, code, name, region_id, currency_code, language_code, is_active, created_at, updated_at) FROM stdin;
1	MX	Mexico	1	MXN	es-MX	t	2025-05-20 22:09:35.140169	2025-05-20 22:09:35.140169
2	CA	Canada	1	CAD	en-CA	t	2025-05-20 22:09:35.140169	2025-05-20 22:09:35.140169
3	US	United States	1	USD	en-US	t	2025-05-20 22:09:35.140169	2025-05-20 22:09:35.140169
4	AR	Argentina	2	ARS	es-AR	t	2025-05-20 22:09:35.140169	2025-05-20 22:09:35.140169
5	BR	Brazil	2	BRL	pt-BR	t	2025-05-20 22:09:35.140169	2025-05-20 22:09:35.140169
6	FR	France	3	EUR	fr-FR	t	2025-05-20 22:09:35.140169	2025-05-20 22:09:35.140169
7	DE	Germany	3	EUR	de-DE	t	2025-05-20 22:09:35.140169	2025-05-20 22:09:35.140169
8	GB	United Kingdom	3	GBP	en-GB	t	2025-05-20 22:09:35.140169	2025-05-20 22:09:35.140169
9	AU	Australia	4	AUD	en-AU	t	2025-05-20 22:09:35.140169	2025-05-20 22:09:35.140169
10	IN	India	4	INR	en-IN	t	2025-05-20 22:09:35.140169	2025-05-20 22:09:35.140169
11	CN	China	4	CNY	zh-CN	t	2025-05-20 22:09:35.140169	2025-05-20 22:09:35.140169
12	JP	Japan	4	JPY	ja-JP	t	2025-05-20 22:09:35.140169	2025-05-20 22:09:35.140169
\.


--
-- Data for Name: credit_control_areas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.credit_control_areas (id, code, name, description, company_code_id, credit_checking_group, credit_period, grace_percentage, blocking_reason, review_frequency, currency, credit_approver, status, is_active, notes, created_at, updated_at, created_by, updated_by) FROM stdin;
1	CC001	North America Credit	Credit control for North American customers	2	medium_risk	30	15	\N	monthly	USD	Michael Brown	active	t	\N	2025-05-17 14:59:22.779157	2025-05-17 14:59:22.779157	\N	\N
2	CC002	EMEA Credit	Credit control for European, Middle Eastern, and African customers	2	high_risk	45	10	\N	monthly	EUR	Emma Schmidt	active	t	\N	2025-05-17 14:59:22.779157	2025-05-17 14:59:22.779157	\N	\N
3	CC003	APAC Credit	Credit control for Asia-Pacific customers	2	low_risk	60	5	\N	monthly	USD	James Wong	active	t	\N	2025-05-17 14:59:22.779157	2025-05-17 14:59:22.779157	\N	\N
4	CC004	Strategic Customers	Strategic Customers - Credit control for VIP customers	1	VIP	60	15	\N	monthly	USD	\N	active	t	\N	2025-05-20 04:52:27.962894	2025-05-20 04:52:27.962894	\N	\N
5	CC005	UK Credit Management	UK Credit Management - Credit control for standard customers	11	standard	30	5	\N	monthly	GBP	\N	active	t	\N	2025-05-20 04:52:28.006898	2025-05-20 04:52:28.006898	\N	\N
\.


--
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.currencies (id, code, name, symbol, decimal_places, conversion_rate, base_currency, is_active, created_at, updated_at, notes) FROM stdin;
1	USD	US Dollar	$	2	1.0	t	t	2025-05-17 14:16:12.170855	2025-05-17 14:16:12.170855	\N
2	EUR	Euro	€	2	1.08	f	t	2025-05-17 14:16:12.170855	2025-05-17 14:16:12.170855	\N
3	GBP	British Pound	£	2	1.27	f	t	2025-05-17 14:16:12.170855	2025-05-17 14:16:12.170855	\N
4	JPY	Japanese Yen	¥	0	0.0067	f	t	2025-05-17 14:16:12.170855	2025-05-17 14:16:12.170855	\N
5	CNY	Chinese Yuan	¥	2	0.138	f	t	2025-05-17 14:16:12.170855	2025-05-17 14:16:12.170855	\N
\.


--
-- Data for Name: custom_reports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.custom_reports (id, name, description, sql_query, chart_config, parameters, category, is_shared, created_by, created_at, updated_at) FROM stdin;
1	Sales by Month	Monthly sales revenue analysis	SELECT DATE_TRUNC('month', order_date) as month, SUM(total_amount) as revenue FROM sales_orders WHERE order_date >= NOW() - INTERVAL '12 months' GROUP BY month ORDER BY month	{"type": "line", "title": "Sales Revenue by Month", "xLabel": "Month", "yLabel": "Revenue"}	[]	sales	f	system	2025-06-04 15:23:51.126114	2025-06-04 15:23:51.126114
2	Top Customers by Revenue	Customers with highest revenue contribution	SELECT c.name as customer_name, SUM(so.total_amount) as total_revenue FROM customers c JOIN sales_orders so ON c.id = so.customer_id GROUP BY c.id, c.name ORDER BY total_revenue DESC LIMIT 10	{"type": "bar", "title": "Top 10 Customers by Revenue", "xLabel": "Customer", "yLabel": "Revenue"}	[]	sales	f	system	2025-06-04 15:23:51.126114	2025-06-04 15:23:51.126114
3	Inventory Levels by Category	Current inventory levels grouped by material category	SELECT cat.name as category, SUM(inv.quantity) as total_quantity FROM inventory inv JOIN materials m ON inv.material_id = m.id JOIN categories cat ON m.category_id = cat.id GROUP BY cat.id, cat.name ORDER BY total_quantity DESC	{"type": "pie", "title": "Inventory Distribution by Category"}	[]	inventory	f	system	2025-06-04 15:23:51.126114	2025-06-04 15:23:51.126114
4	Cost Center Expenses	Expenses by cost center for current year	SELECT cc.name as cost_center, SUM(e.amount) as total_expenses FROM cost_centers cc LEFT JOIN expenses e ON cc.id = e.cost_center_id WHERE EXTRACT(YEAR FROM e.expense_date) = EXTRACT(YEAR FROM NOW()) GROUP BY cc.id, cc.name ORDER BY total_expenses DESC	{"type": "column", "title": "Expenses by Cost Center", "xLabel": "Cost Center", "yLabel": "Amount"}	[]	finance	f	system	2025-06-04 15:23:51.126114	2025-06-04 15:23:51.126114
5	Purchase Orders by Vendor	Purchase order volumes by vendor	SELECT v.name as vendor_name, COUNT(po.id) as order_count, SUM(po.total_amount) as total_amount FROM vendors v JOIN purchase_orders po ON v.id = po.vendor_id GROUP BY v.id, v.name ORDER BY total_amount DESC LIMIT 15	{"type": "stacked_bar", "title": "Purchase Orders by Vendor", "xLabel": "Vendor", "yLabel": "Count/Amount"}	[]	purchase	f	system	2025-06-04 15:23:51.126114	2025-06-04 15:23:51.126114
\.


--
-- Data for Name: customer_contacts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer_contacts (id, customer_id, first_name, last_name, "position", department, email, phone, mobile, is_primary, is_billing, is_shipping, is_technical, is_marketing, preferred_language, notes, is_active, created_at, updated_at, created_by, updated_by) FROM stdin;
1	1	Jessica	Brown	Operations Manager	Operations	jessica.brown@example.com	(555) 456-7890	(555) 654-3210	t	f	f	f	f	English	\N	t	2025-05-22 13:33:12.979	2025-05-22 13:33:12.979	\N	\N
2	1	John	Smith	Purchasing Manager	Procurement	john.smith@example.com	(555) 123-4567	(555) 987-6543	f	f	f	f	f	English	\N	t	2025-05-22 13:33:13.026	2025-05-22 13:33:13.026	\N	\N
3	1	Michael	Williams	CEO	Executive	michael.williams@example.com	(555) 345-6789	(555) 765-4321	f	f	f	f	f	English	\N	t	2025-05-22 13:33:13.069	2025-05-22 13:33:13.069	\N	\N
4	2	Jessica	Brown	Operations Manager	Operations	jessica.brown@example.com	(555) 456-7890	(555) 654-3210	t	f	f	f	f	English	\N	t	2025-05-22 13:33:13.123	2025-05-22 13:33:13.123	\N	\N
5	3	Michael	Williams	CEO	Executive	michael.williams@example.com	(555) 345-6789	(555) 765-4321	t	f	f	f	f	English	\N	t	2025-05-22 13:33:13.176	2025-05-22 13:33:13.176	\N	\N
6	3	Jessica	Brown	Operations Manager	Operations	jessica.brown@example.com	(555) 456-7890	(555) 654-3210	f	f	f	f	f	English	\N	t	2025-05-22 13:33:13.229	2025-05-22 13:33:13.229	\N	\N
7	3	John	Smith	Purchasing Manager	Procurement	john.smith@example.com	(555) 123-4567	(555) 987-6543	f	f	f	f	f	English	\N	t	2025-05-22 13:33:13.269	2025-05-22 13:33:13.269	\N	\N
8	4	Sarah	Johnson	Finance Director	Finance	sarah.johnson@example.com	(555) 234-5678	(555) 876-5432	t	f	f	f	f	English	\N	t	2025-05-22 13:33:13.306	2025-05-22 13:33:13.306	\N	\N
9	4	Sarah	Johnson	Finance Director	Finance	sarah.johnson@example.com	(555) 234-5678	(555) 876-5432	f	f	f	f	f	English	\N	t	2025-05-22 13:33:13.354	2025-05-22 13:33:13.354	\N	\N
10	5	Michael	Williams	CEO	Executive	michael.williams@example.com	(555) 345-6789	(555) 765-4321	t	f	f	f	f	English	\N	t	2025-05-22 13:33:13.393	2025-05-22 13:33:13.393	\N	\N
11	5	Michael	Williams	CEO	Executive	michael.williams@example.com	(555) 345-6789	(555) 765-4321	f	f	f	f	f	English	\N	t	2025-05-22 13:33:13.437	2025-05-22 13:33:13.437	\N	\N
12	5	Michael	Williams	CEO	Executive	michael.williams@example.com	(555) 345-6789	(555) 765-4321	f	f	f	f	f	English	\N	t	2025-05-22 13:33:13.473	2025-05-22 13:33:13.473	\N	\N
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers (id, name, email, phone, address, notes, user_id, created_at, updated_at) FROM stdin;
1	Acme Corporation	orders@acme.example.com	+1-212-555-0123	123 Main Street, New York, NY 10001	Key account - has special pricing agreement	\N	2025-05-20 18:17:22.106429	2025-05-20 18:17:22.106429
2	Global Enterprises	procurement@globalent.example.com	+1-312-555-0456	456 Park Avenue, Chicago, IL 60601	High volume customer	\N	2025-05-20 18:17:22.140573	2025-05-20 18:17:22.140573
3	European Distributors Ltd	orders@eurodist.example.com	+44-20-7123-4567	1 Oxford Street, London, W1D 1BS	European distribution partner	\N	2025-05-20 18:17:22.160991	2025-05-20 18:17:22.160991
4	Tech Solutions GmbH	einkauf@techsolutions.example.de	+49-30-1234-5678	Hauptstraße 1, Berlin, 10115	German tech industry client	\N	2025-05-20 18:17:22.179183	2025-05-20 18:17:22.179183
5	Japan Manufacturing Co.	orders@japanmfg.example.jp	+81-3-1234-5678	1-1 Marunouchi, Tokyo, 100-0005	Japanese manufacturing partner	\N	2025-05-20 18:17:22.197684	2025-05-20 18:17:22.197684
\.


--
-- Data for Name: dashboard_configs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dashboard_configs (id, user_id, config, created_at) FROM stdin;
1	1	{"widgets": [{"id": "custom-widget-1748008057711", "type": "kpi", "title": "quotes Key Metrics", "width": 1, "position": 1}]}	2025-05-23 13:47:27.063425+00
2	1	{"widgets": []}	2025-05-23 13:47:51.571587+00
3	1	{"widgets": [{"id": "custom-widget-1748008102822", "type": "table", "title": "stock Summary", "width": 1, "position": 1}]}	2025-05-23 13:48:12.006036+00
4	1	{"widgets": []}	2025-05-23 13:52:34.618065+00
5	1	{"widgets": [{"id": "custom-widget-1748008386790", "type": "table", "title": "Expenses Summary", "width": 1, "position": 1}]}	2025-05-23 13:52:55.991037+00
6	1	{"widgets": [{"id": "custom-widget-1748008386790", "type": "table", "title": "Expenses Summary", "width": 1, "position": 1}, {"id": "custom-widget-1748008427350", "type": "line-chart", "title": "capacity Trend", "width": 2, "position": 2}]}	2025-05-23 13:53:36.644814+00
7	1	{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 1}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 2}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 3}]}	2025-05-23 14:54:12.045456+00
8	1	{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 1}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 2}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 3}]}	2025-05-23 14:54:27.164226+00
9	1	{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}	2025-05-23 15:22:53.397393+00
10	1	{"widgets": [{"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 0}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}	2025-05-23 15:22:58.232958+00
11	1	{"widgets": [{"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 0}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 1}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}	2025-05-23 15:23:52.777618+00
12	1	{"widgets": [{"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 0}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}	2025-05-23 15:24:12.051902+00
13	1	{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}	2025-05-23 15:28:50.914169+00
14	1	{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}	2025-05-23 15:34:35.768835+00
15	1	{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}	2025-05-23 15:35:09.742322+00
16	1	{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}	2025-05-23 15:37:10.877803+00
17	1	{"widgets": [{"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 0}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 1}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}	2025-05-23 15:37:11.153819+00
18	1	{"widgets": [{"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 0}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 1}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}	2025-05-23 15:37:12.008393+00
19	1	{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 1}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}	2025-05-23 17:57:03.304339+00
20	1	{"widgets": [{"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 0}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}	2025-05-23 17:57:12.171106+00
21	1	{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 1}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}	2025-05-24 01:45:18.72063+00
22	1	{"widgets": [{"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 0}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}, {"id": "custom-widget-1748051153852", "type": "table", "title": "capacity Summary", "width": 1, "position": 5}]}	2025-05-24 01:45:43.473218+00
23	1	{"widgets": [{"id": "custom-widget-1748051153852", "type": "table", "title": "capacity Summary", "width": 1, "position": 5}, {"id": "custom-widget-1748052966585", "type": "pie-chart", "title": "Sales Distribution", "width": 1, "position": 2}]}	2025-05-24 02:15:56.310943+00
24	1	{"widgets": [{"id": "custom-widget-1748051153852", "type": "table", "title": "capacity Summary", "width": 1, "position": 5}]}	2025-05-26 13:07:16.942616+00
25	1	{"widgets": []}	2025-05-26 13:07:19.817058+00
26	1	{"widgets": [{"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 0}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 1}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}	2025-05-26 13:07:33.498415+00
27	1	{"widgets": [{"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 0}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 1}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}	2025-05-26 13:39:00.668615+00
28	1	{"widgets": [{"id": "custom-widget-1748266778139", "type": "table", "title": "capacity Summary", "width": 1, "position": 1}]}	2025-05-26 13:39:27.580284+00
29	1	{"widgets": []}	2025-05-26 13:39:36.825973+00
\.


--
-- Data for Name: employee_master; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.employee_master (id, employee_number, first_name, last_name, middle_name, date_of_birth, gender, hire_date, employment_type, employment_status, company_code_id, cost_center_id, manager_id, work_email, work_phone, created_at) FROM stdin;
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.employees (id, employee_id, first_name, last_name, email, phone, department, "position", company_code_id, cost_center_id, join_date, manager_id, is_active, created_at, updated_at) FROM stdin;
1	E1001	John	Smith	john.smith@minierp.com	212-555-1234	Executive	CEO	1	\N	2018-01-15	\N	t	2025-05-20 22:10:30.210641	2025-05-20 22:10:30.210641
2	E1002	Sarah	Johnson	sarah.johnson@minierp.com	212-555-2345	Finance	CFO	1	\N	2018-02-01	\N	t	2025-05-20 22:10:30.210641	2025-05-20 22:10:30.210641
3	E1003	Michael	Williams	michael.williams@minierp.com	212-555-3456	Operations	COO	1	\N	2018-03-15	\N	t	2025-05-20 22:10:30.210641	2025-05-20 22:10:30.210641
4	E1004	David	Brown	david.brown@minierp.com	212-555-4567	Manufacturing	VP Manufacturing	1	\N	2018-06-01	\N	t	2025-05-20 22:10:30.210641	2025-05-20 22:10:30.210641
5	E1005	Jennifer	Davis	jennifer.davis@minierp.com	212-555-5678	Sales	VP Sales	1	\N	2018-07-15	\N	t	2025-05-20 22:10:30.210641	2025-05-20 22:10:30.210641
8	US01-EMP2769	Emma	Johnson	emma.johnson1@example.com	+1-555-987-8217	Sales	Sales Manager	1	3	2019-07-22	\N	t	2025-05-21 14:58:58.925057	2025-05-21 14:58:58.925057
9	EU01-EMP9748	Emma	Johnson	emma.johnson2@example.com	+1-555-987-8928	Sales	Sales Manager	2	\N	2019-07-22	\N	t	2025-05-21 14:58:58.925057	2025-05-21 14:58:58.925057
10	TEST02-EMP9857	Emma	Johnson	emma.johnson4@example.com	+1-555-987-1855	Sales	Sales Manager	4	\N	2019-07-22	\N	t	2025-05-21 14:58:58.925057	2025-05-21 14:58:58.925057
11	CA01-EMP8109	Emma	Johnson	emma.johnson5@example.com	+1-555-987-5968	Sales	Sales Manager	5	13	2019-07-22	\N	t	2025-05-21 14:58:58.925057	2025-05-21 14:58:58.925057
12	GA01-EMP6705	Emma	Johnson	emma.johnson7@example.com	+1-555-987-5673	Sales	Sales Manager	7	15	2019-07-22	\N	t	2025-05-21 14:58:58.925057	2025-05-21 14:58:58.925057
\.


--
-- Data for Name: environment_config; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.environment_config (id, environment, database_url, is_active, last_transport_date, description) FROM stdin;
\.


--
-- Data for Name: erp_customer_contacts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.erp_customer_contacts (id, customer_id, first_name, last_name, "position", department, email, phone, mobile, is_primary, is_billing, is_shipping, is_technical, is_marketing, preferred_language, notes, is_active, created_at, updated_at, created_by, updated_by) FROM stdin;
1	1	James	Wilson	Purchasing Manager	Procurement	james.wilson@acmecorp.com	+1-312-555-1235	\N	t	f	f	f	f	English	\N	t	2025-05-17 15:46:05.273222	2025-05-17 15:46:05.273222	\N	\N
2	1	Sarah	Johnson	Accounts Payable Manager	Finance	sarah.johnson@acmecorp.com	+1-312-555-1236	\N	f	t	f	f	f	English	\N	t	2025-05-17 15:46:05.273222	2025-05-17 15:46:05.273222	\N	\N
3	1	Robert	Davis	Logistics Coordinator	Operations	robert.davis@acmecorp.com	+1-312-555-1237	\N	f	f	t	f	f	English	\N	t	2025-05-17 15:46:05.273222	2025-05-17 15:46:05.273222	\N	\N
4	2	Michael	Brown	Director of Merchandising	Purchasing	michael.brown@globalretail.com	+1-212-555-2346	\N	t	t	f	f	f	English	\N	t	2025-05-17 15:46:05.273222	2025-05-17 15:46:05.273222	\N	\N
5	2	Emily	Taylor	Supply Chain Manager	Operations	emily.taylor@globalretail.com	+1-212-555-2347	\N	f	f	t	f	f	English	\N	t	2025-05-17 15:46:05.273222	2025-05-17 15:46:05.273222	\N	\N
6	3	David	Martinez	Head of Procurement	Administration	david.martinez@cityhospital.org	+1-617-555-3457	\N	t	t	t	f	f	English	\N	t	2025-05-17 15:46:05.273222	2025-05-17 15:46:05.273222	\N	\N
7	4	Lisa	Anderson	Operations Director	Operations	lisa.anderson@techinnovate.com	+1-415-555-4568	\N	t	t	t	f	f	English	\N	t	2025-05-17 15:46:05.273222	2025-05-17 15:46:05.273222	\N	\N
8	6	Thomas	Washington	Procurement Officer	Acquisitions	thomas.washington@gov.agency.gov	+1-202-555-6790	\N	t	f	f	f	f	English	\N	t	2025-05-17 15:46:05.273222	2025-05-17 15:46:05.273222	\N	\N
9	6	Jennifer	Adams	Financial Officer	Finance	jennifer.adams@gov.agency.gov	+1-202-555-6791	\N	f	t	f	f	f	English	\N	t	2025-05-17 15:46:05.273222	2025-05-17 15:46:05.273222	\N	\N
10	7	Klaus	Schmidt	International Sales Director	Sales	klaus.schmidt@eurodist.eu	+49-30-555-7891	\N	t	t	t	f	f	English	\N	t	2025-05-17 15:46:05.273222	2025-05-17 15:46:05.273222	\N	\N
\.


--
-- Data for Name: erp_customers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.erp_customers (id, customer_code, name, type, description, tax_id, industry, segment, address, city, state, country, postal_code, region, phone, alt_phone, email, website, currency, payment_terms, payment_method, credit_limit, credit_rating, discount_group, price_group, incoterms, shipping_method, delivery_terms, delivery_route, sales_rep_id, parent_customer_id, status, is_b2b, is_b2c, is_vip, notes, tags, company_code_id, is_active, created_at, updated_at, created_by, updated_by, version) FROM stdin;
1	C1001	Acme Corporation	corporate	Large manufacturing client	123-45-6789	manufacturing	enterprise	123 Main Street	Chicago	IL	US	60601	\N	+1-312-555-1234	\N	contact@acmecorp.com	\N	USD	net_30	\N	50000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	active	t	f	t	\N	\N	2	t	2025-05-17 15:45:52.538438	2025-05-17 15:45:52.538438	\N	\N	1
2	C1002	Global Retailers	corporate	International retail chain	987-65-4321	retail	key_account	456 Market Ave	New York	NY	US	10001	\N	+1-212-555-2345	\N	orders@globalretail.com	\N	USD	net_45	\N	100000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	active	t	f	t	\N	\N	2	t	2025-05-17 15:45:52.538438	2025-05-17 15:45:52.538438	\N	\N	1
3	C1003	City Hospital	corporate	Regional medical center	456-78-9012	healthcare	mid_market	789 Health Blvd	Boston	MA	US	02110	\N	+1-617-555-3456	\N	procurement@cityhospital.org	\N	USD	net_60	\N	75000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	active	t	f	f	\N	\N	2	t	2025-05-17 15:45:52.538438	2025-05-17 15:45:52.538438	\N	\N	1
4	C1004	Tech Innovations	corporate	Technology startup	789-01-2345	technology	small_business	321 Tech Park	San Francisco	CA	US	94105	\N	+1-415-555-4567	\N	orders@techinnovate.com	\N	USD	net_30	\N	25000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	active	t	f	f	\N	\N	2	t	2025-05-17 15:45:52.538438	2025-05-17 15:45:52.538438	\N	\N	1
5	C1005	John Smith	individual	Regular customer	\N	\N	consumer	555 Residential St	Los Angeles	CA	US	90001	\N	+1-213-555-5678	\N	john.smith@email.com	\N	USD	prepaid	\N	1000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	active	f	t	f	\N	\N	2	t	2025-05-17 15:45:52.538438	2025-05-17 15:45:52.538438	\N	\N	1
6	C1006	Government Agency	government	Federal procurement office	GOV-123456	government	enterprise	1 Federal Plaza	Washington	DC	US	20001	\N	+1-202-555-6789	\N	procurement@gov.agency.gov	\N	USD	net_60	\N	500000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	active	t	f	f	\N	\N	2	t	2025-05-17 15:45:52.538438	2025-05-17 15:45:52.538438	\N	\N	1
7	C1007	European Distributors	corporate	European distribution partner	EU-8765432	distribution	strategic	10 International Blvd	Berlin	\N	DE	10115	\N	+49-30-555-7890	\N	orders@eurodist.eu	\N	EUR	net_45	\N	200000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	active	t	f	t	\N	\N	2	t	2025-05-17 15:45:52.538438	2025-05-17 15:45:52.538438	\N	\N	1
8	C1008	Education Foundation	non_profit	Educational institution	TAX-EXEMPT-123	education	mid_market	200 Learning Way	Atlanta	GA	US	30301	\N	+1-404-555-8901	\N	purchases@edufoundation.org	\N	USD	net_30	\N	30000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	active	t	f	f	\N	\N	2	t	2025-05-17 15:45:52.538438	2025-05-17 15:45:52.538438	\N	\N	1
9	C1009	Local Restaurant	corporate	Small business customer	BUS-987654	food_service	small_business	75 Culinary Lane	Miami	FL	US	33101	\N	+1-305-555-9012	\N	orders@localrestaurant.com	\N	USD	cod	\N	5000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	active	t	f	f	\N	\N	2	t	2025-05-17 15:45:52.538438	2025-05-17 15:45:52.538438	\N	\N	1
10	C1010	Industrial Supplies	corporate	Industrial equipment supplier	IND-456789	industrial	mid_market	800 Factory Road	Detroit	MI	US	48201	\N	+1-313-555-0123	\N	sales@industrialsupplies.com	\N	USD	net_30	\N	150000.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	active	t	f	f	\N	\N	2	t	2025-05-17 15:45:52.538438	2025-05-17 15:45:52.538438	\N	\N	1
\.


--
-- Data for Name: erp_vendor_contacts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.erp_vendor_contacts (id, vendor_id, first_name, last_name, "position", department, email, phone, mobile, is_primary, is_order_contact, is_purchase_contact, is_quality_contact, is_accounts_contact, preferred_language, notes, is_active, created_at, updated_at, created_by, updated_by) FROM stdin;
1	1	Richard	Steel	Sales Director	Sales	richard.steel@primesteelsupply.com	+1-412-555-1112	\N	t	t	f	f	f	English	\N	t	2025-05-17 15:46:49.348119	2025-05-17 15:46:49.348119	\N	\N
2	1	Patricia	Miller	Accounts Manager	Finance	patricia.miller@primesteelsupply.com	+1-412-555-1113	\N	f	f	f	f	t	English	\N	t	2025-05-17 15:46:49.348119	2025-05-17 15:46:49.348119	\N	\N
3	2	Edward	Johnson	VP of Sales	Sales	edward.johnson@qualityelectronics.com	+1-408-555-2223	\N	t	t	f	f	f	English	\N	t	2025-05-17 15:46:49.348119	2025-05-17 15:46:49.348119	\N	\N
4	2	Michelle	Lee	Customer Relations	Customer Service	michelle.lee@qualityelectronics.com	+1-408-555-2224	\N	f	f	f	f	t	English	\N	t	2025-05-17 15:46:49.348119	2025-05-17 15:46:49.348119	\N	\N
5	3	Carlos	Rodriguez	Operations Manager	Operations	carlos.rodriguez@globallogistics.com	+1-562-555-3334	\N	t	t	f	f	t	English	\N	t	2025-05-17 15:46:49.348119	2025-05-17 15:46:49.348119	\N	\N
6	4	Stephanie	Clark	Sales Representative	Sales	stephanie.clark@advancedmaterials.com	+1-919-555-4445	\N	t	t	f	f	f	English	\N	t	2025-05-17 15:46:49.348119	2025-05-17 15:46:49.348119	\N	\N
7	4	Mark	Williams	Technical Support	Engineering	mark.williams@advancedmaterials.com	+1-919-555-4446	\N	f	f	f	f	f	English	\N	t	2025-05-17 15:46:49.348119	2025-05-17 15:46:49.348119	\N	\N
8	5	Gregory	Phillips	Owner	Management	gregory.phillips@precisionengineering.com	+1-513-555-5556	\N	t	t	f	f	t	English	\N	t	2025-05-17 15:46:49.348119	2025-05-17 15:46:49.348119	\N	\N
9	8	Mei	Chen	Export Manager	International Sales	mei.chen@asianmanufacturing.com	+86-755-5558889	\N	t	t	f	f	f	English	\N	t	2025-05-17 15:46:49.348119	2025-05-17 15:46:49.348119	\N	\N
10	8	Jian	Zhang	Quality Control Manager	Quality	jian.zhang@asianmanufacturing.com	+86-755-5558890	\N	f	f	f	f	t	English	\N	t	2025-05-17 15:46:49.348119	2025-05-17 15:46:49.348119	\N	\N
11	12	Brian	Davis	Account Executive	Sales	brian.davis@softwaresolutions.com	+1-206-555-2223	\N	t	t	f	f	f	English	\N	t	2025-05-17 15:46:49.348119	2025-05-17 15:46:49.348119	\N	\N
12	12	Amanda	Wilson	Support Manager	Technical Support	amanda.wilson@softwaresolutions.com	+1-206-555-2224	\N	f	f	f	f	t	English	\N	t	2025-05-17 15:46:49.348119	2025-05-17 15:46:49.348119	\N	\N
\.


--
-- Data for Name: erp_vendors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.erp_vendors (id, vendor_code, name, type, description, tax_id, industry, address, city, state, country, postal_code, region, phone, alt_phone, email, website, currency, payment_terms, payment_method, supplier_type, category, order_frequency, minimum_order_value, evaluation_score, lead_time, purchasing_group_id, status, blacklisted, blacklist_reason, notes, tags, company_code_id, is_active, created_at, updated_at, created_by, updated_by, version) FROM stdin;
1	V1001	Prime Steel Supply	supplier	Steel and metal supplier	PS-12345	manufacturing	100 Industrial Road	Pittsburgh	PA	US	15222	\N	+1-412-555-1111	\N	orders@primesteelsupply.com	\N	USD	net_30	\N	manufacturer	strategic	\N	\N	92	14	\N	active	f	\N	\N	\N	2	t	2025-05-17 15:46:35.531383	2025-05-17 15:46:35.531383	\N	\N	1
2	V1002	Quality Electronics	supplier	Electronic components supplier	QE-67890	electronics	200 Tech Avenue	San Jose	CA	US	95110	\N	+1-408-555-2222	\N	sales@qualityelectronics.com	\N	USD	net_45	\N	distributor	preferred	\N	\N	88	21	\N	active	f	\N	\N	\N	2	t	2025-05-17 15:46:35.531383	2025-05-17 15:46:35.531383	\N	\N	1
3	V1003	Global Logistics	service_provider	International shipping and logistics	GL-34567	transportation	300 Harbor Blvd	Long Beach	CA	US	90802	\N	+1-562-555-3333	\N	operations@globallogistics.com	\N	USD	net_30	\N	service	approved	\N	\N	95	7	\N	active	f	\N	\N	\N	2	t	2025-05-17 15:46:35.531383	2025-05-17 15:46:35.531383	\N	\N	1
4	V1004	Advanced Materials	supplier	Specialized manufacturing materials	AM-89012	chemicals	400 Research Parkway	Raleigh	NC	US	27601	\N	+1-919-555-4444	\N	orders@advancedmaterials.com	\N	USD	net_60	\N	manufacturer	strategic	\N	\N	90	28	\N	active	f	\N	\N	\N	2	t	2025-05-17 15:46:35.531383	2025-05-17 15:46:35.531383	\N	\N	1
5	V1005	Precision Engineering	contractor	Custom tooling and machining services	PE-45678	manufacturing	500 Precision Way	Cincinnati	OH	US	45202	\N	+1-513-555-5555	\N	info@precisionengineering.com	\N	USD	net_30	\N	service	preferred	\N	\N	87	35	\N	active	f	\N	\N	\N	2	t	2025-05-17 15:46:35.531383	2025-05-17 15:46:35.531383	\N	\N	1
6	V1006	Packaging Solutions	supplier	Industrial packaging materials	PS-90123	packaging	600 Box Street	Memphis	TN	US	38101	\N	+1-901-555-6666	\N	sales@packagingsolutions.com	\N	USD	net_30	\N	manufacturer	approved	\N	\N	83	10	\N	active	f	\N	\N	\N	2	t	2025-05-17 15:46:35.531383	2025-05-17 15:46:35.531383	\N	\N	1
7	V1007	Machinery Maintenance	service_provider	Equipment maintenance and repair	MM-56789	services	700 Service Road	Cleveland	OH	US	44101	\N	+1-216-555-7777	\N	service@machinerymaintenance.com	\N	USD	net_15	\N	service	approved	\N	\N	79	3	\N	active	f	\N	\N	\N	2	t	2025-05-17 15:46:35.531383	2025-05-17 15:46:35.531383	\N	\N	1
8	V1008	Asian Manufacturing	supplier	Overseas manufacturing partner	AM-901234	manufacturing	800 Export Zone	Shenzhen	\N	CN	518000	\N	+86-755-5558888	\N	exports@asianmanufacturing.com	\N	USD	letter_of_credit	\N	manufacturer	strategic	\N	\N	85	45	\N	active	f	\N	\N	\N	2	t	2025-05-17 15:46:35.531383	2025-05-17 15:46:35.531383	\N	\N	1
9	V1009	Office Supplies Co	supplier	General office and facility supplies	OSC-12345	retail	900 Retail Row	Chicago	IL	US	60602	\N	+1-312-555-9999	\N	orders@officesupplies.com	\N	USD	net_30	\N	distributor	approved	\N	\N	82	5	\N	active	f	\N	\N	\N	2	t	2025-05-17 15:46:35.531383	2025-05-17 15:46:35.531383	\N	\N	1
10	V1010	Unreliable Vendor	supplier	Problematic supplier with quality issues	UV-99999	manufacturing	1000 Problem Street	Phoenix	AZ	US	85001	\N	+1-602-555-0000	\N	orders@unreliablevendor.com	\N	USD	advance	\N	manufacturer	one_time	\N	\N	30	60	\N	inactive	f	\N	\N	\N	2	t	2025-05-17 15:46:35.531383	2025-05-17 15:46:35.531383	\N	\N	1
11	V1011	Blacklisted Supply	supplier	Blacklisted due to contract violations	BS-00000	manufacturing	1100 Violation Road	Denver	CO	US	80201	\N	+1-303-555-1111	\N	info@blacklistedsupply.com	\N	USD	cod	\N	manufacturer	one_time	\N	\N	10	90	\N	blocked	f	\N	\N	\N	2	t	2025-05-17 15:46:35.531383	2025-05-17 15:46:35.531383	\N	\N	1
12	V1012	Software Solutions	service_provider	Software and IT services provider	SS-12345	technology	1200 Code Boulevard	Seattle	WA	US	98101	\N	+1-206-555-2222	\N	services@softwaresolutions.com	\N	USD	net_30	\N	service	strategic	\N	\N	91	14	\N	active	f	\N	\N	\N	2	t	2025-05-17 15:46:35.531383	2025-05-17 15:46:35.531383	\N	\N	1
\.


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.expenses (id, date, amount, category, description, payment_method, reference, user_id, created_at, updated_at) FROM stdin;
4	2025-04-07 13:40:07.532	4497.31	Professional Services	Consulting and professional fees	Credit Card	EXP-7870	1	2025-05-22 13:40:07.533	2025-05-22 13:40:07.533
5	2025-03-02 13:40:07.532	4652.64	Software	Software licenses and subscriptions	Petty Cash	EXP-7268	1	2025-05-22 13:40:07.575	2025-05-22 13:40:07.575
6	2025-03-18 13:40:07.532	1942.11	Training	Employee training and development	Credit Card	EXP-0984	1	2025-05-22 13:40:07.599	2025-05-22 13:40:07.599
7	2025-05-06 13:40:07.532	2303.66	Marketing	Marketing campaign expenses	Credit Card	EXP-3024	1	2025-05-22 13:40:07.617	2025-05-22 13:40:07.617
8	2025-05-14 13:40:07.532	4140.1	Utilities	Monthly utility bills	Petty Cash	EXP-7523	1	2025-05-22 13:40:07.635	2025-05-22 13:40:07.635
9	2025-05-14 13:40:07.532	3782.49	Maintenance	Equipment and building maintenance	Cash	EXP-0422	1	2025-05-22 13:40:07.654	2025-05-22 13:40:07.654
10	2025-03-02 13:40:07.532	3939.37	Hardware	Computer and office equipment	Corporate Card	EXP-1328	1	2025-05-22 13:40:07.68	2025-05-22 13:40:07.68
11	2025-02-27 13:40:07.532	2907.45	Office Supplies	Office stationery and supplies	PayPal	EXP-6739	1	2025-05-22 13:40:07.71	2025-05-22 13:40:07.71
12	2025-04-11 13:40:07.532	4389.24	Office Supplies	Office stationery and supplies	PayPal	EXP-4371	1	2025-05-22 13:40:07.731	2025-05-22 13:40:07.731
13	2025-04-21 13:40:07.532	2628.29	Marketing	Marketing campaign expenses	Bank Transfer	EXP-1703	1	2025-05-22 13:40:07.75	2025-05-22 13:40:07.75
14	2025-05-16 13:40:07.532	1210.63	Office Supplies	Office stationery and supplies	Corporate Card	EXP-5873	1	2025-05-22 13:40:07.768	2025-05-22 13:40:07.768
15	2025-03-15 13:40:07.532	2723.74	Software	Software licenses and subscriptions	Check	EXP-6857	1	2025-05-22 13:40:07.788	2025-05-22 13:40:07.788
16	2025-03-26 13:40:07.532	1338.37	Software	Software licenses and subscriptions	PayPal	EXP-4754	1	2025-05-22 13:40:07.808	2025-05-22 13:40:07.808
17	2025-05-07 13:40:07.532	1939.2	Professional Services	Consulting and professional fees	Bank Transfer	EXP-5327	1	2025-05-22 13:40:07.826	2025-05-22 13:40:07.826
18	2025-03-22 13:40:07.532	1458.69	Office Supplies	Office stationery and supplies	Cash	EXP-7187	1	2025-05-22 13:40:07.857	2025-05-22 13:40:07.857
\.


--
-- Data for Name: fiscal_periods; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.fiscal_periods (id, created_at, updated_at, version, year, period, name, start_date, end_date, status, company_code_id) FROM stdin;
1	2025-05-20 22:11:27.296074	2025-05-20 22:11:27.296074	1	2025	1	2025-01	2025-01-01	2025-01-31	CLOSED	1
2	2025-05-20 22:11:27.296074	2025-05-20 22:11:27.296074	1	2025	2	2025-02	2025-02-01	2025-02-28	CLOSED	1
3	2025-05-20 22:11:27.296074	2025-05-20 22:11:27.296074	1	2025	3	2025-03	2025-03-01	2025-03-31	CLOSED	1
4	2025-05-20 22:11:27.296074	2025-05-20 22:11:27.296074	1	2025	4	2025-04	2025-04-01	2025-04-30	CLOSED	1
5	2025-05-20 22:11:27.296074	2025-05-20 22:11:27.296074	1	2025	5	2025-05	2025-05-01	2025-05-31	CLOSED	1
6	2025-05-20 22:11:27.296074	2025-05-20 22:11:27.296074	1	2025	6	2025-06	2025-06-01	2025-06-30	OPEN	1
7	2025-05-20 22:11:27.296074	2025-05-20 22:11:27.296074	1	2025	7	2025-07	2025-07-01	2025-07-31	OPEN	1
8	2025-05-20 22:11:27.296074	2025-05-20 22:11:27.296074	1	2025	8	2025-08	2025-08-01	2025-08-31	OPEN	1
9	2025-05-20 22:11:27.296074	2025-05-20 22:11:27.296074	1	2025	9	2025-09	2025-09-01	2025-09-30	OPEN	1
10	2025-05-20 22:11:27.296074	2025-05-20 22:11:27.296074	1	2025	10	2025-10	2025-10-01	2025-10-31	OPEN	1
11	2025-05-20 22:11:27.296074	2025-05-20 22:11:27.296074	1	2025	11	2025-11	2025-11-01	2025-11-30	OPEN	1
12	2025-05-20 22:11:27.296074	2025-05-20 22:11:27.296074	1	2025	12	2025-12	2025-12-01	2025-12-31	OPEN	1
\.


--
-- Data for Name: fiscal_year_variants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.fiscal_year_variants (id, code, name, description, start_month, periods_count, short_year, calendar_year, is_active, created_at, updated_at) FROM stdin;
1	K4	Calendar Year (Jan-Dec)	Standard calendar year with 12 monthly periods	1	12	f	t	t	2025-06-04 02:37:36.574909	2025-06-04 02:37:36.574909
2	K7	Fiscal Year (Apr-Mar)	Fiscal year starting April with 12 monthly periods	4	12	f	f	t	2025-06-04 02:37:36.574909	2025-06-04 02:37:36.574909
3	K2	Fiscal Year (Jul-Jun)	Fiscal year starting July with 12 monthly periods	7	12	f	f	t	2025-06-04 02:37:36.574909	2025-06-04 02:37:36.574909
4	V3	Weekly Periods (52 weeks)	Annual cycle with 52 weekly periods	1	52	f	t	t	2025-06-04 02:37:36.574909	2025-06-04 02:37:36.574909
\.


--
-- Data for Name: general_ledger_accounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.general_ledger_accounts (id, account_number, account_name, account_type, account_group, parent_account_id, company_code_id, currency_id, balance_sheet_item, profit_loss_item, reconciliation_account, tax_relevant, posting_allowed, blocked, description, created_at) FROM stdin;
\.


--
-- Data for Name: gl_accounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gl_accounts (id, account_number, account_name, chart_of_accounts_id, account_type, account_group, balance_sheet_account, pl_account, block_posting, reconciliation_account, is_active, created_at, updated_at) FROM stdin;
1	1000	Cash and Cash Equivalents	39	ASSETS	CURRENT_ASSETS	t	f	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
2	1100	Accounts Receivable	39	ASSETS	CURRENT_ASSETS	t	f	f	t	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
3	1110	Allowance for Doubtful Accounts	39	ASSETS	CURRENT_ASSETS	t	f	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
4	1200	Inventory - Raw Materials	39	ASSETS	CURRENT_ASSETS	t	f	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
5	1210	Inventory - Work in Process	39	ASSETS	CURRENT_ASSETS	t	f	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
6	1220	Inventory - Finished Goods	39	ASSETS	CURRENT_ASSETS	t	f	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
7	1300	Prepaid Expenses	39	ASSETS	CURRENT_ASSETS	t	f	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
8	1500	Property, Plant & Equipment	39	ASSETS	FIXED_ASSETS	t	f	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
9	1510	Accumulated Depreciation - PPE	39	ASSETS	FIXED_ASSETS	t	f	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
10	1600	Intangible Assets	39	ASSETS	FIXED_ASSETS	t	f	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
11	2000	Accounts Payable	39	LIABILITIES	CURRENT_LIABILITIES	t	f	f	t	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
12	2100	Accrued Expenses	39	LIABILITIES	CURRENT_LIABILITIES	t	f	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
13	2110	Accrued Payroll	39	LIABILITIES	CURRENT_LIABILITIES	t	f	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
14	2200	Short-term Debt	39	LIABILITIES	CURRENT_LIABILITIES	t	f	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
15	2300	Income Tax Payable	39	LIABILITIES	CURRENT_LIABILITIES	t	f	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
16	2500	Long-term Debt	39	LIABILITIES	LONG_TERM_LIABILITIES	t	f	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
17	3000	Common Stock	39	EQUITY	STOCKHOLDERS_EQUITY	t	f	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
18	3100	Retained Earnings	39	EQUITY	STOCKHOLDERS_EQUITY	t	f	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
19	3200	Additional Paid-in Capital	39	EQUITY	STOCKHOLDERS_EQUITY	t	f	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
20	4000	Sales Revenue - Products	39	REVENUE	OPERATING_REVENUE	f	t	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
21	4100	Service Revenue	39	REVENUE	OPERATING_REVENUE	f	t	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
22	4200	Other Operating Revenue	39	REVENUE	OTHER_REVENUE	f	t	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
23	5000	Cost of Goods Sold - Materials	39	EXPENSES	COST_OF_SALES	f	t	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
24	5100	Cost of Goods Sold - Labor	39	EXPENSES	COST_OF_SALES	f	t	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
25	5200	Cost of Goods Sold - Overhead	39	EXPENSES	COST_OF_SALES	f	t	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
26	6000	Salaries and Wages	39	EXPENSES	OPERATING_EXPENSES	f	t	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
27	6100	Rent Expense	39	EXPENSES	OPERATING_EXPENSES	f	t	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
28	6200	Utilities Expense	39	EXPENSES	OPERATING_EXPENSES	f	t	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
29	6300	Depreciation Expense	39	EXPENSES	OPERATING_EXPENSES	f	t	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
30	6400	Insurance Expense	39	EXPENSES	OPERATING_EXPENSES	f	t	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
31	6500	Marketing and Advertising	39	EXPENSES	OPERATING_EXPENSES	f	t	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
32	6600	Research and Development	39	EXPENSES	OPERATING_EXPENSES	f	t	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
33	7000	Interest Expense	39	EXPENSES	NON_OPERATING_EXPENSES	f	t	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
34	7100	Interest Income	39	REVENUE	NON_OPERATING_REVENUE	f	t	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
35	8000	Income Tax Expense	39	EXPENSES	TAX_EXPENSES	f	t	f	f	t	2025-06-04 02:38:20.681585	2025-06-04 02:38:20.681585
\.


--
-- Data for Name: internal_orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.internal_orders (id, order_number, order_type, description, company_code, controlling_area, responsible_cost_center, profit_center, order_status, planned_costs, actual_costs, committed_costs, budget_amount, start_date, end_date, created_by, created_at) FROM stdin;
\.


--
-- Data for Name: inventory_transactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inventory_transactions (id, transaction_number, transaction_type, material_id, plant_id, storage_location_id, movement_type, quantity, unit_of_measure, unit_price, total_value, batch_number, serial_number, reference_document, posting_date, document_date, cost_center_id, reason_code, notes, created_by, created_at) FROM stdin;
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.invoices (id, invoice_number, order_id, issue_date, due_date, amount, status, paid_date, user_id, created_at, updated_at) FROM stdin;
1	INV-10000	3	2025-02-14 07:25:12.502	2025-03-16 07:25:12.502	7469.740000000001	PAID	2025-03-05 07:25:12.502	1	2025-05-21 16:29:36.095	2025-05-21 16:29:36.095
2	INV-10017	20	2025-05-01 21:09:29.634	2025-05-31 21:09:29.634	11439.71	PAID	2025-05-09 21:09:29.634	1	2025-05-21 16:29:37.327	2025-05-21 16:29:37.327
3	INV-10023	26	2024-12-29 18:43:15.488	2025-01-28 18:43:15.488	2289.85	PAID	2025-01-14 18:43:15.488	1	2025-05-21 16:29:37.785	2025-05-21 16:29:37.785
4	INV-10024	27	2025-04-02 03:12:19.304	2025-05-02 03:12:19.304	5399.91	ISSUED	\N	1	2025-05-21 16:29:37.848	2025-05-21 16:29:37.848
5	INV-10028	31	2025-01-24 22:23:11.444	2025-02-23 22:23:11.444	5069.94	ISSUED	\N	1	2025-05-21 16:29:38.129	2025-05-21 16:29:38.129
6	INV-10033	36	2025-04-02 18:15:28.827	2025-05-02 18:15:28.827	4029.66	PAID	2025-04-25 18:15:28.827	1	2025-05-21 16:29:38.506	2025-05-21 16:29:38.506
7	INV-10036	39	2024-12-18 11:36:51.5	2025-01-17 11:36:51.5	9339.75	PAID	2025-01-07 11:36:51.5	1	2025-05-21 16:29:38.739	2025-05-21 16:29:38.739
8	INV-10037	40	2024-12-16 07:21:42.349	2025-01-15 07:21:42.349	5749.83	ISSUED	\N	1	2025-05-21 16:29:38.837	2025-05-21 16:29:38.837
9	INV-10045	48	2025-04-19 12:23:00.681	2025-05-19 12:23:00.681	869.9300000000001	ISSUED	\N	1	2025-05-21 16:29:39.511	2025-05-21 16:29:39.511
10	INV-10046	49	2025-03-30 13:28:24.852	2025-04-29 13:28:24.852	1199.98	ISSUED	\N	1	2025-05-21 16:29:39.574	2025-05-21 16:29:39.574
\.


--
-- Data for Name: journal_entries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.journal_entries (id, document_number, company_code_id, document_type, posting_date, document_date, fiscal_period, fiscal_year, currency_id, exchange_rate, reference_document, header_text, total_debit_amount, total_credit_amount, created_by, posted_by, posting_time, status, created_at, entry_date) FROM stdin;
1	JE-2025-001	\N	SA	2025-06-01	2025-06-01	06	2025	\N	1.0000	\N	Monthly depreciation expense	5000.00	5000.00	\N	\N	\N	Posted	2025-06-04 01:15:51.540258	\N
2	JE-2025-002	\N	SA	2025-06-02	2025-06-02	06	2025	\N	1.0000	\N	Accrued salaries payable	15000.00	15000.00	\N	\N	\N	Posted	2025-06-04 01:15:51.540258	\N
3	JE-2025-003	\N	SA	2025-06-03	2025-06-03	06	2025	\N	1.0000	\N	Purchase of office supplies	2500.00	2500.00	\N	\N	\N	Posted	2025-06-04 01:15:51.540258	\N
4	JE-2025-004	\N	SA	2025-06-04	2025-06-04	06	2025	\N	1.0000	\N	Bank loan interest expense	1200.00	1200.00	\N	\N	\N	Draft	2025-06-04 01:15:51.540258	\N
5	JE-2025-005	\N	SA	2025-06-05	2025-06-05	06	2025	\N	1.0000	\N	Inventory adjustment	3200.00	3200.00	\N	\N	\N	Posted	2025-06-04 01:15:51.540258	\N
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.leads (id, first_name, last_name, company_name, job_title, email, phone, status, source, industry, annual_revenue, employee_count, website, address, city, state, country, postal_code, description, last_contacted, next_followup, assigned_to, lead_score, is_converted, notes, created_at, updated_at) FROM stdin;
1	John	Smith	Tech Innovations	CTO	john.smith@techinnovations.com	(555) 123-4567	New	Website	Technology	5000000.00	50	www.techinnovations.com	\N	\N	\N	\N	\N	Interested in ERP solutions for tech startups	\N	\N	\N	\N	f	\N	2025-05-21 23:38:46.934661	2025-05-21 23:38:46.934661
2	Emma	Johnson	Healthcare Solutions	Director of Operations	emma.johnson@healthcaresolutions.com	(555) 234-5678	New	Trade Show	Healthcare	12000000.00	120	www.healthcaresolutions.com	\N	\N	\N	\N	\N	Looking for inventory management solutions	\N	\N	\N	\N	f	\N	2025-05-21 23:38:46.95743	2025-05-21 23:38:46.95743
3	Michael	Davis	Davis Manufacturing	CEO	michael.davis@davismanufacturing.com	(555) 345-6789	New	Referral	Manufacturing	8500000.00	75	www.davismanufacturing.com	\N	\N	\N	\N	\N	Needs a complete ERP system	\N	\N	\N	\N	f	\N	2025-05-21 23:38:46.975151	2025-05-21 23:38:46.975151
4	Sarah	Wilson	Wilson Retail Group	Procurement Manager	sarah.wilson@wilsonretail.com	(555) 456-7890	New	Email Campaign	Retail	20000000.00	200	www.wilsonretail.com	\N	\N	\N	\N	\N	Interested in inventory and POS integration	\N	\N	\N	\N	f	\N	2025-05-21 23:38:46.993483	2025-05-21 23:38:46.993483
5	Robert	Brown	Brown Financial	CFO	robert.brown@brownfinancial.com	(555) 567-8901	New	Webinar	Financial Services	15000000.00	65	www.brownfinancial.com	\N	\N	\N	\N	\N	Looking for financial management modules	\N	\N	\N	\N	f	\N	2025-05-21 23:38:47.012149	2025-05-21 23:38:47.012149
6	Jennifer	Lee	Lee Education Services	Director	jennifer.lee@leeeducation.com	(555) 678-9012	Contacted	Website	Education	3000000.00	30	www.leeeducation.com	\N	\N	\N	\N	\N	Initial call completed, requested demo	2025-05-18 23:38:46.923	2025-05-28 23:38:46.924	\N	\N	f	\N	2025-05-21 23:38:47.034029	2025-05-21 23:38:47.034029
7	David	Miller	Miller Tech Solutions	COO	david.miller@millertech.com	(555) 789-0123	Contacted	Social Media	Technology	7500000.00	45	www.millertech.com	\N	\N	\N	\N	\N	Spoke about inventory needs, follow up with pricing	2025-05-16 23:38:46.924	2025-05-26 23:38:46.924	\N	\N	f	\N	2025-05-21 23:38:47.05167	2025-05-21 23:38:47.05167
8	Patricia	Garcia	Garcia Manufacturing	Operations Manager	patricia.garcia@garciamanufacturing.com	(555) 890-1234	Contacted	Trade Show	Manufacturing	10000000.00	90	www.garciamanufacturing.com	\N	\N	\N	\N	\N	Initial discussion about production modules	2025-05-19 23:38:46.924	2025-05-31 23:38:46.924	\N	\N	f	\N	2025-05-21 23:38:47.06892	2025-05-21 23:38:47.06892
9	James	Taylor	Taylor Consulting	Managing Partner	james.taylor@taylorconsulting.com	(555) 901-2345	Contacted	Referral	Professional Services	2500000.00	15	www.taylorconsulting.com	\N	\N	\N	\N	\N	Had intro call, wants demo next week	2025-05-20 23:38:46.924	2025-05-27 23:38:46.924	\N	\N	f	\N	2025-05-21 23:38:47.086203	2025-05-21 23:38:47.086203
10	Elizabeth	Moore	Moore Health Systems	CIO	elizabeth.moore@moorehealth.com	(555) 012-3456	Qualified	Webinar	Healthcare	18000000.00	150	www.moorehealth.com	\N	\N	\N	\N	\N	Completed needs assessment, high potential	2025-05-13 23:38:46.924	2025-05-24 23:38:46.924	\N	85	f	\N	2025-05-21 23:38:47.104021	2025-05-21 23:38:47.104021
11	William	White	White Industries	VP of Operations	william.white@whiteindustries.com	(555) 123-4567	Qualified	Partner	Manufacturing	25000000.00	200	www.whiteindustries.com	\N	\N	\N	\N	\N	Ready for detailed proposal, budget approved	2025-05-17 23:38:46.924	2025-05-23 23:38:46.924	\N	90	f	\N	2025-05-21 23:38:47.121482	2025-05-21 23:38:47.121482
12	Barbara	Jones	Jones Retail	CEO	barbara.jones@jonesretail.com	(555) 234-5678	Qualified	Website	Retail	12000000.00	120	www.jonesretail.com	\N	\N	\N	\N	\N	Completed requirements gathering, good fit	2025-05-15 23:38:46.924	2025-05-25 23:38:46.924	\N	80	f	\N	2025-05-21 23:38:47.139809	2025-05-21 23:38:47.139809
13	Richard	Clark	Clark Financial	Director of IT	richard.clark@clarkfinancial.com	(555) 345-6789	Qualified	Email Campaign	Financial Services	30000000.00	80	www.clarkfinancial.com	\N	\N	\N	\N	\N	Has specific requirements, ready for formal quote	2025-05-11 23:38:46.924	2025-05-22 23:38:46.924	\N	95	f	\N	2025-05-21 23:38:47.158429	2025-05-21 23:38:47.158429
14	Susan	Anderson	Anderson Academy	President	susan.anderson@andersonacademy.edu	(555) 456-7890	Nurturing	Trade Show	Education	5000000.00	75	www.andersonacademy.edu	\N	\N	\N	\N	\N	Interested but no budget until next quarter	2025-05-06 23:38:46.924	2025-06-20 23:38:46.924	\N	60	f	\N	2025-05-21 23:38:47.178116	2025-05-21 23:38:47.178116
15	Thomas	Martinez	Martinez Technologies	CTO	thomas.martinez@martineztech.com	(555) 567-8901	Nurturing	Webinar	Technology	8000000.00	40	www.martineztech.com	\N	\N	\N	\N	\N	Needs more education about solution benefits	2025-05-01 23:38:46.924	2025-06-05 23:38:46.924	\N	45	f	\N	2025-05-21 23:38:47.195594	2025-05-21 23:38:47.195594
16	Mary	Robinson	Robinson Healthcare	Procurement Director	mary.robinson@robinsonhealth.com	(555) 678-9012	Nurturing	Social Media	Healthcare	15000000.00	130	www.robinsonhealth.com	\N	\N	\N	\N	\N	Still researching options, send case studies	2025-05-09 23:38:46.924	2025-06-10 23:38:46.924	\N	55	f	\N	2025-05-21 23:38:47.21573	2025-05-21 23:38:47.21573
17	Charles	Lewis	Lewis Manufacturing	Operations Director	charles.lewis@lewismanufacturing.com	(555) 789-0123	Nurturing	Email Campaign	Manufacturing	20000000.00	180	www.lewismanufacturing.com	\N	\N	\N	\N	\N	Implementing another system now, revisit later	2025-04-26 23:38:46.924	2025-07-20 23:38:46.924	\N	40	f	\N	2025-05-21 23:38:47.233772	2025-05-21 23:38:47.233772
18	Lisa	Walker	Walker Group	CFO	lisa.walker@walkergroup.com	(555) 890-1234	Disqualified	Website	Professional Services	1000000.00	8	www.walkergroup.com	\N	\N	\N	\N	\N	Too small for our solution, not a good fit	2025-04-21 23:38:46.924	\N	\N	10	f	\N	2025-05-21 23:38:47.251179	2025-05-21 23:38:47.251179
19	Daniel	Hall	Hall Tech	CEO	daniel.hall@halltech.com	(555) 901-2345	Disqualified	Cold Call	Technology	500000.00	5	www.halltech.com	\N	\N	\N	\N	\N	No budget, using free alternatives	2025-04-06 23:38:46.924	\N	\N	5	f	\N	2025-05-21 23:38:47.268622	2025-05-21 23:38:47.268622
20	Nancy	Allen	Allen Consulting	Principal	nancy.allen@allenconsulting.com	(555) 012-3456	Disqualified	Partner	Professional Services	750000.00	4	www.allenconsulting.com	\N	\N	\N	\N	\N	Outside our target market segment	2025-03-22 23:38:46.924	\N	\N	15	f	\N	2025-05-21 23:38:47.286383	2025-05-21 23:38:47.286383
21	Paul	Young	Young Enterprises	Owner	paul.young@youngenterprises.com	(555) 123-4567	Disqualified	Trade Show	Retail	300000.00	3	www.youngenterprises.com	\N	\N	\N	\N	\N	Selected competitor solution	2025-05-06 23:38:46.924	\N	\N	20	f	\N	2025-05-21 23:38:47.303792	2025-05-21 23:38:47.303792
22	Sam	Josh	samJ	\N	samj@gmail.com		Contacted	Website	Technology	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	2025-05-22 19:00:33.604778	2025-05-22 19:00:33.604778
23	aF		TES	\N	sapbdc1@mail.com	22	Qualified	Website		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	2025-05-23 01:53:09.735372	2025-05-23 01:53:09.735372
24	Rita		May23	\N	Rita12@mail.com		New	Website		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	2025-05-23 04:51:05.225758	2025-05-23 04:51:05.225758
\.


--
-- Data for Name: material_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.material_categories (id, code, name, description, parent_id, created_at, updated_at) FROM stdin;
1	RM	Raw Materials	Base materials used in production	\N	2025-05-21 15:12:13.362374	2025-05-21 15:12:13.362374
2	FG	Finished Goods	Products ready for sale	\N	2025-05-21 15:12:13.362374	2025-05-21 15:12:13.362374
3	SFG	Semi-finished	Intermediate products	\N	2025-05-21 15:12:13.362374	2025-05-21 15:12:13.362374
4	SPRT	Spare Parts	Components for maintenance and repair	\N	2025-05-21 15:12:13.362374	2025-05-21 15:12:13.362374
5	PKG	Packaging	Materials used for packaging products	\N	2025-05-21 15:12:13.362374	2025-05-21 15:12:13.362374
6	CONS	Consumables	Materials consumed during production	\N	2025-05-21 15:12:13.362374	2025-05-21 15:12:13.362374
7	RM-MET	Metals	Metal raw materials	1	2025-05-21 15:12:24.470947	2025-05-21 15:12:24.470947
8	RM-PLST	Plastics	Plastic raw materials	1	2025-05-21 15:12:24.470947	2025-05-21 15:12:24.470947
9	FG-ELEC	Electronics	Electronic finished products	2	2025-05-21 15:12:24.470947	2025-05-21 15:12:24.470947
10	FG-TOOL	Tools	Hand and power tools	2	2025-05-21 15:12:24.470947	2025-05-21 15:12:24.470947
11	PKG-BOX	Boxes	Cardboard and corrugated boxes	5	2025-05-21 15:12:24.470947	2025-05-21 15:12:24.470947
\.


--
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.materials (id, code, name, description, long_description, type, uom_id, category_id, weight, weight_uom_id, dimensions, base_unit_price, cost, min_order_qty, order_multiple, procurement_type, min_stock, max_stock, reorder_point, lead_time, shelf_life, lot_size, mrp_type, planning_policy, is_active, is_sellable, is_purchasable, is_manufactured, is_stockable, created_at, updated_at, created_by, updated_by, version) FROM stdin;
1	RM-1001	Aluminum Sheet	High-grade aluminum sheet for industrial use	\N	RAW	1	1	1	1	{"width": "1000mm", "height": "2mm", "length": "1000mm"}	7.5	5.25	10	5	external	20	100	30	7	0	EX	reorder_point	standard	t	t	t	f	t	2025-05-20 14:36:38.689364	2025-05-20 14:36:38.689364	\N	\N	1
2	RM-1002	Steel Rod	Carbon steel rod for structural applications	\N	RAW	1	1	2.5	1	{"length": "2m", "diameter": "20mm"}	8.75	6.5	10	5	external	15	80	20	5	0	EX	reorder_point	standard	t	t	t	f	t	2025-05-20 14:36:38.705246	2025-05-20 14:36:38.705246	\N	\N	1
3	RM-1003	Plastic Granulate	ABS plastic granulate for injection molding	\N	RAW	1	1	1	1	{"bulk": true}	3.25	2.1	25	25	external	50	300	75	10	730	EX	reorder_point	lot_for_lot	t	f	t	f	t	2025-05-20 14:36:38.720782	2025-05-20 14:36:38.720782	\N	\N	1
4	RM-1004	Copper Wire	Industrial grade copper wire	\N	RAW	4	1	0.05	1	{"diameter": "2mm"}	6.5	4.2	100	50	external	200	1000	300	15	0	EX	reorder_point	standard	t	f	t	f	t	2025-05-20 14:36:38.735852	2025-05-20 14:36:38.735852	\N	\N	1
5	RM-1005	Cotton Fabric	Premium cotton fabric for textile manufacturing	\N	RAW	5	1	0.2	1	{"width": "1.5m"}	4.25	3	50	10	external	100	500	150	12	365	EX	reorder_point	standard	t	f	t	f	t	2025-05-20 14:36:38.750003	2025-05-20 14:36:38.750003	\N	\N	1
6	SF-2001	Aluminum Frame	Partially assembled aluminum frame	\N	SEMI	10	1	3.2	1	{"width": "0.8m", "height": "0.1m", "length": "1.2m"}	35	22.5	5	5	in-house	10	50	15	3	0	EX	make_to_stock	lot_for_lot	t	f	f	t	t	2025-05-20 14:36:38.765285	2025-05-20 14:36:38.765285	\N	\N	1
7	SF-2002	PCB Assembly	Partially assembled printed circuit board	\N	SEMI	10	1	0.15	1	{"width": "80mm", "height": "2mm", "length": "120mm"}	28.5	18	10	5	in-house	20	100	30	5	365	EX	make_to_stock	lot_for_lot	t	f	f	t	t	2025-05-20 14:36:38.779297	2025-05-20 14:36:38.779297	\N	\N	1
8	SF-2003	Injection Molded Housing	Plastic housing for electronic devices	\N	SEMI	10	1	0.45	1	{"width": "150mm", "height": "50mm", "length": "200mm"}	12.75	8.5	25	25	in-house	50	250	75	2	0	EX	make_to_stock	lot_for_lot	t	f	f	t	t	2025-05-20 14:36:38.794055	2025-05-20 14:36:38.794055	\N	\N	1
9	FG-3001	Smart Thermostat	IoT-enabled smart thermostat for home automation	\N	FINI	10	1	0.85	1	{"width": "80mm", "height": "35mm", "length": "120mm"}	85	45	1	1	in-house	10	50	15	7	730	EX	make_to_stock	lot_for_lot	t	t	f	t	t	2025-05-20 14:36:38.808153	2025-05-20 14:36:38.808153	\N	\N	1
10	FG-3002	Industrial Control Panel	Advanced control panel for manufacturing equipment	\N	FINI	10	1	12.5	1	{"width": "450mm", "height": "200mm", "length": "600mm"}	1250	750	1	1	in-house	2	10	3	15	1825	EX	make_to_order	lot_for_lot	t	t	f	t	t	2025-05-20 14:36:38.822432	2025-05-20 14:36:38.822432	\N	\N	1
11	FG-3003	LED Light Fixture	Energy-efficient LED ceiling light fixture	\N	FINI	10	1	1.8	1	{"width": "300mm", "height": "100mm", "length": "300mm"}	65	38	1	1	in-house	15	75	25	5	1825	EX	make_to_stock	lot_for_lot	t	t	f	t	t	2025-05-20 14:36:38.83712	2025-05-20 14:36:38.83712	\N	\N	1
12	FG-3004	Wireless Router	High-speed wireless router for home and office	\N	FINI	10	1	0.9	1	{"width": "180mm", "height": "40mm", "length": "230mm"}	120	75	1	1	external	20	100	30	7	1095	EX	make_to_stock	standard	t	t	t	f	t	2025-05-20 14:36:38.851882	2025-05-20 14:36:38.851882	\N	\N	1
13	FG-3005	Electric Motor	Industrial electric motor for manufacturing equipment	\N	FINI	10	1	35	1	{"width": "250mm", "height": "250mm", "length": "350mm"}	890	650	1	1	external	3	15	5	21	3650	EX	make_to_order	standard	t	t	t	f	t	2025-05-20 14:36:38.866115	2025-05-20 14:36:38.866115	\N	\N	1
14	PM-4001	Cardboard Box - Small	Corrugated cardboard box for shipping small items	\N	PACK	10	1	0.15	1	{"width": "200mm", "height": "200mm", "length": "200mm"}	1.25	0.85	100	100	external	250	1000	350	3	365	EX	reorder_point	lot_for_lot	t	f	t	f	t	2025-05-20 14:36:38.885914	2025-05-20 14:36:38.885914	\N	\N	1
16	CHEM-001	Industrial Cleaning Solution	Multi-purpose industrial cleaning solution	\N	RAW	1	1	\N	\N	\N	25.5	15.75	\N	\N	\N	10	50	\N	\N	\N	\N	\N	\N	t	f	f	f	t	2025-05-20 16:14:07.491142	2025-05-20 16:14:07.491142	\N	\N	1
17	TOOL-001	Precision Measurement Tool	High-accuracy digital measurement tool	\N	FINI	1	1	\N	\N	\N	199.99	125	\N	\N	\N	2	10	\N	\N	\N	\N	\N	\N	t	f	f	f	t	2025-05-20 16:14:07.580166	2025-05-20 16:14:07.580166	\N	\N	1
\.


--
-- Data for Name: opportunities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.opportunities (id, name, lead_id, customer_id, status, stage, amount, expected_revenue, probability, close_date, next_step, type, source, campaign_source, description, assigned_to, is_closed, is_won, notes, created_at, updated_at) FROM stdin;
1	Lee Education Services - Education Solution	6	\N	Open	Prospecting	98612.00	9861.20	10	2025-08-23 23:38:47.376	Follow up with Jennifer	Upgrade	Lead Conversion	\N	Opportunity for Lee Education Services in the Education industry	\N	f	f	\N	2025-05-21 23:38:47.38633	2025-05-21 23:38:47.38633
2	Miller Tech Solutions - Technology Solution	7	\N	Open	Qualification	67801.00	13560.20	20	2025-09-01 23:38:47.376	Follow up with David	Existing Business	Lead Conversion	\N	Opportunity for Miller Tech Solutions in the Technology industry	\N	f	f	\N	2025-05-21 23:38:47.405549	2025-05-21 23:38:47.405549
3	Garcia Manufacturing - Manufacturing Solution	8	\N	Open	Needs Analysis	38398.00	11519.40	30	2025-10-23 23:38:47.376	Follow up with Patricia	New Business	Lead Conversion	\N	Opportunity for Garcia Manufacturing in the Manufacturing industry	\N	f	f	\N	2025-05-21 23:38:47.423186	2025-05-21 23:38:47.423186
4	Taylor Consulting - Professional Services Solution	9	\N	Open	Value Proposition	30785.00	12314.00	40	2025-10-05 23:38:47.376	Follow up with James	Existing Business	Lead Conversion	\N	Opportunity for Taylor Consulting in the Professional Services industry	\N	f	f	\N	2025-05-21 23:38:47.440964	2025-05-21 23:38:47.440964
5	Moore Health Systems - Healthcare Solution	10	\N	Open	Identify Decision Makers	59384.00	29692.00	50	2025-08-24 23:38:47.376	Follow up with Elizabeth	New Business	Lead Conversion	\N	Opportunity for Moore Health Systems in the Healthcare industry	\N	f	f	\N	2025-05-21 23:38:47.459055	2025-05-21 23:38:47.459055
6	White Industries - Manufacturing Solution	11	\N	Open	Proposal/Price Quote	34939.00	20963.40	60	2025-09-06 23:38:47.376	Follow up with William	Upgrade	Lead Conversion	\N	Opportunity for White Industries in the Manufacturing industry	\N	f	f	\N	2025-05-21 23:38:47.476515	2025-05-21 23:38:47.476515
7	Jones Retail - Retail Solution	12	\N	Open	Negotiation/Review	63504.00	47628.00	75	2025-07-04 23:38:47.376	Follow up with Barbara	Upgrade	Lead Conversion	\N	Opportunity for Jones Retail in the Retail industry	\N	f	f	\N	2025-05-21 23:38:47.49444	2025-05-21 23:38:47.49444
8	Clark Financial - Financial Services Solution	13	\N	Closed Won	Closed Won	89097.00	89097.00	100	2025-05-21 23:38:47.376	None	Existing Business	Lead Conversion	\N	Opportunity for Clark Financial in the Financial Services industry	\N	t	t	\N	2025-05-21 23:38:47.512112	2025-05-21 23:38:47.512112
9	Lee Education Services - Education Solution	6	\N	Closed Lost	Closed Lost	90911.00	0.00	0	2025-05-11 23:38:47.376	None	New Business	Lead Conversion	\N	Opportunity for Lee Education Services in the Education industry	\N	t	f	\N	2025-05-21 23:38:47.532369	2025-05-21 23:38:47.532369
10	Jones Retail - Additional Retail Project	12	\N	Open	Qualification	28807.00	5761.40	20	2025-06-02 23:38:47.376	Schedule meeting with Barbara	Upgrade	Lead Conversion	\N	Additional opportunity for Jones Retail in the Retail industry	\N	f	f	\N	2025-05-21 23:38:47.550037	2025-05-21 23:38:47.550037
11	Clark Financial - Additional Financial Services Project	13	\N	Open	Needs Analysis	43756.00	13126.80	30	2025-05-31 23:38:47.376	Schedule meeting with Richard	Upgrade	Lead Conversion	\N	Additional opportunity for Clark Financial in the Financial Services industry	\N	f	f	\N	2025-05-21 23:38:47.568149	2025-05-21 23:38:47.568149
12	Jones Retail - Additional Retail Project	12	\N	Open	Identify Decision Makers	75321.00	37660.50	50	2025-08-06 23:38:47.376	Schedule meeting with Barbara	New Business	Lead Conversion	\N	Additional opportunity for Jones Retail in the Retail industry	\N	f	f	\N	2025-05-21 23:38:47.585741	2025-05-21 23:38:47.585741
13	Taylor Consulting - Additional Professional Services Project	9	\N	Open	Proposal/Price Quote	26130.00	15678.00	60	2025-06-15 23:38:47.376	Schedule meeting with James	Upgrade	Lead Conversion	\N	Additional opportunity for Taylor Consulting in the Professional Services industry	\N	f	f	\N	2025-05-21 23:38:47.603145	2025-05-21 23:38:47.603145
14	Lee Education Services - Additional Education Project	6	\N	Open	Negotiation/Review	15916.00	11937.00	75	2025-07-09 23:38:47.376	Schedule meeting with Jennifer	Existing Business	Lead Conversion	\N	Additional opportunity for Lee Education Services in the Education industry	\N	f	f	\N	2025-05-21 23:38:47.620392	2025-05-21 23:38:47.620392
15	Jones Retail - Additional Retail Project	12	\N	Open	Prospecting	18557.00	1855.70	10	2025-07-02 23:38:47.376	Schedule meeting with Barbara	New Business	Lead Conversion	\N	Additional opportunity for Jones Retail in the Retail industry	\N	f	f	\N	2025-05-21 23:38:47.637868	2025-05-21 23:38:47.637868
16	Miller Tech Solutions - Additional Technology Project	7	\N	Open	Value Proposition	14051.00	5620.40	40	2025-06-16 23:38:47.376	Schedule meeting with David	Existing Business	Lead Conversion	\N	Additional opportunity for Miller Tech Solutions in the Technology industry	\N	f	f	\N	2025-05-21 23:38:47.655522	2025-05-21 23:38:47.655522
17	NewOpportunity	2	\N	Open	Needs Analysis	200.00	0.00	10	2025-05-23 00:00:00		New Business	Manual Entry	\N		\N	f	f	\N	2025-05-23 01:33:26.916831	2025-05-23 01:33:26.916831
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_items (id, order_id, product_id, quantity, unit_price, total, created_at, updated_at) FROM stdin;
2	3	15	7	39.99	279.93	2025-05-21 16:29:36.011	2025-05-21 16:29:36.011
3	3	17	3	129.99	389.97	2025-05-21 16:29:36.028	2025-05-21 16:29:36.028
4	3	8	10	79.99	799.9	2025-05-21 16:29:36.045	2025-05-21 16:29:36.045
5	3	13	6	999.99	5999.9400000000005	2025-05-21 16:29:36.061	2025-05-21 16:29:36.061
6	4	5	7	349.99	2449.9300000000003	2025-05-21 16:29:36.146	2025-05-21 16:29:36.146
7	5	13	10	999.99	9999.9	2025-05-21 16:29:36.193	2025-05-21 16:29:36.193
8	6	7	4	49.99	199.96	2025-05-21 16:29:36.241	2025-05-21 16:29:36.241
9	6	17	7	129.99	909.9300000000001	2025-05-21 16:29:36.257	2025-05-21 16:29:36.257
10	6	18	8	149.99	1199.92	2025-05-21 16:29:36.272	2025-05-21 16:29:36.272
11	7	5	10	349.99	3499.9	2025-05-21 16:29:36.32	2025-05-21 16:29:36.32
12	8	16	10	59.99	599.9	2025-05-21 16:29:36.367	2025-05-21 16:29:36.367
13	8	2	7	249.99	1749.93	2025-05-21 16:29:36.383	2025-05-21 16:29:36.383
14	8	18	2	149.99	299.98	2025-05-21 16:29:36.399	2025-05-21 16:29:36.399
15	9	13	1	999.99	999.99	2025-05-21 16:29:36.447	2025-05-21 16:29:36.447
16	9	10	6	179.99	1079.94	2025-05-21 16:29:36.462	2025-05-21 16:29:36.462
17	10	4	3	129.99	389.97	2025-05-21 16:29:36.509	2025-05-21 16:29:36.509
18	11	14	2	69.99	139.98	2025-05-21 16:29:36.559	2025-05-21 16:29:36.559
19	11	18	7	149.99	1049.93	2025-05-21 16:29:36.575	2025-05-21 16:29:36.575
20	11	5	10	349.99	3499.9	2025-05-21 16:29:36.59	2025-05-21 16:29:36.59
21	12	19	10	49.99	499.90000000000003	2025-05-21 16:29:36.638	2025-05-21 16:29:36.638
22	12	8	9	79.99	719.91	2025-05-21 16:29:36.657	2025-05-21 16:29:36.657
23	12	20	1	399.99	399.99	2025-05-21 16:29:36.673	2025-05-21 16:29:36.673
24	12	5	10	349.99	3499.9	2025-05-21 16:29:36.689	2025-05-21 16:29:36.689
25	13	4	6	129.99	779.94	2025-05-21 16:29:36.742	2025-05-21 16:29:36.742
26	14	8	2	79.99	159.98	2025-05-21 16:29:36.79	2025-05-21 16:29:36.79
27	14	5	9	349.99	3149.91	2025-05-21 16:29:36.806	2025-05-21 16:29:36.806
28	14	16	6	59.99	359.94	2025-05-21 16:29:36.822	2025-05-21 16:29:36.822
29	15	13	2	999.99	1999.98	2025-05-21 16:29:36.87	2025-05-21 16:29:36.87
30	15	4	5	129.99	649.95	2025-05-21 16:29:36.885	2025-05-21 16:29:36.885
31	16	1	1	1299.99	1299.99	2025-05-21 16:29:36.932	2025-05-21 16:29:36.932
32	16	20	10	399.99	3999.9	2025-05-21 16:29:36.948	2025-05-21 16:29:36.948
33	17	17	5	129.99	649.95	2025-05-21 16:29:36.995	2025-05-21 16:29:36.995
34	17	19	4	49.99	199.96	2025-05-21 16:29:37.01	2025-05-21 16:29:37.01
35	18	1	3	1299.99	3899.9700000000003	2025-05-21 16:29:37.058	2025-05-21 16:29:37.058
36	18	19	3	49.99	149.97	2025-05-21 16:29:37.074	2025-05-21 16:29:37.074
37	18	2	1	249.99	249.99	2025-05-21 16:29:37.09	2025-05-21 16:29:37.09
38	19	9	3	299.99	899.97	2025-05-21 16:29:37.137	2025-05-21 16:29:37.137
39	19	16	6	59.99	359.94	2025-05-21 16:29:37.153	2025-05-21 16:29:37.153
40	19	14	4	69.99	279.96	2025-05-21 16:29:37.169	2025-05-21 16:29:37.169
41	19	10	9	179.99	1619.91	2025-05-21 16:29:37.185	2025-05-21 16:29:37.185
42	20	9	5	299.99	1499.95	2025-05-21 16:29:37.233	2025-05-21 16:29:37.233
43	20	12	10	499.99	4999.9	2025-05-21 16:29:37.249	2025-05-21 16:29:37.249
44	20	1	1	1299.99	1299.99	2025-05-21 16:29:37.265	2025-05-21 16:29:37.265
45	20	8	8	79.99	639.92	2025-05-21 16:29:37.28	2025-05-21 16:29:37.28
46	20	3	5	599.99	2999.95	2025-05-21 16:29:37.296	2025-05-21 16:29:37.296
47	21	6	8	89.99	719.92	2025-05-21 16:29:37.367	2025-05-21 16:29:37.367
48	21	2	9	249.99	2249.91	2025-05-21 16:29:37.383	2025-05-21 16:29:37.383
49	22	3	3	599.99	1799.97	2025-05-21 16:29:37.437	2025-05-21 16:29:37.437
50	22	5	4	349.99	1399.96	2025-05-21 16:29:37.453	2025-05-21 16:29:37.453
51	23	3	9	599.99	5399.91	2025-05-21 16:29:37.499	2025-05-21 16:29:37.499
52	23	13	9	999.99	8999.91	2025-05-21 16:29:37.515	2025-05-21 16:29:37.515
53	23	12	10	499.99	4999.9	2025-05-21 16:29:37.531	2025-05-21 16:29:37.531
54	24	4	8	129.99	1039.92	2025-05-21 16:29:37.578	2025-05-21 16:29:37.578
55	25	15	8	39.99	319.92	2025-05-21 16:29:37.625	2025-05-21 16:29:37.625
56	25	5	6	349.99	2099.94	2025-05-21 16:29:37.641	2025-05-21 16:29:37.641
57	25	4	4	129.99	519.96	2025-05-21 16:29:37.657	2025-05-21 16:29:37.657
58	26	20	2	399.99	799.98	2025-05-21 16:29:37.705	2025-05-21 16:29:37.705
59	26	4	5	129.99	649.95	2025-05-21 16:29:37.721	2025-05-21 16:29:37.721
60	26	9	2	299.99	599.98	2025-05-21 16:29:37.737	2025-05-21 16:29:37.737
61	26	15	6	39.99	239.94	2025-05-21 16:29:37.752	2025-05-21 16:29:37.752
62	27	3	9	599.99	5399.91	2025-05-21 16:29:37.816	2025-05-21 16:29:37.816
63	28	5	1	349.99	349.99	2025-05-21 16:29:37.879	2025-05-21 16:29:37.879
64	28	9	5	299.99	1499.95	2025-05-21 16:29:37.894	2025-05-21 16:29:37.894
65	28	15	1	39.99	39.99	2025-05-21 16:29:37.91	2025-05-21 16:29:37.91
66	29	15	1	39.99	39.99	2025-05-21 16:29:37.957	2025-05-21 16:29:37.957
67	29	12	10	499.99	4999.9	2025-05-21 16:29:37.972	2025-05-21 16:29:37.972
68	30	12	4	499.99	1999.96	2025-05-21 16:29:38.019	2025-05-21 16:29:38.019
69	30	5	4	349.99	1399.96	2025-05-21 16:29:38.034	2025-05-21 16:29:38.034
70	31	13	5	999.99	4999.95	2025-05-21 16:29:38.082	2025-05-21 16:29:38.082
71	31	14	1	69.99	69.99	2025-05-21 16:29:38.097	2025-05-21 16:29:38.097
72	32	8	3	79.99	239.96999999999997	2025-05-21 16:29:38.16	2025-05-21 16:29:38.16
73	33	12	9	499.99	4499.91	2025-05-21 16:29:38.208	2025-05-21 16:29:38.208
74	34	18	8	149.99	1199.92	2025-05-21 16:29:38.255	2025-05-21 16:29:38.255
75	34	13	8	999.99	7999.92	2025-05-21 16:29:38.271	2025-05-21 16:29:38.271
76	34	14	10	69.99	699.9	2025-05-21 16:29:38.286	2025-05-21 16:29:38.286
77	34	9	5	299.99	1499.95	2025-05-21 16:29:38.302	2025-05-21 16:29:38.302
78	35	19	3	49.99	149.97	2025-05-21 16:29:38.349	2025-05-21 16:29:38.349
79	35	9	3	299.99	899.97	2025-05-21 16:29:38.365	2025-05-21 16:29:38.365
80	36	7	7	49.99	349.93	2025-05-21 16:29:38.412	2025-05-21 16:29:38.412
81	36	8	10	79.99	799.9	2025-05-21 16:29:38.428	2025-05-21 16:29:38.428
82	36	5	1	349.99	349.99	2025-05-21 16:29:38.443	2025-05-21 16:29:38.443
83	36	17	7	129.99	909.9300000000001	2025-05-21 16:29:38.459	2025-05-21 16:29:38.459
84	36	10	9	179.99	1619.91	2025-05-21 16:29:38.475	2025-05-21 16:29:38.475
85	37	8	4	79.99	319.96	2025-05-21 16:29:38.539	2025-05-21 16:29:38.539
86	38	2	1	249.99	249.99	2025-05-21 16:29:38.586	2025-05-21 16:29:38.586
87	38	1	7	1299.99	9099.93	2025-05-21 16:29:38.611	2025-05-21 16:29:38.611
88	39	9	1	299.99	299.99	2025-05-21 16:29:38.659	2025-05-21 16:29:38.659
89	39	5	8	349.99	2799.92	2025-05-21 16:29:38.676	2025-05-21 16:29:38.676
90	39	10	8	179.99	1439.92	2025-05-21 16:29:38.692	2025-05-21 16:29:38.692
91	39	3	8	599.99	4799.92	2025-05-21 16:29:38.708	2025-05-21 16:29:38.708
92	40	7	8	49.99	399.92	2025-05-21 16:29:38.771	2025-05-21 16:29:38.771
93	40	5	5	349.99	1749.95	2025-05-21 16:29:38.787	2025-05-21 16:29:38.787
94	40	11	4	899.99	3599.96	2025-05-21 16:29:38.805	2025-05-21 16:29:38.805
95	41	10	6	179.99	1079.94	2025-05-21 16:29:38.869	2025-05-21 16:29:38.869
96	41	9	8	299.99	2399.92	2025-05-21 16:29:38.885	2025-05-21 16:29:38.885
97	42	4	1	129.99	129.99	2025-05-21 16:29:38.933	2025-05-21 16:29:38.933
98	42	3	8	599.99	4799.92	2025-05-21 16:29:38.949	2025-05-21 16:29:38.949
99	42	14	8	69.99	559.92	2025-05-21 16:29:38.965	2025-05-21 16:29:38.965
100	42	17	2	129.99	259.98	2025-05-21 16:29:38.981	2025-05-21 16:29:38.981
101	43	2	7	249.99	1749.93	2025-05-21 16:29:39.028	2025-05-21 16:29:39.028
102	43	18	6	149.99	899.94	2025-05-21 16:29:39.044	2025-05-21 16:29:39.044
103	43	14	8	69.99	559.92	2025-05-21 16:29:39.06	2025-05-21 16:29:39.06
104	44	1	4	1299.99	5199.96	2025-05-21 16:29:39.108	2025-05-21 16:29:39.108
105	44	6	3	89.99	269.96999999999997	2025-05-21 16:29:39.124	2025-05-21 16:29:39.124
106	44	13	6	999.99	5999.9400000000005	2025-05-21 16:29:39.139	2025-05-21 16:29:39.139
107	45	15	2	39.99	79.98	2025-05-21 16:29:39.187	2025-05-21 16:29:39.187
108	45	9	3	299.99	899.97	2025-05-21 16:29:39.202	2025-05-21 16:29:39.202
109	45	13	1	999.99	999.99	2025-05-21 16:29:39.224	2025-05-21 16:29:39.224
110	45	12	8	499.99	3999.92	2025-05-21 16:29:39.24	2025-05-21 16:29:39.24
111	45	18	1	149.99	149.99	2025-05-21 16:29:39.256	2025-05-21 16:29:39.256
112	46	17	8	129.99	1039.92	2025-05-21 16:29:39.305	2025-05-21 16:29:39.305
113	46	18	2	149.99	299.98	2025-05-21 16:29:39.322	2025-05-21 16:29:39.322
114	46	10	5	179.99	899.95	2025-05-21 16:29:39.338	2025-05-21 16:29:39.338
115	47	1	8	1299.99	10399.92	2025-05-21 16:29:39.386	2025-05-21 16:29:39.386
116	47	6	5	89.99	449.95	2025-05-21 16:29:39.401	2025-05-21 16:29:39.401
117	48	6	5	89.99	449.95	2025-05-21 16:29:39.448	2025-05-21 16:29:39.448
118	48	5	1	349.99	349.99	2025-05-21 16:29:39.464	2025-05-21 16:29:39.464
119	48	14	1	69.99	69.99	2025-05-21 16:29:39.48	2025-05-21 16:29:39.48
120	49	3	2	599.99	1199.98	2025-05-21 16:29:39.543	2025-05-21 16:29:39.543
121	50	3	7	599.99	4199.93	2025-05-21 16:29:39.605	2025-05-21 16:29:39.605
122	50	16	10	59.99	599.9	2025-05-21 16:29:39.622	2025-05-21 16:29:39.622
123	51	17	10	129.99	1299.9	2025-05-21 16:29:39.669	2025-05-21 16:29:39.669
124	51	4	9	129.99	1169.91	2025-05-21 16:29:39.685	2025-05-21 16:29:39.685
125	51	8	4	79.99	319.96	2025-05-21 16:29:39.701	2025-05-21 16:29:39.701
126	51	9	3	299.99	899.97	2025-05-21 16:29:39.718	2025-05-21 16:29:39.718
127	51	3	5	599.99	2999.95	2025-05-21 16:29:39.733	2025-05-21 16:29:39.733
128	52	14	8	69.99	559.92	2025-05-21 16:29:39.781	2025-05-21 16:29:39.781
129	52	1	4	1299.99	5199.96	2025-05-21 16:29:39.796	2025-05-21 16:29:39.796
130	52	20	10	399.99	3999.9	2025-05-21 16:29:39.812	2025-05-21 16:29:39.812
131	52	3	9	599.99	5399.91	2025-05-21 16:29:39.828	2025-05-21 16:29:39.828
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders (id, order_number, customer_id, date, status, total, notes, shipping_address, user_id, created_at, updated_at) FROM stdin;
3	SO-10000	5	2025-02-11 07:25:12.502	DELIVERED	7469.740000000001	Sample order 1 for Japan Manufacturing Co.	Shipping to Japan Manufacturing Co. at their registered address	\N	2025-05-21 16:29:35.988	2025-05-21 16:29:35.988
4	SO-10001	1	2025-05-13 05:02:26.31	CONFIRMED	2449.9300000000003	Sample order 2 for Acme Corporation	Shipping to Acme Corporation at their registered address	\N	2025-05-21 16:29:36.13	2025-05-21 16:29:36.13
5	SO-10002	5	2025-04-24 07:05:56.36	DRAFT	9999.9	Sample order 3 for Japan Manufacturing Co.	Shipping to Japan Manufacturing Co. at their registered address	\N	2025-05-21 16:29:36.178	2025-05-21 16:29:36.178
6	SO-10003	3	2025-03-01 02:13:26.649	DRAFT	2309.8100000000004	Sample order 4 for European Distributors Ltd	Shipping to European Distributors Ltd at their registered address	\N	2025-05-21 16:29:36.225	2025-05-21 16:29:36.225
7	SO-10004	2	2025-02-04 03:01:03.697	CONFIRMED	3499.9	Sample order 5 for Global Enterprises	Shipping to Global Enterprises at their registered address	\N	2025-05-21 16:29:36.304	2025-05-21 16:29:36.304
8	SO-10005	5	2025-02-11 09:32:58.133	DRAFT	2649.81	Sample order 6 for Japan Manufacturing Co.	Shipping to Japan Manufacturing Co. at their registered address	\N	2025-05-21 16:29:36.352	2025-05-21 16:29:36.352
9	SO-10006	1	2024-12-31 19:00:58.283	DRAFT	2079.9300000000003	Sample order 7 for Acme Corporation	Shipping to Acme Corporation at their registered address	\N	2025-05-21 16:29:36.431	2025-05-21 16:29:36.431
10	SO-10007	3	2025-05-13 13:56:33.214	PROCESSING	389.97	Sample order 8 for European Distributors Ltd	Shipping to European Distributors Ltd at their registered address	\N	2025-05-21 16:29:36.493	2025-05-21 16:29:36.493
11	SO-10008	5	2025-04-02 01:46:56.499	DRAFT	4689.81	Sample order 9 for Japan Manufacturing Co.	Shipping to Japan Manufacturing Co. at their registered address	\N	2025-05-21 16:29:36.541	2025-05-21 16:29:36.541
12	SO-10009	1	2025-05-17 16:51:54.19	DRAFT	5119.7	Sample order 10 for Acme Corporation	Shipping to Acme Corporation at their registered address	\N	2025-05-21 16:29:36.622	2025-05-21 16:29:36.622
13	SO-10010	1	2025-02-08 11:36:41.019	CONFIRMED	779.94	Sample order 11 for Acme Corporation	Shipping to Acme Corporation at their registered address	\N	2025-05-21 16:29:36.727	2025-05-21 16:29:36.727
14	SO-10011	1	2025-03-25 04:45:53.561	CONFIRMED	3669.83	Sample order 12 for Acme Corporation	Shipping to Acme Corporation at their registered address	\N	2025-05-21 16:29:36.774	2025-05-21 16:29:36.774
15	SO-10012	2	2025-04-25 09:54:02.31	DRAFT	2649.9300000000003	Sample order 13 for Global Enterprises	Shipping to Global Enterprises at their registered address	\N	2025-05-21 16:29:36.854	2025-05-21 16:29:36.854
16	SO-10013	2	2025-02-26 11:17:58.421	CONFIRMED	5299.89	Sample order 14 for Global Enterprises	Shipping to Global Enterprises at their registered address	\N	2025-05-21 16:29:36.917	2025-05-21 16:29:36.917
17	SO-10014	5	2024-12-31 20:35:27.996	DRAFT	849.9100000000001	Sample order 15 for Japan Manufacturing Co.	Shipping to Japan Manufacturing Co. at their registered address	\N	2025-05-21 16:29:36.979	2025-05-21 16:29:36.979
18	SO-10015	5	2025-05-12 17:12:33.098	CONFIRMED	4299.93	Sample order 16 for Japan Manufacturing Co.	Shipping to Japan Manufacturing Co. at their registered address	\N	2025-05-21 16:29:37.042	2025-05-21 16:29:37.042
19	SO-10016	3	2025-05-13 20:10:12.347	DRAFT	3159.78	Sample order 17 for European Distributors Ltd	Shipping to European Distributors Ltd at their registered address	\N	2025-05-21 16:29:37.121	2025-05-21 16:29:37.121
20	SO-10017	4	2025-05-01 21:09:29.634	DELIVERED	11439.71	Sample order 18 for Tech Solutions GmbH	Shipping to Tech Solutions GmbH at their registered address	\N	2025-05-21 16:29:37.218	2025-05-21 16:29:37.218
21	SO-10018	4	2024-11-22 16:16:12.929	DRAFT	2969.83	Sample order 19 for Tech Solutions GmbH	Shipping to Tech Solutions GmbH at their registered address	\N	2025-05-21 16:29:37.344	2025-05-21 16:29:37.344
22	SO-10019	1	2025-05-14 07:41:52.633	DRAFT	3199.9300000000003	Sample order 20 for Acme Corporation	Shipping to Acme Corporation at their registered address	\N	2025-05-21 16:29:37.416	2025-05-21 16:29:37.416
23	SO-10020	3	2024-11-23 20:26:31.944	DRAFT	19399.72	Sample order 21 for European Distributors Ltd	Shipping to European Distributors Ltd at their registered address	\N	2025-05-21 16:29:37.484	2025-05-21 16:29:37.484
24	SO-10021	2	2025-04-06 06:02:00.824	PROCESSING	1039.92	Sample order 22 for Global Enterprises	Shipping to Global Enterprises at their registered address	\N	2025-05-21 16:29:37.562	2025-05-21 16:29:37.562
25	SO-10022	3	2025-04-18 03:56:30.454	DRAFT	2939.82	Sample order 23 for European Distributors Ltd	Shipping to European Distributors Ltd at their registered address	\N	2025-05-21 16:29:37.609	2025-05-21 16:29:37.609
26	SO-10023	1	2024-12-28 18:43:15.488	DELIVERED	2289.85	Sample order 24 for Acme Corporation	Shipping to Acme Corporation at their registered address	\N	2025-05-21 16:29:37.689	2025-05-21 16:29:37.689
27	SO-10024	4	2025-04-01 03:12:19.304	SHIPPED	5399.91	Sample order 25 for Tech Solutions GmbH	Shipping to Tech Solutions GmbH at their registered address	\N	2025-05-21 16:29:37.801	2025-05-21 16:29:37.801
28	SO-10025	1	2024-12-17 00:56:14.765	PROCESSING	1889.93	Sample order 26 for Acme Corporation	Shipping to Acme Corporation at their registered address	\N	2025-05-21 16:29:37.863	2025-05-21 16:29:37.863
29	SO-10026	1	2025-04-09 15:27:28.084	PROCESSING	5039.889999999999	Sample order 27 for Acme Corporation	Shipping to Acme Corporation at their registered address	\N	2025-05-21 16:29:37.941	2025-05-21 16:29:37.941
30	SO-10027	1	2025-03-05 08:43:30.987	PROCESSING	3399.92	Sample order 28 for Acme Corporation	Shipping to Acme Corporation at their registered address	\N	2025-05-21 16:29:38.003	2025-05-21 16:29:38.003
31	SO-10028	2	2025-01-21 22:23:11.444	SHIPPED	5069.94	Sample order 29 for Global Enterprises	Shipping to Global Enterprises at their registered address	\N	2025-05-21 16:29:38.066	2025-05-21 16:29:38.066
32	SO-10029	3	2025-04-27 22:45:20.308	DRAFT	239.96999999999997	Sample order 30 for European Distributors Ltd	Shipping to European Distributors Ltd at their registered address	\N	2025-05-21 16:29:38.145	2025-05-21 16:29:38.145
33	SO-10030	3	2025-03-22 08:01:44.102	DRAFT	4499.91	Sample order 31 for European Distributors Ltd	Shipping to European Distributors Ltd at their registered address	\N	2025-05-21 16:29:38.192	2025-05-21 16:29:38.192
34	SO-10031	5	2025-05-15 11:21:24.615	CONFIRMED	11399.69	Sample order 32 for Japan Manufacturing Co.	Shipping to Japan Manufacturing Co. at their registered address	\N	2025-05-21 16:29:38.239	2025-05-21 16:29:38.239
35	SO-10032	5	2025-03-02 04:57:18.132	CONFIRMED	1049.94	Sample order 33 for Japan Manufacturing Co.	Shipping to Japan Manufacturing Co. at their registered address	\N	2025-05-21 16:29:38.333	2025-05-21 16:29:38.333
36	SO-10033	2	2025-04-02 18:15:28.827	DELIVERED	4029.66	Sample order 34 for Global Enterprises	Shipping to Global Enterprises at their registered address	\N	2025-05-21 16:29:38.397	2025-05-21 16:29:38.397
37	SO-10034	2	2024-12-30 02:51:24.05	CONFIRMED	319.96	Sample order 35 for Global Enterprises	Shipping to Global Enterprises at their registered address	\N	2025-05-21 16:29:38.523	2025-05-21 16:29:38.523
38	SO-10035	4	2025-02-20 15:40:35.692	CONFIRMED	9349.92	Sample order 36 for Tech Solutions GmbH	Shipping to Tech Solutions GmbH at their registered address	\N	2025-05-21 16:29:38.571	2025-05-21 16:29:38.571
39	SO-10036	1	2024-12-18 11:36:51.5	DELIVERED	9339.75	Sample order 37 for Acme Corporation	Shipping to Acme Corporation at their registered address	\N	2025-05-21 16:29:38.644	2025-05-21 16:29:38.644
40	SO-10037	1	2024-12-12 07:21:42.349	SHIPPED	5749.83	Sample order 38 for Acme Corporation	Shipping to Acme Corporation at their registered address	\N	2025-05-21 16:29:38.756	2025-05-21 16:29:38.756
41	SO-10038	1	2024-12-17 22:48:02.894	CONFIRMED	3479.86	Sample order 39 for Acme Corporation	Shipping to Acme Corporation at their registered address	\N	2025-05-21 16:29:38.853	2025-05-21 16:29:38.853
42	SO-10039	2	2025-04-26 05:01:08.069	CONFIRMED	5749.8099999999995	Sample order 40 for Global Enterprises	Shipping to Global Enterprises at their registered address	\N	2025-05-21 16:29:38.917	2025-05-21 16:29:38.917
43	SO-10040	1	2025-03-29 04:54:40.334	PROCESSING	3209.79	Sample order 41 for Acme Corporation	Shipping to Acme Corporation at their registered address	\N	2025-05-21 16:29:39.012	2025-05-21 16:29:39.012
44	SO-10041	1	2025-03-09 00:25:18.663	DRAFT	11469.87	Sample order 42 for Acme Corporation	Shipping to Acme Corporation at their registered address	\N	2025-05-21 16:29:39.092	2025-05-21 16:29:39.092
45	SO-10042	2	2025-02-16 07:37:27.292	CONFIRMED	6129.85	Sample order 43 for Global Enterprises	Shipping to Global Enterprises at their registered address	\N	2025-05-21 16:29:39.17	2025-05-21 16:29:39.17
46	SO-10043	5	2025-02-16 07:23:13.799	DRAFT	2239.8500000000004	Sample order 44 for Japan Manufacturing Co.	Shipping to Japan Manufacturing Co. at their registered address	\N	2025-05-21 16:29:39.289	2025-05-21 16:29:39.289
47	SO-10044	2	2025-02-12 01:25:13.831	DRAFT	10849.87	Sample order 45 for Global Enterprises	Shipping to Global Enterprises at their registered address	\N	2025-05-21 16:29:39.37	2025-05-21 16:29:39.37
48	SO-10045	5	2025-04-18 12:23:00.681	SHIPPED	869.9300000000001	Sample order 46 for Japan Manufacturing Co.	Shipping to Japan Manufacturing Co. at their registered address	\N	2025-05-21 16:29:39.433	2025-05-21 16:29:39.433
49	SO-10046	4	2025-03-29 13:28:24.852	SHIPPED	1199.98	Sample order 47 for Tech Solutions GmbH	Shipping to Tech Solutions GmbH at their registered address	\N	2025-05-21 16:29:39.527	2025-05-21 16:29:39.527
50	SO-10047	2	2024-12-13 18:44:12.34	DRAFT	4799.83	Sample order 48 for Global Enterprises	Shipping to Global Enterprises at their registered address	\N	2025-05-21 16:29:39.59	2025-05-21 16:29:39.59
51	SO-10048	1	2024-11-21 17:19:52.771	CONFIRMED	6689.6900000000005	Sample order 49 for Acme Corporation	Shipping to Acme Corporation at their registered address	\N	2025-05-21 16:29:39.653	2025-05-21 16:29:39.653
52	SO-10049	2	2025-03-22 10:52:52.984	DRAFT	15159.69	Sample order 50 for Global Enterprises	Shipping to Global Enterprises at their registered address	\N	2025-05-21 16:29:39.765	2025-05-21 16:29:39.765
\.


--
-- Data for Name: plants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.plants (id, code, name, description, company_code_id, type, category, address, city, state, country, postal_code, phone, email, manager, timezone, operating_hours, coordinates, status, is_active, created_at, created_by, updated_at, updated_by, version, notes) FROM stdin;
1	P001	Main Factory	\N	1	Manufacturing	Production	\N	Chicago	\N	United States	\N	\N	\N	\N	\N	\N	\N	active	t	2025-05-17 13:44:11.172767	\N	2025-05-17 13:44:11.172767	\N	1	\N
2	W001	East Coast Warehouse	\N	1	Warehouse	Storage	\N	Newark	\N	United States	\N	\N	\N	\N	\N	\N	\N	active	t	2025-05-17 13:44:11.172767	\N	2025-05-17 13:44:11.172767	\N	1	\N
3	P002	European Production	\N	2	Manufacturing	Production	\N	Munich	\N	Germany	\N	\N	\N	\N	\N	\N	\N	active	t	2025-05-17 13:44:11.172767	\N	2025-05-17 13:44:11.172767	\N	1	\N
4	p001	plant South East		1	Warehouse								\N					active	t	2025-05-19 22:58:38.372	\N	2025-05-19 22:58:38.372	\N	1	\N
5	P003	Berlin Production	Berlin Production - manufacturing facility	2	manufacturing	production	Fabrikstraße 25, Berlin, 10115	\N	\N	Germany	\N	\N	\N	\N	\N	\N	\N	active	t	2025-05-20 04:52:26.251247	\N	2025-05-20 04:52:26.251247	\N	1	\N
6	P004	Shanghai Facility	Shanghai Facility - manufacturing facility	10	manufacturing	production	100 Industrial Zone, Shanghai, 200000	\N	\N	China	\N	\N	\N	\N	\N	\N	\N	active	t	2025-05-20 04:52:26.305857	\N	2025-05-20 04:52:26.305857	\N	1	\N
7	W002	European Warehouse	European Warehouse - warehouse facility	2	warehouse	distribution	Logistikweg 10, Hamburg, 20095	\N	\N	Germany	\N	\N	\N	\N	\N	\N	\N	active	t	2025-05-20 04:52:26.370563	\N	2025-05-20 04:52:26.370563	\N	1	\N
8	W003	Asian Distribution Hub	Asian Distribution Hub - warehouse facility	10	warehouse	distribution	200 Export Center, Shenzhen, 518000	\N	\N	China	\N	\N	\N	\N	\N	\N	\N	active	t	2025-05-20 04:52:26.417674	\N	2025-05-20 04:52:26.417674	\N	1	\N
9	W004	UK Warehouse	UK Warehouse - warehouse facility	11	warehouse	distribution	15 Logistics Way, Manchester, M1 1AA	\N	\N	United Kingdom	\N	\N	\N	\N	\N	\N	\N	active	t	2025-05-20 04:52:26.461796	\N	2025-05-20 04:52:26.461796	\N	1	\N
\.


--
-- Data for Name: production_orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.production_orders (id, order_number, material_id, bom_id, plant_id, work_center_id, order_type, planned_quantity, actual_quantity, scrap_quantity, unit_of_measure, planned_start_date, planned_end_date, actual_start_date, actual_end_date, priority, status, cost_center_id, created_by, released_by, release_date, notes, created_at) FROM stdin;
1	PROD-2025-001	1	\N	\N	1	Production	100.000	85.000	0.000	\N	2025-06-01	2025-06-15	\N	\N	NORMAL	In Progress	\N	\N	\N	\N	\N	2025-06-04 01:16:16.078961
2	PROD-2025-002	2	\N	\N	2	Production	250.000	250.000	0.000	\N	2025-05-20	2025-06-10	\N	\N	NORMAL	Completed	\N	\N	\N	\N	\N	2025-06-04 01:16:16.078961
3	PROD-2025-003	3	\N	\N	3	Production	150.000	0.000	0.000	\N	2025-06-10	2025-06-25	\N	\N	NORMAL	Planned	\N	\N	\N	\N	\N	2025-06-04 01:16:16.078961
4	PROD-2025-004	4	\N	\N	1	Production	300.000	180.000	0.000	\N	2025-06-05	2025-06-20	\N	\N	NORMAL	In Progress	\N	\N	\N	\N	\N	2025-06-04 01:16:16.078961
5	PROD-2025-005	5	\N	\N	2	Production	75.000	75.000	0.000	\N	2025-05-25	2025-06-08	\N	\N	NORMAL	Completed	\N	\N	\N	\N	\N	2025-06-04 01:16:16.078961
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, name, sku, description, price, cost, stock, min_stock, category_id, user_id, created_at, updated_at) FROM stdin;
1	Premium Laptop	TECH-001	High-quality premium laptop for professional use	1299.99	950	25	5	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
2	Office Chair	FURN-001	High-quality office chair for professional use	249.99	150	50	10	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
3	Standing Desk	FURN-002	High-quality standing desk for professional use	599.99	350	15	3	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
4	Wireless Earbuds	TECH-002	High-quality wireless earbuds for professional use	129.99	65	100	20	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
5	Smart Watch	TECH-003	High-quality smart watch for professional use	349.99	200	30	8	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
6	External Hard Drive	TECH-004	High-quality external hard drive for professional use	89.99	45	40	10	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
7	Wireless Mouse	TECH-005	High-quality wireless mouse for professional use	49.99	25	75	15	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
8	Bluetooth Speaker	TECH-006	High-quality bluetooth speaker for professional use	79.99	40	60	12	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
9	Monitor	TECH-007	High-quality monitor for professional use	299.99	180	35	7	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
10	Printer	TECH-008	High-quality printer for professional use	179.99	120	20	5	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
11	Smartphone	TECH-009	High-quality smartphone for professional use	899.99	650	40	8	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
12	Tablet	TECH-010	High-quality tablet for professional use	499.99	350	30	6	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
13	Desktop PC	TECH-011	High-quality desktop pc for professional use	999.99	750	15	3	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
14	Keyboard	TECH-012	High-quality keyboard for professional use	69.99	35	50	10	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
15	USB-C Hub	TECH-013	High-quality usb-c hub for professional use	39.99	18	80	20	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
16	Webcam	TECH-014	High-quality webcam for professional use	59.99	30	45	10	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
17	Microphone	TECH-015	High-quality microphone for professional use	129.99	65	25	5	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
18	Router	TECH-016	High-quality router for professional use	149.99	80	20	5	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
19	Power Bank	TECH-017	High-quality power bank for professional use	49.99	25	60	15	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
20	VR Headset	TECH-018	High-quality vr headset for professional use	399.99	250	10	2	1	\N	2025-05-21 16:28:39.279	2025-05-21 16:28:39.279
\.


--
-- Data for Name: profit_centers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.profit_centers (id, profit_center, description, profit_center_group, company_code, controlling_area, segment, hierarchy_area, responsible_person, valid_from, valid_to, created_at, company_code_id, plant_id, responsible_person_id) FROM stdin;
1	PC001	Manufacturing Division	PRODUCTION	US01	US01	\N	\N	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	1	\N	\N
2	PC001-01	Product Line A	PRODUCTION	US01	US01	\N	\N	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	1	\N	\N
3	PC001-02	Product Line B	PRODUCTION	US01	US01	\N	\N	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	1	\N	\N
4	PC001-03	Custom Products	PRODUCTION	US01	US01	\N	\N	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	1	\N	\N
5	PC002	Sales Division	SALES	US01	US01	\N	\N	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	1	\N	\N
6	PC002-01	Domestic Sales	SALES	US01	US01	\N	\N	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	1	\N	\N
7	PC002-02	Export Sales	SALES	US01	US01	\N	\N	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	1	\N	\N
8	PC002-03	Online Sales	SALES	US01	US01	\N	\N	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	1	\N	\N
9	PC003	Service Division	SERVICE	US01	US01	\N	\N	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	1	\N	\N
10	PC003-01	Maintenance Services	SERVICE	US01	US01	\N	\N	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	1	\N	\N
11	PC003-02	Consulting Services	SERVICE	US01	US01	\N	\N	\N	2025-06-03	\N	2025-06-03 17:58:50.654812	1	\N	\N
12	PC-PROD-A	Product Line A - Main product profitability	PRODUCT_LINE	US01	US01	\N	\N	John Smith	2025-01-01	\N	2025-06-04 02:39:51.210528	1	\N	\N
13	PC-PROD-B	Product Line B - Secondary product line	PRODUCT_LINE	US01	US01	\N	\N	Jane Doe	2025-01-01	\N	2025-06-04 02:39:51.210528	1	\N	\N
14	PC-SERV	Service Division - Service and maintenance revenue	DIVISION	US01	US01	\N	\N	Mike Johnson	2025-01-01	\N	2025-06-04 02:39:51.210528	1	\N	\N
15	PC-REG-E	Eastern Region - East coast sales region	REGION	US01	US01	\N	\N	Sarah Davis	2025-01-01	\N	2025-06-04 02:39:51.210528	1	\N	\N
16	PC-REG-W	Western Region - West coast sales region	REGION	US01	US01	\N	\N	Tom Brown	2025-01-01	\N	2025-06-04 02:39:51.210528	1	\N	\N
17	PC-REG-C	Central Region - Central US sales region	REGION	US01	US01	\N	\N	Lisa Garcia	2025-01-01	\N	2025-06-04 02:39:51.210528	1	\N	\N
18	PC-EXPORT	Export Division - International sales and exports	DIVISION	US01	US01	\N	\N	David Miller	2025-01-01	\N	2025-06-04 02:39:51.210528	1	\N	\N
19	PC-RETAIL	Retail Channel - Direct retail sales	CHANNEL	US01	US01	\N	\N	Chris Lee	2025-01-01	\N	2025-06-04 02:39:51.210528	1	\N	\N
20	PC-WHSALE	Wholesale Channel - Wholesale and distribution	CHANNEL	US01	US01	\N	\N	Emily Chen	2025-01-01	\N	2025-06-04 02:39:51.210528	1	\N	\N
\.


--
-- Data for Name: purchase_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchase_groups (id, code, name, description, is_active, created_at, updated_at, created_by, updated_by, version, valid_from, valid_to) FROM stdin;
1	MECH	Mechanical Parts	Procurement group for mechanical components and parts	t	2025-05-20 03:25:48.01028	2025-05-20 03:25:48.01028	\N	\N	1	2025-05-20 03:25:48.01028	\N
2	ELEC	Electrical Components	Procurement group for electrical components and supplies	t	2025-05-20 03:25:48.01028	2025-05-20 03:25:48.01028	\N	\N	1	2025-05-20 03:25:48.01028	\N
3	RAW	Raw Materials	Basic raw materials used in manufacturing processes	t	2025-05-20 03:25:48.01028	2025-05-20 03:25:48.01028	\N	\N	1	2025-05-20 03:25:48.01028	\N
4	PACK	Packaging Materials	Materials used for packaging finished products	t	2025-05-20 03:25:48.01028	2025-05-20 03:25:48.01028	\N	\N	1	2025-05-20 03:25:48.01028	\N
5	TOOL	Tools & Equipment	Tools and equipment for maintenance and operations	t	2025-05-20 03:25:48.01028	2025-05-20 03:25:48.01028	\N	\N	1	2025-05-20 03:25:48.01028	\N
6	PG001	Raw Materials	Purchasing group for raw materials procurement	t	2025-05-20 04:52:27.386821	2025-05-20 04:52:27.386821	\N	\N	1	2025-05-20 04:52:27.386821	\N
7	PG002	Production Equipment	Purchasing group for manufacturing equipment	t	2025-05-20 04:52:27.427776	2025-05-20 04:52:27.427776	\N	\N	1	2025-05-20 04:52:27.427776	\N
8	PG003	Office Supplies	Purchasing group for office and administrative supplies	t	2025-05-20 04:52:27.459234	2025-05-20 04:52:27.459234	\N	\N	1	2025-05-20 04:52:27.459234	\N
9	PG004	IT Hardware	Purchasing group for computers and IT equipment	t	2025-05-20 04:52:27.490428	2025-05-20 04:52:27.490428	\N	\N	1	2025-05-20 04:52:27.490428	\N
10	PG005	Packaging Materials	Purchasing group for packaging supplies	t	2025-05-20 04:52:27.526279	2025-05-20 04:52:27.526279	\N	\N	1	2025-05-20 04:52:27.526279	\N
11	PG006	Services	Purchasing group for third-party services	t	2025-05-20 04:52:27.560699	2025-05-20 04:52:27.560699	\N	\N	1	2025-05-20 04:52:27.560699	\N
12	PG007	Maintenance	Purchasing group for maintenance supplies and services	t	2025-05-20 04:52:27.592969	2025-05-20 04:52:27.592969	\N	\N	1	2025-05-20 04:52:27.592969	\N
\.


--
-- Data for Name: purchase_order_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchase_order_items (id, purchase_order_id, line_number, material_id, description, quantity, unit_price, total_price, delivery_date, plant_id, storage_location_id, tax_code, discount_percent, received_quantity, invoiced_quantity, status, created_at) FROM stdin;
\.


--
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchase_orders (id, order_number, vendor_id, purchase_organization_id, company_code_id, plant_id, order_date, delivery_date, payment_terms, currency_id, exchange_rate, total_amount, tax_amount, discount_amount, net_amount, status, created_by, approved_by, approval_date, notes, created_at, updated_at) FROM stdin;
1	PO-2025-001	1	\N	\N	\N	2025-06-01	2025-06-15	\N	\N	1.0000	25000.00	\N	\N	\N	Approved	1	\N	\N	\N	2025-06-04 01:15:06.542271	2025-06-04 01:15:06.542271
2	PO-2025-002	2	\N	\N	\N	2025-06-02	2025-06-20	\N	\N	1.0000	18500.00	\N	\N	\N	Pending	1	\N	\N	\N	2025-06-04 01:15:06.542271	2025-06-04 01:15:06.542271
3	PO-2025-003	3	\N	\N	\N	2025-06-03	2025-06-25	\N	\N	1.0000	42000.00	\N	\N	\N	Draft	1	\N	\N	\N	2025-06-04 01:15:06.542271	2025-06-04 01:15:06.542271
4	PO-2025-004	1	\N	\N	\N	2025-06-04	2025-06-30	\N	\N	1.0000	15750.00	\N	\N	\N	Approved	1	\N	\N	\N	2025-06-04 01:15:06.542271	2025-06-04 01:15:06.542271
5	PO-2025-005	2	\N	\N	\N	2025-06-05	2025-07-05	\N	\N	1.0000	33200.00	\N	\N	\N	Pending	1	\N	\N	\N	2025-06-04 01:15:06.542271	2025-06-04 01:15:06.542271
\.


--
-- Data for Name: purchase_organizations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchase_organizations (id, code, name, description, company_code_id, currency, purchasing_manager, email, phone, address, is_active, created_at, updated_at, created_by, updated_by, version, valid_from, valid_to, purchasing_group, supply_type, approval_level, city, state, country, postal_code, status, notes, manager) FROM stdin;
9	PO01	US Raw Materials Procurement	Purchases raw materials for US manufacturing	1	USD	\N	\N	\N	\N	t	2025-05-20 05:01:13.627938	2025-05-20 05:01:13.627938	\N	\N	1	2025-05-20	\N	direct	production	\N	\N	\N	USA	\N	active	\N	\N
10	PO02	US MRO Procurement	Purchases maintenance supplies for US operations	1	USD	\N	\N	\N	\N	t	2025-05-20 05:01:13.677542	2025-05-20 05:01:13.677542	\N	\N	1	2025-05-20	\N	indirect	maintenance	\N	\N	\N	USA	\N	active	\N	\N
11	PO03	European Raw Materials	Purchases raw materials for European manufacturing	2	EUR	\N	\N	\N	\N	t	2025-05-20 05:01:13.705442	2025-05-20 05:01:13.705442	\N	\N	1	2025-05-20	\N	direct	production	\N	\N	\N	Germany	\N	active	\N	\N
12	PO04	European Services	Purchases services for European operations	2	EUR	\N	\N	\N	\N	t	2025-05-20 05:01:13.730688	2025-05-20 05:01:13.730688	\N	\N	1	2025-05-20	\N	indirect	services	\N	\N	\N	Germany	\N	active	\N	\N
13	PO05	Asia Pacific Procurement	Handles all purchasing activities in APAC region	10	CNY	\N	\N	\N	\N	t	2025-05-20 05:01:13.754219	2025-05-20 05:01:13.754219	\N	\N	1	2025-05-20	\N	direct	production	\N	\N	\N	China	\N	active	\N	\N
14	PO06	Global Capital Purchases	Handles all major capital expenditures globally	1	USD	\N	\N	\N	\N	t	2025-05-20 05:01:13.782274	2025-05-20 05:01:13.782274	\N	\N	1	2025-05-20	\N	capital	equipment	\N	\N	\N	USA	\N	active	\N	\N
15	PO07	UK Procurement	Manages all procurement for UK operations	11	GBP	\N	\N	\N	\N	t	2025-05-20 05:01:13.801961	2025-05-20 05:01:13.801961	\N	\N	1	2025-05-20	\N	direct	production	\N	\N	\N	United Kingdom	\N	active	\N	\N
16	PO08	Canada Procurement	Handles all purchasing for Canadian operations	5	CAD	\N	\N	\N	\N	t	2025-05-20 05:01:13.825862	2025-05-20 05:01:13.825862	\N	\N	1	2025-05-20	\N	direct	production	\N	\N	\N	Canada	\N	active	\N	\N
17	NA01	North America Procurement	\N	1	USD	\N	\N	\N	\N	t	2025-05-20 21:43:20.089848	2025-05-20 21:43:20.089848	\N	\N	1	2025-05-20	\N	\N	\N	\N	\N	\N	\N	\N	active	\N	\N
18	EU01	European Procurement	\N	9	EUR	\N	\N	\N	\N	t	2025-05-20 21:43:20.111292	2025-05-20 21:43:20.111292	\N	\N	1	2025-05-20	\N	\N	\N	\N	\N	\N	\N	\N	active	\N	\N
19	UK01	UK Procurement	\N	11	GBP	\N	\N	\N	\N	t	2025-05-20 21:43:20.128029	2025-05-20 21:43:20.128029	\N	\N	1	2025-05-20	\N	\N	\N	\N	\N	\N	\N	\N	active	\N	\N
22	IN01	India Purchasing	\N	6	INR	\N	\N	\N	\N	t	2025-05-20 21:43:20.460685	2025-05-20 21:43:20.460685	\N	\N	1	2025-05-20	\N	\N	\N	\N	\N	\N	\N	\N	active	\N	\N
24	GLOB	Global Procurement	\N	1	USD	\N	\N	\N	\N	t	2025-05-20 21:43:20.621543	2025-05-20 21:43:20.621543	\N	\N	1	2025-05-20	\N	\N	\N	\N	\N	\N	\N	\N	active	\N	\N
\.


--
-- Data for Name: quote_approvals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.quote_approvals (id, quote_id, requested_by, requested_at, status, current_approver, approved_by, approved_at, rejected_by, rejected_at, rejection_reason, comments, approval_level, created_at, updated_at) FROM stdin;
7	7	2	2025-04-25 13:35:46.205	Rejected	\N	\N	\N	1	2025-04-28 13:35:46.205	Price is too high or terms need adjustment.	Quote needs revision.	Level 3	2025-05-22 13:35:46.206	2025-05-22 13:35:46.206
8	5	1	2025-05-12 13:35:46.235	Rejected	\N	\N	\N	2	2025-05-17 13:35:46.235	Price is too high or terms need adjustment.	Quote needs revision.	Level 2	2025-05-22 13:35:46.235	2025-05-22 13:35:46.235
9	7	2	2025-05-15 13:35:46.254	In Review	2	\N	\N	\N	\N	\N	Currently reviewing details.	Level 2	2025-05-22 13:35:46.254	2025-05-22 13:35:46.254
10	7	1	2025-04-25 13:35:46.271	In Review	1	\N	\N	\N	\N	\N	Currently reviewing details.	Level 3	2025-05-22 13:35:46.271	2025-05-22 13:35:46.271
11	6	2	2025-05-17 13:35:46.293	Rejected	\N	\N	\N	3	2025-05-21 13:35:46.293	Price is too high or terms need adjustment.	Quote needs revision.	Level 2	2025-05-22 13:35:46.293	2025-05-22 13:35:46.293
12	1	1	2025-05-22 13:35:46.329	Approved	\N	1	2025-05-23 13:35:46.329	\N	\N	\N	Quote looks good, approved.	Level 2	2025-05-22 13:35:46.329	2025-05-22 13:35:46.329
13	7	2	2025-05-05 13:35:46.346	Approved	\N	3	2025-05-08 13:35:46.346	\N	\N	\N	Quote looks good, approved.	Level 1	2025-05-22 13:35:46.346	2025-05-22 13:35:46.346
14	2	1	2025-04-27 13:35:46.363	In Review	2	\N	\N	\N	\N	\N	Currently reviewing details.	Level 2	2025-05-22 13:35:46.363	2025-05-22 13:35:46.363
15	1	2	2025-05-04 13:35:46.385	Pending	2	\N	\N	\N	\N	\N	Awaiting review	Level 2	2025-05-22 13:35:46.385	2025-05-22 13:35:46.385
16	2	1	2025-04-23 13:35:46.404	In Review	2	\N	\N	\N	\N	\N	Currently reviewing details.	Level 3	2025-05-22 13:35:46.404	2025-05-22 13:35:46.404
\.


--
-- Data for Name: quote_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.quote_items (id, quote_id, product_id, description, quantity, unit_price, discount_percent, tax_percent, line_total, created_at, updated_at) FROM stdin;
1	1	13	Desktop PC	4	999.99	1.00	7.00	4237.16	2025-05-21 23:38:47.755728	2025-05-21 23:38:47.755728
2	1	11	Smartphone	4	899.99	2.00	7.00	3774.92	2025-05-21 23:38:47.774319	2025-05-21 23:38:47.774319
3	2	1	Premium Laptop	4	1299.99	8.00	7.00	5118.84	2025-05-21 23:38:47.809738	2025-05-21 23:38:47.809738
4	3	18	Router	1	149.99	0.00	7.00	160.49	2025-05-21 23:38:47.844784	2025-05-21 23:38:47.844784
5	4	8	Bluetooth Speaker	1	79.99	7.00	7.00	79.60	2025-05-21 23:38:47.88047	2025-05-21 23:38:47.88047
6	5	1	Premium Laptop	2	1299.99	6.00	7.00	2615.06	2025-05-21 23:38:47.917178	2025-05-21 23:38:47.917178
7	5	16	Webcam	4	59.99	7.00	7.00	238.78	2025-05-21 23:38:47.935082	2025-05-21 23:38:47.935082
8	6	5	Smart Watch	1	349.99	8.00	7.00	344.53	2025-05-21 23:38:47.970515	2025-05-21 23:38:47.970515
9	7	18	Router	1	149.99	8.00	7.00	147.65	2025-05-21 23:38:48.005675	2025-05-21 23:38:48.005675
10	7	16	Webcam	1	59.99	4.00	7.00	61.62	2025-05-21 23:38:48.023953	2025-05-21 23:38:48.023953
\.


--
-- Data for Name: quotes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.quotes (id, quote_number, opportunity_id, customer_id, status, valid_until, total_amount, discount_amount, tax_amount, grand_total, terms, notes, assigned_to, approval_status, approved_by, approved_at, rejected_reason, created_at, updated_at) FROM stdin;
1	Q-10000	4	\N	Draft	2025-07-20 23:38:47.725	31422.69	123.42	2190.95	33490.22	Net 30 days from invoice date	Quote for Taylor Consulting - Professional Services Solution	\N	Pending	\N	\N	\N	2025-05-21 23:38:47.735855	2025-05-21 23:38:47.735855
2	Q-10001	6	\N	Draft	2025-07-20 23:38:47.725	36841.54	2387.72	2411.77	36865.58	Net 30 days from invoice date	Quote for White Industries - Manufacturing Solution	\N	Pending	\N	\N	\N	2025-05-21 23:38:47.791841	2025-05-21 23:38:47.791841
3	Q-10002	7	\N	Draft	2025-07-20 23:38:47.725	69242.43	2302.19	4685.82	71626.05	Net 30 days from invoice date	Quote for Jones Retail - Retail Solution	\N	Pending	\N	\N	\N	2025-05-21 23:38:47.827033	2025-05-21 23:38:47.827033
4	Q-10003	8	\N	Draft	2025-07-20 23:38:47.725	86299.49	7798.41	5495.08	83996.15	Net 30 days from invoice date	Quote for Clark Financial - Financial Services Solution	\N	Pending	\N	\N	\N	2025-05-21 23:38:47.862695	2025-05-21 23:38:47.862695
5	Q-10004	13	\N	Draft	2025-07-20 23:38:47.725	24764.53	1062.54	1659.14	25361.13	Net 30 days from invoice date	Quote for Taylor Consulting - Additional Professional Services Project	\N	Pending	\N	\N	\N	2025-05-21 23:38:47.899481	2025-05-21 23:38:47.899481
6	Q-10005	14	\N	Draft	2025-07-20 23:38:47.725	14741.10	1285.18	941.92	14397.84	Net 30 days from invoice date	Quote for Lee Education Services - Additional Education Project	\N	Pending	\N	\N	\N	2025-05-21 23:38:47.952958	2025-05-21 23:38:47.952958
7	Q-10006	16	\N	Draft	2025-07-20 23:38:47.725	14007.43	1287.56	890.39	13610.26	Net 30 days from invoice date	Quote for Miller Tech Solutions - Additional Technology Project	\N	Pending	\N	\N	\N	2025-05-21 23:38:47.988115	2025-05-21 23:38:47.988115
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.regions (id, code, name, description, is_active, created_at, updated_at) FROM stdin;
1	NA	North America	United States, Canada, and Mexico	t	2025-05-20 22:09:35.140169	2025-05-20 22:09:35.140169
2	SA	South America	South American countries	t	2025-05-20 22:09:35.140169	2025-05-20 22:09:35.140169
3	EMEA	Europe, Middle East, and Africa	Europe, Middle East, and Africa regions	t	2025-05-20 22:09:35.140169	2025-05-20 22:09:35.140169
4	APAC	Asia Pacific	Asia, Australia, and Pacific Islands	t	2025-05-20 22:09:35.140169	2025-05-20 22:09:35.140169
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reports (id, name, description, sql_query, chart_config, category, created_at, updated_at) FROM stdin;
1	Sales by Month	Monthly sales revenue analysis	SELECT \n        DATE_TRUNC('month', order_date) as month,\n        COUNT(*) as order_count,\n        SUM(total_amount) as total_revenue\n    FROM sales_orders \n    WHERE order_date >= CURRENT_DATE - INTERVAL '12 months'\n    GROUP BY DATE_TRUNC('month', order_date)\n    ORDER BY month	{"type": "line", "xAxis": "month", "yAxis": "total_revenue", "showLegend": true}	sales	2025-06-04 17:17:13.453916	2025-06-04 17:17:13.453916
2	Top Customers by Revenue	Customers with highest revenue contribution	SELECT \n        c.name as customer_name,\n        COUNT(so.id) as order_count,\n        SUM(so.total_amount) as total_revenue\n    FROM customers c\n    JOIN sales_orders so ON c.id = so.customer_id\n    GROUP BY c.id, c.name\n    ORDER BY total_revenue DESC\n    LIMIT 10	{"type": "bar", "xAxis": "customer_name", "yAxis": "total_revenue", "showLegend": false}	sales	2025-06-04 17:17:13.453916	2025-06-04 17:17:13.453916
3	Inventory Levels by Category	Current inventory levels grouped by material category	SELECT \n        cat.name as category_name,\n        COUNT(m.id) as material_count,\n        SUM(inv.quantity) as total_quantity\n    FROM categories cat\n    JOIN materials m ON cat.id = m.category_id\n    JOIN inventory inv ON m.id = inv.material_id\n    GROUP BY cat.id, cat.name\n    ORDER BY total_quantity DESC	{"type": "pie", "dataKey": "total_quantity", "nameKey": "category_name", "showLegend": true}	inventory	2025-06-04 17:17:13.453916	2025-06-04 17:17:13.453916
4	Cost Center Expenses	Expenses by cost center for current year	SELECT \n        cc.name as cost_center,\n        SUM(e.amount) as total_expenses\n    FROM cost_centers cc\n    LEFT JOIN expenses e ON cc.id = e.cost_center_id\n    WHERE e.expense_date >= DATE_TRUNC('year', CURRENT_DATE)\n    GROUP BY cc.id, cc.name\n    ORDER BY total_expenses DESC	{"type": "bar", "xAxis": "cost_center", "yAxis": "total_expenses", "showLegend": false}	finance	2025-06-04 17:17:13.453916	2025-06-04 17:17:13.453916
5	Purchase Orders by Vendor	Purchase order volumes by vendor	SELECT \n        v.name as vendor_name,\n        COUNT(po.id) as order_count,\n        SUM(po.total_amount) as total_amount\n    FROM vendors v\n    JOIN purchase_orders po ON v.id = po.vendor_id\n    WHERE po.order_date >= CURRENT_DATE - INTERVAL '6 months'\n    GROUP BY v.id, v.name\n    ORDER BY total_amount DESC\n    LIMIT 10	{"type": "bar", "xAxis": "vendor_name", "yAxis": "total_amount", "showLegend": false}	purchase	2025-06-04 17:17:13.453916	2025-06-04 17:17:13.453916
\.


--
-- Data for Name: sales_customer_contacts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales_customer_contacts (id, customer_id, name, "position", email, phone, is_primary, notes, created_at, updated_at) FROM stdin;
1	1	John Smith	Primary Contact	john.smith@technova.com	(555) 123-4567	t	\N	2025-05-23 02:20:10.142606+00	2025-05-23 02:20:10.142606+00
2	2	Sarah Johnson	Primary Contact	sarah@elevatesolutions.com	(555) 234-5678	t	\N	2025-05-23 02:20:10.160107+00	2025-05-23 02:20:10.160107+00
3	2	Tom Baker	Finance Director	tom@elevatesolutions.com	(555) 541-3019	f	\N	2025-05-23 02:20:10.176177+00	2025-05-23 02:20:10.176177+00
4	3	Michael Chen	Primary Contact	michael@datawave.com	(555) 345-6789	t	\N	2025-05-23 02:20:10.192015+00	2025-05-23 02:20:10.192015+00
5	3	Tom Baker	Technical Lead	tom@datawave.com	(555) 736-3307	f	\N	2025-05-23 02:20:10.207854+00	2025-05-23 02:20:10.207854+00
6	4	Emily Rodriguez	Primary Contact	emily@quantumsystems.com	(555) 456-7890	t	\N	2025-05-23 02:20:10.223908+00	2025-05-23 02:20:10.223908+00
7	4	Jessica Lee	Technical Lead	jessica@quantumsystems.com	(555) 464-2074	f	\N	2025-05-23 02:20:10.240059+00	2025-05-23 02:20:10.240059+00
8	5	David Wilson	Primary Contact	david@arcticinnovations.com	(555) 567-8901	t	\N	2025-05-23 02:20:10.257459+00	2025-05-23 02:20:10.257459+00
9	5	Jessica Lee	Technical Lead	jessica@arcticinnovations.com	(555) 186-3388	f	\N	2025-05-23 02:20:10.273451+00	2025-05-23 02:20:10.273451+00
10	6	Lisa Morgan	Primary Contact	lisa@sunrisehealthcare.com	(555) 678-9012	t	\N	2025-05-23 02:20:10.289534+00	2025-05-23 02:20:10.289534+00
11	7	Robert Brown	Primary Contact	robert@velocitylogistics.com	(555) 789-0123	t	\N	2025-05-23 02:20:10.305579+00	2025-05-23 02:20:10.305579+00
\.


--
-- Data for Name: sales_customers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales_customers (id, customer_number, company_name, contact_person, email, phone, website, industry, customer_type, billing_address, shipping_address, tax_id, payment_terms, credit_limit, status, notes, created_at, updated_at) FROM stdin;
1	CUST-1001	TechNova Inc	John Smith	john.smith@technova.com	(555) 123-4567	www.technova.com	Technology	Business	\N	\N	\N	\N	50000.00	Active	\N	2025-05-23 02:20:10.071348+00	2025-05-23 02:20:10.071348+00
2	CUST-1002	Elevate Solutions	Sarah Johnson	sarah@elevatesolutions.com	(555) 234-5678	www.elevatesolutions.com	Consulting	Business	\N	\N	\N	\N	35000.00	Active	\N	2025-05-23 02:20:10.071348+00	2025-05-23 02:20:10.071348+00
3	CUST-1003	DataWave Analytics	Michael Chen	michael@datawave.com	(555) 345-6789	www.datawave.com	Data Services	Business	\N	\N	\N	\N	75000.00	Active	\N	2025-05-23 02:20:10.071348+00	2025-05-23 02:20:10.071348+00
4	CUST-1004	Quantum Systems	Emily Rodriguez	emily@quantumsystems.com	(555) 456-7890	www.quantumsystems.com	Manufacturing	Business	\N	\N	\N	\N	100000.00	Active	\N	2025-05-23 02:20:10.071348+00	2025-05-23 02:20:10.071348+00
5	CUST-1005	Arctic Innovations	David Wilson	david@arcticinnovations.com	(555) 567-8901	www.arcticinnovations.com	Research	Business	\N	\N	\N	\N	25000.00	Active	\N	2025-05-23 02:20:10.071348+00	2025-05-23 02:20:10.071348+00
6	CUST-1006	Sunrise Healthcare	Lisa Morgan	lisa@sunrisehealthcare.com	(555) 678-9012	www.sunrisehealthcare.com	Healthcare	Business	\N	\N	\N	\N	40000.00	Inactive	\N	2025-05-23 02:20:10.071348+00	2025-05-23 02:20:10.071348+00
7	CUST-1007	Velocity Logistics	Robert Brown	robert@velocitylogistics.com	(555) 789-0123	www.velocitylogistics.com	Transportation	Business	\N	\N	\N	\N	60000.00	Active	\N	2025-05-23 02:20:10.071348+00	2025-05-23 02:20:10.071348+00
\.


--
-- Data for Name: sales_invoice_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales_invoice_items (id, invoice_id, product_name, description, quantity, unit_price, discount_percent, tax_percent, subtotal, created_at, updated_at) FROM stdin;
1	1	Enterprise SaaS License	Annual subscription	5	1299.99	0.00	0.00	6499.95	2025-05-23 02:20:07.133409+00	2025-05-23 02:20:07.133409+00
2	2	Network Infrastructure	Network hardware and setup	2	2499.50	0.00	0.00	4999.00	2025-05-23 02:20:07.151846+00	2025-05-23 02:20:07.151846+00
3	3	Data Analytics Platform	Business intelligence tools	1	1499.75	0.00	0.00	1499.75	2025-05-23 02:20:07.167522+00	2025-05-23 02:20:07.167522+00
4	3	Data Analytics Platform	Business intelligence tools	3	1499.75	0.00	0.00	4499.25	2025-05-23 02:20:07.183249+00	2025-05-23 02:20:07.183249+00
5	3	Cloud Security Package	Advanced security suite	4	899.50	0.00	0.00	3598.00	2025-05-23 02:20:07.198912+00	2025-05-23 02:20:07.198912+00
6	4	Cloud Security Package	Advanced security suite	5	899.50	0.00	0.00	4497.50	2025-05-23 02:20:07.214642+00	2025-05-23 02:20:07.214642+00
7	4	Cloud Security Package	Advanced security suite	4	899.50	0.00	0.00	3598.00	2025-05-23 02:20:07.230456+00	2025-05-23 02:20:07.230456+00
8	5	Mobile Device Management	Enterprise mobility solution	1	699.99	0.00	0.00	699.99	2025-05-23 02:20:07.246834+00	2025-05-23 02:20:07.246834+00
9	5	Mobile Device Management	Enterprise mobility solution	3	699.99	0.00	0.00	2099.97	2025-05-23 02:20:07.262681+00	2025-05-23 02:20:07.262681+00
\.


--
-- Data for Name: sales_invoices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales_invoices (id, invoice_number, order_id, customer_name, invoice_date, due_date, status, total_amount, discount_amount, tax_amount, grand_total, paid_amount, payment_method, payment_date, notes, created_by, created_at, updated_at) FROM stdin;
1	INV-2025-1001	\N	TechNova Inc	2025-05-03 02:20:07.072407+00	2025-05-18 02:20:07.072407+00	Paid	5649.75	0.00	0.00	5932.24	5932.24	Credit Card	2025-05-16 02:20:07.072407+00	\N	\N	2025-05-23 02:20:07.072407+00	2025-05-23 02:20:07.072407+00
2	INV-2025-1002	\N	Elevate Solutions	2025-05-05 02:20:07.072407+00	2025-05-20 02:20:07.072407+00	Paid	2375.50	0.00	0.00	2494.28	2494.28	Bank Transfer	2025-05-17 02:20:07.072407+00	\N	\N	2025-05-23 02:20:07.072407+00	2025-05-23 02:20:07.072407+00
3	INV-2025-1003	\N	DataWave Analytics	2025-05-08 02:20:07.072407+00	2025-06-07 02:20:07.072407+00	Partially Paid	8925.33	0.00	0.00	9371.60	4000.00	Bank Transfer	2025-05-13 02:20:07.072407+00	\N	\N	2025-05-23 02:20:07.072407+00	2025-05-23 02:20:07.072407+00
4	INV-2025-1004	\N	Quantum Systems	2025-05-13 02:20:07.072407+00	2025-06-12 02:20:07.072407+00	Unpaid	3450.20	0.00	0.00	3622.71	0.00	\N	\N	\N	\N	2025-05-23 02:20:07.072407+00	2025-05-23 02:20:07.072407+00
5	INV-2025-1005	\N	Arctic Innovations	2025-05-16 02:20:07.072407+00	2025-06-15 02:20:07.072407+00	Unpaid	1875.60	0.00	0.00	1969.38	0.00	\N	\N	\N	\N	2025-05-23 02:20:07.072407+00	2025-05-23 02:20:07.072407+00
\.


--
-- Data for Name: sales_order_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales_order_items (id, order_id, product_id, product_name, quantity, unit_price, discount_percent, tax_percent, subtotal, created_at, updated_at) FROM stdin;
1	1	\N	Network Infrastructure	4	2499.50	0.00	0.00	9998.00	2025-05-23 02:19:58.99797+00	2025-05-23 02:19:58.99797+00
2	1	\N	Enterprise SaaS License	4	1299.99	0.00	0.00	5199.96	2025-05-23 02:19:59.015933+00	2025-05-23 02:19:59.015933+00
3	2	\N	Cloud Security Package	5	899.50	0.00	0.00	4497.50	2025-05-23 02:19:59.031645+00	2025-05-23 02:19:59.031645+00
4	3	\N	Enterprise SaaS License	5	1299.99	0.00	0.00	6499.95	2025-05-23 02:19:59.047403+00	2025-05-23 02:19:59.047403+00
5	3	\N	Enterprise SaaS License	5	1299.99	0.00	0.00	6499.95	2025-05-23 02:19:59.063361+00	2025-05-23 02:19:59.063361+00
6	4	\N	Cloud Security Package	3	899.50	0.00	0.00	2698.50	2025-05-23 02:19:59.07912+00	2025-05-23 02:19:59.07912+00
7	4	\N	Cloud Security Package	5	899.50	0.00	0.00	4497.50	2025-05-23 02:19:59.094803+00	2025-05-23 02:19:59.094803+00
8	4	\N	Data Analytics Platform	5	1499.75	0.00	0.00	7498.75	2025-05-23 02:19:59.110759+00	2025-05-23 02:19:59.110759+00
9	5	\N	Data Analytics Platform	4	1499.75	0.00	0.00	5999.00	2025-05-23 02:19:59.126744+00	2025-05-23 02:19:59.126744+00
10	5	\N	Enterprise SaaS License	3	1299.99	0.00	0.00	3899.97	2025-05-23 02:19:59.142363+00	2025-05-23 02:19:59.142363+00
11	5	\N	Enterprise SaaS License	5	1299.99	0.00	0.00	6499.95	2025-05-23 02:19:59.158064+00	2025-05-23 02:19:59.158064+00
\.


--
-- Data for Name: sales_orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales_orders (id, order_number, customer_id, customer_name, order_date, delivery_date, status, total_amount, payment_status, shipping_address, billing_address, notes, created_by, created_at, updated_at, plant_id, sales_org_id, company_code_id, currency_id) FROM stdin;
1	SO-2025-1001	1	TechNova Inc	2025-05-10 02:19:58.867513+00	2025-05-30 02:19:58.867513+00	Confirmed	5649.75	Paid	123 Tech Park, San Francisco, CA	123 Tech Park, San Francisco, CA	\N	\N	2025-05-23 02:19:58.867513+00	2025-05-23 02:19:58.867513+00	1	8	1	\N
2	SO-2025-1002	2	Elevate Solutions	2025-05-12 02:19:58.867513+00	2025-05-28 02:19:58.867513+00	Processing	2375.50	Paid	456 Business Ave, Seattle, WA	456 Business Ave, Seattle, WA	\N	\N	2025-05-23 02:19:58.867513+00	2025-05-23 02:19:58.867513+00	1	8	1	\N
3	SO-2025-1003	3	DataWave Analytics	2025-05-15 02:19:58.867513+00	2025-06-02 02:19:58.867513+00	Processing	8925.33	Partial	789 Data Drive, Boston, MA	789 Data Drive, Boston, MA	\N	\N	2025-05-23 02:19:58.867513+00	2025-05-23 02:19:58.867513+00	1	8	1	\N
4	SO-2025-1004	4	Quantum Systems	2025-05-18 02:19:58.867513+00	2025-06-06 02:19:58.867513+00	Pending	3450.20	Unpaid	101 Quantum Blvd, Austin, TX	101 Quantum Blvd, Austin, TX	\N	\N	2025-05-23 02:19:58.867513+00	2025-05-23 02:19:58.867513+00	1	8	1	\N
5	SO-2025-1005	5	Arctic Innovations	2025-05-20 02:19:58.867513+00	2025-05-30 02:19:58.867513+00	Confirmed	1875.60	Paid	202 Ice Street, Chicago, IL	202 Ice Street, Chicago, IL	\N	\N	2025-05-23 02:19:58.867513+00	2025-05-23 02:19:58.867513+00	1	8	1	\N
\.


--
-- Data for Name: sales_organizations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales_organizations (id, code, name, description, company_code_id, currency, region, distribution_channel, industry, address, city, state, country, postal_code, phone, email, manager, status, is_active, notes, created_at, created_by, updated_at, updated_by, version) FROM stdin;
8	SO01	US Consumer Retail	Manages US retail consumer sales	1	USD	North America	retail	consumer	\N	\N	\N	USA	\N	\N	\N	\N	active	t	\N	2025-05-20 05:01:13.871186+00	\N	2025-05-20 05:01:13.871186+00	\N	1
9	SO02	US B2B Sales	Handles direct business-to-business sales in US	1	USD	North America	direct	industrial	\N	\N	\N	USA	\N	\N	\N	\N	active	t	\N	2025-05-20 05:01:13.903811+00	\N	2025-05-20 05:01:13.903811+00	\N	1
10	SO03	US eCommerce	Manages all online sales channels in US	1	USD	North America	online	consumer	\N	\N	\N	USA	\N	\N	\N	\N	active	t	\N	2025-05-20 05:01:13.923177+00	\N	2025-05-20 05:01:13.923177+00	\N	1
11	SO04	European Retail	Manages European retail sales operations	2	EUR	EMEA	retail	consumer	\N	\N	\N	Germany	\N	\N	\N	\N	active	t	\N	2025-05-20 05:01:13.949517+00	\N	2025-05-20 05:01:13.949517+00	\N	1
12	SO05	European Wholesale	Handles wholesale distribution in Europe	2	EUR	EMEA	wholesale	industrial	\N	\N	\N	Germany	\N	\N	\N	\N	active	t	\N	2025-05-20 05:01:13.967276+00	\N	2025-05-20 05:01:13.967276+00	\N	1
13	SO06	China Retail	Manages retail sales operations in China	10	CNY	APAC	retail	consumer	\N	\N	\N	China	\N	\N	\N	\N	active	t	\N	2025-05-20 05:01:13.98566+00	\N	2025-05-20 05:01:13.98566+00	\N	1
14	SO07	APAC Distribution	Handles distribution across Asia Pacific region	10	CNY	APAC	wholesale	mixed	\N	\N	\N	China	\N	\N	\N	\N	active	t	\N	2025-05-20 05:01:14.008718+00	\N	2025-05-20 05:01:14.008718+00	\N	1
15	SO08	UK Consumer Sales	Manages retail consumer sales in UK	11	GBP	EMEA	retail	consumer	\N	\N	\N	United Kingdom	\N	\N	\N	\N	active	t	\N	2025-05-20 05:01:14.03034+00	\N	2025-05-20 05:01:14.03034+00	\N	1
16	SO09	Canada Sales	Handles all sales operations in Canada	5	CAD	North America	mixed	mixed	\N	\N	\N	Canada	\N	\N	\N	\N	active	t	\N	2025-05-20 05:01:14.049053+00	\N	2025-05-20 05:01:14.049053+00	\N	1
17	US01	US East Sales	\N	1	USD	\N	\N	\N	\N	\N	\N	US	\N	\N	\N	\N	active	t	\N	2025-05-20 21:43:19.29688+00	\N	2025-05-20 21:43:19.29688+00	\N	1
19	CA01	Canada Sales	\N	5	CAD	\N	\N	\N	\N	\N	\N	CA	\N	\N	\N	\N	active	t	\N	2025-05-20 21:43:19.477648+00	\N	2025-05-20 21:43:19.477648+00	\N	1
20	UK01	UK Sales Division	\N	11	GBP	\N	\N	\N	\N	\N	\N	GB	\N	\N	\N	\N	active	t	\N	2025-05-20 21:43:19.499825+00	\N	2025-05-20 21:43:19.499825+00	\N	1
21	EU01	European Sales	\N	9	EUR	\N	\N	\N	\N	\N	\N	EU	\N	\N	\N	\N	active	t	\N	2025-05-20 21:43:19.51623+00	\N	2025-05-20 21:43:19.51623+00	\N	1
24	IN01	India Sales Division	\N	6	INR	\N	\N	\N	\N	\N	\N	IN	\N	\N	\N	\N	active	t	\N	2025-05-20 21:43:19.889334+00	\N	2025-05-20 21:43:19.889334+00	\N	1
\.


--
-- Data for Name: sales_quote_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales_quote_items (id, quote_id, product_name, description, quantity, unit_price, discount_percent, tax_percent, subtotal, created_at, updated_at) FROM stdin;
1	1	Technical Support Plan	24/7 technical support	2	499.99	0.00	0.00	999.98	2025-05-23 02:20:05.446439+00	2025-05-23 02:20:05.446439+00
2	1	Cloud Security Package	Advanced security suite	5	899.50	0.00	0.00	4497.50	2025-05-23 02:20:05.464681+00	2025-05-23 02:20:05.464681+00
3	2	Data Analytics Platform	Business intelligence tools	3	1499.75	0.00	0.00	4499.25	2025-05-23 02:20:05.481121+00	2025-05-23 02:20:05.481121+00
4	2	Network Infrastructure	Network hardware and setup	3	2499.50	0.00	0.00	7498.50	2025-05-23 02:20:05.497218+00	2025-05-23 02:20:05.497218+00
5	2	Data Analytics Platform	Business intelligence tools	3	1499.75	0.00	0.00	4499.25	2025-05-23 02:20:05.513114+00	2025-05-23 02:20:05.513114+00
6	3	Enterprise SaaS License	Annual subscription	3	1299.99	0.00	0.00	3899.97	2025-05-23 02:20:05.529484+00	2025-05-23 02:20:05.529484+00
7	4	Data Analytics Platform	Business intelligence tools	2	1499.75	0.00	0.00	2999.50	2025-05-23 02:20:05.545361+00	2025-05-23 02:20:05.545361+00
8	4	Custom Development	Custom software development (hourly)	5	150.00	0.00	0.00	750.00	2025-05-23 02:20:05.561196+00	2025-05-23 02:20:05.561196+00
9	4	Cloud Security Package	Advanced security suite	4	899.50	0.00	0.00	3598.00	2025-05-23 02:20:05.576626+00	2025-05-23 02:20:05.576626+00
10	5	Data Analytics Platform	Business intelligence tools	5	1499.75	0.00	0.00	7498.75	2025-05-23 02:20:05.592399+00	2025-05-23 02:20:05.592399+00
11	5	Custom Development	Custom software development (hourly)	2	150.00	0.00	0.00	300.00	2025-05-23 02:20:05.609084+00	2025-05-23 02:20:05.609084+00
12	5	Network Infrastructure	Network hardware and setup	3	2499.50	0.00	0.00	7498.50	2025-05-23 02:20:05.624837+00	2025-05-23 02:20:05.624837+00
\.


--
-- Data for Name: sales_quotes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales_quotes (id, quote_number, opportunity_id, customer_name, quote_date, valid_until, status, total_amount, discount_amount, tax_amount, grand_total, notes, terms_conditions, created_by, created_at, updated_at) FROM stdin;
1	QT-2025-1001	\N	TechNova Inc	2025-05-08 02:20:05.38177+00	2025-07-07 02:20:05.38177+00	Sent	6200.00	0.00	0.00	6510.00	\N	Net 30 payment terms. Quoted prices valid for 60 days.	\N	2025-05-23 02:20:05.38177+00	2025-05-23 02:20:05.38177+00
2	QT-2025-1002	\N	Elevate Solutions	2025-05-11 02:20:05.38177+00	2025-07-10 02:20:05.38177+00	Draft	3750.50	0.00	0.00	3938.03	\N	Net 30 payment terms. Quoted prices valid for 60 days.	\N	2025-05-23 02:20:05.38177+00	2025-05-23 02:20:05.38177+00
3	QT-2025-1003	\N	DataWave Analytics	2025-05-13 02:20:05.38177+00	2025-07-12 02:20:05.38177+00	Approved	9200.00	0.00	0.00	9660.00	\N	Net 30 payment terms. Quoted prices valid for 60 days.	\N	2025-05-23 02:20:05.38177+00	2025-05-23 02:20:05.38177+00
4	QT-2025-1004	\N	Quantum Systems	2025-05-16 02:20:05.38177+00	2025-07-15 02:20:05.38177+00	Rejected	4800.75	0.00	0.00	5040.79	\N	Net 30 payment terms. Quoted prices valid for 60 days.	\N	2025-05-23 02:20:05.38177+00	2025-05-23 02:20:05.38177+00
5	QT-2025-1005	\N	Arctic Innovations	2025-05-18 02:20:05.38177+00	2025-07-17 02:20:05.38177+00	Sent	2350.25	0.00	0.00	2467.76	\N	Net 30 payment terms. Quoted prices valid for 60 days.	\N	2025-05-23 02:20:05.38177+00	2025-05-23 02:20:05.38177+00
\.


--
-- Data for Name: sales_return_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales_return_items (id, return_id, product_name, quantity, unit_price, subtotal, return_reason, condition, created_at, updated_at) FROM stdin;
1	1	Data Analytics Platform	2	1499.75	2999.50	\N	New	2025-05-23 02:20:08.524521+00	2025-05-23 02:20:08.524521+00
2	1	Enterprise SaaS License	1	1299.99	1299.99	\N	Like New	2025-05-23 02:20:08.541858+00	2025-05-23 02:20:08.541858+00
3	2	Cloud Security Package	2	899.50	1799.00	\N	Damaged	2025-05-23 02:20:08.557869+00	2025-05-23 02:20:08.557869+00
4	3	Enterprise SaaS License	2	1299.99	2599.98	\N	Used	2025-05-23 02:20:08.573484+00	2025-05-23 02:20:08.573484+00
5	3	Network Infrastructure	2	2499.50	4999.00	\N	Used	2025-05-23 02:20:08.589491+00	2025-05-23 02:20:08.589491+00
6	4	Data Analytics Platform	1	1499.75	1499.75	\N	Like New	2025-05-23 02:20:08.60648+00	2025-05-23 02:20:08.60648+00
7	4	Network Infrastructure	1	2499.50	2499.50	\N	New	2025-05-23 02:20:08.622107+00	2025-05-23 02:20:08.622107+00
\.


--
-- Data for Name: sales_returns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sales_returns (id, return_number, order_id, invoice_id, customer_name, return_date, status, total_amount, return_reason, notes, created_by, created_at, updated_at) FROM stdin;
1	RET-2025-1001	\N	\N	TechNova Inc	2025-05-13 02:20:08.463433+00	Completed	1299.99	Product not needed anymore	\N	\N	2025-05-23 02:20:08.463433+00	2025-05-23 02:20:08.463433+00
2	RET-2025-1002	\N	\N	Elevate Solutions	2025-05-16 02:20:08.463433+00	Processing	899.50	Incompatible with current systems	\N	\N	2025-05-23 02:20:08.463433+00	2025-05-23 02:20:08.463433+00
3	RET-2025-1003	\N	\N	DataWave Analytics	2025-05-18 02:20:08.463433+00	Approved	699.99	Duplicate order	\N	\N	2025-05-23 02:20:08.463433+00	2025-05-23 02:20:08.463433+00
4	RET-2025-1004	\N	\N	Quantum Systems	2025-05-20 02:20:08.463433+00	Pending	1499.75	Wrong product received	\N	\N	2025-05-23 02:20:08.463433+00	2025-05-23 02:20:08.463433+00
\.


--
-- Data for Name: stock_movements; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stock_movements (id, product_id, type, quantity, reason, date, user_id, created_at) FROM stdin;
4	2	Return	29	Wrong item return	2025-05-05 13:40:07.915	1	2025-05-22 13:40:07.915
5	5	Return	80	Customer order cancellation	2025-01-24 13:40:07.915	1	2025-05-22 13:40:07.937
6	10	Transfer	78	Cross-docking operation	2025-03-19 13:40:07.915	1	2025-05-22 13:40:07.954
7	7	Adjustment	26	System data correction	2024-12-16 13:40:07.915	1	2025-05-22 13:40:07.974
8	2	Receipt	81	Return from customer	2025-01-19 13:40:07.915	1	2025-05-22 13:40:07.992
9	3	Issue	37	Sample issuance	2025-02-03 13:40:07.915	1	2025-05-22 13:40:08.018
10	8	Transfer	39	Relocation optimization	2025-02-11 13:40:07.915	1	2025-05-22 13:40:08.038
11	5	Issue	95	Damaged goods disposal	2024-12-22 13:40:07.915	1	2025-05-22 13:40:08.057
12	7	Receipt	30	Transfer from another location	2025-02-22 13:40:07.915	1	2025-05-22 13:40:08.076
13	6	Receipt	55	Return from customer	2025-01-11 13:40:07.915	1	2025-05-22 13:40:08.098
14	1	Receipt	72	Inventory count adjustment	2025-02-14 13:40:07.915	1	2025-05-22 13:40:08.116
15	9	Receipt	40	Return from customer	2025-04-20 13:40:07.915	1	2025-05-22 13:40:08.136
16	10	Adjustment	41	System data correction	2025-04-08 13:40:07.915	1	2025-05-22 13:40:08.154
17	2	Return	86	Wrong item return	2025-05-07 13:40:07.915	1	2025-05-22 13:40:08.176
18	4	Issue	27	Sales order fulfillment	2024-11-27 13:40:07.915	1	2025-05-22 13:40:08.194
19	7	Transfer	3	Relocation optimization	2024-12-28 13:40:07.915	1	2025-05-22 13:40:08.213
20	5	Issue	45	Damaged goods disposal	2024-12-05 13:40:07.915	1	2025-05-22 13:40:08.23
21	3	Transfer	35	Warehouse rebalancing	2025-04-08 13:40:07.915	1	2025-05-22 13:40:08.249
22	2	Transfer	22	Warehouse rebalancing	2025-05-04 13:40:07.915	1	2025-05-22 13:40:08.271
23	8	Return	88	Customer order cancellation	2025-01-04 13:40:07.915	1	2025-05-22 13:40:08.295
24	8	Receipt	23	Production output	2025-05-13 13:40:07.915	1	2025-05-22 13:40:08.326
25	10	Return	52	Damaged goods return	2025-03-21 13:40:07.915	1	2025-05-22 13:40:08.344
26	8	Issue	79	Sales order fulfillment	2025-02-05 13:40:07.915	1	2025-05-22 13:40:08.363
27	7	Receipt	24	Production output	2025-02-07 13:40:07.915	1	2025-05-22 13:40:08.387
28	1	Transfer	39	Warehouse rebalancing	2025-03-02 13:40:07.915	1	2025-05-22 13:40:08.407
\.


--
-- Data for Name: storage_locations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.storage_locations (id, code, name, description, plant_id, type, is_mrp_relevant, is_negative_stock_allowed, is_goods_receipt_relevant, is_goods_issue_relevant, is_interim_storage, is_transit_storage, is_restricted_use, status, is_active, created_at, created_by, updated_at, updated_by, version, notes) FROM stdin;
13	SL001	Raw Materials Warehouse	Primary storage for raw materials in main factory	1	raw_material	t	f	t	f	f	f	f	active	t	2025-05-20 05:01:14.094952	\N	2025-05-20 05:01:14.094952	\N	1	\N
14	SL002	Work-in-Progress	Temporary storage for work-in-progress items	1	wip	t	f	f	f	f	f	f	active	t	2025-05-20 05:01:14.125555	\N	2025-05-20 05:01:14.125555	\N	1	\N
15	SL003	Finished Goods	Storage for completed products ready for shipping	1	finished_goods	t	f	f	t	f	f	f	active	t	2025-05-20 05:01:14.149165	\N	2025-05-20 05:01:14.149165	\N	1	\N
16	SL004	Quality Control Area	Area for quality inspection and testing	1	quality_control	f	f	t	f	f	f	f	active	t	2025-05-20 05:01:14.170727	\N	2025-05-20 05:01:14.170727	\N	1	\N
17	SL005	Components Storage	Storage for assembly components and parts	3	components	t	f	t	f	f	f	f	active	t	2025-05-20 05:01:14.195182	\N	2025-05-20 05:01:14.195182	\N	1	\N
18	SL006	Assembly WIP	Work-in-progress area for assembly operations	3	wip	t	f	f	f	f	f	f	active	t	2025-05-20 05:01:14.215786	\N	2025-05-20 05:01:14.215786	\N	1	\N
19	SL007	Berlin Raw Materials	Raw material storage for Berlin plant	5	raw_material	t	f	t	f	f	f	f	active	t	2025-05-20 05:01:14.233335	\N	2025-05-20 05:01:14.233335	\N	1	\N
20	SL008	Berlin Finished Goods	Finished product storage for Berlin plant	5	finished_goods	t	f	f	t	f	f	f	active	t	2025-05-20 05:01:14.250899	\N	2025-05-20 05:01:14.250899	\N	1	\N
21	SL009	Shanghai Materials	Raw material storage for Shanghai facility	6	raw_material	t	f	t	f	f	f	f	active	t	2025-05-20 05:01:14.273873	\N	2025-05-20 05:01:14.273873	\N	1	\N
22	SL010	Shanghai Finished Goods	Finished product storage for Shanghai facility	6	finished_goods	t	f	f	t	f	f	f	active	t	2025-05-20 05:01:14.293642	\N	2025-05-20 05:01:14.293642	\N	1	\N
23	SL011	US Distribution - Zone A	High-volume products distribution area	2	distribution	f	f	f	t	f	f	f	active	t	2025-05-20 05:01:14.314699	\N	2025-05-20 05:01:14.314699	\N	1	\N
24	SL012	US Distribution - Zone B	Specialty products distribution area	2	distribution	f	f	f	t	f	f	f	active	t	2025-05-20 05:01:14.339057	\N	2025-05-20 05:01:14.339057	\N	1	\N
25	SL013	European Warehouse - General	General storage area for European warehouse	7	distribution	f	f	f	t	f	f	f	active	t	2025-05-20 05:01:14.365961	\N	2025-05-20 05:01:14.365961	\N	1	\N
26	SL014	European Warehouse - Cold Storage	Temperature-controlled storage area	7	special_handling	f	f	f	t	f	f	f	active	t	2025-05-20 05:01:14.386335	\N	2025-05-20 05:01:14.386335	\N	1	\N
27	SL015	Asia Distribution - General	General storage area for Asian distribution hub	8	distribution	f	f	f	t	f	f	f	active	t	2025-05-20 05:01:14.408615	\N	2025-05-20 05:01:14.408615	\N	1	\N
28	SL016	UK Warehouse - Main	Main storage area for UK warehouse	9	distribution	f	f	f	t	f	f	f	active	t	2025-05-20 05:01:14.426302	\N	2025-05-20 05:01:14.426302	\N	1	\N
29	SL017	Hazardous Materials	Special storage for hazardous materials	1	hazardous	t	f	t	f	f	f	f	active	t	2025-05-20 05:01:14.444301	\N	2025-05-20 05:01:14.444301	\N	1	\N
30	SL018	Returns Processing	Area for processing customer returns	2	returns	f	f	t	f	f	f	f	active	t	2025-05-20 05:01:14.465474	\N	2025-05-20 05:01:14.465474	\N	1	\N
31	SL019	Maintenance Supplies	Storage for maintenance tools and supplies	1	maintenance	f	f	t	f	f	f	f	active	t	2025-05-20 05:01:14.484431	\N	2025-05-20 05:01:14.484431	\N	1	\N
32	SL020	Packaging Materials	Storage for packaging materials and supplies	1	packaging	t	f	t	f	f	f	f	active	t	2025-05-20 05:01:14.506819	\N	2025-05-20 05:01:14.506819	\N	1	\N
\.


--
-- Data for Name: supply_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.supply_types (id, code, name, description, is_active, created_at, updated_at, created_by, updated_by, version, valid_from, valid_to) FROM stdin;
1	DIR	Direct Materials	Materials directly used in manufacturing products	t	2025-05-20 03:25:53.97972	2025-05-20 03:25:53.97972	\N	\N	1	2025-05-20 03:25:53.97972	\N
2	IND	Indirect Materials	Materials indirectly used in manufacturing	t	2025-05-20 03:25:53.97972	2025-05-20 03:25:53.97972	\N	\N	1	2025-05-20 03:25:53.97972	\N
3	SERV	Services	Service-related procurement	t	2025-05-20 03:25:53.97972	2025-05-20 03:25:53.97972	\N	\N	1	2025-05-20 03:25:53.97972	\N
4	CAPEX	Capital Expenditure	Large equipment and capital investments	t	2025-05-20 03:25:53.97972	2025-05-20 03:25:53.97972	\N	\N	1	2025-05-20 03:25:53.97972	\N
5	MRO	Maintenance & Repair	Maintenance, repair, and operations supplies	t	2025-05-20 03:25:53.97972	2025-05-20 03:25:53.97972	\N	\N	1	2025-05-20 03:25:53.97972	\N
6	ST001	Direct Materials	Materials directly used in manufacturing	t	2025-05-20 04:52:27.64864	2025-05-20 04:52:27.64864	\N	\N	1	2025-05-20 04:52:27.64864	\N
7	ST002	Indirect Materials	Materials not directly used in manufacturing	t	2025-05-20 04:52:27.683957	2025-05-20 04:52:27.683957	\N	\N	1	2025-05-20 04:52:27.683957	\N
8	ST003	Capital Equipment	Long-term assets and equipment	t	2025-05-20 04:52:27.71506	2025-05-20 04:52:27.71506	\N	\N	1	2025-05-20 04:52:27.71506	\N
9	ST004	Services	External services and contracted work	t	2025-05-20 04:52:27.75151	2025-05-20 04:52:27.75151	\N	\N	1	2025-05-20 04:52:27.75151	\N
10	ST005	Trading Goods	Finished goods purchased for resale	t	2025-05-20 04:52:27.788036	2025-05-20 04:52:27.788036	\N	\N	1	2025-05-20 04:52:27.788036	\N
11	ST006	MRO Supplies	Maintenance, repair, and operations supplies	t	2025-05-20 04:52:27.83183	2025-05-20 04:52:27.83183	\N	\N	1	2025-05-20 04:52:27.83183	\N
\.


--
-- Data for Name: tax_codes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tax_codes (id, code, name, country, tax_type, percentage, description, is_active, created_at, updated_at) FROM stdin;
1	US-EX	US Exempt	US	SALES	0.00	Tax exempt sales in US	t	2025-05-20 22:10:47.493264	2025-05-20 22:10:47.493264
2	US-STD	US Standard	US	SALES	6.00	Standard US sales tax	t	2025-05-20 22:10:47.493264	2025-05-20 22:10:47.493264
3	US-NY	New York	US	SALES	8.88	New York City sales tax	t	2025-05-20 22:10:47.493264	2025-05-20 22:10:47.493264
4	DE-STD	Germany Standard	DE	VAT	19.00	Standard German VAT	t	2025-05-20 22:10:47.493264	2025-05-20 22:10:47.493264
5	DE-RED	Germany Reduced	DE	VAT	7.00	Reduced German VAT	t	2025-05-20 22:10:47.493264	2025-05-20 22:10:47.493264
6	UK-STD	UK Standard	GB	VAT	20.00	Standard UK VAT	t	2025-05-20 22:10:47.493264	2025-05-20 22:10:47.493264
7	JP-STD	Japan Standard	JP	CONSUMPTION	10.00	Standard Japanese consumption tax	t	2025-05-20 22:10:47.493264	2025-05-20 22:10:47.493264
10	US-RED	US Reduced Tax	US	SALES	2.50	United States reduced sales tax rate	t	2025-05-21 15:11:30.587326	2025-05-21 15:11:30.587326
11	US-EXE	US Tax Exempt	US	EXEMPT	0.00	United States tax exempt status	t	2025-05-21 15:11:30.587326	2025-05-21 15:11:30.587326
12	CA-GST	Canada GST	CA	SALES	5.00	Canada Goods and Services Tax	t	2025-05-21 15:11:30.587326	2025-05-21 15:11:30.587326
13	CA-HST	Canada HST	CA	SALES	13.00	Canada Harmonized Sales Tax	t	2025-05-21 15:11:30.587326	2025-05-21 15:11:30.587326
14	UK-VAT	UK Standard VAT	UK	VAT	20.00	United Kingdom standard Value Added Tax	t	2025-05-21 15:11:30.587326	2025-05-21 15:11:30.587326
15	UK-RED	UK Reduced VAT	UK	VAT	5.00	United Kingdom reduced Value Added Tax	t	2025-05-21 15:11:30.587326	2025-05-21 15:11:30.587326
16	UK-ZER	UK Zero VAT	UK	VAT	0.00	United Kingdom zero-rated Value Added Tax	t	2025-05-21 15:11:30.587326	2025-05-21 15:11:30.587326
17	EU-STD	EU Standard VAT	EU	VAT	21.00	European Union standard Value Added Tax	t	2025-05-21 15:11:30.587326	2025-05-21 15:11:30.587326
18	EU-RED	EU Reduced VAT	EU	VAT	10.00	European Union reduced Value Added Tax	t	2025-05-21 15:11:30.587326	2025-05-21 15:11:30.587326
\.


--
-- Data for Name: transport_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transport_logs (id, request_id, environment, action, status, message, executed_by, executed_at) FROM stdin;
1	1	DEV	TRANSPORT_CREATED	SUCCESS	Transport request MDK395986 created	DEVELOPER_001	2025-06-03 05:09:56.088744
2	2	DEV	TRANSPORT_CREATED	SUCCESS	Transport request MDK434665 created	SYSTEM_ADMIN	2025-06-03 05:10:34.710041
3	2	DEV	TRANSPORT_RELEASED	SUCCESS	Transport MDK434665 released for QA	SYSTEM	2025-06-03 05:10:54.196096
4	2	QA	TRANSPORT_IMPORTED	FAILED	Transport MDK434665 imported to QA	QA_ADMIN	2025-06-03 05:10:57.717893
5	3	DEV	TRANSPORT_CREATED	SUCCESS	Transport request MDK494346 created	SYSTEM_ADMIN	2025-06-03 05:11:34.379077
6	4	DEV	TRANSPORT_CREATED	SUCCESS	Transport request MDK557474 created	ERP_ADMIN	2025-06-03 05:12:37.509983
7	4	DEV	TRANSPORT_RELEASED	SUCCESS	Transport MDK557474 released for QA	SYSTEM	2025-06-03 05:12:47.03698
8	4	QA	TRANSPORT_IMPORTED	FAILED	Transport MDK557474 imported to QA	QA_ADMIN	2025-06-03 05:12:51.277264
9	5	DEV	CREATE	SUCCESS	Transport request A1100003 created with 1 objects	SYSTEM_USER	2025-06-03 16:34:14.749
\.


--
-- Data for Name: transport_number_ranges; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transport_number_ranges (id, range_prefix, range_type, description, current_number, max_number, is_active, created_at, updated_at) FROM stdin;
2	Y1	CUSTOM_DEV	Custom Development Objects - Level 1	100000	999999	t	2025-06-03 16:19:15.360657	2025-06-03 16:19:15.360657
3	Z1	CUSTOMER	Customer Customization Objects - Level 1	100000	999999	t	2025-06-03 16:19:15.379191	2025-06-03 16:19:15.379191
1	A1	STANDARD	Standard ERP Objects - Level 1	100003	999999	t	2025-06-03 16:19:15.319047	2025-06-03 16:34:14.437086
\.


--
-- Data for Name: transport_objects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transport_objects (id, request_id, object_type, object_name, table_name, record_id, action, data_snapshot, created_at) FROM stdin;
1	1	COMPANY_CODE	US01	company_codes	1	INSERT	{"id": 1, "city": null, "code": "US01", "name": "ACME Corporation USA", "email": null, "notes": null, "phone": null, "state": null, "tax_id": null, "address": null, "country": "United States", "version": 1, "website": null, "currency": "USD", "logo_url": null, "is_active": true, "created_at": "2025-05-17T13:43:44.835Z", "created_by": null, "updated_at": "2025-05-17T13:43:44.835Z", "updated_by": null, "description": null, "fiscal_year": "Calendar Year (Jan-Dec)", "postal_code": null}	2025-06-03 05:10:04.045575
2	1	PLANT	P001	plants	1	INSERT	{"id": 1, "city": "Chicago", "code": "P001", "name": "Main Factory", "type": "Manufacturing", "email": null, "notes": null, "phone": null, "state": null, "status": "active", "address": null, "country": "United States", "manager": null, "version": 1, "category": "Production", "timezone": null, "is_active": true, "created_at": "2025-05-17T13:44:11.172Z", "created_by": null, "updated_at": "2025-05-17T13:44:11.172Z", "updated_by": null, "coordinates": null, "description": null, "postal_code": null, "company_code_id": 1, "operating_hours": null}	2025-06-03 05:10:10.185206
3	2	COMPANY_CODE	US01	company_codes	1	INSERT	{"id": 1, "city": null, "code": "US01", "name": "ACME Corporation USA", "email": null, "notes": null, "phone": null, "state": null, "tax_id": null, "address": null, "country": "United States", "version": 1, "website": null, "currency": "USD", "logo_url": null, "is_active": true, "created_at": "2025-05-17T13:43:44.835Z", "created_by": null, "updated_at": "2025-05-17T13:43:44.835Z", "updated_by": null, "description": null, "fiscal_year": "Calendar Year (Jan-Dec)", "postal_code": null}	2025-06-03 05:10:38.682137
4	2	PLANT	P001	plants	1	INSERT	{"id": 1, "city": "Chicago", "code": "P001", "name": "Main Factory", "type": "Manufacturing", "email": null, "notes": null, "phone": null, "state": null, "status": "active", "address": null, "country": "United States", "manager": null, "version": 1, "category": "Production", "timezone": null, "is_active": true, "created_at": "2025-05-17T13:44:11.172Z", "created_by": null, "updated_at": "2025-05-17T13:44:11.172Z", "updated_by": null, "coordinates": null, "description": null, "postal_code": null, "company_code_id": 1, "operating_hours": null}	2025-06-03 05:10:38.725666
5	2	PLANT	W001	plants	2	INSERT	{"id": 2, "city": "Newark", "code": "W001", "name": "East Coast Warehouse", "type": "Warehouse", "email": null, "notes": null, "phone": null, "state": null, "status": "active", "address": null, "country": "United States", "manager": null, "version": 1, "category": "Storage", "timezone": null, "is_active": true, "created_at": "2025-05-17T13:44:11.172Z", "created_by": null, "updated_at": "2025-05-17T13:44:11.172Z", "updated_by": null, "coordinates": null, "description": null, "postal_code": null, "company_code_id": 1, "operating_hours": null}	2025-06-03 05:10:38.76116
6	3	COMPANY_CODE	US01	company_codes	1	INSERT	{"id": 1, "city": null, "code": "US01", "name": "ACME Corporation USA", "email": null, "notes": null, "phone": null, "state": null, "tax_id": null, "address": null, "country": "United States", "version": 1, "website": null, "currency": "USD", "logo_url": null, "is_active": true, "created_at": "2025-05-17T13:43:44.835Z", "created_by": null, "updated_at": "2025-05-17T13:43:44.835Z", "updated_by": null, "description": null, "fiscal_year": "Calendar Year (Jan-Dec)", "postal_code": null}	2025-06-03 05:11:38.890332
7	3	PLANT	P001	plants	1	INSERT	{"id": 1, "city": "Chicago", "code": "P001", "name": "Main Factory", "type": "Manufacturing", "email": null, "notes": null, "phone": null, "state": null, "status": "active", "address": null, "country": "United States", "manager": null, "version": 1, "category": "Production", "timezone": null, "is_active": true, "created_at": "2025-05-17T13:44:11.172Z", "created_by": null, "updated_at": "2025-05-17T13:44:11.172Z", "updated_by": null, "coordinates": null, "description": null, "postal_code": null, "company_code_id": 1, "operating_hours": null}	2025-06-03 05:11:38.923908
8	3	PLANT	W001	plants	2	INSERT	{"id": 2, "city": "Newark", "code": "W001", "name": "East Coast Warehouse", "type": "Warehouse", "email": null, "notes": null, "phone": null, "state": null, "status": "active", "address": null, "country": "United States", "manager": null, "version": 1, "category": "Storage", "timezone": null, "is_active": true, "created_at": "2025-05-17T13:44:11.172Z", "created_by": null, "updated_at": "2025-05-17T13:44:11.172Z", "updated_by": null, "coordinates": null, "description": null, "postal_code": null, "company_code_id": 1, "operating_hours": null}	2025-06-03 05:11:38.957773
9	4	COMPANY_CODE	US01	company_codes	1	INSERT	{"id": 1, "city": null, "code": "US01", "name": "ACME Corporation USA", "email": null, "notes": null, "phone": null, "state": null, "tax_id": null, "address": null, "country": "United States", "version": 1, "website": null, "currency": "USD", "logo_url": null, "is_active": true, "created_at": "2025-05-17T13:43:44.835Z", "created_by": null, "updated_at": "2025-05-17T13:43:44.835Z", "updated_by": null, "description": null, "fiscal_year": "Calendar Year (Jan-Dec)", "postal_code": null}	2025-06-03 05:12:42.300606
10	4	PLANT	P001	plants	1	INSERT	{"id": 1, "city": "Chicago", "code": "P001", "name": "Main Factory", "type": "Manufacturing", "email": null, "notes": null, "phone": null, "state": null, "status": "active", "address": null, "country": "United States", "manager": null, "version": 1, "category": "Production", "timezone": null, "is_active": true, "created_at": "2025-05-17T13:44:11.172Z", "created_by": null, "updated_at": "2025-05-17T13:44:11.172Z", "updated_by": null, "coordinates": null, "description": null, "postal_code": null, "company_code_id": 1, "operating_hours": null}	2025-06-03 05:12:42.337057
11	4	PLANT	W001	plants	2	INSERT	{"id": 2, "city": "Newark", "code": "W001", "name": "East Coast Warehouse", "type": "Warehouse", "email": null, "notes": null, "phone": null, "state": null, "status": "active", "address": null, "country": "United States", "manager": null, "version": 1, "category": "Storage", "timezone": null, "is_active": true, "created_at": "2025-05-17T13:44:11.172Z", "created_by": null, "updated_at": "2025-05-17T13:44:11.172Z", "updated_by": null, "coordinates": null, "description": null, "postal_code": null, "company_code_id": 1, "operating_hours": null}	2025-06-03 05:12:42.371786
12	5	Master Data	UK01	company_codes	\N	CREATE	{"id": 11, "city": null, "code": "UK01", "name": "United Kingdom Branch", "email": null, "notes": null, "phone": null, "state": null, "tax_id": null, "address": null, "country": "United Kingdom", "version": 1, "website": null, "currency": "GBP", "logo_url": null, "is_active": true, "created_at": "2025-05-20T03:55:35.337Z", "created_by": null, "updated_at": "2025-05-20T03:55:35.337Z", "updated_by": null, "description": "UK sales and distribution", "fiscal_year": "2025", "postal_code": null}	2025-06-03 16:34:14.698
\.


--
-- Data for Name: transport_requests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transport_requests (id, request_number, request_type, description, owner, status, source_environment, target_environment, created_at, released_at, imported_at, release_notes) FROM stdin;
1	MDK395986	MD	Transport Company Code with dependent master data	DEVELOPER_001	CREATED	DEV	QA	2025-06-03 05:09:56.056941	\N	\N	\N
2	MDK434665	MD	Complete organizational structure transport with referential integrity	SYSTEM_ADMIN	FAILED	DEV	QA	2025-06-03 05:10:34.676022	2025-06-03 05:10:54.159074	2025-06-03 05:10:57.699986	Organizational structure ready for QA testing - includes Company Code US01 with dependent plants P001 and W001. All referential integrity validated.
3	MDK494346	MD	Complete CI/CD demonstration - organizational master data with referential integrity	SYSTEM_ADMIN	CREATED	DEV	QA	2025-06-03 05:11:34.355374	\N	\N	\N
4	MDK557474	MD	Final CI/CD demonstration - Enterprise-style master data transport with referential integrity	ERP_ADMIN	FAILED	DEV	QA	2025-06-03 05:12:37.485285	2025-06-03 05:12:47.003937	2025-06-03 05:12:51.258397	Enterprise-style CI/CD transport ready for QA - Company Code US01 with dependent Plants P001 and W001. Complete referential integrity validation passed.
5	A1100003	MANUAL	MD - Company Code UK01	SYSTEM_USER	MODIFIABLE	DEV	QA	2025-06-03 16:34:14.606	\N	\N	\N
\.


--
-- Data for Name: units_of_measure; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.units_of_measure (id, code, name, description, is_active, dimension, conversion_factor, base_uom_id, created_at, updated_at, version) FROM stdin;
21	BOX	Box	Standard shipping box	t	Count	1.00000	1	2025-05-20 14:35:23.427158	2025-05-20 14:35:23.427158	1
22	PK	Pack	Standard package unit	t	Count	1.00000	1	2025-05-20 14:35:23.450134	2025-05-20 14:35:23.450134	1
23	CS	Case	Standard shipping case	t	Count	1.00000	1	2025-05-20 14:35:23.469472	2025-05-20 14:35:23.469472	1
24	PAL	Pallet	Standard shipping pallet	t	Count	1.00000	1	2025-05-20 14:35:23.487324	2025-05-20 14:35:23.487324	1
25	BDL	Bundle	Bundled items	t	Count	1.00000	1	2025-05-20 14:35:23.504645	2025-05-20 14:35:23.504645	1
26	ROL	Roll	Material in roll form	t	Count	1.00000	1	2025-05-20 14:35:23.523414	2025-05-20 14:35:23.523414	1
1	EA	Each	Individual units/pieces	t	Count	1.00000	\N	2025-05-20 14:35:22.9723	2025-05-20 14:35:22.9723	1
2	KG	Kilogram	Standard weight measure	t	Weight	1.00000	\N	2025-05-20 14:35:22.993509	2025-05-20 14:35:22.993509	1
3	L	Liter	Standard volume measure	t	Volume	1.00000	\N	2025-05-20 14:35:23.012083	2025-05-20 14:35:23.012083	1
4	M	Meter	Standard length measure	t	Length	1.00000	\N	2025-05-20 14:35:23.031217	2025-05-20 14:35:23.031217	1
5	M2	Square Meter	Standard area measure	t	Area	1.00000	\N	2025-05-20 14:35:23.051068	2025-05-20 14:35:23.051068	1
6	M3	Cubic Meter	Standard cubic measure	t	Volume	1.00000	\N	2025-05-20 14:35:23.091756	2025-05-20 14:35:23.091756	1
7	HR	Hour	Time duration in hours	t	Time	1.00000	\N	2025-05-20 14:35:23.126854	2025-05-20 14:35:23.126854	1
8	DZ	Dozen	12 pieces	t	Count	12.00000	1	2025-05-20 14:35:23.149004	2025-05-20 14:35:23.149004	1
18	LB	Pound	Imperial weight unit	t	Weight	0.45359	2	2025-05-20 14:35:23.360131	2025-05-20 14:35:23.360131	1
19	OZ	Ounce	Imperial weight unit	t	Weight	0.02835	2	2025-05-20 14:35:23.380406	2025-05-20 14:35:23.380406	1
9	G	Gram	1/1000 of a kilogram	t	Weight	0.00100	2	2025-05-20 14:35:23.167923	2025-05-20 14:35:23.167923	1
10	TON	Metric Ton	1000 kilograms	t	Weight	1000.00000	2	2025-05-20 14:35:23.188929	2025-05-20 14:35:23.188929	1
20	GAL	Gallon	Imperial volume unit	t	Volume	3.78541	3	2025-05-20 14:35:23.407112	2025-05-20 14:35:23.407112	1
11	ML	Milliliter	1/1000 of a liter	t	Volume	0.00100	3	2025-05-20 14:35:23.211278	2025-05-20 14:35:23.211278	1
14	KM	Kilometer	1000 meters	t	Length	1000.00000	4	2025-05-20 14:35:23.278287	2025-05-20 14:35:23.278287	1
15	FT	Feet	Imperial length unit	t	Length	0.30480	4	2025-05-20 14:35:23.296244	2025-05-20 14:35:23.296244	1
16	IN	Inch	Imperial length unit	t	Length	0.02540	4	2025-05-20 14:35:23.318598	2025-05-20 14:35:23.318598	1
17	YD	Yard	Imperial length unit	t	Length	0.91440	4	2025-05-20 14:35:23.338962	2025-05-20 14:35:23.338962	1
12	CM	Centimeter	1/100 of a meter	t	Length	0.01000	4	2025-05-20 14:35:23.240106	2025-05-20 14:35:23.240106	1
13	MM	Millimeter	1/1000 of a meter	t	Length	0.00100	4	2025-05-20 14:35:23.260301	2025-05-20 14:35:23.260301	1
27	MIN	Minute	Time duration in minutes	t	Time	0.01667	7	2025-05-20 14:35:23.542799	2025-05-20 14:35:23.542799	1
28	DAY	Day	Time duration in days	t	Time	24.00000	7	2025-05-20 14:35:23.562736	2025-05-20 14:35:23.562736	1
29	WK	Week	Time duration in weeks	t	Time	168.00000	7	2025-05-20 14:35:23.581007	2025-05-20 14:35:23.581007	1
30	MO	Month	Time duration in months	t	Time	730.00000	7	2025-05-20 14:35:23.601732	2025-05-20 14:35:23.601732	1
\.


--
-- Data for Name: uom; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.uom (id, code, name, description, category, is_base, created_at, created_by, updated_at, updated_by, version, is_active, notes) FROM stdin;
1	KG	Kilogram	\N	weight	t	2025-05-17 05:55:13.089835	1	2025-05-17 05:55:13.089835	1	1	t	\N
2	G	Gram	\N	weight	f	2025-05-17 05:55:13.089835	1	2025-05-17 05:55:13.089835	1	1	t	\N
3	LB	Pound	\N	weight	f	2025-05-17 05:55:13.089835	1	2025-05-17 05:55:13.089835	1	1	t	\N
4	M	Meter	\N	length	t	2025-05-17 05:55:13.089835	1	2025-05-17 05:55:13.089835	1	1	t	\N
5	CM	Centimeter	\N	length	f	2025-05-17 05:55:13.089835	1	2025-05-17 05:55:13.089835	1	1	t	\N
6	INCH	Inch	\N	length	f	2025-05-17 05:55:13.089835	1	2025-05-17 05:55:13.089835	1	1	t	\N
7	L	Liter	\N	volume	t	2025-05-17 05:55:13.089835	1	2025-05-17 05:55:13.089835	1	1	t	\N
8	ML	Milliliter	\N	volume	f	2025-05-17 05:55:13.089835	1	2025-05-17 05:55:13.089835	1	1	t	\N
9	GAL	Gallon	\N	volume	f	2025-05-17 05:55:13.089835	1	2025-05-17 05:55:13.089835	1	1	t	\N
10	EA	Each	\N	unit	t	2025-05-17 05:55:13.089835	1	2025-05-17 05:55:13.089835	1	1	t	\N
11	PCS	Pieces	\N	unit	f	2025-05-17 05:55:13.089835	1	2025-05-17 05:55:13.089835	1	1	t	\N
12	BOX	Box	\N	package	t	2025-05-17 05:55:13.089835	1	2025-05-17 05:55:13.089835	1	1	t	\N
13	Oz	OZ	OZ	Weight	f	2025-05-17 12:34:16.642	1	2025-05-17 12:34:16.642	1	1	t	\N
14	PC	Piece	Standard Piece	Count	t	2025-05-20 16:12:26.384342	\N	2025-05-20 16:12:26.384342	\N	1	t	\N
\.


--
-- Data for Name: uom_conversions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.uom_conversions (id, from_uom_id, to_uom_id, conversion_factor, created_at, created_by, updated_at, updated_by, version, is_active, notes) FROM stdin;
1	1	2	1000	2025-05-17 05:55:19.590846	1	2025-05-17 05:55:19.590846	1	1	t	\N
2	1	3	2.20462	2025-05-17 05:55:19.590846	1	2025-05-17 05:55:19.590846	1	1	t	\N
3	4	5	100	2025-05-17 05:55:19.590846	1	2025-05-17 05:55:19.590846	1	1	t	\N
4	4	6	39.3701	2025-05-17 05:55:19.590846	1	2025-05-17 05:55:19.590846	1	1	t	\N
5	7	8	1000	2025-05-17 05:55:19.590846	1	2025-05-17 05:55:19.590846	1	1	t	\N
6	7	9	0.264172	2025-05-17 05:55:19.590846	1	2025-05-17 05:55:19.590846	1	1	t	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, username, password, name, email, role, created_at, updated_at) FROM stdin;
1	admin	admin123	Administrator	admin@example.com	admin	2025-05-17 05:55:13.089835	2025-05-17 05:55:13.089835
\.


--
-- Data for Name: variance_analysis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.variance_analysis (id, variance_type, object_type, object_number, fiscal_year, period, account, cost_element, planned_amount, actual_amount, variance_amount, variance_percentage, currency, analysis_date, created_at) FROM stdin;
\.


--
-- Data for Name: vendor_contacts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vendor_contacts (id, vendor_id, first_name, last_name, "position", department, email, phone, mobile, is_primary, is_order_contact, is_purchase_contact, is_quality_contact, is_accounts_contact, preferred_language, notes, is_active, created_at, updated_at, created_by, updated_by) FROM stdin;
1	1	Thomas	Anderson	Technical Support	Support	thomas.anderson@supplier.com	(555) 333-4444	(555) 555-6666	t	f	f	f	f	English	\N	t	2025-05-22 13:33:13.574	2025-05-22 13:33:13.574	\N	\N
2	1	Jennifer	Taylor	Account Manager	Customer Relations	jennifer.taylor@supplier.com	(555) 222-3333	(555) 444-5555	f	f	f	f	f	English	\N	t	2025-05-22 13:33:13.615	2025-05-22 13:33:13.615	\N	\N
3	2	Robert	Wilson	Sales Representative	Sales	robert.wilson@supplier.com	(555) 111-2222	(555) 333-4444	t	f	f	f	f	English	\N	t	2025-05-22 13:33:13.655	2025-05-22 13:33:13.655	\N	\N
4	3	William	Thompson	Logistics Coordinator	Logistics	william.thompson@supplier.com	(555) 555-6666	(555) 777-8888	t	f	f	f	f	English	\N	t	2025-05-22 13:33:13.692	2025-05-22 13:33:13.692	\N	\N
5	3	William	Thompson	Logistics Coordinator	Logistics	william.thompson@supplier.com	(555) 555-6666	(555) 777-8888	f	f	f	f	f	English	\N	t	2025-05-22 13:33:13.729	2025-05-22 13:33:13.729	\N	\N
6	3	Elizabeth	Martin	VP of Sales	Executive	elizabeth.martin@supplier.com	(555) 444-5555	(555) 666-7777	f	f	f	f	f	English	\N	t	2025-05-22 13:33:13.767	2025-05-22 13:33:13.767	\N	\N
7	4	Robert	Wilson	Sales Representative	Sales	robert.wilson@supplier.com	(555) 111-2222	(555) 333-4444	t	f	f	f	f	English	\N	t	2025-05-22 13:33:13.807	2025-05-22 13:33:13.807	\N	\N
8	5	Elizabeth	Martin	VP of Sales	Executive	elizabeth.martin@supplier.com	(555) 444-5555	(555) 666-7777	t	f	f	f	f	English	\N	t	2025-05-22 13:33:13.864	2025-05-22 13:33:13.864	\N	\N
9	5	Robert	Wilson	Sales Representative	Sales	robert.wilson@supplier.com	(555) 111-2222	(555) 333-4444	f	f	f	f	f	English	\N	t	2025-05-22 13:33:13.905	2025-05-22 13:33:13.905	\N	\N
10	5	William	Thompson	Logistics Coordinator	Logistics	william.thompson@supplier.com	(555) 555-6666	(555) 777-8888	f	f	f	f	f	English	\N	t	2025-05-22 13:33:13.944	2025-05-22 13:33:13.944	\N	\N
\.


--
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vendors (id, code, name, type, description, tax_id, industry, address, city, state, country, postal_code, region, phone, alt_phone, email, website, currency, payment_terms, payment_method, supplier_type, category, order_frequency, minimum_order_value, evaluation_score, lead_time, purchasing_group_id, status, blacklisted, blacklist_reason, notes, tags, company_code_id, is_active, created_at, updated_at, created_by, updated_by, version) FROM stdin;
1	VEND001	Global Raw Materials Inc	SUPPLIER	\N	123-45-6789	\N	100 Supplier Road, Chicago, IL 60601	\N	\N	US	\N	\N	+1-312-555-1234	\N	sales@grm.example.com	\N	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	active	f	\N	Primary raw material supplier	\N	\N	t	2025-05-20 18:17:22.279989	2025-05-20 18:17:22.279989	\N	\N	1
2	VEND002	European Components GmbH	MANUFACTURER	\N	DE123456789	\N	Industrieweg 10, Munich, 80331	\N	\N	DE	\N	\N	+49-89-1234-5678	\N	orders@eurocomponents.example.de	\N	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	active	f	\N	European electronics components supplier	\N	\N	t	2025-05-20 18:17:22.301591	2025-05-20 18:17:22.301591	\N	\N	1
3	VEND003	Asian Electronics Ltd	MANUFACTURER	\N	SG987654321	\N	1 Electronics Way, Singapore, 618989	\N	\N	SG	\N	\N	+65-6789-1234	\N	sales@asianelec.example.sg	\N	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	active	f	\N	Electronics components supplier	\N	\N	t	2025-05-20 18:17:22.320725	2025-05-20 18:17:22.320725	\N	\N	1
4	VEND004	Quality Packaging Ltd	SUPPLIER	\N	GB123456789	\N	10 Packaging Street, Manchester, M1 1AA	\N	\N	GB	\N	\N	+44-161-123-4567	\N	sales@qualitypack.example.uk	\N	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	active	f	\N	Packaging materials supplier	\N	\N	t	2025-05-20 18:17:22.341416	2025-05-20 18:17:22.341416	\N	\N	1
5	VEND005	Japan Precision Tools	MANUFACTURER	\N	JP1234567890	\N	2-1 Industrial Area, Osaka, 530-0001	\N	\N	JP	\N	\N	+81-6-1234-5678	\N	export@jpt.example.jp	\N	\N	NET15	\N	\N	\N	\N	\N	\N	\N	\N	active	f	\N	Precision tools manufacturer	\N	\N	t	2025-05-20 18:17:22.360311	2025-05-20 18:17:22.360311	\N	\N	1
\.


--
-- Data for Name: warehouse_bins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.warehouse_bins (id, bin_code, bin_name, storage_location_id, bin_type, zone, aisle, shelf, capacity_volume, capacity_weight, current_volume, current_weight, status, created_at) FROM stdin;
\.


--
-- Data for Name: work_centers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.work_centers (id, code, name, plant_id, description, capacity, capacity_unit, cost_rate, is_active, created_at, updated_at, status, cost_center_id, company_code_id) FROM stdin;
1	WC-ASM-01	Primary Assembly Line	1	Main assembly line for final product assembly with automated stations	120.00	units/day	65.75	t	2025-05-21 02:02:30.35722	2025-05-21 02:02:30.35722	active	\N	\N
2	WC-ASM-02	Secondary Assembly	1	Manual assembly operations for complex components	85.00	units/day	48.50	t	2025-05-21 02:02:30.35722	2025-05-21 02:02:30.35722	active	\N	\N
3	WC-SUBASM	Sub-Assembly Station	2	Pre-assembly of component groups before main assembly	200.00	units/day	42.25	t	2025-05-21 02:02:30.35722	2025-05-21 02:02:30.35722	active	\N	\N
4	WC-MCH-01	CNC Machining Center	2	Precision CNC machining for critical components	65.00	units/day	78.50	t	2025-05-21 02:02:30.35722	2025-05-21 02:02:30.35722	active	\N	\N
5	WC-MCH-02	Milling Station	3	Multi-axis milling operations for complex geometries	40.00	units/day	82.75	t	2025-05-21 02:02:30.35722	2025-05-21 02:02:30.35722	active	\N	\N
6	WC-QC-01	Quality Inspection	1	Manual and automated quality inspection station	180.00	units/day	45.25	t	2025-05-21 02:02:30.35722	2025-05-21 02:02:30.35722	active	\N	\N
7	WC-PKG-01	Packaging Line	1	Automated packaging system for finished products	200.00	units/day	38.75	t	2025-05-21 02:02:30.35722	2025-05-21 02:02:30.35722	active	\N	\N
8	WC-WELD-01	Robotic Welding	4	Automated welding cells for consistent high-quality joints	60.00	units/day	72.25	t	2025-05-21 02:02:30.35722	2025-05-21 02:02:30.35722	active	\N	\N
9	WC-LASER	Laser Cutting Station	5	Precision laser cutting for sheet materials	70.00	units/day	92.50	t	2025-05-21 02:02:30.35722	2025-05-21 02:02:30.35722	maintenance	\N	\N
10	WC-3DPRINT	Additive Manufacturing	6	3D printing facility for prototypes and small production runs	30.00	units/day	105.75	f	2025-05-21 02:02:30.35722	2025-05-21 02:02:30.35722	inactive	\N	\N
11	WC-W001A	Assembly Line - East Coast Warehouse	2	Main assembly line for East Coast Warehouse	480.00	\N	\N	t	2025-05-21 14:57:16.95612	2025-05-21 14:57:16.95612	ACTIVE	\N	\N
12	WC-p001A	Assembly Line - plant South East	4	Main assembly line for plant South East	480.00	\N	\N	t	2025-05-21 14:57:16.95612	2025-05-21 14:57:16.95612	ACTIVE	\N	\N
13	WC-P004A	Assembly Line - Shanghai Facility	6	Main assembly line for Shanghai Facility	480.00	\N	\N	t	2025-05-21 14:57:16.95612	2025-05-21 14:57:16.95612	ACTIVE	\N	\N
14	WC-P003A	Assembly Line - Berlin Production	5	Main assembly line for Berlin Production	480.00	\N	\N	t	2025-05-21 14:57:16.95612	2025-05-21 14:57:16.95612	ACTIVE	\N	\N
15	WC-P001A	Assembly Line - Main Factory	1	Main assembly line for Main Factory	480.00	\N	\N	t	2025-05-21 14:57:16.95612	2025-05-21 14:57:16.95612	ACTIVE	\N	\N
16	WC-W003P	Packaging - Asian Distribution Hub	8	Packaging workstation for Asian Distribution Hub	960.00	\N	\N	t	2025-05-21 14:57:26.598637	2025-05-21 14:57:26.598637	ACTIVE	\N	\N
17	WC-P004P	Packaging - Shanghai Facility	6	Packaging workstation for Shanghai Facility	960.00	\N	\N	t	2025-05-21 14:57:26.598637	2025-05-21 14:57:26.598637	ACTIVE	\N	\N
18	WC-p001P	Packaging - plant South East	4	Packaging workstation for plant South East	960.00	\N	\N	t	2025-05-21 14:57:26.598637	2025-05-21 14:57:26.598637	ACTIVE	\N	\N
19	WC-W004P	Packaging - UK Warehouse	9	Packaging workstation for UK Warehouse	960.00	\N	\N	t	2025-05-21 14:57:26.598637	2025-05-21 14:57:26.598637	ACTIVE	\N	\N
20	WC-W001P	Packaging - East Coast Warehouse	2	Packaging workstation for East Coast Warehouse	960.00	\N	\N	t	2025-05-21 14:57:26.598637	2025-05-21 14:57:26.598637	ACTIVE	\N	\N
21	WC-AB01	Abdul WC	1	Abdul Workcenter Demo	50.00	units/day	50.00	t	2025-05-21 16:40:07.940798	2025-05-21 16:40:07.940798	active	\N	\N
\.


--
-- Name: accounts_payable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.accounts_payable_id_seq', 20, true);


--
-- Name: accounts_receivable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.accounts_receivable_id_seq', 25, true);


--
-- Name: activity_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.activity_types_id_seq', 5, true);


--
-- Name: ai_agent_analytics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ai_agent_analytics_id_seq', 1, false);


--
-- Name: ai_agent_configs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ai_agent_configs_id_seq', 7, true);


--
-- Name: ai_agent_health_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ai_agent_health_id_seq', 1, false);


--
-- Name: ai_chat_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ai_chat_messages_id_seq', 1, false);


--
-- Name: ai_chat_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ai_chat_sessions_id_seq', 1, false);


--
-- Name: ai_data_analysis_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ai_data_analysis_sessions_id_seq', 1, false);


--
-- Name: api_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.api_keys_id_seq', 2, true);


--
-- Name: approval_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.approval_levels_id_seq', 11, true);


--
-- Name: asset_master_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.asset_master_id_seq', 15, true);


--
-- Name: batch_master_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.batch_master_id_seq', 1, false);


--
-- Name: bill_of_materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bill_of_materials_id_seq', 8, true);


--
-- Name: bom_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bom_items_id_seq', 18, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, true);


--
-- Name: chart_of_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.chart_of_accounts_id_seq', 41, true);


--
-- Name: company_code_chart_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.company_code_chart_assignments_id_seq', 1, true);


--
-- Name: company_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.company_codes_id_seq', 17, true);


--
-- Name: copa_actuals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.copa_actuals_id_seq', 1, false);


--
-- Name: cost_allocations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cost_allocations_id_seq', 1, false);


--
-- Name: cost_center_actuals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cost_center_actuals_id_seq', 135, true);


--
-- Name: cost_center_planning_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cost_center_planning_id_seq', 138, true);


--
-- Name: cost_centers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cost_centers_id_seq', 22, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.countries_id_seq', 12, true);


--
-- Name: credit_control_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.credit_control_areas_id_seq', 5, true);


--
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.currencies_id_seq', 5, true);


--
-- Name: custom_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.custom_reports_id_seq', 5, true);


--
-- Name: customer_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customer_contacts_id_seq', 12, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_id_seq', 5, true);


--
-- Name: dashboard_configs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dashboard_configs_id_seq', 29, true);


--
-- Name: employee_master_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.employee_master_id_seq', 1, false);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.employees_id_seq', 12, true);


--
-- Name: environment_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.environment_config_id_seq', 1, false);


--
-- Name: erp_customer_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.erp_customer_contacts_id_seq', 10, true);


--
-- Name: erp_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.erp_customers_id_seq', 10, true);


--
-- Name: erp_vendor_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.erp_vendor_contacts_id_seq', 12, true);


--
-- Name: erp_vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.erp_vendors_id_seq', 12, true);


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.expenses_id_seq', 18, true);


--
-- Name: fiscal_periods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fiscal_periods_id_seq', 12, true);


--
-- Name: fiscal_year_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.fiscal_year_variants_id_seq', 4, true);


--
-- Name: general_ledger_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.general_ledger_accounts_id_seq', 1, false);


--
-- Name: gl_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.gl_accounts_id_seq', 35, true);


--
-- Name: internal_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.internal_orders_id_seq', 1, false);


--
-- Name: inventory_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inventory_transactions_id_seq', 1, false);


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.invoices_id_seq', 10, true);


--
-- Name: journal_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.journal_entries_id_seq', 5, true);


--
-- Name: leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.leads_id_seq', 24, true);


--
-- Name: material_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.material_categories_id_seq', 11, true);


--
-- Name: materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.materials_id_seq', 17, true);


--
-- Name: opportunities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.opportunities_id_seq', 17, true);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.order_items_id_seq', 131, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_id_seq', 52, true);


--
-- Name: plants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.plants_id_seq', 11, true);


--
-- Name: production_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.production_orders_id_seq', 5, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 20, true);


--
-- Name: profit_centers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.profit_centers_id_seq', 20, true);


--
-- Name: purchase_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchase_groups_id_seq', 12, true);


--
-- Name: purchase_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchase_order_items_id_seq', 1, false);


--
-- Name: purchase_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchase_orders_id_seq', 5, true);


--
-- Name: purchase_organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchase_organizations_id_seq', 24, true);


--
-- Name: quote_approvals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.quote_approvals_id_seq', 16, true);


--
-- Name: quote_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.quote_items_id_seq', 10, true);


--
-- Name: quotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.quotes_id_seq', 7, true);


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.regions_id_seq', 4, true);


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reports_id_seq', 5, true);


--
-- Name: sales_customer_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sales_customer_contacts_id_seq', 11, true);


--
-- Name: sales_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sales_customers_id_seq', 7, true);


--
-- Name: sales_invoice_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sales_invoice_items_id_seq', 9, true);


--
-- Name: sales_invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sales_invoices_id_seq', 5, true);


--
-- Name: sales_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sales_order_items_id_seq', 11, true);


--
-- Name: sales_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sales_orders_id_seq', 5, true);


--
-- Name: sales_organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sales_organizations_id_seq', 25, true);


--
-- Name: sales_quote_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sales_quote_items_id_seq', 12, true);


--
-- Name: sales_quotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sales_quotes_id_seq', 5, true);


--
-- Name: sales_return_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sales_return_items_id_seq', 7, true);


--
-- Name: sales_returns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sales_returns_id_seq', 4, true);


--
-- Name: stock_movements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stock_movements_id_seq', 28, true);


--
-- Name: storage_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.storage_locations_id_seq', 52, true);


--
-- Name: supply_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.supply_types_id_seq', 11, true);


--
-- Name: tax_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tax_codes_id_seq', 18, true);


--
-- Name: transport_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transport_logs_id_seq', 9, true);


--
-- Name: transport_number_ranges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transport_number_ranges_id_seq', 687, true);


--
-- Name: transport_objects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transport_objects_id_seq', 12, true);


--
-- Name: transport_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transport_requests_id_seq', 5, true);


--
-- Name: units_of_measure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.units_of_measure_id_seq', 30, true);


--
-- Name: uom_conversions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.uom_conversions_id_seq', 6, true);


--
-- Name: uom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.uom_id_seq', 14, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: variance_analysis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.variance_analysis_id_seq', 1, false);


--
-- Name: vendor_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vendor_contacts_id_seq', 10, true);


--
-- Name: vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vendors_id_seq', 5, true);


--
-- Name: warehouse_bins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.warehouse_bins_id_seq', 1, false);


--
-- Name: work_centers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.work_centers_id_seq', 21, true);


--
-- Name: accounts_payable accounts_payable_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_payable
    ADD CONSTRAINT accounts_payable_pkey PRIMARY KEY (id);


--
-- Name: accounts_receivable accounts_receivable_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_receivable
    ADD CONSTRAINT accounts_receivable_pkey PRIMARY KEY (id);


--
-- Name: activity_types activity_types_activity_type_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_types
    ADD CONSTRAINT activity_types_activity_type_key UNIQUE (activity_type);


--
-- Name: activity_types activity_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_types
    ADD CONSTRAINT activity_types_pkey PRIMARY KEY (id);


--
-- Name: ai_agent_analytics ai_agent_analytics_module_type_date_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_analytics
    ADD CONSTRAINT ai_agent_analytics_module_type_date_key UNIQUE (module_type, date);


--
-- Name: ai_agent_analytics ai_agent_analytics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_analytics
    ADD CONSTRAINT ai_agent_analytics_pkey PRIMARY KEY (id);


--
-- Name: ai_agent_configs ai_agent_configs_module_type_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_configs
    ADD CONSTRAINT ai_agent_configs_module_type_key UNIQUE (module_type);


--
-- Name: ai_agent_configs ai_agent_configs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_configs
    ADD CONSTRAINT ai_agent_configs_pkey PRIMARY KEY (id);


--
-- Name: ai_agent_health ai_agent_health_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_health
    ADD CONSTRAINT ai_agent_health_pkey PRIMARY KEY (id);


--
-- Name: ai_chat_messages ai_chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_chat_messages
    ADD CONSTRAINT ai_chat_messages_pkey PRIMARY KEY (id);


--
-- Name: ai_chat_sessions ai_chat_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_chat_sessions
    ADD CONSTRAINT ai_chat_sessions_pkey PRIMARY KEY (id);


--
-- Name: ai_chat_sessions ai_chat_sessions_session_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_chat_sessions
    ADD CONSTRAINT ai_chat_sessions_session_id_key UNIQUE (session_id);


--
-- Name: ai_data_analysis_sessions ai_data_analysis_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_data_analysis_sessions
    ADD CONSTRAINT ai_data_analysis_sessions_pkey PRIMARY KEY (id);


--
-- Name: ai_data_analysis_sessions ai_data_analysis_sessions_session_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_data_analysis_sessions
    ADD CONSTRAINT ai_data_analysis_sessions_session_id_key UNIQUE (session_id);


--
-- Name: api_keys api_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.api_keys
    ADD CONSTRAINT api_keys_pkey PRIMARY KEY (id);


--
-- Name: api_keys api_keys_service_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.api_keys
    ADD CONSTRAINT api_keys_service_name_key UNIQUE (service_name);


--
-- Name: approval_levels approval_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.approval_levels
    ADD CONSTRAINT approval_levels_pkey PRIMARY KEY (id);


--
-- Name: asset_master asset_master_asset_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asset_master
    ADD CONSTRAINT asset_master_asset_number_key UNIQUE (asset_number);


--
-- Name: asset_master asset_master_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asset_master
    ADD CONSTRAINT asset_master_pkey PRIMARY KEY (id);


--
-- Name: batch_master batch_master_batch_number_material_id_plant_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batch_master
    ADD CONSTRAINT batch_master_batch_number_material_id_plant_id_key UNIQUE (batch_number, material_id, plant_id);


--
-- Name: batch_master batch_master_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batch_master
    ADD CONSTRAINT batch_master_pkey PRIMARY KEY (id);


--
-- Name: bill_of_materials bill_of_materials_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bill_of_materials
    ADD CONSTRAINT bill_of_materials_code_key UNIQUE (code);


--
-- Name: bill_of_materials bill_of_materials_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bill_of_materials
    ADD CONSTRAINT bill_of_materials_pkey PRIMARY KEY (id);


--
-- Name: bom_items bom_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bom_items
    ADD CONSTRAINT bom_items_pkey PRIMARY KEY (id);


--
-- Name: categories categories_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_unique UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: chart_of_accounts chart_of_accounts_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chart_of_accounts
    ADD CONSTRAINT chart_of_accounts_code_key UNIQUE (code);


--
-- Name: chart_of_accounts chart_of_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chart_of_accounts
    ADD CONSTRAINT chart_of_accounts_pkey PRIMARY KEY (id);


--
-- Name: company_code_chart_assignments company_code_chart_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_code_chart_assignments
    ADD CONSTRAINT company_code_chart_assignments_pkey PRIMARY KEY (id);


--
-- Name: company_codes company_code_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_codes
    ADD CONSTRAINT company_code_unique UNIQUE (code);


--
-- Name: company_codes company_codes_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_codes
    ADD CONSTRAINT company_codes_code_key UNIQUE (code);


--
-- Name: company_codes company_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_codes
    ADD CONSTRAINT company_codes_pkey PRIMARY KEY (id);


--
-- Name: copa_actuals copa_actuals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.copa_actuals
    ADD CONSTRAINT copa_actuals_pkey PRIMARY KEY (id);


--
-- Name: cost_allocations cost_allocations_allocation_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_allocations
    ADD CONSTRAINT cost_allocations_allocation_id_key UNIQUE (allocation_id);


--
-- Name: cost_allocations cost_allocations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_allocations
    ADD CONSTRAINT cost_allocations_pkey PRIMARY KEY (id);


--
-- Name: cost_center_actuals cost_center_actuals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_center_actuals
    ADD CONSTRAINT cost_center_actuals_pkey PRIMARY KEY (id);


--
-- Name: cost_center_planning cost_center_planning_cost_center_fiscal_year_period_version_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_center_planning
    ADD CONSTRAINT cost_center_planning_cost_center_fiscal_year_period_version_key UNIQUE (cost_center, fiscal_year, period, version, account, activity_type);


--
-- Name: cost_center_planning cost_center_planning_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_center_planning
    ADD CONSTRAINT cost_center_planning_pkey PRIMARY KEY (id);


--
-- Name: cost_centers cost_centers_cost_center_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_centers
    ADD CONSTRAINT cost_centers_cost_center_key UNIQUE (cost_center);


--
-- Name: cost_centers cost_centers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_centers
    ADD CONSTRAINT cost_centers_pkey PRIMARY KEY (id);


--
-- Name: countries countries_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_code_key UNIQUE (code);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: credit_control_areas credit_control_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credit_control_areas
    ADD CONSTRAINT credit_control_areas_pkey PRIMARY KEY (id);


--
-- Name: currencies currencies_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_code_key UNIQUE (code);


--
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);


--
-- Name: custom_reports custom_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_reports
    ADD CONSTRAINT custom_reports_pkey PRIMARY KEY (id);


--
-- Name: customer_contacts customer_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_contacts
    ADD CONSTRAINT customer_contacts_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: dashboard_configs dashboard_configs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboard_configs
    ADD CONSTRAINT dashboard_configs_pkey PRIMARY KEY (id);


--
-- Name: employee_master employee_master_employee_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee_master
    ADD CONSTRAINT employee_master_employee_number_key UNIQUE (employee_number);


--
-- Name: employee_master employee_master_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee_master
    ADD CONSTRAINT employee_master_pkey PRIMARY KEY (id);


--
-- Name: employees employees_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key UNIQUE (email);


--
-- Name: employees employees_employee_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_employee_id_key UNIQUE (employee_id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: environment_config environment_config_environment_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.environment_config
    ADD CONSTRAINT environment_config_environment_key UNIQUE (environment);


--
-- Name: environment_config environment_config_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.environment_config
    ADD CONSTRAINT environment_config_pkey PRIMARY KEY (id);


--
-- Name: erp_customer_contacts erp_customer_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.erp_customer_contacts
    ADD CONSTRAINT erp_customer_contacts_pkey PRIMARY KEY (id);


--
-- Name: erp_customers erp_customers_customer_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.erp_customers
    ADD CONSTRAINT erp_customers_customer_code_key UNIQUE (customer_code);


--
-- Name: erp_customers erp_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.erp_customers
    ADD CONSTRAINT erp_customers_pkey PRIMARY KEY (id);


--
-- Name: erp_vendor_contacts erp_vendor_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.erp_vendor_contacts
    ADD CONSTRAINT erp_vendor_contacts_pkey PRIMARY KEY (id);


--
-- Name: erp_vendors erp_vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.erp_vendors
    ADD CONSTRAINT erp_vendors_pkey PRIMARY KEY (id);


--
-- Name: erp_vendors erp_vendors_vendor_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.erp_vendors
    ADD CONSTRAINT erp_vendors_vendor_code_key UNIQUE (vendor_code);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- Name: fiscal_periods fiscal_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fiscal_periods
    ADD CONSTRAINT fiscal_periods_pkey PRIMARY KEY (id);


--
-- Name: fiscal_periods fiscal_periods_year_period_company_code_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fiscal_periods
    ADD CONSTRAINT fiscal_periods_year_period_company_code_id_key UNIQUE (year, period, company_code_id);


--
-- Name: fiscal_year_variants fiscal_year_variants_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fiscal_year_variants
    ADD CONSTRAINT fiscal_year_variants_code_key UNIQUE (code);


--
-- Name: fiscal_year_variants fiscal_year_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fiscal_year_variants
    ADD CONSTRAINT fiscal_year_variants_pkey PRIMARY KEY (id);


--
-- Name: general_ledger_accounts general_ledger_accounts_account_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.general_ledger_accounts
    ADD CONSTRAINT general_ledger_accounts_account_number_key UNIQUE (account_number);


--
-- Name: general_ledger_accounts general_ledger_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.general_ledger_accounts
    ADD CONSTRAINT general_ledger_accounts_pkey PRIMARY KEY (id);


--
-- Name: gl_accounts gl_accounts_account_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gl_accounts
    ADD CONSTRAINT gl_accounts_account_number_key UNIQUE (account_number);


--
-- Name: gl_accounts gl_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gl_accounts
    ADD CONSTRAINT gl_accounts_pkey PRIMARY KEY (id);


--
-- Name: internal_orders internal_orders_order_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.internal_orders
    ADD CONSTRAINT internal_orders_order_number_key UNIQUE (order_number);


--
-- Name: internal_orders internal_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.internal_orders
    ADD CONSTRAINT internal_orders_pkey PRIMARY KEY (id);


--
-- Name: inventory_transactions inventory_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_transactions
    ADD CONSTRAINT inventory_transactions_pkey PRIMARY KEY (id);


--
-- Name: inventory_transactions inventory_transactions_transaction_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_transactions
    ADD CONSTRAINT inventory_transactions_transaction_number_key UNIQUE (transaction_number);


--
-- Name: invoices invoices_invoice_number_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_invoice_number_unique UNIQUE (invoice_number);


--
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: journal_entries journal_entries_document_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.journal_entries
    ADD CONSTRAINT journal_entries_document_number_key UNIQUE (document_number);


--
-- Name: journal_entries journal_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.journal_entries
    ADD CONSTRAINT journal_entries_pkey PRIMARY KEY (id);


--
-- Name: leads leads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leads
    ADD CONSTRAINT leads_pkey PRIMARY KEY (id);


--
-- Name: material_categories material_categories_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material_categories
    ADD CONSTRAINT material_categories_code_key UNIQUE (code);


--
-- Name: material_categories material_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material_categories
    ADD CONSTRAINT material_categories_pkey PRIMARY KEY (id);


--
-- Name: materials materials_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_code_key UNIQUE (code);


--
-- Name: materials materials_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (id);


--
-- Name: opportunities opportunities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opportunities
    ADD CONSTRAINT opportunities_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_order_number_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_order_number_unique UNIQUE (order_number);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: plants plants_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plants_code_key UNIQUE (code);


--
-- Name: plants plants_code_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plants_code_unique UNIQUE (code);


--
-- Name: plants plants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plants_pkey PRIMARY KEY (id);


--
-- Name: production_orders production_orders_order_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_orders
    ADD CONSTRAINT production_orders_order_number_key UNIQUE (order_number);


--
-- Name: production_orders production_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_orders
    ADD CONSTRAINT production_orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products products_sku_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_sku_unique UNIQUE (sku);


--
-- Name: profit_centers profit_centers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profit_centers
    ADD CONSTRAINT profit_centers_pkey PRIMARY KEY (id);


--
-- Name: profit_centers profit_centers_profit_center_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profit_centers
    ADD CONSTRAINT profit_centers_profit_center_key UNIQUE (profit_center);


--
-- Name: purchase_groups purchase_groups_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_groups
    ADD CONSTRAINT purchase_groups_code_key UNIQUE (code);


--
-- Name: purchase_groups purchase_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_groups
    ADD CONSTRAINT purchase_groups_pkey PRIMARY KEY (id);


--
-- Name: purchase_order_items purchase_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_order_items
    ADD CONSTRAINT purchase_order_items_pkey PRIMARY KEY (id);


--
-- Name: purchase_orders purchase_orders_order_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_order_number_key UNIQUE (order_number);


--
-- Name: purchase_orders purchase_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_pkey PRIMARY KEY (id);


--
-- Name: purchase_organizations purchase_organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_organizations
    ADD CONSTRAINT purchase_organizations_pkey PRIMARY KEY (id);


--
-- Name: quote_approvals quote_approvals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quote_approvals
    ADD CONSTRAINT quote_approvals_pkey PRIMARY KEY (id);


--
-- Name: quote_items quote_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quote_items
    ADD CONSTRAINT quote_items_pkey PRIMARY KEY (id);


--
-- Name: quotes quotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quotes
    ADD CONSTRAINT quotes_pkey PRIMARY KEY (id);


--
-- Name: regions regions_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_code_key UNIQUE (code);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: sales_customer_contacts sales_customer_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_customer_contacts
    ADD CONSTRAINT sales_customer_contacts_pkey PRIMARY KEY (id);


--
-- Name: sales_customers sales_customers_customer_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_customers
    ADD CONSTRAINT sales_customers_customer_number_key UNIQUE (customer_number);


--
-- Name: sales_customers sales_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_customers
    ADD CONSTRAINT sales_customers_pkey PRIMARY KEY (id);


--
-- Name: sales_invoice_items sales_invoice_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_invoice_items
    ADD CONSTRAINT sales_invoice_items_pkey PRIMARY KEY (id);


--
-- Name: sales_invoices sales_invoices_invoice_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_invoices
    ADD CONSTRAINT sales_invoices_invoice_number_key UNIQUE (invoice_number);


--
-- Name: sales_invoices sales_invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_invoices
    ADD CONSTRAINT sales_invoices_pkey PRIMARY KEY (id);


--
-- Name: sales_order_items sales_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_order_items
    ADD CONSTRAINT sales_order_items_pkey PRIMARY KEY (id);


--
-- Name: sales_orders sales_orders_order_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT sales_orders_order_number_key UNIQUE (order_number);


--
-- Name: sales_orders sales_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT sales_orders_pkey PRIMARY KEY (id);


--
-- Name: sales_organizations sales_organizations_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_organizations
    ADD CONSTRAINT sales_organizations_code_key UNIQUE (code);


--
-- Name: sales_organizations sales_organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_organizations
    ADD CONSTRAINT sales_organizations_pkey PRIMARY KEY (id);


--
-- Name: sales_quote_items sales_quote_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_quote_items
    ADD CONSTRAINT sales_quote_items_pkey PRIMARY KEY (id);


--
-- Name: sales_quotes sales_quotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_quotes
    ADD CONSTRAINT sales_quotes_pkey PRIMARY KEY (id);


--
-- Name: sales_quotes sales_quotes_quote_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_quotes
    ADD CONSTRAINT sales_quotes_quote_number_key UNIQUE (quote_number);


--
-- Name: sales_return_items sales_return_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_return_items
    ADD CONSTRAINT sales_return_items_pkey PRIMARY KEY (id);


--
-- Name: sales_returns sales_returns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_returns
    ADD CONSTRAINT sales_returns_pkey PRIMARY KEY (id);


--
-- Name: sales_returns sales_returns_return_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_returns
    ADD CONSTRAINT sales_returns_return_number_key UNIQUE (return_number);


--
-- Name: stock_movements stock_movements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_movements
    ADD CONSTRAINT stock_movements_pkey PRIMARY KEY (id);


--
-- Name: storage_locations storage_locations_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.storage_locations
    ADD CONSTRAINT storage_locations_code_key UNIQUE (code);


--
-- Name: storage_locations storage_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.storage_locations
    ADD CONSTRAINT storage_locations_pkey PRIMARY KEY (id);


--
-- Name: supply_types supply_types_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.supply_types
    ADD CONSTRAINT supply_types_code_key UNIQUE (code);


--
-- Name: supply_types supply_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.supply_types
    ADD CONSTRAINT supply_types_pkey PRIMARY KEY (id);


--
-- Name: tax_codes tax_codes_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_codes
    ADD CONSTRAINT tax_codes_code_key UNIQUE (code);


--
-- Name: tax_codes tax_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_codes
    ADD CONSTRAINT tax_codes_pkey PRIMARY KEY (id);


--
-- Name: transport_logs transport_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_logs
    ADD CONSTRAINT transport_logs_pkey PRIMARY KEY (id);


--
-- Name: transport_number_ranges transport_number_ranges_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_number_ranges
    ADD CONSTRAINT transport_number_ranges_pkey PRIMARY KEY (id);


--
-- Name: transport_number_ranges transport_number_ranges_range_prefix_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_number_ranges
    ADD CONSTRAINT transport_number_ranges_range_prefix_key UNIQUE (range_prefix);


--
-- Name: transport_objects transport_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_objects
    ADD CONSTRAINT transport_objects_pkey PRIMARY KEY (id);


--
-- Name: transport_requests transport_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_requests
    ADD CONSTRAINT transport_requests_pkey PRIMARY KEY (id);


--
-- Name: transport_requests transport_requests_request_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_requests
    ADD CONSTRAINT transport_requests_request_number_key UNIQUE (request_number);


--
-- Name: units_of_measure units_of_measure_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.units_of_measure
    ADD CONSTRAINT units_of_measure_code_key UNIQUE (code);


--
-- Name: units_of_measure units_of_measure_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.units_of_measure
    ADD CONSTRAINT units_of_measure_pkey PRIMARY KEY (id);


--
-- Name: uom uom_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uom
    ADD CONSTRAINT uom_code_key UNIQUE (code);


--
-- Name: uom_conversions uom_conversions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uom_conversions
    ADD CONSTRAINT uom_conversions_pkey PRIMARY KEY (id);


--
-- Name: uom uom_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uom
    ADD CONSTRAINT uom_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- Name: variance_analysis variance_analysis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variance_analysis
    ADD CONSTRAINT variance_analysis_pkey PRIMARY KEY (id);


--
-- Name: vendor_contacts vendor_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_contacts
    ADD CONSTRAINT vendor_contacts_pkey PRIMARY KEY (id);


--
-- Name: vendors vendors_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_code_key UNIQUE (code);


--
-- Name: vendors vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (id);


--
-- Name: warehouse_bins warehouse_bins_bin_code_storage_location_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse_bins
    ADD CONSTRAINT warehouse_bins_bin_code_storage_location_id_key UNIQUE (bin_code, storage_location_id);


--
-- Name: warehouse_bins warehouse_bins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse_bins
    ADD CONSTRAINT warehouse_bins_pkey PRIMARY KEY (id);


--
-- Name: work_centers work_centers_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_centers
    ADD CONSTRAINT work_centers_code_key UNIQUE (code);


--
-- Name: work_centers work_centers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_centers
    ADD CONSTRAINT work_centers_pkey PRIMARY KEY (id);


--
-- Name: idx_custom_reports_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_custom_reports_category ON public.custom_reports USING btree (category);


--
-- Name: idx_custom_reports_created_by; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_custom_reports_created_by ON public.custom_reports USING btree (created_by);


--
-- Name: idx_custom_reports_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_custom_reports_name ON public.custom_reports USING btree (name);


--
-- Name: custom_reports update_custom_reports_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_custom_reports_updated_at BEFORE UPDATE ON public.custom_reports FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: accounts_payable accounts_payable_company_code_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_payable
    ADD CONSTRAINT accounts_payable_company_code_id_fkey FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: accounts_payable accounts_payable_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_payable
    ADD CONSTRAINT accounts_payable_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: accounts_payable accounts_payable_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_payable
    ADD CONSTRAINT accounts_payable_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.currencies(id);


--
-- Name: accounts_payable accounts_payable_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_payable
    ADD CONSTRAINT accounts_payable_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id);


--
-- Name: accounts_payable accounts_payable_purchase_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_payable
    ADD CONSTRAINT accounts_payable_purchase_order_id_fkey FOREIGN KEY (purchase_order_id) REFERENCES public.purchase_orders(id);


--
-- Name: accounts_payable accounts_payable_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_payable
    ADD CONSTRAINT accounts_payable_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(id);


--
-- Name: accounts_receivable accounts_receivable_company_code_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_receivable
    ADD CONSTRAINT accounts_receivable_company_code_id_fkey FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: accounts_receivable accounts_receivable_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_receivable
    ADD CONSTRAINT accounts_receivable_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: accounts_receivable accounts_receivable_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_receivable
    ADD CONSTRAINT accounts_receivable_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.currencies(id);


--
-- Name: accounts_receivable accounts_receivable_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_receivable
    ADD CONSTRAINT accounts_receivable_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: accounts_receivable accounts_receivable_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_receivable
    ADD CONSTRAINT accounts_receivable_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id);


--
-- Name: accounts_receivable accounts_receivable_sales_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts_receivable
    ADD CONSTRAINT accounts_receivable_sales_order_id_fkey FOREIGN KEY (sales_order_id) REFERENCES public.sales_orders(id);


--
-- Name: ai_agent_analytics ai_agent_analytics_module_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_agent_analytics
    ADD CONSTRAINT ai_agent_analytics_module_type_fkey FOREIGN KEY (module_type) REFERENCES public.ai_agent_configs(module_type);


--
-- Name: ai_chat_messages ai_chat_messages_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_chat_messages
    ADD CONSTRAINT ai_chat_messages_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.ai_chat_sessions(session_id) ON DELETE CASCADE;


--
-- Name: ai_chat_sessions ai_chat_sessions_module_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_chat_sessions
    ADD CONSTRAINT ai_chat_sessions_module_type_fkey FOREIGN KEY (module_type) REFERENCES public.ai_agent_configs(module_type);


--
-- Name: ai_data_analysis_sessions ai_data_analysis_sessions_module_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_data_analysis_sessions
    ADD CONSTRAINT ai_data_analysis_sessions_module_type_fkey FOREIGN KEY (module_type) REFERENCES public.ai_agent_configs(module_type);


--
-- Name: batch_master batch_master_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batch_master
    ADD CONSTRAINT batch_master_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.materials(id);


--
-- Name: batch_master batch_master_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batch_master
    ADD CONSTRAINT batch_master_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id);


--
-- Name: bom_items bom_items_bom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bom_items
    ADD CONSTRAINT bom_items_bom_id_fkey FOREIGN KEY (bom_id) REFERENCES public.bill_of_materials(id);


--
-- Name: categories categories_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: company_code_chart_assignments company_code_chart_assignments_chart_of_accounts_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_code_chart_assignments
    ADD CONSTRAINT company_code_chart_assignments_chart_of_accounts_id_fkey FOREIGN KEY (chart_of_accounts_id) REFERENCES public.chart_of_accounts(id);


--
-- Name: company_code_chart_assignments company_code_chart_assignments_company_code_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_code_chart_assignments
    ADD CONSTRAINT company_code_chart_assignments_company_code_id_fkey FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: company_code_chart_assignments company_code_chart_assignments_fiscal_year_variant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_code_chart_assignments
    ADD CONSTRAINT company_code_chart_assignments_fiscal_year_variant_id_fkey FOREIGN KEY (fiscal_year_variant_id) REFERENCES public.fiscal_year_variants(id);


--
-- Name: countries countries_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: customers customers_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: employee_master employee_master_company_code_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee_master
    ADD CONSTRAINT employee_master_company_code_id_fkey FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: employee_master employee_master_manager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee_master
    ADD CONSTRAINT employee_master_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.employee_master(id);


--
-- Name: employees employees_manager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.employees(id);


--
-- Name: expenses expenses_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: fiscal_periods fiscal_periods_company_code_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fiscal_periods
    ADD CONSTRAINT fiscal_periods_company_code_id_fkey FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: cost_center_actuals fk_cc_actuals_cost_center; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_center_actuals
    ADD CONSTRAINT fk_cc_actuals_cost_center FOREIGN KEY (cost_center_id) REFERENCES public.cost_centers(id);


--
-- Name: chart_of_accounts fk_company_code_chart; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chart_of_accounts
    ADD CONSTRAINT fk_company_code_chart FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: erp_customers fk_company_code_erp_customer; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.erp_customers
    ADD CONSTRAINT fk_company_code_erp_customer FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: erp_vendors fk_company_code_erp_vendor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.erp_vendors
    ADD CONSTRAINT fk_company_code_erp_vendor FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: vendors fk_company_code_vendor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT fk_company_code_vendor FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: copa_actuals fk_copa_customer; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.copa_actuals
    ADD CONSTRAINT fk_copa_customer FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: copa_actuals fk_copa_material; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.copa_actuals
    ADD CONSTRAINT fk_copa_material FOREIGN KEY (material_id) REFERENCES public.materials(id);


--
-- Name: copa_actuals fk_copa_profit_center; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.copa_actuals
    ADD CONSTRAINT fk_copa_profit_center FOREIGN KEY (profit_center_id) REFERENCES public.profit_centers(id);


--
-- Name: cost_centers fk_cost_center_company_code; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_centers
    ADD CONSTRAINT fk_cost_center_company_code FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: credit_control_areas fk_credit_control_company_code; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credit_control_areas
    ADD CONSTRAINT fk_credit_control_company_code FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: customer_contacts fk_customer; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_contacts
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: erp_customer_contacts fk_erp_customer; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.erp_customer_contacts
    ADD CONSTRAINT fk_erp_customer FOREIGN KEY (customer_id) REFERENCES public.erp_customers(id) ON DELETE CASCADE;


--
-- Name: erp_vendor_contacts fk_erp_vendor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.erp_vendor_contacts
    ADD CONSTRAINT fk_erp_vendor FOREIGN KEY (vendor_id) REFERENCES public.erp_vendors(id) ON DELETE CASCADE;


--
-- Name: chart_of_accounts fk_parent_account; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chart_of_accounts
    ADD CONSTRAINT fk_parent_account FOREIGN KEY (parent_account_id) REFERENCES public.chart_of_accounts(id);


--
-- Name: erp_customers fk_parent_erp_customer; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.erp_customers
    ADD CONSTRAINT fk_parent_erp_customer FOREIGN KEY (parent_customer_id) REFERENCES public.erp_customers(id);


--
-- Name: profit_centers fk_profit_center_company_code; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profit_centers
    ADD CONSTRAINT fk_profit_center_company_code FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: purchase_organizations fk_purchase_org_company_code; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_organizations
    ADD CONSTRAINT fk_purchase_org_company_code FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: sales_orders fk_sales_order_company_code; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT fk_sales_order_company_code FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: sales_orders fk_sales_order_plant; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT fk_sales_order_plant FOREIGN KEY (plant_id) REFERENCES public.plants(id);


--
-- Name: sales_orders fk_sales_order_sales_org; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT fk_sales_order_sales_org FOREIGN KEY (sales_org_id) REFERENCES public.sales_organizations(id);


--
-- Name: materials fk_uom; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT fk_uom FOREIGN KEY (uom_id) REFERENCES public.uom(id);


--
-- Name: vendor_contacts fk_vendor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_contacts
    ADD CONSTRAINT fk_vendor FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE CASCADE;


--
-- Name: general_ledger_accounts general_ledger_accounts_company_code_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.general_ledger_accounts
    ADD CONSTRAINT general_ledger_accounts_company_code_id_fkey FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: general_ledger_accounts general_ledger_accounts_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.general_ledger_accounts
    ADD CONSTRAINT general_ledger_accounts_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.currencies(id);


--
-- Name: general_ledger_accounts general_ledger_accounts_parent_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.general_ledger_accounts
    ADD CONSTRAINT general_ledger_accounts_parent_account_id_fkey FOREIGN KEY (parent_account_id) REFERENCES public.general_ledger_accounts(id);


--
-- Name: gl_accounts gl_accounts_chart_of_accounts_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gl_accounts
    ADD CONSTRAINT gl_accounts_chart_of_accounts_id_fkey FOREIGN KEY (chart_of_accounts_id) REFERENCES public.chart_of_accounts(id);


--
-- Name: inventory_transactions inventory_transactions_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_transactions
    ADD CONSTRAINT inventory_transactions_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: inventory_transactions inventory_transactions_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_transactions
    ADD CONSTRAINT inventory_transactions_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.materials(id);


--
-- Name: inventory_transactions inventory_transactions_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_transactions
    ADD CONSTRAINT inventory_transactions_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id);


--
-- Name: inventory_transactions inventory_transactions_storage_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_transactions
    ADD CONSTRAINT inventory_transactions_storage_location_id_fkey FOREIGN KEY (storage_location_id) REFERENCES public.storage_locations(id);


--
-- Name: invoices invoices_order_id_orders_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_order_id_orders_id_fk FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: invoices invoices_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: journal_entries journal_entries_company_code_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.journal_entries
    ADD CONSTRAINT journal_entries_company_code_id_fkey FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: journal_entries journal_entries_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.journal_entries
    ADD CONSTRAINT journal_entries_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: journal_entries journal_entries_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.journal_entries
    ADD CONSTRAINT journal_entries_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.currencies(id);


--
-- Name: journal_entries journal_entries_posted_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.journal_entries
    ADD CONSTRAINT journal_entries_posted_by_fkey FOREIGN KEY (posted_by) REFERENCES public.users(id);


--
-- Name: material_categories material_categories_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material_categories
    ADD CONSTRAINT material_categories_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.material_categories(id);


--
-- Name: opportunities opportunities_lead_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opportunities
    ADD CONSTRAINT opportunities_lead_id_fkey FOREIGN KEY (lead_id) REFERENCES public.leads(id);


--
-- Name: order_items order_items_order_id_orders_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_orders_id_fk FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: order_items order_items_product_id_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_products_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: orders orders_customer_id_customers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_customers_id_fk FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: orders orders_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: plants plants_company_code_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plants_company_code_id_fkey FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: production_orders production_orders_bom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_orders
    ADD CONSTRAINT production_orders_bom_id_fkey FOREIGN KEY (bom_id) REFERENCES public.bill_of_materials(id);


--
-- Name: production_orders production_orders_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_orders
    ADD CONSTRAINT production_orders_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: production_orders production_orders_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_orders
    ADD CONSTRAINT production_orders_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.materials(id);


--
-- Name: production_orders production_orders_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_orders
    ADD CONSTRAINT production_orders_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id);


--
-- Name: production_orders production_orders_released_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_orders
    ADD CONSTRAINT production_orders_released_by_fkey FOREIGN KEY (released_by) REFERENCES public.users(id);


--
-- Name: production_orders production_orders_work_center_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_orders
    ADD CONSTRAINT production_orders_work_center_id_fkey FOREIGN KEY (work_center_id) REFERENCES public.work_centers(id);


--
-- Name: products products_category_id_categories_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_categories_id_fk FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: products products_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: purchase_order_items purchase_order_items_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_order_items
    ADD CONSTRAINT purchase_order_items_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.materials(id);


--
-- Name: purchase_order_items purchase_order_items_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_order_items
    ADD CONSTRAINT purchase_order_items_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id);


--
-- Name: purchase_order_items purchase_order_items_purchase_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_order_items
    ADD CONSTRAINT purchase_order_items_purchase_order_id_fkey FOREIGN KEY (purchase_order_id) REFERENCES public.purchase_orders(id);


--
-- Name: purchase_order_items purchase_order_items_storage_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_order_items
    ADD CONSTRAINT purchase_order_items_storage_location_id_fkey FOREIGN KEY (storage_location_id) REFERENCES public.storage_locations(id);


--
-- Name: purchase_orders purchase_orders_approved_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_approved_by_fkey FOREIGN KEY (approved_by) REFERENCES public.users(id);


--
-- Name: purchase_orders purchase_orders_company_code_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_company_code_id_fkey FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: purchase_orders purchase_orders_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: purchase_orders purchase_orders_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.currencies(id);


--
-- Name: purchase_orders purchase_orders_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id);


--
-- Name: purchase_orders purchase_orders_purchase_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_purchase_organization_id_fkey FOREIGN KEY (purchase_organization_id) REFERENCES public.purchase_organizations(id);


--
-- Name: purchase_orders purchase_orders_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(id);


--
-- Name: quote_approvals quote_approvals_quote_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quote_approvals
    ADD CONSTRAINT quote_approvals_quote_id_fkey FOREIGN KEY (quote_id) REFERENCES public.quotes(id) ON DELETE CASCADE;


--
-- Name: quote_items quote_items_quote_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quote_items
    ADD CONSTRAINT quote_items_quote_id_fkey FOREIGN KEY (quote_id) REFERENCES public.quotes(id) ON DELETE CASCADE;


--
-- Name: quotes quotes_opportunity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quotes
    ADD CONSTRAINT quotes_opportunity_id_fkey FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id);


--
-- Name: sales_customer_contacts sales_customer_contacts_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_customer_contacts
    ADD CONSTRAINT sales_customer_contacts_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.sales_customers(id) ON DELETE CASCADE;


--
-- Name: sales_invoice_items sales_invoice_items_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_invoice_items
    ADD CONSTRAINT sales_invoice_items_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.sales_invoices(id) ON DELETE CASCADE;


--
-- Name: sales_order_items sales_order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_order_items
    ADD CONSTRAINT sales_order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.sales_orders(id) ON DELETE CASCADE;


--
-- Name: sales_organizations sales_organizations_company_code_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_organizations
    ADD CONSTRAINT sales_organizations_company_code_id_fkey FOREIGN KEY (company_code_id) REFERENCES public.company_codes(id);


--
-- Name: sales_quote_items sales_quote_items_quote_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_quote_items
    ADD CONSTRAINT sales_quote_items_quote_id_fkey FOREIGN KEY (quote_id) REFERENCES public.sales_quotes(id) ON DELETE CASCADE;


--
-- Name: sales_return_items sales_return_items_return_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_return_items
    ADD CONSTRAINT sales_return_items_return_id_fkey FOREIGN KEY (return_id) REFERENCES public.sales_returns(id) ON DELETE CASCADE;


--
-- Name: stock_movements stock_movements_product_id_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_movements
    ADD CONSTRAINT stock_movements_product_id_products_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: stock_movements stock_movements_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_movements
    ADD CONSTRAINT stock_movements_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: storage_locations storage_locations_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.storage_locations
    ADD CONSTRAINT storage_locations_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id);


--
-- Name: transport_logs transport_logs_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_logs
    ADD CONSTRAINT transport_logs_request_id_fkey FOREIGN KEY (request_id) REFERENCES public.transport_requests(id);


--
-- Name: transport_objects transport_objects_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_objects
    ADD CONSTRAINT transport_objects_request_id_fkey FOREIGN KEY (request_id) REFERENCES public.transport_requests(id);


--
-- Name: units_of_measure units_of_measure_base_uom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.units_of_measure
    ADD CONSTRAINT units_of_measure_base_uom_id_fkey FOREIGN KEY (base_uom_id) REFERENCES public.units_of_measure(id);


--
-- Name: uom_conversions uom_conversions_from_uom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uom_conversions
    ADD CONSTRAINT uom_conversions_from_uom_id_fkey FOREIGN KEY (from_uom_id) REFERENCES public.uom(id);


--
-- Name: uom_conversions uom_conversions_to_uom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.uom_conversions
    ADD CONSTRAINT uom_conversions_to_uom_id_fkey FOREIGN KEY (to_uom_id) REFERENCES public.uom(id);


--
-- Name: warehouse_bins warehouse_bins_storage_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse_bins
    ADD CONSTRAINT warehouse_bins_storage_location_id_fkey FOREIGN KEY (storage_location_id) REFERENCES public.storage_locations(id);


--
-- PostgreSQL database dump complete
--

