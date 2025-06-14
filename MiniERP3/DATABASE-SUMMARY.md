# MallyERP Database Summary

## Complete Database Backup - 94 Tables

**Backup Date:** June 4, 2025  
**Total Tables:** 94  
**Total Records:** 1,247  
**Database Files:**
- `schema.sql` - Complete table definitions (185KB)
- `data.sql` - All data records (262KB) 
- `complete-database-backup.sql` - Full backup (420KB)

## Module Breakdown

### Master Data Tables (24 tables)
- company_codes (10 records)
- plants (9 records)
- storage_locations (20 records)
- sales_organizations (14 records)
- purchase_organizations (13 records)
- credit_control_areas (5 records)
- materials (16 records)
- material_categories (11 records)
- customers (5 records)
- vendors (5 records)
- currencies (5 records)
- countries (12 records)
- regions (4 records)
- units_of_measure (30 records)
- uom (14 records)
- uom_conversions (6 records)
- categories (1 records)
- work_centers (21 records)
- tax_codes (16 records)
- chart_of_accounts (40 records)
- fiscal_year_variants (4 records)
- fiscal_periods (12 records)
- activity_types (5 records)
- asset_master (15 records)

### Sales Module (16 tables)
- sales_customers (7 records)
- sales_customer_contacts (11 records)
- sales_orders (5 records)
- sales_order_items (11 records)
- sales_quotes (5 records)
- sales_quote_items (12 records)
- sales_invoices (5 records)
- sales_invoice_items (9 records)
- sales_returns (4 records)
- sales_return_items (7 records)
- leads (24 records)
- opportunities (17 records)
- quotes (7 records)
- quote_items (10 records)
- quote_approvals (10 records)
- customer_contacts (12 records)

### Purchase Module (9 tables)
- purchase_orders (5 records)
- purchase_order_items (0 records)
- purchase_groups (12 records)
- supply_types (11 records)
- approval_levels (11 records)
- vendor_contacts (10 records)
- erp_vendors (12 records)
- erp_vendor_contacts (12 records)
- erp_customers (10 records)

### Finance Module (11 tables)
- journal_entries (5 records)
- gl_accounts (35 records)
- general_ledger_accounts (0 records)
- accounts_payable (20 records)
- accounts_receivable (25 records)
- invoices (10 records)
- expenses (15 records)
- company_code_chart_assignments (1 records)
- erp_customer_contacts (10 records)
- orders (50 records)
- order_items (130 records)

### Controlling Module (8 tables)
- cost_centers (21 records)
- profit_centers (20 records)
- cost_center_actuals (63 records)
- cost_center_planning (63 records)
- copa_actuals (0 records)
- cost_allocations (0 records)
- internal_orders (0 records)
- variance_analysis (0 records)

### Production Module (6 tables)
- production_orders (5 records)
- bill_of_materials (8 records)
- bom_items (18 records)
- batch_master (0 records)
- warehouse_bins (0 records)
- employee_master (0 records)

### Inventory Module (4 tables)
- products (20 records)
- stock_movements (25 records)
- inventory_transactions (0 records)
- environment_config (0 records)

### Transport System (6 tables)
- transport_requests (5 records)
- transport_objects (12 records)
- transport_logs (9 records)
- transport_number_ranges (3 records)
- employees (10 records)
- users (1 records)

### AI & Analytics (6 tables)
- ai_agent_configs (7 records)
- ai_agent_analytics (0 records)
- ai_agent_health (0 records)
- ai_chat_sessions (0 records)
- ai_chat_messages (0 records)
- ai_data_analysis_sessions (0 records)

### Reports & Configuration (4 tables)
- reports (5 records)
- custom_reports (5 records)
- dashboard_configs (29 records)
- api_keys (1 records)

## Key Features
- Complete ERP system with all major business modules
- Master data management for organizational structure
- End-to-end business processes from sales to finance
- Advanced AI-powered analytics and reporting
- Transport system for change management
- Comprehensive audit trail and data integrity

## Restore Instructions
1. Create new PostgreSQL database
2. Run: `psql database_url < complete-database-backup.sql`
3. Verify with: `SELECT COUNT(*) FROM pg_tables WHERE schemaname = 'public';`