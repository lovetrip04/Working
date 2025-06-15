-- Complete MallyERP Database Schema Export
-- Generated: 2025-06-05T02:32:23.061Z
-- Total Tables: 112

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;


-- Table: account_groups
CREATE TABLE IF NOT EXISTS account_groups (
  id INTEGER NOT NULL DEFAULT nextval('account_groups_id_seq'::regclass),
  chart_id VARCHAR(10) NOT NULL,
  group_name VARCHAR(50) NOT NULL,
  account_range_from VARCHAR(10),
  account_range_to VARCHAR(10),
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: accounts_payable
CREATE TABLE IF NOT EXISTS accounts_payable (
  id INTEGER NOT NULL DEFAULT nextval('accounts_payable_id_seq'::regclass),
  vendor_id INTEGER,
  invoice_number VARCHAR(50) NOT NULL,
  invoice_date DATE NOT NULL,
  due_date DATE NOT NULL,
  amount NUMERIC NOT NULL,
  currency_id INTEGER,
  company_code_id INTEGER,
  plant_id INTEGER,
  purchase_order_id INTEGER,
  payment_terms VARCHAR(50),
  status VARCHAR(20) DEFAULT 'Open'::character varying,
  payment_date DATE,
  payment_reference VARCHAR(100),
  discount_amount NUMERIC DEFAULT 0,
  tax_amount NUMERIC DEFAULT 0,
  net_amount NUMERIC NOT NULL,
  notes TEXT,
  created_by INTEGER,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: accounts_receivable
CREATE TABLE IF NOT EXISTS accounts_receivable (
  id INTEGER NOT NULL DEFAULT nextval('accounts_receivable_id_seq'::regclass),
  customer_id INTEGER,
  invoice_number VARCHAR(50) NOT NULL,
  invoice_date DATE NOT NULL,
  due_date DATE NOT NULL,
  amount NUMERIC NOT NULL,
  currency_id INTEGER,
  company_code_id INTEGER,
  plant_id INTEGER,
  sales_order_id INTEGER,
  payment_terms VARCHAR(50),
  status VARCHAR(20) DEFAULT 'Open'::character varying,
  payment_date DATE,
  payment_reference VARCHAR(100),
  discount_amount NUMERIC DEFAULT 0,
  tax_amount NUMERIC DEFAULT 0,
  net_amount NUMERIC NOT NULL,
  notes TEXT,
  created_by INTEGER,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: activity_types
CREATE TABLE IF NOT EXISTS activity_types (
  id INTEGER NOT NULL DEFAULT nextval('activity_types_id_seq'::regclass),
  activity_type VARCHAR(10) NOT NULL,
  description VARCHAR(100) NOT NULL,
  unit_of_measure VARCHAR(3) NOT NULL,
  category VARCHAR(20) NOT NULL,
  controlling_area VARCHAR(4) NOT NULL,
  allocation_method VARCHAR(20),
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: ai_agent_analytics
CREATE TABLE IF NOT EXISTS ai_agent_analytics (
  id INTEGER NOT NULL DEFAULT nextval('ai_agent_analytics_id_seq'::regclass),
  module_type VARCHAR(50) NOT NULL,
  date DATE DEFAULT CURRENT_DATE,
  total_queries INTEGER DEFAULT 0,
  successful_queries INTEGER DEFAULT 0,
  failed_queries INTEGER DEFAULT 0,
  avg_response_time NUMERIC,
  total_tokens_used INTEGER DEFAULT 0,
  unique_users INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: ai_agent_configs
CREATE TABLE IF NOT EXISTS ai_agent_configs (
  id INTEGER NOT NULL DEFAULT nextval('ai_agent_configs_id_seq'::regclass),
  module_type VARCHAR(50) NOT NULL,
  module_name VARCHAR(100) NOT NULL,
  agent_name VARCHAR(100) NOT NULL,
  role_description TEXT NOT NULL,
  system_prompt TEXT NOT NULL,
  expertise_areas JSONB NOT NULL,
  capabilities JSONB NOT NULL,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: ai_agent_health
CREATE TABLE IF NOT EXISTS ai_agent_health (
  id INTEGER NOT NULL DEFAULT nextval('ai_agent_health_id_seq'::regclass),
  check_timestamp TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  openai_status VARCHAR(20) NOT NULL,
  api_key_status VARCHAR(20) NOT NULL,
  total_agents INTEGER NOT NULL,
  active_agents INTEGER NOT NULL,
  response_time INTEGER,
  error_details JSONB,
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: ai_agent_interventions
CREATE TABLE IF NOT EXISTS ai_agent_interventions (
  id BIGINT NOT NULL DEFAULT nextval('ai_agent_interventions_id_seq'::regclass),
  issue_id UUID NOT NULL,
  agent_name VARCHAR(200) NOT NULL,
  agent_type VARCHAR(50) NOT NULL,
  analysis_result JSONB NOT NULL,
  recommended_actions JSONB NOT NULL,
  confidence_score NUMERIC,
  execution_status VARCHAR(20) DEFAULT 'PENDING'::character varying,
  execution_start TIMESTAMP WITH TIME ZONE,
  execution_end TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: ai_agent_performance
CREATE TABLE IF NOT EXISTS ai_agent_performance (
  id BIGINT NOT NULL DEFAULT nextval('ai_agent_performance_id_seq'::regclass),
  agent_name VARCHAR(200) NOT NULL,
  agent_type VARCHAR(50) NOT NULL,
  performance_date DATE NOT NULL DEFAULT CURRENT_DATE,
  total_interventions INTEGER DEFAULT 0,
  successful_interventions INTEGER DEFAULT 0,
  failed_interventions INTEGER DEFAULT 0,
  avg_confidence_score NUMERIC DEFAULT 0.00,
  avg_resolution_time INTEGER DEFAULT 0,
  success_rate NUMERIC DEFAULT 0.00,
  pattern_matches INTEGER DEFAULT 0,
  new_patterns_learned INTEGER DEFAULT 0,
  accuracy_improvement NUMERIC DEFAULT 0.00,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: ai_chat_messages
CREATE TABLE IF NOT EXISTS ai_chat_messages (
  id INTEGER NOT NULL DEFAULT nextval('ai_chat_messages_id_seq'::regclass),
  session_id UUID NOT NULL,
  message_type VARCHAR(20) NOT NULL,
  content TEXT NOT NULL,
  agent_name VARCHAR(100),
  context_data JSONB,
  api_response_time INTEGER,
  tokens_used INTEGER,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: ai_chat_sessions
CREATE TABLE IF NOT EXISTS ai_chat_sessions (
  id INTEGER NOT NULL DEFAULT nextval('ai_chat_sessions_id_seq'::regclass),
  session_id UUID DEFAULT gen_random_uuid(),
  module_type VARCHAR(50) NOT NULL,
  user_id INTEGER,
  user_role VARCHAR(50),
  context_data JSONB,
  session_start TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  session_end TIMESTAMP WITH TIME ZONE,
  is_active BOOLEAN DEFAULT true,
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: ai_data_analysis_sessions
CREATE TABLE IF NOT EXISTS ai_data_analysis_sessions (
  id INTEGER NOT NULL DEFAULT nextval('ai_data_analysis_sessions_id_seq'::regclass),
  session_id UUID DEFAULT gen_random_uuid(),
  module_type VARCHAR(50) NOT NULL,
  analysis_type VARCHAR(50) NOT NULL,
  input_data JSONB NOT NULL,
  analysis_result TEXT,
  insights JSONB,
  recommendations JSONB,
  user_id INTEGER,
  processing_time INTEGER,
  status VARCHAR(20) DEFAULT 'pending'::character varying,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  completed_at TIMESTAMP WITH TIME ZONE,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: api_keys
CREATE TABLE IF NOT EXISTS api_keys (
  id INTEGER NOT NULL DEFAULT nextval('api_keys_id_seq'::regclass),
  service_name VARCHAR(100) NOT NULL,
  key_name VARCHAR(100) NOT NULL,
  key_value TEXT NOT NULL,
  description TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  last_used TIMESTAMP WITH TIME ZONE,
  active BOOLEAN DEFAULT true
);


-- Table: approval_levels
CREATE TABLE IF NOT EXISTS approval_levels (
  id INTEGER NOT NULL DEFAULT nextval('approval_levels_id_seq'::regclass),
  level INTEGER NOT NULL,
  name VARCHAR(50) NOT NULL,
  description TEXT,
  value_limit NUMERIC,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: asset_master
CREATE TABLE IF NOT EXISTS asset_master (
  id INTEGER NOT NULL DEFAULT nextval('asset_master_id_seq'::regclass),
  asset_number VARCHAR(20) NOT NULL,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  asset_class VARCHAR(50),
  acquisition_date DATE,
  acquisition_cost NUMERIC,
  current_value NUMERIC,
  depreciation_method VARCHAR(50),
  useful_life_years INTEGER,
  company_code_id INTEGER,
  cost_center_id INTEGER,
  location VARCHAR(100),
  status VARCHAR(20),
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: batch_master
CREATE TABLE IF NOT EXISTS batch_master (
  id INTEGER NOT NULL DEFAULT nextval('batch_master_id_seq'::regclass),
  batch_number VARCHAR(50) NOT NULL,
  material_id INTEGER,
  plant_id INTEGER,
  production_date DATE,
  expiry_date DATE,
  shelf_life_days INTEGER,
  vendor_batch_number VARCHAR(50),
  quality_status VARCHAR(20) DEFAULT 'UNRESTRICTED'::character varying,
  available_quantity NUMERIC,
  reserved_quantity NUMERIC,
  blocked_quantity NUMERIC,
  unit_of_measure VARCHAR(10),
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: bill_of_materials
CREATE TABLE IF NOT EXISTS bill_of_materials (
  id INTEGER NOT NULL DEFAULT nextval('bill_of_materials_id_seq'::regclass),
  code VARCHAR(20) NOT NULL,
  name VARCHAR(100) NOT NULL,
  material_id INTEGER NOT NULL,
  description TEXT,
  version VARCHAR(10) DEFAULT '1.0'::character varying,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: bom_items
CREATE TABLE IF NOT EXISTS bom_items (
  id INTEGER NOT NULL DEFAULT nextval('bom_items_id_seq'::regclass),
  bom_id INTEGER NOT NULL,
  material_id INTEGER NOT NULL,
  quantity NUMERIC NOT NULL,
  unit_cost NUMERIC,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: categories
CREATE TABLE IF NOT EXISTS categories (
  id INTEGER NOT NULL DEFAULT nextval('categories_id_seq'::regclass),
  name TEXT NOT NULL,
  description TEXT,
  user_id INTEGER,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  active BOOLEAN DEFAULT true
);


-- Table: change_document_analytics
CREATE TABLE IF NOT EXISTS change_document_analytics (
  id BIGINT NOT NULL DEFAULT nextval('change_document_analytics_id_seq'::regclass),
  analysis_date DATE NOT NULL DEFAULT CURRENT_DATE,
  object_class VARCHAR(50) NOT NULL,
  application_module VARCHAR(50) NOT NULL,
  total_changes INTEGER DEFAULT 0,
  creates_count INTEGER DEFAULT 0,
  updates_count INTEGER DEFAULT 0,
  deletes_count INTEGER DEFAULT 0,
  avg_fields_changed NUMERIC,
  avg_approval_time INTERVAL,
  avg_processing_time INTERVAL,
  error_count INTEGER DEFAULT 0,
  reversal_count INTEGER DEFAULT 0,
  quality_score NUMERIC,
  high_impact_changes INTEGER DEFAULT 0,
  compliance_changes INTEGER DEFAULT 0,
  emergency_changes INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: change_document_approvals
CREATE TABLE IF NOT EXISTS change_document_approvals (
  id BIGINT NOT NULL DEFAULT nextval('change_document_approvals_id_seq'::regclass),
  change_document_id UUID NOT NULL,
  approval_level INTEGER NOT NULL,
  approver_role VARCHAR(50) NOT NULL,
  approver_name VARCHAR(100),
  approval_status VARCHAR(20) NOT NULL DEFAULT 'PENDING'::character varying,
  approval_comments TEXT,
  approval_timestamp TIMESTAMP WITH TIME ZONE,
  delegation_to VARCHAR(100),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: change_document_attachments
CREATE TABLE IF NOT EXISTS change_document_attachments (
  id BIGINT NOT NULL DEFAULT nextval('change_document_attachments_id_seq'::regclass),
  change_document_id UUID NOT NULL,
  attachment_type VARCHAR(50) NOT NULL,
  file_name VARCHAR(500) NOT NULL,
  file_path TEXT,
  file_size BIGINT,
  mime_type VARCHAR(100),
  description TEXT,
  uploaded_by VARCHAR(100),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: change_document_headers
CREATE TABLE IF NOT EXISTS change_document_headers (
  id BIGINT NOT NULL DEFAULT nextval('change_document_headers_id_seq'::regclass),
  change_document_id UUID DEFAULT gen_random_uuid(),
  object_class VARCHAR(50) NOT NULL,
  object_id VARCHAR(100) NOT NULL,
  change_number VARCHAR(20) NOT NULL DEFAULT generate_change_number(),
  user_name VARCHAR(100) NOT NULL,
  user_role VARCHAR(50),
  session_id VARCHAR(100),
  transaction_code VARCHAR(20),
  change_type VARCHAR(20) NOT NULL,
  change_reason VARCHAR(100),
  change_category VARCHAR(50),
  change_date DATE NOT NULL DEFAULT CURRENT_DATE,
  change_time TIME WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIME,
  change_timestamp TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  client_ip VARCHAR(45),
  user_agent TEXT,
  application_module VARCHAR(50),
  business_process VARCHAR(100),
  reference_document VARCHAR(100),
  approval_status VARCHAR(20) DEFAULT 'PENDING'::character varying,
  version_number INTEGER DEFAULT 1,
  parent_change_id UUID,
  is_active BOOLEAN DEFAULT true,
  is_reversed BOOLEAN DEFAULT false,
  reversal_change_id UUID,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: change_document_positions
CREATE TABLE IF NOT EXISTS change_document_positions (
  id BIGINT NOT NULL DEFAULT nextval('change_document_positions_id_seq'::regclass),
  change_document_id UUID NOT NULL,
  position_number INTEGER NOT NULL,
  table_name VARCHAR(100) NOT NULL,
  field_name VARCHAR(100) NOT NULL,
  field_label VARCHAR(200),
  data_type VARCHAR(50),
  old_value TEXT,
  new_value TEXT,
  old_value_formatted TEXT,
  new_value_formatted TEXT,
  value_unit VARCHAR(20),
  value_currency VARCHAR(10),
  value_language VARCHAR(10),
  change_indicator VARCHAR(10) NOT NULL,
  change_magnitude NUMERIC,
  change_percentage NUMERIC,
  reference_table VARCHAR(100),
  reference_field VARCHAR(100),
  reference_value VARCHAR(200),
  data_quality_score INTEGER,
  validation_status VARCHAR(20) DEFAULT 'VALID'::character varying,
  validation_errors JSONB,
  business_impact VARCHAR(20),
  requires_approval BOOLEAN DEFAULT false,
  compliance_flag BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: change_document_relations
CREATE TABLE IF NOT EXISTS change_document_relations (
  id BIGINT NOT NULL DEFAULT nextval('change_document_relations_id_seq'::regclass),
  source_change_id UUID NOT NULL,
  target_change_id UUID NOT NULL,
  relation_type VARCHAR(50) NOT NULL,
  relation_strength VARCHAR(20) DEFAULT 'MEDIUM'::character varying,
  business_context TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: chart_of_accounts
CREATE TABLE IF NOT EXISTS chart_of_accounts (
  id INTEGER NOT NULL DEFAULT nextval('chart_of_accounts_id_seq'::regclass),
  chart_id VARCHAR(10) NOT NULL,
  description VARCHAR(255) NOT NULL,
  account_length INTEGER DEFAULT 6,
  maintenance_language VARCHAR(2),
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: companies
CREATE TABLE IF NOT EXISTS companies (
  id INTEGER NOT NULL DEFAULT nextval('companies_id_seq'::regclass),
  company_id VARCHAR(10) NOT NULL,
  name VARCHAR(255) NOT NULL,
  address TEXT,
  country VARCHAR(2),
  currency VARCHAR(3),
  language VARCHAR(2),
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: company_code_chart_assignments
CREATE TABLE IF NOT EXISTS company_code_chart_assignments (
  id INTEGER NOT NULL DEFAULT nextval('company_code_chart_assignments_id_seq'::regclass),
  company_code_id INTEGER,
  chart_of_accounts_id INTEGER,
  fiscal_year_variant_id INTEGER,
  assigned_date TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  is_active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: company_codes
CREATE TABLE IF NOT EXISTS company_codes (
  id INTEGER NOT NULL DEFAULT nextval('company_codes_id_seq'::regclass),
  code VARCHAR(10) NOT NULL,
  name VARCHAR(255) NOT NULL,
  city VARCHAR(100),
  country VARCHAR(100),
  currency VARCHAR(3),
  language VARCHAR(50),
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: comprehensive_issues_log
CREATE TABLE IF NOT EXISTS comprehensive_issues_log (
  id BIGINT NOT NULL DEFAULT nextval('comprehensive_issues_log_id_seq'::regclass),
  issue_id UUID DEFAULT gen_random_uuid(),
  error_message TEXT NOT NULL,
  stack_trace TEXT,
  module VARCHAR(100) NOT NULL,
  operation VARCHAR(200) NOT NULL,
  user_id VARCHAR(100),
  session_id VARCHAR(100),
  request_data JSONB,
  severity VARCHAR(20) NOT NULL,
  category VARCHAR(20) NOT NULL,
  status VARCHAR(20) DEFAULT 'OPEN'::character varying,
  resolved_at TIMESTAMP WITH TIME ZONE,
  resolved_by VARCHAR(50),
  additional_data JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  auto_resolvable BOOLEAN DEFAULT false,
  confidence_score NUMERIC DEFAULT 0.0,
  pattern_matched JSONB,
  recommended_actions JSONB,
  ai_analysis JSONB,
  business_context TEXT,
  user_impact TEXT,
  resolution_status VARCHAR(20) DEFAULT 'PENDING'::character varying
);


-- Table: copa_actuals
CREATE TABLE IF NOT EXISTS copa_actuals (
  id INTEGER NOT NULL DEFAULT nextval('copa_actuals_id_seq'::regclass),
  operating_concern VARCHAR(4) NOT NULL,
  fiscal_year INTEGER NOT NULL,
  period INTEGER NOT NULL,
  record_type VARCHAR(1) NOT NULL,
  customer VARCHAR(10),
  material VARCHAR(18),
  product_group VARCHAR(10),
  customer_group VARCHAR(5),
  sales_organization VARCHAR(4),
  distribution_channel VARCHAR(2),
  division VARCHAR(2),
  region VARCHAR(10),
  country VARCHAR(3),
  profit_center VARCHAR(10),
  value_field VARCHAR(5) NOT NULL,
  amount NUMERIC NOT NULL,
  quantity NUMERIC DEFAULT 0,
  currency VARCHAR(3) DEFAULT 'USD'::character varying,
  unit_of_measure VARCHAR(3),
  posting_date DATE NOT NULL,
  document_number VARCHAR(20),
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  customer_id INTEGER,
  material_id INTEGER,
  profit_center_id INTEGER,
  sales_org_id INTEGER,
  company_code_id INTEGER,
  currency_id INTEGER,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: cost_allocations
CREATE TABLE IF NOT EXISTS cost_allocations (
  id INTEGER NOT NULL DEFAULT nextval('cost_allocations_id_seq'::regclass),
  allocation_id VARCHAR(20) NOT NULL,
  allocation_type VARCHAR(20) NOT NULL,
  sender_object_type VARCHAR(20) NOT NULL,
  sender_object VARCHAR(20) NOT NULL,
  receiver_object_type VARCHAR(20) NOT NULL,
  receiver_object VARCHAR(20) NOT NULL,
  fiscal_year INTEGER NOT NULL,
  period INTEGER NOT NULL,
  allocation_base VARCHAR(20),
  percentage NUMERIC,
  amount NUMERIC NOT NULL,
  currency VARCHAR(3) DEFAULT 'USD'::character varying,
  posting_date DATE NOT NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: cost_center_actuals
CREATE TABLE IF NOT EXISTS cost_center_actuals (
  id INTEGER NOT NULL DEFAULT nextval('cost_center_actuals_id_seq'::regclass),
  cost_center VARCHAR(10) NOT NULL,
  fiscal_year INTEGER NOT NULL,
  period INTEGER NOT NULL,
  account VARCHAR(10) NOT NULL,
  activity_type VARCHAR(10),
  actual_amount NUMERIC DEFAULT 0,
  actual_quantity NUMERIC DEFAULT 0,
  currency VARCHAR(3) DEFAULT 'USD'::character varying,
  unit_of_measure VARCHAR(3),
  posting_date DATE NOT NULL,
  document_number VARCHAR(20),
  reference VARCHAR(50),
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  cost_center_id INTEGER,
  company_code_id INTEGER,
  currency_id INTEGER,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: cost_center_planning
CREATE TABLE IF NOT EXISTS cost_center_planning (
  id INTEGER NOT NULL DEFAULT nextval('cost_center_planning_id_seq'::regclass),
  cost_center VARCHAR(10) NOT NULL,
  fiscal_year INTEGER NOT NULL,
  period INTEGER NOT NULL,
  version VARCHAR(10) DEFAULT '000'::character varying,
  account VARCHAR(10) NOT NULL,
  activity_type VARCHAR(10),
  planned_amount NUMERIC DEFAULT 0,
  planned_quantity NUMERIC DEFAULT 0,
  currency VARCHAR(3) DEFAULT 'USD'::character varying,
  unit_of_measure VARCHAR(3),
  created_by INTEGER,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: cost_centers
CREATE TABLE IF NOT EXISTS cost_centers (
  id INTEGER NOT NULL DEFAULT nextval('cost_centers_id_seq'::regclass),
  cost_center VARCHAR(10) NOT NULL,
  description VARCHAR(100) NOT NULL,
  cost_center_category VARCHAR(20) NOT NULL,
  company_code VARCHAR(4) NOT NULL,
  controlling_area VARCHAR(4) NOT NULL,
  hierarchy_area VARCHAR(20),
  responsible_person VARCHAR(50),
  valid_from DATE NOT NULL,
  valid_to DATE,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  company_code_id INTEGER,
  plant_id INTEGER,
  responsible_person_id INTEGER,
  active BOOLEAN DEFAULT true
);


-- Table: countries
CREATE TABLE IF NOT EXISTS countries (
  id INTEGER NOT NULL DEFAULT nextval('countries_id_seq'::regclass),
  code VARCHAR(2) NOT NULL,
  name VARCHAR(100) NOT NULL,
  region_id INTEGER,
  currency_code VARCHAR(3),
  language_code VARCHAR(5),
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: credit_control_areas
CREATE TABLE IF NOT EXISTS credit_control_areas (
  id INTEGER NOT NULL DEFAULT nextval('credit_control_areas_id_seq'::regclass),
  code VARCHAR(10) NOT NULL,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  company_code_id INTEGER NOT NULL,
  credit_checking_group VARCHAR(50),
  credit_period INTEGER DEFAULT 30,
  grace_percentage NUMERIC DEFAULT 10,
  blocking_reason VARCHAR(100),
  review_frequency VARCHAR(20) DEFAULT 'monthly'::character varying,
  currency VARCHAR(3) DEFAULT 'USD'::character varying,
  credit_approver VARCHAR(100),
  status VARCHAR(20) DEFAULT 'active'::character varying,
  is_active BOOLEAN DEFAULT true,
  notes TEXT,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  created_by INTEGER,
  updated_by INTEGER,
  active BOOLEAN DEFAULT true
);


-- Table: currencies
CREATE TABLE IF NOT EXISTS currencies (
  id INTEGER NOT NULL DEFAULT nextval('currencies_id_seq'::regclass),
  code TEXT NOT NULL,
  name TEXT NOT NULL,
  symbol TEXT NOT NULL,
  decimal_places TEXT NOT NULL,
  conversion_rate TEXT NOT NULL,
  base_currency BOOLEAN NOT NULL DEFAULT false,
  is_active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  notes TEXT,
  active BOOLEAN DEFAULT true
);


-- Table: custom_reports
CREATE TABLE IF NOT EXISTS custom_reports (
  id INTEGER NOT NULL DEFAULT nextval('custom_reports_id_seq'::regclass),
  name VARCHAR(255) NOT NULL,
  description TEXT,
  sql_query TEXT NOT NULL,
  chart_config JSONB DEFAULT '{}'::jsonb,
  parameters JSONB DEFAULT '[]'::jsonb,
  category VARCHAR(100) DEFAULT 'custom'::character varying,
  is_shared BOOLEAN DEFAULT false,
  created_by VARCHAR(100) DEFAULT 'system'::character varying,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  active BOOLEAN DEFAULT true
);


-- Table: customer_contacts
CREATE TABLE IF NOT EXISTS customer_contacts (
  id INTEGER NOT NULL DEFAULT nextval('customer_contacts_id_seq'::regclass),
  customer_id INTEGER NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  position VARCHAR(100),
  department VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(30),
  mobile VARCHAR(30),
  is_primary BOOLEAN DEFAULT false,
  is_billing BOOLEAN DEFAULT false,
  is_shipping BOOLEAN DEFAULT false,
  is_technical BOOLEAN DEFAULT false,
  is_marketing BOOLEAN DEFAULT false,
  preferred_language VARCHAR(50) DEFAULT 'English'::character varying,
  notes TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  created_by INTEGER,
  updated_by INTEGER,
  active BOOLEAN DEFAULT true
);


-- Table: customers
CREATE TABLE IF NOT EXISTS customers (
  id INTEGER NOT NULL DEFAULT nextval('customers_id_seq'::regclass),
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT NOT NULL,
  address TEXT NOT NULL,
  notes TEXT,
  user_id INTEGER,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  active BOOLEAN DEFAULT true,
  code VARCHAR(20),
  type VARCHAR(50) DEFAULT 'Regular'::character varying
);


-- Table: dashboard_configs
CREATE TABLE IF NOT EXISTS dashboard_configs (
  id INTEGER NOT NULL DEFAULT nextval('dashboard_configs_id_seq'::regclass),
  user_id INTEGER NOT NULL,
  config JSONB NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: employee_master
CREATE TABLE IF NOT EXISTS employee_master (
  id INTEGER NOT NULL DEFAULT nextval('employee_master_id_seq'::regclass),
  employee_number VARCHAR(20) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  middle_name VARCHAR(50),
  date_of_birth DATE,
  gender VARCHAR(10),
  hire_date DATE NOT NULL,
  employment_type VARCHAR(20),
  employment_status VARCHAR(20) DEFAULT 'ACTIVE'::character varying,
  company_code_id INTEGER,
  cost_center_id INTEGER,
  manager_id INTEGER,
  work_email VARCHAR(100),
  work_phone VARCHAR(20),
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: employees
CREATE TABLE IF NOT EXISTS employees (
  id INTEGER NOT NULL DEFAULT nextval('employees_id_seq'::regclass),
  employee_id VARCHAR(20) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100),
  phone VARCHAR(20),
  department VARCHAR(100),
  position VARCHAR(100),
  company_code_id INTEGER,
  cost_center_id INTEGER,
  join_date DATE,
  manager_id INTEGER,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: environment_config
CREATE TABLE IF NOT EXISTS environment_config (
  id INTEGER NOT NULL DEFAULT nextval('environment_config_id_seq'::regclass),
  environment VARCHAR(10) NOT NULL,
  database_url TEXT,
  is_active BOOLEAN DEFAULT true,
  last_transport_date TIMESTAMP WITHOUT TIME ZONE,
  description TEXT,
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: erp_customer_contacts
CREATE TABLE IF NOT EXISTS erp_customer_contacts (
  id INTEGER NOT NULL DEFAULT nextval('erp_customer_contacts_id_seq'::regclass),
  customer_id INTEGER NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  position VARCHAR(100),
  department VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(30),
  mobile VARCHAR(30),
  is_primary BOOLEAN DEFAULT false,
  is_billing BOOLEAN DEFAULT false,
  is_shipping BOOLEAN DEFAULT false,
  is_technical BOOLEAN DEFAULT false,
  is_marketing BOOLEAN DEFAULT false,
  preferred_language VARCHAR(50) DEFAULT 'English'::character varying,
  notes TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  created_by INTEGER,
  updated_by INTEGER,
  active BOOLEAN DEFAULT true
);


-- Table: erp_customers
CREATE TABLE IF NOT EXISTS erp_customers (
  id INTEGER NOT NULL DEFAULT nextval('erp_customers_id_seq'::regclass),
  customer_code VARCHAR(20) NOT NULL,
  name VARCHAR(100) NOT NULL,
  type VARCHAR(50) NOT NULL,
  description TEXT,
  tax_id VARCHAR(50),
  industry VARCHAR(50),
  segment VARCHAR(50),
  address TEXT,
  city VARCHAR(100),
  state VARCHAR(50),
  country VARCHAR(50),
  postal_code VARCHAR(20),
  region VARCHAR(50),
  phone VARCHAR(30),
  alt_phone VARCHAR(30),
  email VARCHAR(100),
  website VARCHAR(255),
  currency VARCHAR(10),
  payment_terms VARCHAR(50),
  payment_method VARCHAR(50),
  credit_limit NUMERIC,
  credit_rating VARCHAR(10),
  discount_group VARCHAR(50),
  price_group VARCHAR(50),
  incoterms VARCHAR(20),
  shipping_method VARCHAR(50),
  delivery_terms VARCHAR(100),
  delivery_route VARCHAR(100),
  sales_rep_id INTEGER,
  parent_customer_id INTEGER,
  status VARCHAR(20) NOT NULL DEFAULT 'active'::character varying,
  is_b2b BOOLEAN DEFAULT true,
  is_b2c BOOLEAN DEFAULT false,
  is_vip BOOLEAN DEFAULT false,
  notes TEXT,
  tags ARRAY,
  company_code_id INTEGER,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  created_by INTEGER,
  updated_by INTEGER,
  version INTEGER NOT NULL DEFAULT 1,
  active BOOLEAN DEFAULT true
);


-- Table: erp_vendor_contacts
CREATE TABLE IF NOT EXISTS erp_vendor_contacts (
  id INTEGER NOT NULL DEFAULT nextval('erp_vendor_contacts_id_seq'::regclass),
  vendor_id INTEGER NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  position VARCHAR(100),
  department VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(30),
  mobile VARCHAR(30),
  is_primary BOOLEAN DEFAULT false,
  is_order_contact BOOLEAN DEFAULT false,
  is_purchase_contact BOOLEAN DEFAULT false,
  is_quality_contact BOOLEAN DEFAULT false,
  is_accounts_contact BOOLEAN DEFAULT false,
  preferred_language VARCHAR(50) DEFAULT 'English'::character varying,
  notes TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  created_by INTEGER,
  updated_by INTEGER,
  active BOOLEAN DEFAULT true
);


-- Table: erp_vendors
CREATE TABLE IF NOT EXISTS erp_vendors (
  id INTEGER NOT NULL DEFAULT nextval('erp_vendors_id_seq'::regclass),
  vendor_code VARCHAR(20) NOT NULL,
  name VARCHAR(100) NOT NULL,
  type VARCHAR(50) NOT NULL,
  description TEXT,
  tax_id VARCHAR(50),
  industry VARCHAR(50),
  address TEXT,
  city VARCHAR(100),
  state VARCHAR(50),
  country VARCHAR(50),
  postal_code VARCHAR(20),
  region VARCHAR(50),
  phone VARCHAR(30),
  alt_phone VARCHAR(30),
  email VARCHAR(100),
  website VARCHAR(255),
  currency VARCHAR(10),
  payment_terms VARCHAR(50),
  payment_method VARCHAR(50),
  supplier_type VARCHAR(50),
  category VARCHAR(50),
  order_frequency VARCHAR(50),
  minimum_order_value NUMERIC,
  evaluation_score NUMERIC,
  lead_time INTEGER,
  purchasing_group_id INTEGER,
  status VARCHAR(20) NOT NULL DEFAULT 'active'::character varying,
  blacklisted BOOLEAN DEFAULT false,
  blacklist_reason TEXT,
  notes TEXT,
  tags ARRAY,
  company_code_id INTEGER,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  created_by INTEGER,
  updated_by INTEGER,
  version INTEGER NOT NULL DEFAULT 1,
  active BOOLEAN DEFAULT true
);


-- Table: expenses
CREATE TABLE IF NOT EXISTS expenses (
  id INTEGER NOT NULL DEFAULT nextval('expenses_id_seq'::regclass),
  date TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  amount DOUBLE PRECISION NOT NULL,
  category TEXT NOT NULL,
  description TEXT NOT NULL,
  payment_method TEXT NOT NULL,
  reference TEXT,
  user_id INTEGER,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  active BOOLEAN DEFAULT true
);


-- Table: fiscal_periods
CREATE TABLE IF NOT EXISTS fiscal_periods (
  id INTEGER NOT NULL DEFAULT nextval('fiscal_periods_id_seq'::regclass),
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  version INTEGER DEFAULT 1,
  year INTEGER NOT NULL,
  period INTEGER NOT NULL,
  name VARCHAR(255) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  status VARCHAR(50) DEFAULT 'Open'::character varying,
  company_code_id INTEGER,
  active BOOLEAN DEFAULT true
);


-- Table: fiscal_year_variants
CREATE TABLE IF NOT EXISTS fiscal_year_variants (
  id INTEGER NOT NULL DEFAULT nextval('fiscal_year_variants_id_seq'::regclass),
  variant_id VARCHAR(10) NOT NULL,
  description VARCHAR(255) NOT NULL,
  posting_periods INTEGER DEFAULT 12,
  special_periods INTEGER DEFAULT 0,
  year_shift INTEGER DEFAULT 0,
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: general_ledger_accounts
CREATE TABLE IF NOT EXISTS general_ledger_accounts (
  id INTEGER NOT NULL DEFAULT nextval('general_ledger_accounts_id_seq'::regclass),
  account_number VARCHAR(20) NOT NULL,
  account_name VARCHAR(100) NOT NULL,
  account_type VARCHAR(20) NOT NULL,
  account_group VARCHAR(50),
  parent_account_id INTEGER,
  company_code_id INTEGER,
  currency_id INTEGER,
  balance_sheet_item BOOLEAN DEFAULT false,
  profit_loss_item BOOLEAN DEFAULT false,
  reconciliation_account BOOLEAN DEFAULT false,
  tax_relevant BOOLEAN DEFAULT false,
  posting_allowed BOOLEAN DEFAULT true,
  blocked BOOLEAN DEFAULT false,
  description TEXT,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: gl_accounts
CREATE TABLE IF NOT EXISTS gl_accounts (
  id INTEGER NOT NULL DEFAULT nextval('gl_accounts_id_seq'::regclass),
  account_number TEXT NOT NULL,
  account_name TEXT NOT NULL,
  chart_of_accounts_id INTEGER,
  account_type TEXT NOT NULL,
  account_group TEXT,
  balance_sheet_account BOOLEAN NOT NULL DEFAULT false,
  pl_account BOOLEAN NOT NULL DEFAULT false,
  block_posting BOOLEAN NOT NULL DEFAULT false,
  reconciliation_account BOOLEAN NOT NULL DEFAULT false,
  is_active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  active BOOLEAN DEFAULT true
);


-- Table: internal_orders
CREATE TABLE IF NOT EXISTS internal_orders (
  id INTEGER NOT NULL DEFAULT nextval('internal_orders_id_seq'::regclass),
  order_number VARCHAR(20) NOT NULL,
  order_type VARCHAR(10) NOT NULL,
  description VARCHAR(100) NOT NULL,
  company_code VARCHAR(4) NOT NULL,
  controlling_area VARCHAR(4) NOT NULL,
  responsible_cost_center VARCHAR(10),
  profit_center VARCHAR(10),
  order_status VARCHAR(20) DEFAULT 'CREATED'::character varying,
  planned_costs NUMERIC DEFAULT 0,
  actual_costs NUMERIC DEFAULT 0,
  committed_costs NUMERIC DEFAULT 0,
  budget_amount NUMERIC DEFAULT 0,
  start_date DATE,
  end_date DATE,
  created_by INTEGER,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: inventory_transactions
CREATE TABLE IF NOT EXISTS inventory_transactions (
  id INTEGER NOT NULL DEFAULT nextval('inventory_transactions_id_seq'::regclass),
  transaction_number VARCHAR(20) NOT NULL,
  transaction_type VARCHAR(20) NOT NULL,
  material_id INTEGER,
  plant_id INTEGER,
  storage_location_id INTEGER,
  movement_type VARCHAR(10) NOT NULL,
  quantity NUMERIC NOT NULL,
  unit_of_measure VARCHAR(10),
  unit_price NUMERIC,
  total_value NUMERIC,
  batch_number VARCHAR(50),
  serial_number VARCHAR(50),
  reference_document VARCHAR(50),
  posting_date DATE NOT NULL,
  document_date DATE NOT NULL,
  cost_center_id INTEGER,
  reason_code VARCHAR(10),
  notes TEXT,
  created_by INTEGER,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: invoices
CREATE TABLE IF NOT EXISTS invoices (
  id INTEGER NOT NULL DEFAULT nextval('invoices_id_seq'::regclass),
  invoice_number TEXT NOT NULL,
  order_id INTEGER,
  issue_date TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  due_date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  amount DOUBLE PRECISION NOT NULL,
  status TEXT NOT NULL DEFAULT 'Due'::text,
  paid_date TIMESTAMP WITHOUT TIME ZONE,
  user_id INTEGER,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  active BOOLEAN DEFAULT true
);


-- Table: issue_analytics_summary
CREATE TABLE IF NOT EXISTS issue_analytics_summary (
  id BIGINT NOT NULL DEFAULT nextval('issue_analytics_summary_id_seq'::regclass),
  analysis_date DATE NOT NULL DEFAULT CURRENT_DATE,
  total_issues INTEGER DEFAULT 0,
  critical_issues INTEGER DEFAULT 0,
  high_issues INTEGER DEFAULT 0,
  medium_issues INTEGER DEFAULT 0,
  low_issues INTEGER DEFAULT 0,
  ai_resolved INTEGER DEFAULT 0,
  auto_resolved INTEGER DEFAULT 0,
  manual_resolved INTEGER DEFAULT 0,
  unresolved INTEGER DEFAULT 0,
  avg_resolution_time INTEGER DEFAULT 0,
  median_resolution_time INTEGER DEFAULT 0,
  fastest_resolution INTEGER DEFAULT 0,
  slowest_resolution INTEGER DEFAULT 0,
  master_data_issues INTEGER DEFAULT 0,
  transaction_issues INTEGER DEFAULT 0,
  system_issues INTEGER DEFAULT 0,
  api_issues INTEGER DEFAULT 0,
  database_issues INTEGER DEFAULT 0,
  validation_issues INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: issue_patterns
CREATE TABLE IF NOT EXISTS issue_patterns (
  id BIGINT NOT NULL DEFAULT nextval('issue_patterns_id_seq'::regclass),
  pattern_name VARCHAR(200) NOT NULL,
  pattern_regex VARCHAR(500) NOT NULL,
  category VARCHAR(20) NOT NULL,
  match_count INTEGER DEFAULT 0,
  success_rate NUMERIC DEFAULT 0.00,
  avg_resolution_time INTEGER DEFAULT 0,
  auto_resolvable BOOLEAN DEFAULT false,
  resolution_template JSONB,
  confidence_threshold NUMERIC DEFAULT 0.80,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: issue_resolutions
CREATE TABLE IF NOT EXISTS issue_resolutions (
  id BIGINT NOT NULL DEFAULT nextval('issue_resolutions_id_seq'::regclass),
  resolution_id UUID DEFAULT gen_random_uuid(),
  issue_id UUID NOT NULL,
  resolved_by VARCHAR(50) NOT NULL,
  resolution_time INTEGER,
  steps JSONB NOT NULL,
  success BOOLEAN NOT NULL,
  additional_notes TEXT,
  validation_checks JSONB,
  rollback_info JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: journal_entries
CREATE TABLE IF NOT EXISTS journal_entries (
  id INTEGER NOT NULL DEFAULT nextval('journal_entries_id_seq'::regclass),
  document_number VARCHAR(20) NOT NULL,
  company_code_id INTEGER,
  document_type VARCHAR(10) NOT NULL,
  posting_date DATE NOT NULL,
  document_date DATE NOT NULL,
  fiscal_period VARCHAR(7) NOT NULL,
  fiscal_year INTEGER NOT NULL,
  currency_id INTEGER,
  exchange_rate NUMERIC DEFAULT 1.0,
  reference_document VARCHAR(50),
  header_text TEXT,
  total_debit_amount NUMERIC NOT NULL,
  total_credit_amount NUMERIC NOT NULL,
  created_by INTEGER,
  posted_by INTEGER,
  posting_time TIMESTAMP WITHOUT TIME ZONE,
  status VARCHAR(20) DEFAULT 'POSTED'::character varying,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  entry_date DATE,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: leads
CREATE TABLE IF NOT EXISTS leads (
  id INTEGER NOT NULL DEFAULT nextval('leads_id_seq'::regclass),
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  company_name VARCHAR(200),
  job_title VARCHAR(100),
  email VARCHAR(200) NOT NULL,
  phone VARCHAR(50),
  status VARCHAR(50) NOT NULL DEFAULT 'New'::character varying,
  source VARCHAR(100),
  industry VARCHAR(100),
  annual_revenue NUMERIC,
  employee_count INTEGER,
  website VARCHAR(200),
  address TEXT,
  city VARCHAR(100),
  state VARCHAR(100),
  country VARCHAR(100),
  postal_code VARCHAR(20),
  description TEXT,
  last_contacted TIMESTAMP WITHOUT TIME ZONE,
  next_followup TIMESTAMP WITHOUT TIME ZONE,
  assigned_to INTEGER,
  lead_score INTEGER,
  is_converted BOOLEAN DEFAULT false,
  notes TEXT,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  active BOOLEAN DEFAULT true
);


-- Table: material_categories
CREATE TABLE IF NOT EXISTS material_categories (
  id INTEGER NOT NULL DEFAULT nextval('material_categories_id_seq'::regclass),
  code VARCHAR(10) NOT NULL,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  parent_id INTEGER,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: materials
CREATE TABLE IF NOT EXISTS materials (
  id INTEGER NOT NULL DEFAULT nextval('materials_id_seq'::regclass),
  code VARCHAR(20) NOT NULL,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  long_description TEXT,
  type VARCHAR(50) NOT NULL,
  uom_id INTEGER NOT NULL,
  category_id INTEGER,
  weight NUMERIC,
  weight_uom_id INTEGER,
  dimensions JSONB,
  base_unit_price NUMERIC,
  cost NUMERIC,
  min_order_qty NUMERIC,
  order_multiple NUMERIC,
  procurement_type VARCHAR(20),
  min_stock NUMERIC DEFAULT 0,
  max_stock NUMERIC,
  reorder_point NUMERIC,
  lead_time INTEGER,
  shelf_life INTEGER,
  lot_size VARCHAR(20),
  mrp_type VARCHAR(30),
  planning_policy VARCHAR(30),
  is_active BOOLEAN DEFAULT true,
  is_sellable BOOLEAN DEFAULT false,
  is_purchasable BOOLEAN DEFAULT false,
  is_manufactured BOOLEAN DEFAULT false,
  is_stockable BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  created_by INTEGER,
  updated_by INTEGER,
  version INTEGER NOT NULL DEFAULT 1,
  active BOOLEAN DEFAULT true,
  base_uom VARCHAR(10) DEFAULT 'PC'::character varying,
  status VARCHAR(20) DEFAULT 'active'::character varying
);


-- Table: module_health_status
CREATE TABLE IF NOT EXISTS module_health_status (
  id BIGINT NOT NULL DEFAULT nextval('module_health_status_id_seq'::regclass),
  module_name VARCHAR(100) NOT NULL,
  health_score NUMERIC NOT NULL,
  total_issues INTEGER DEFAULT 0,
  critical_issues INTEGER DEFAULT 0,
  resolved_issues INTEGER DEFAULT 0,
  avg_resolution_time INTEGER DEFAULT 0,
  response_time_avg INTEGER DEFAULT 0,
  error_rate NUMERIC DEFAULT 0.00,
  availability_score NUMERIC DEFAULT 100.00,
  ai_intervention_count INTEGER DEFAULT 0,
  ai_success_rate NUMERIC DEFAULT 0.00,
  last_check TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: opportunities
CREATE TABLE IF NOT EXISTS opportunities (
  id INTEGER NOT NULL DEFAULT nextval('opportunities_id_seq'::regclass),
  name VARCHAR(200) NOT NULL,
  lead_id INTEGER,
  customer_id INTEGER,
  status VARCHAR(50) NOT NULL DEFAULT 'Prospecting'::character varying,
  stage VARCHAR(50) NOT NULL,
  amount NUMERIC,
  expected_revenue NUMERIC,
  probability INTEGER,
  close_date TIMESTAMP WITHOUT TIME ZONE,
  next_step VARCHAR(200),
  type VARCHAR(100),
  source VARCHAR(100),
  campaign_source VARCHAR(100),
  description TEXT,
  assigned_to INTEGER,
  is_closed BOOLEAN DEFAULT false,
  is_won BOOLEAN DEFAULT false,
  notes TEXT,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  active BOOLEAN DEFAULT true
);


-- Table: order_items
CREATE TABLE IF NOT EXISTS order_items (
  id INTEGER NOT NULL DEFAULT nextval('order_items_id_seq'::regclass),
  order_id INTEGER,
  product_id INTEGER,
  quantity INTEGER NOT NULL,
  unit_price DOUBLE PRECISION NOT NULL,
  total DOUBLE PRECISION NOT NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  active BOOLEAN DEFAULT true
);


-- Table: orders
CREATE TABLE IF NOT EXISTS orders (
  id INTEGER NOT NULL DEFAULT nextval('orders_id_seq'::regclass),
  order_number TEXT NOT NULL,
  customer_id INTEGER,
  date TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  status TEXT NOT NULL DEFAULT 'Processing'::text,
  total DOUBLE PRECISION NOT NULL,
  notes TEXT,
  shipping_address TEXT,
  user_id INTEGER,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  active BOOLEAN DEFAULT true
);


-- Table: plants
CREATE TABLE IF NOT EXISTS plants (
  id INTEGER NOT NULL DEFAULT nextval('plants_id_seq'::regclass),
  code TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  company_code_id INTEGER NOT NULL,
  type TEXT NOT NULL,
  category TEXT,
  address TEXT,
  city TEXT,
  state TEXT,
  country TEXT,
  postal_code TEXT,
  phone TEXT,
  email TEXT,
  manager TEXT,
  timezone TEXT,
  operating_hours TEXT,
  coordinates TEXT,
  status TEXT NOT NULL DEFAULT 'active'::text,
  is_active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  created_by INTEGER,
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_by INTEGER,
  version INTEGER NOT NULL DEFAULT 1,
  notes TEXT,
  active BOOLEAN DEFAULT true,
  company_code VARCHAR(50)
);


-- Table: production_orders
CREATE TABLE IF NOT EXISTS production_orders (
  id INTEGER NOT NULL DEFAULT nextval('production_orders_id_seq'::regclass),
  order_number VARCHAR(20) NOT NULL,
  material_id INTEGER,
  bom_id INTEGER,
  plant_id INTEGER,
  work_center_id INTEGER,
  order_type VARCHAR(20) NOT NULL,
  planned_quantity NUMERIC NOT NULL,
  actual_quantity NUMERIC DEFAULT 0,
  scrap_quantity NUMERIC DEFAULT 0,
  unit_of_measure VARCHAR(10),
  planned_start_date DATE NOT NULL,
  planned_end_date DATE NOT NULL,
  actual_start_date DATE,
  actual_end_date DATE,
  priority VARCHAR(10) DEFAULT 'NORMAL'::character varying,
  status VARCHAR(20) DEFAULT 'CREATED'::character varying,
  cost_center_id INTEGER,
  created_by INTEGER,
  released_by INTEGER,
  release_date TIMESTAMP WITHOUT TIME ZONE,
  notes TEXT,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: production_work_orders
CREATE TABLE IF NOT EXISTS production_work_orders (
  id INTEGER NOT NULL DEFAULT nextval('production_work_orders_id_seq'::regclass),
  production_order_id INTEGER,
  material_id INTEGER,
  work_center_id INTEGER,
  quantity NUMERIC,
  start_date TIMESTAMP WITH TIME ZONE,
  end_date TIMESTAMP WITH TIME ZONE,
  status VARCHAR(20) DEFAULT 'planned'::character varying,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: products
CREATE TABLE IF NOT EXISTS products (
  id INTEGER NOT NULL DEFAULT nextval('products_id_seq'::regclass),
  name TEXT NOT NULL,
  sku TEXT NOT NULL,
  description TEXT,
  price DOUBLE PRECISION NOT NULL,
  cost DOUBLE PRECISION NOT NULL,
  stock INTEGER NOT NULL DEFAULT 0,
  min_stock INTEGER NOT NULL DEFAULT 10,
  category_id INTEGER,
  user_id INTEGER,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  active BOOLEAN DEFAULT true
);


-- Table: profit_centers
CREATE TABLE IF NOT EXISTS profit_centers (
  id INTEGER NOT NULL DEFAULT nextval('profit_centers_id_seq'::regclass),
  profit_center VARCHAR(10) NOT NULL,
  description VARCHAR(100) NOT NULL,
  profit_center_group VARCHAR(20),
  company_code VARCHAR(4) NOT NULL,
  controlling_area VARCHAR(4) NOT NULL,
  segment VARCHAR(10),
  hierarchy_area VARCHAR(20),
  responsible_person VARCHAR(50),
  valid_from DATE NOT NULL,
  valid_to DATE,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  company_code_id INTEGER,
  plant_id INTEGER,
  responsible_person_id INTEGER,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: purchase_groups
CREATE TABLE IF NOT EXISTS purchase_groups (
  id INTEGER NOT NULL DEFAULT nextval('purchase_groups_id_seq'::regclass),
  code TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  is_active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  created_by TEXT,
  updated_by TEXT,
  version INTEGER NOT NULL DEFAULT 1,
  valid_from TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  valid_to TIMESTAMP WITHOUT TIME ZONE,
  active BOOLEAN DEFAULT true
);


-- Table: purchase_order_items
CREATE TABLE IF NOT EXISTS purchase_order_items (
  id INTEGER NOT NULL DEFAULT nextval('purchase_order_items_id_seq'::regclass),
  purchase_order_id INTEGER,
  line_number INTEGER NOT NULL,
  material_id INTEGER,
  description TEXT,
  quantity NUMERIC NOT NULL,
  unit_price NUMERIC NOT NULL,
  total_price NUMERIC NOT NULL,
  delivery_date DATE,
  plant_id INTEGER,
  storage_location_id INTEGER,
  tax_code VARCHAR(10),
  discount_percent NUMERIC,
  received_quantity NUMERIC DEFAULT 0,
  invoiced_quantity NUMERIC DEFAULT 0,
  status VARCHAR(20) DEFAULT 'OPEN'::character varying,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: purchase_orders
CREATE TABLE IF NOT EXISTS purchase_orders (
  id INTEGER NOT NULL DEFAULT nextval('purchase_orders_id_seq'::regclass),
  order_number VARCHAR(20) NOT NULL,
  vendor_id INTEGER,
  purchase_organization_id INTEGER,
  company_code_id INTEGER,
  plant_id INTEGER,
  order_date DATE NOT NULL,
  delivery_date DATE,
  payment_terms VARCHAR(50),
  currency_id INTEGER,
  exchange_rate NUMERIC DEFAULT 1.0,
  total_amount NUMERIC,
  tax_amount NUMERIC,
  discount_amount NUMERIC,
  net_amount NUMERIC,
  status VARCHAR(20) DEFAULT 'OPEN'::character varying,
  created_by INTEGER,
  approved_by INTEGER,
  approval_date TIMESTAMP WITHOUT TIME ZONE,
  notes TEXT,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true,
  vendor_name VARCHAR(255)
);


-- Table: purchase_organizations
CREATE TABLE IF NOT EXISTS purchase_organizations (
  id INTEGER NOT NULL DEFAULT nextval('purchase_organizations_id_seq'::regclass),
  code VARCHAR(10) NOT NULL,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  company_code_id INTEGER NOT NULL,
  currency VARCHAR(3) DEFAULT 'USD'::character varying,
  purchasing_manager VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(50),
  address TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  created_by INTEGER,
  updated_by INTEGER,
  version INTEGER DEFAULT 1,
  valid_from DATE DEFAULT CURRENT_DATE,
  valid_to DATE,
  purchasing_group TEXT,
  supply_type TEXT,
  approval_level TEXT,
  city TEXT,
  state TEXT,
  country TEXT,
  postal_code TEXT,
  status TEXT NOT NULL DEFAULT 'active'::text,
  notes TEXT,
  manager TEXT,
  active BOOLEAN DEFAULT true
);


-- Table: purchase_requests
CREATE TABLE IF NOT EXISTS purchase_requests (
  id INTEGER NOT NULL DEFAULT nextval('purchase_requests_id_seq'::regclass),
  description TEXT NOT NULL,
  amount NUMERIC,
  priority VARCHAR(20) DEFAULT 'Medium'::character varying,
  cost_center_id INTEGER,
  requester_id INTEGER,
  status VARCHAR(20) DEFAULT 'pending'::character varying,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: quote_approvals
CREATE TABLE IF NOT EXISTS quote_approvals (
  id INTEGER NOT NULL DEFAULT nextval('quote_approvals_id_seq'::regclass),
  quote_id INTEGER,
  requested_by INTEGER NOT NULL,
  requested_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  status VARCHAR(50) NOT NULL DEFAULT 'Pending'::character varying,
  current_approver INTEGER,
  approved_by INTEGER,
  approved_at TIMESTAMP WITHOUT TIME ZONE,
  rejected_by INTEGER,
  rejected_at TIMESTAMP WITHOUT TIME ZONE,
  rejection_reason TEXT,
  comments TEXT,
  approval_level VARCHAR(50),
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  active BOOLEAN DEFAULT true
);


-- Table: quote_items
CREATE TABLE IF NOT EXISTS quote_items (
  id INTEGER NOT NULL DEFAULT nextval('quote_items_id_seq'::regclass),
  quote_id INTEGER,
  product_id INTEGER,
  description TEXT NOT NULL,
  quantity INTEGER NOT NULL,
  unit_price NUMERIC NOT NULL,
  discount_percent NUMERIC DEFAULT 0,
  tax_percent NUMERIC DEFAULT 0,
  line_total NUMERIC NOT NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  active BOOLEAN DEFAULT true
);


-- Table: quotes
CREATE TABLE IF NOT EXISTS quotes (
  id INTEGER NOT NULL DEFAULT nextval('quotes_id_seq'::regclass),
  quote_number VARCHAR(50) NOT NULL,
  opportunity_id INTEGER,
  customer_id INTEGER,
  status VARCHAR(50) NOT NULL DEFAULT 'Draft'::character varying,
  valid_until TIMESTAMP WITHOUT TIME ZONE,
  total_amount NUMERIC NOT NULL,
  discount_amount NUMERIC DEFAULT 0,
  tax_amount NUMERIC DEFAULT 0,
  grand_total NUMERIC NOT NULL,
  terms TEXT,
  notes TEXT,
  assigned_to INTEGER,
  approval_status VARCHAR(50) DEFAULT 'Pending'::character varying,
  approved_by INTEGER,
  approved_at TIMESTAMP WITHOUT TIME ZONE,
  rejected_reason TEXT,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  active BOOLEAN DEFAULT true
);


-- Table: regions
CREATE TABLE IF NOT EXISTS regions (
  id INTEGER NOT NULL DEFAULT nextval('regions_id_seq'::regclass),
  code VARCHAR(10) NOT NULL,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: reports
CREATE TABLE IF NOT EXISTS reports (
  id INTEGER NOT NULL DEFAULT nextval('reports_id_seq'::regclass),
  name VARCHAR(255) NOT NULL,
  description TEXT,
  sql_query TEXT NOT NULL,
  chart_config JSONB,
  category VARCHAR(100) DEFAULT 'custom'::character varying,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: sales_customer_contacts
CREATE TABLE IF NOT EXISTS sales_customer_contacts (
  id INTEGER NOT NULL DEFAULT nextval('sales_customer_contacts_id_seq'::regclass),
  customer_id INTEGER,
  name VARCHAR(255) NOT NULL,
  position VARCHAR(100),
  email VARCHAR(255),
  phone VARCHAR(50),
  is_primary BOOLEAN DEFAULT false,
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: sales_customers
CREATE TABLE IF NOT EXISTS sales_customers (
  id INTEGER NOT NULL DEFAULT nextval('sales_customers_id_seq'::regclass),
  customer_number VARCHAR(50) NOT NULL,
  company_name VARCHAR(255) NOT NULL,
  contact_person VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(50),
  website VARCHAR(255),
  industry VARCHAR(100),
  customer_type VARCHAR(50) DEFAULT 'Business'::character varying,
  billing_address TEXT,
  shipping_address TEXT,
  tax_id VARCHAR(100),
  payment_terms VARCHAR(100),
  credit_limit NUMERIC,
  status VARCHAR(50) DEFAULT 'Active'::character varying,
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: sales_invoice_items
CREATE TABLE IF NOT EXISTS sales_invoice_items (
  id INTEGER NOT NULL DEFAULT nextval('sales_invoice_items_id_seq'::regclass),
  invoice_id INTEGER,
  product_name VARCHAR(255) NOT NULL,
  description TEXT,
  quantity INTEGER NOT NULL,
  unit_price NUMERIC NOT NULL,
  discount_percent NUMERIC DEFAULT 0,
  tax_percent NUMERIC DEFAULT 0,
  subtotal NUMERIC NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: sales_invoices
CREATE TABLE IF NOT EXISTS sales_invoices (
  id INTEGER NOT NULL DEFAULT nextval('sales_invoices_id_seq'::regclass),
  invoice_number VARCHAR(50) NOT NULL,
  order_id INTEGER,
  customer_name VARCHAR(255) NOT NULL,
  invoice_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  due_date TIMESTAMP WITH TIME ZONE,
  status VARCHAR(50) DEFAULT 'Pending'::character varying,
  total_amount NUMERIC DEFAULT 0,
  discount_amount NUMERIC DEFAULT 0,
  tax_amount NUMERIC DEFAULT 0,
  grand_total NUMERIC DEFAULT 0,
  paid_amount NUMERIC DEFAULT 0,
  payment_method VARCHAR(50),
  payment_date TIMESTAMP WITH TIME ZONE,
  notes TEXT,
  created_by INTEGER,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: sales_order_items
CREATE TABLE IF NOT EXISTS sales_order_items (
  id INTEGER NOT NULL DEFAULT nextval('sales_order_items_id_seq'::regclass),
  order_id INTEGER,
  product_id INTEGER,
  product_name VARCHAR(255),
  quantity INTEGER NOT NULL,
  unit_price NUMERIC NOT NULL DEFAULT 0,
  discount_percent NUMERIC DEFAULT 0,
  tax_percent NUMERIC DEFAULT 0,
  subtotal NUMERIC NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: sales_orders
CREATE TABLE IF NOT EXISTS sales_orders (
  id INTEGER NOT NULL DEFAULT nextval('sales_orders_id_seq'::regclass),
  order_number VARCHAR(50) NOT NULL,
  customer_id INTEGER,
  customer_name VARCHAR(255) NOT NULL,
  order_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  delivery_date TIMESTAMP WITH TIME ZONE,
  status VARCHAR(50) DEFAULT 'Pending'::character varying,
  total_amount NUMERIC DEFAULT 0,
  payment_status VARCHAR(50) DEFAULT 'Unpaid'::character varying,
  shipping_address TEXT,
  billing_address TEXT,
  notes TEXT,
  created_by INTEGER,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  plant_id INTEGER,
  sales_org_id INTEGER,
  company_code_id INTEGER,
  currency_id INTEGER,
  active BOOLEAN DEFAULT true
);


-- Table: sales_organizations
CREATE TABLE IF NOT EXISTS sales_organizations (
  id INTEGER NOT NULL DEFAULT nextval('sales_organizations_id_seq'::regclass),
  code TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  company_code_id INTEGER NOT NULL,
  currency TEXT DEFAULT 'USD'::text,
  region TEXT,
  distribution_channel TEXT,
  industry TEXT,
  address TEXT,
  city TEXT,
  state TEXT,
  country TEXT,
  postal_code TEXT,
  phone TEXT,
  email TEXT,
  manager TEXT,
  status TEXT NOT NULL DEFAULT 'active'::text,
  is_active BOOLEAN NOT NULL DEFAULT true,
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by INTEGER,
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by INTEGER,
  version INTEGER NOT NULL DEFAULT 1,
  active BOOLEAN DEFAULT true
);


-- Table: sales_quote_items
CREATE TABLE IF NOT EXISTS sales_quote_items (
  id INTEGER NOT NULL DEFAULT nextval('sales_quote_items_id_seq'::regclass),
  quote_id INTEGER,
  product_name VARCHAR(255) NOT NULL,
  description TEXT,
  quantity INTEGER NOT NULL,
  unit_price NUMERIC NOT NULL,
  discount_percent NUMERIC DEFAULT 0,
  tax_percent NUMERIC DEFAULT 0,
  subtotal NUMERIC NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: sales_quotes
CREATE TABLE IF NOT EXISTS sales_quotes (
  id INTEGER NOT NULL DEFAULT nextval('sales_quotes_id_seq'::regclass),
  quote_number VARCHAR(50) NOT NULL,
  opportunity_id INTEGER,
  customer_name VARCHAR(255) NOT NULL,
  quote_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  valid_until TIMESTAMP WITH TIME ZONE,
  status VARCHAR(50) DEFAULT 'Draft'::character varying,
  total_amount NUMERIC DEFAULT 0,
  discount_amount NUMERIC DEFAULT 0,
  tax_amount NUMERIC DEFAULT 0,
  grand_total NUMERIC DEFAULT 0,
  notes TEXT,
  terms_conditions TEXT,
  created_by INTEGER,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: sales_return_items
CREATE TABLE IF NOT EXISTS sales_return_items (
  id INTEGER NOT NULL DEFAULT nextval('sales_return_items_id_seq'::regclass),
  return_id INTEGER,
  product_name VARCHAR(255) NOT NULL,
  quantity INTEGER NOT NULL,
  unit_price NUMERIC NOT NULL,
  subtotal NUMERIC NOT NULL,
  return_reason TEXT,
  condition VARCHAR(50),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: sales_returns
CREATE TABLE IF NOT EXISTS sales_returns (
  id INTEGER NOT NULL DEFAULT nextval('sales_returns_id_seq'::regclass),
  return_number VARCHAR(50) NOT NULL,
  order_id INTEGER,
  invoice_id INTEGER,
  customer_name VARCHAR(255) NOT NULL,
  return_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(50) DEFAULT 'Pending'::character varying,
  total_amount NUMERIC DEFAULT 0,
  return_reason TEXT,
  notes TEXT,
  created_by INTEGER,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: stock_movements
CREATE TABLE IF NOT EXISTS stock_movements (
  id INTEGER NOT NULL DEFAULT nextval('stock_movements_id_seq'::regclass),
  product_id INTEGER,
  type TEXT NOT NULL,
  quantity INTEGER NOT NULL,
  reason TEXT NOT NULL,
  date TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  user_id INTEGER,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: storage_locations
CREATE TABLE IF NOT EXISTS storage_locations (
  id INTEGER NOT NULL DEFAULT nextval('storage_locations_id_seq'::regclass),
  code TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  plant_id INTEGER NOT NULL,
  type TEXT NOT NULL,
  is_mrp_relevant BOOLEAN NOT NULL DEFAULT true,
  is_negative_stock_allowed BOOLEAN NOT NULL DEFAULT false,
  is_goods_receipt_relevant BOOLEAN NOT NULL DEFAULT true,
  is_goods_issue_relevant BOOLEAN NOT NULL DEFAULT true,
  is_interim_storage BOOLEAN NOT NULL DEFAULT false,
  is_transit_storage BOOLEAN NOT NULL DEFAULT false,
  is_restricted_use BOOLEAN NOT NULL DEFAULT false,
  status TEXT NOT NULL DEFAULT 'active'::text,
  is_active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  created_by INTEGER,
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_by INTEGER,
  version INTEGER NOT NULL DEFAULT 1,
  notes TEXT,
  active BOOLEAN DEFAULT true
);


-- Table: supply_types
CREATE TABLE IF NOT EXISTS supply_types (
  id INTEGER NOT NULL DEFAULT nextval('supply_types_id_seq'::regclass),
  code TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  is_active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  created_by TEXT,
  updated_by TEXT,
  version INTEGER NOT NULL DEFAULT 1,
  valid_from TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  valid_to TIMESTAMP WITHOUT TIME ZONE,
  active BOOLEAN DEFAULT true
);


-- Table: system_error_logs
CREATE TABLE IF NOT EXISTS system_error_logs (
  id INTEGER NOT NULL DEFAULT nextval('system_error_logs_id_seq'::regclass),
  timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
  level VARCHAR(10) NOT NULL,
  module VARCHAR(100) NOT NULL,
  message TEXT NOT NULL,
  stack TEXT,
  additional_data JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: tax_codes
CREATE TABLE IF NOT EXISTS tax_codes (
  id INTEGER NOT NULL DEFAULT nextval('tax_codes_id_seq'::regclass),
  code VARCHAR(10) NOT NULL,
  name VARCHAR(100) NOT NULL,
  country VARCHAR(2) NOT NULL,
  tax_type VARCHAR(20) NOT NULL,
  percentage NUMERIC NOT NULL,
  description TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: transport_logs
CREATE TABLE IF NOT EXISTS transport_logs (
  id INTEGER NOT NULL DEFAULT nextval('transport_logs_id_seq'::regclass),
  request_id INTEGER,
  environment VARCHAR(10) NOT NULL,
  action VARCHAR(50) NOT NULL,
  status VARCHAR(20) NOT NULL,
  message TEXT,
  executed_by VARCHAR(100),
  executed_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: transport_number_ranges
CREATE TABLE IF NOT EXISTS transport_number_ranges (
  id INTEGER NOT NULL DEFAULT nextval('transport_number_ranges_id_seq'::regclass),
  range_prefix VARCHAR(2) NOT NULL,
  range_type VARCHAR(50) NOT NULL,
  description TEXT,
  current_number INTEGER DEFAULT 100000,
  max_number INTEGER DEFAULT 999999,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true
);


-- Table: transport_objects
CREATE TABLE IF NOT EXISTS transport_objects (
  id INTEGER NOT NULL DEFAULT nextval('transport_objects_id_seq'::regclass),
  request_id INTEGER,
  object_type VARCHAR(50) NOT NULL,
  object_name VARCHAR(100) NOT NULL,
  table_name VARCHAR(100) NOT NULL,
  record_id INTEGER,
  action VARCHAR(20) NOT NULL,
  data_snapshot JSONB,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: transport_requests
CREATE TABLE IF NOT EXISTS transport_requests (
  id INTEGER NOT NULL DEFAULT nextval('transport_requests_id_seq'::regclass),
  request_number VARCHAR(20) NOT NULL,
  request_type VARCHAR(20) NOT NULL,
  description TEXT,
  owner VARCHAR(100) NOT NULL,
  status VARCHAR(20) DEFAULT 'CREATED'::character varying,
  source_environment VARCHAR(10) DEFAULT 'DEV'::character varying,
  target_environment VARCHAR(10),
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  released_at TIMESTAMP WITHOUT TIME ZONE,
  imported_at TIMESTAMP WITHOUT TIME ZONE,
  release_notes TEXT,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: units_of_measure
CREATE TABLE IF NOT EXISTS units_of_measure (
  id INTEGER NOT NULL DEFAULT nextval('units_of_measure_id_seq'::regclass),
  code VARCHAR(10) NOT NULL,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  is_active BOOLEAN DEFAULT true,
  dimension VARCHAR(50),
  conversion_factor NUMERIC DEFAULT 1.0,
  base_uom_id INTEGER,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  version INTEGER DEFAULT 1,
  active BOOLEAN DEFAULT true
);


-- Table: uom
CREATE TABLE IF NOT EXISTS uom (
  id INTEGER NOT NULL DEFAULT nextval('uom_id_seq'::regclass),
  code TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  category TEXT NOT NULL,
  is_base BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  created_by INTEGER,
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_by INTEGER,
  version INTEGER NOT NULL DEFAULT 1,
  is_active BOOLEAN NOT NULL DEFAULT true,
  notes TEXT,
  active BOOLEAN DEFAULT true
);


-- Table: uom_conversions
CREATE TABLE IF NOT EXISTS uom_conversions (
  id INTEGER NOT NULL DEFAULT nextval('uom_conversions_id_seq'::regclass),
  from_uom_id INTEGER NOT NULL,
  to_uom_id INTEGER NOT NULL,
  conversion_factor NUMERIC NOT NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  created_by INTEGER,
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_by INTEGER,
  version INTEGER NOT NULL DEFAULT 1,
  is_active BOOLEAN NOT NULL DEFAULT true,
  notes TEXT,
  active BOOLEAN DEFAULT true
);


-- Table: users
CREATE TABLE IF NOT EXISTS users (
  id INTEGER NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  username TEXT NOT NULL,
  password TEXT NOT NULL,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  role TEXT NOT NULL DEFAULT 'user'::text,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  active BOOLEAN DEFAULT true
);


-- Table: variance_analysis
CREATE TABLE IF NOT EXISTS variance_analysis (
  id INTEGER NOT NULL DEFAULT nextval('variance_analysis_id_seq'::regclass),
  variance_type VARCHAR(20) NOT NULL,
  object_type VARCHAR(20) NOT NULL,
  object_number VARCHAR(20) NOT NULL,
  fiscal_year INTEGER NOT NULL,
  period INTEGER NOT NULL,
  account VARCHAR(10),
  cost_element VARCHAR(10),
  planned_amount NUMERIC DEFAULT 0,
  actual_amount NUMERIC DEFAULT 0,
  variance_amount NUMERIC DEFAULT 0,
  variance_percentage NUMERIC DEFAULT 0,
  currency VARCHAR(3) DEFAULT 'USD'::character varying,
  analysis_date DATE NOT NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: vendor_contacts
CREATE TABLE IF NOT EXISTS vendor_contacts (
  id INTEGER NOT NULL DEFAULT nextval('vendor_contacts_id_seq'::regclass),
  vendor_id INTEGER NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  position VARCHAR(100),
  department VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(30),
  mobile VARCHAR(30),
  is_primary BOOLEAN DEFAULT false,
  is_order_contact BOOLEAN DEFAULT false,
  is_purchase_contact BOOLEAN DEFAULT false,
  is_quality_contact BOOLEAN DEFAULT false,
  is_accounts_contact BOOLEAN DEFAULT false,
  preferred_language VARCHAR(50) DEFAULT 'English'::character varying,
  notes TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  created_by INTEGER,
  updated_by INTEGER,
  active BOOLEAN DEFAULT true
);


-- Table: vendors
CREATE TABLE IF NOT EXISTS vendors (
  id INTEGER NOT NULL DEFAULT nextval('vendors_id_seq'::regclass),
  code VARCHAR(20) NOT NULL,
  name VARCHAR(100) NOT NULL,
  type VARCHAR(50) NOT NULL,
  description TEXT,
  tax_id VARCHAR(50),
  industry VARCHAR(50),
  address TEXT,
  city VARCHAR(100),
  state VARCHAR(50),
  country VARCHAR(50),
  postal_code VARCHAR(20),
  region VARCHAR(50),
  phone VARCHAR(30),
  alt_phone VARCHAR(30),
  email VARCHAR(100),
  website VARCHAR(255),
  currency VARCHAR(10),
  payment_terms VARCHAR(50),
  payment_method VARCHAR(50),
  supplier_type VARCHAR(50),
  category VARCHAR(50),
  order_frequency VARCHAR(50),
  minimum_order_value NUMERIC,
  evaluation_score NUMERIC,
  lead_time INTEGER,
  purchasing_group_id INTEGER,
  status VARCHAR(20) NOT NULL DEFAULT 'active'::character varying,
  blacklisted BOOLEAN DEFAULT false,
  blacklist_reason TEXT,
  notes TEXT,
  tags ARRAY,
  company_code_id INTEGER,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  created_by INTEGER,
  updated_by INTEGER,
  version INTEGER NOT NULL DEFAULT 1,
  active BOOLEAN DEFAULT true
);


-- Table: warehouse_bins
CREATE TABLE IF NOT EXISTS warehouse_bins (
  id INTEGER NOT NULL DEFAULT nextval('warehouse_bins_id_seq'::regclass),
  bin_code VARCHAR(20) NOT NULL,
  bin_name VARCHAR(100),
  storage_location_id INTEGER,
  bin_type VARCHAR(20) NOT NULL,
  zone VARCHAR(20),
  aisle VARCHAR(20),
  shelf VARCHAR(20),
  capacity_volume NUMERIC,
  capacity_weight NUMERIC,
  current_volume NUMERIC DEFAULT 0,
  current_weight NUMERIC DEFAULT 0,
  status VARCHAR(20) DEFAULT 'ACTIVE'::character varying,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  active BOOLEAN DEFAULT true,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Table: work_centers
CREATE TABLE IF NOT EXISTS work_centers (
  id INTEGER NOT NULL DEFAULT nextval('work_centers_id_seq'::regclass),
  code VARCHAR(20) NOT NULL,
  name VARCHAR(100) NOT NULL,
  plant_id INTEGER,
  description TEXT,
  capacity NUMERIC,
  capacity_unit VARCHAR(20),
  cost_rate NUMERIC,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(20) DEFAULT 'active'::character varying,
  cost_center_id INTEGER,
  company_code_id INTEGER,
  active BOOLEAN DEFAULT true
);

