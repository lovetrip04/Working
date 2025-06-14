# Complete Business Process Guide - MallyERP

## Overview

This guide covers the complete business process flow from Master Data setup through Sales execution to Finance and Controlling integration. Each module is interconnected and feeds data to the next level of business operations.

## Table of Contents

1. [Master Data Foundation](#master-data-foundation)
2. [Sales Process Flow](#sales-process-flow)
3. [Purchase Process Flow](#purchase-process-flow)
4. [Production Process Flow](#production-process-flow)
5. [Finance Integration](#finance-integration)
6. [Controlling Module](#controlling-module)
7. [Complete Process Integration](#complete-process-integration)

---

## Master Data Foundation

### 1. Organizational Structure Setup

#### Company Code Configuration
```
Company Code → Plants → Storage Locations → Cost Centers → Profit Centers
```

**Step-by-Step:**
1. Create Company Code (US01)
2. Assign Chart of Accounts (USCOA)
3. Configure Fiscal Year Variant (K4)
4. Set Currency (USD)
5. Define Tax Settings

#### Plant and Storage Setup
1. **Plant Creation**
   - Plant Code: CHI01 (Chicago Manufacturing)
   - Assign to Company Code: US01
   - Set Plant Category: Manufacturing

2. **Storage Locations**
   - RAW1: Raw Materials Warehouse
   - WIP1: Work-in-Process Storage
   - FIN1: Finished Goods Warehouse
   - QC01: Quality Control Hold

### 2. Financial Master Data

#### Chart of Accounts Structure
- **1000000-1999999**: Assets
  - 1100000-1199999: Current Assets
  - 1200000-1299999: Fixed Assets
- **2000000-2999999**: Liabilities
  - 2100000-2199999: Current Liabilities
  - 2200000-2299999: Long-term Liabilities
- **3000000-3999999**: Equity
- **4000000-4999999**: Revenue
- **5000000-9999999**: Expenses

#### Cost Center Hierarchy
```
Company US01
├── Production Cost Centers
│   ├── CC001 - Manufacturing Line 1
│   ├── CC002 - Manufacturing Line 2
│   └── CC003 - Quality Control
├── Administrative Cost Centers
│   ├── CC101 - Human Resources
│   ├── CC102 - IT Department
│   └── CC103 - Finance Department
└── Sales Cost Centers
    ├── CC201 - Sales North
    ├── CC202 - Sales South
    └── CC203 - Sales International
```

### 3. Customer and Vendor Master

#### Customer Master Data
- **Customer Groups**: Corporate, Retail, Government
- **Payment Terms**: NET15, NET30, NET60
- **Credit Management**: Credit limits and risk assessment
- **Pricing Groups**: Standard, Premium, Volume

#### Vendor Master Data
- **Vendor Types**: Raw Material, Service, Equipment
- **Payment Terms**: Standard vendor payment conditions
- **Purchase Organizations**: Centralized purchasing setup

---

## Sales Process Flow

### 1. Lead Management
```
Lead Creation → Qualification → Opportunity → Quote → Sales Order
```

#### Lead to Opportunity Conversion
1. **Lead Capture**
   - Source tracking (Web, Phone, Referral)
   - Lead scoring and qualification
   - Assignment to sales representatives

2. **Opportunity Management**
   - Probability assessment
   - Revenue forecasting
   - Stage progression tracking

### 2. Sales Order Processing

#### Order Creation Workflow
```
Customer Inquiry → Quote Generation → Order Entry → Credit Check → Order Confirmation
```

**Detailed Steps:**
1. **Quote Generation**
   - Material availability check
   - Pricing determination
   - Delivery date calculation
   - Terms and conditions

2. **Order Entry**
   - Customer master validation
   - Material master verification
   - Availability-to-Promise (ATP) check
   - Credit limit verification

3. **Order Processing**
   - Pick list generation
   - Delivery planning
   - Invoice preparation

### 3. Pricing and Conditions

#### Pricing Procedure (RVAA01)
```
Step 10: Base Price (PR00)
Step 20: Customer Discount (K004)
Step 30: Material Discount (K005)
Step 40: Freight (KF00)
Step 50: Tax (MWST)
```

#### Condition Types
- **PR00**: Base Price
- **K004**: Customer-specific discount
- **K005**: Material-specific discount
- **KF00**: Freight charges
- **MWST**: Tax (Sales Tax/VAT)

---

## Purchase Process Flow

### 1. Purchase Requisition to Order

```
Purchase Requisition → Purchase Order → Goods Receipt → Invoice Verification → Payment
```

#### Purchase Requisition Process
1. **Requirement Planning**
   - MRP (Material Requirements Planning)
   - Manual requisitions
   - Stock replenishment

2. **Purchase Order Creation**
   - Vendor selection
   - Price comparison
   - Terms negotiation
   - Approval workflow

### 2. Goods Receipt Process

#### Three-Way Matching
1. **Purchase Order** (Quantity ordered)
2. **Goods Receipt** (Quantity received)
3. **Invoice** (Quantity invoiced)

#### Inventory Impact
- Raw Materials: Increase stock
- Quality inspection: Hold stock
- Direct consumption: Expense posting

---

## Production Process Flow

### 1. Production Planning

```
Sales Forecast → Production Plan → Material Requirements → Capacity Planning → Production Orders
```

#### Master Production Schedule (MPS)
1. **Demand Planning**
   - Sales forecast integration
   - Safety stock consideration
   - Seasonal adjustments

2. **Capacity Planning**
   - Work center capacity
   - Resource allocation
   - Bottleneck analysis

### 2. Production Execution

#### Production Order Lifecycle
```
Created → Released → In Process → Technically Completed → Closed
```

**Key Activities:**
1. **Material Issue**
   - Raw material consumption
   - Component allocation
   - Batch tracking

2. **Labor Recording**
   - Time confirmation
   - Activity allocation
   - Efficiency tracking

3. **Overhead Allocation**
   - Machine hours
   - Setup costs
   - Indirect labor

---

## Finance Integration

### 1. Financial Document Flow

```
Business Transaction → Journal Entry → GL Posting → Financial Statements
```

#### Document Types
- **SA**: Sales documents
- **RE**: Vendor invoices
- **AB**: Asset postings
- **KR**: Internal cost allocations

### 2. Accounts Payable (AP)

#### Invoice Processing
1. **Invoice Receipt**
   - Vendor invoice matching
   - Three-way matching validation
   - Approval workflow

2. **Payment Processing**
   - Payment terms application
   - Cash discount calculation
   - Payment run execution

### 3. Accounts Receivable (AR)

#### Customer Invoice Management
1. **Billing Process**
   - Delivery-based billing
   - Milestone billing
   - Recurring billing

2. **Collections Management**
   - Aging analysis
   - Dunning procedures
   - Credit management

---

## Controlling Module

### 1. Cost Center Accounting

#### Cost Center Structure
```
Company Code
├── Production Cost Centers
│   ├── Primary Costs (Material, Labor)
│   ├── Secondary Costs (Overhead allocation)
│   └── Activity Types (Machine hours, Labor hours)
├── Service Cost Centers
│   ├── HR Services
│   ├── IT Services
│   └── Facility Services
└── Administrative Cost Centers
    ├── Finance & Accounting
    ├── General Management
    └── Sales & Marketing
```

#### Cost Center Planning
1. **Primary Cost Planning**
   - Direct material costs
   - Direct labor costs
   - Machine costs

2. **Activity Planning**
   - Activity types definition
   - Activity quantities
   - Activity prices

#### Cost Center Allocation
```sql
-- Primary cost posting
INSERT INTO cost_center_actuals 
(cost_center, account, period, amount, quantity, posting_date)
VALUES ('CC001', '5000001', '2025006', 15000.00, 100, CURRENT_DATE);

-- Secondary cost allocation
INSERT INTO cost_center_allocations
(sender_cost_center, receiver_cost_center, allocation_base, percentage, amount)
VALUES ('CC101', 'CC001', 'HEADCOUNT', 25.5, 3500.00);
```

### 2. Profit Center Accounting

#### Profit Center Hierarchy
```
Profit Center Standard Hierarchy
├── PC001 - Manufacturing Division
│   ├── PC001-01 - Product Line A
│   ├── PC001-02 - Product Line B
│   └── PC001-03 - Custom Products
├── PC002 - Sales Division
│   ├── PC002-01 - Domestic Sales
│   ├── PC002-02 - Export Sales
│   └── PC002-03 - Online Sales
└── PC003 - Service Division
    ├── PC003-01 - Maintenance Services
    └── PC003-02 - Consulting Services
```

#### Profit Center P&L Structure
- **Revenue**: Sales revenue by product line
- **Cost of Goods Sold**: Direct material and production costs
- **Gross Profit**: Revenue minus COGS
- **Operating Expenses**: Administrative and selling expenses
- **Operating Profit**: Gross profit minus operating expenses

### 3. Internal Orders

#### Order Types
- **Marketing Orders**: Campaign costs
- **Investment Orders**: Capital projects
- **Maintenance Orders**: Equipment maintenance
- **Research Orders**: R&D projects

#### Internal Order Lifecycle
```
Planning → Budget Release → Cost Collection → Settlement → Closure
```

### 4. Product Costing

#### Costing Methods
1. **Standard Costing**
   - Predetermined costs
   - Variance analysis
   - Cost center rates

2. **Actual Costing**
   - Real-time cost collection
   - Activity-based costing
   - Resource consumption

#### Cost Component Structure
- **Material Costs**: Raw materials and components
- **Labor Costs**: Direct and indirect labor
- **Overhead Costs**: Machine, setup, and general overhead

### 5. Profitability Analysis (CO-PA)

#### Costing-Based CO-PA
```sql
-- Profitability segment definition
CREATE TABLE profitability_segments (
    segment_id SERIAL PRIMARY KEY,
    customer_group VARCHAR(10),
    product_group VARCHAR(10),
    sales_organization VARCHAR(4),
    distribution_channel VARCHAR(2),
    region VARCHAR(10)
);

-- Revenue posting to CO-PA
INSERT INTO copa_actual_data
(segment_id, value_field, period, amount, quantity, currency)
VALUES (12345, 'VV010', '2025006', 125000.00, 500, 'USD');
```

#### Account-Based CO-PA
- **Revenue Recognition**: Sales by segment
- **Cost Attribution**: COGS allocation
- **Margin Analysis**: Contribution margins

---

## Complete Process Integration

### 1. Order-to-Cash Process

```
Sales Order → Delivery → Billing → Payment → Financial Posting
```

#### Financial Integration Points
1. **Sales Order Creation**
   ```sql
   -- Credit management check
   UPDATE customers SET credit_exposure = credit_exposure + order_value
   WHERE customer_number = 'C10001';
   ```

2. **Goods Issue (Delivery)**
   ```sql
   -- Inventory reduction
   UPDATE material_stocks 
   SET quantity = quantity - delivered_qty,
        value = value - (delivered_qty * standard_price)
   WHERE material = 'MAT001001' AND plant = 'CHI01';
   
   -- COGS posting
   INSERT INTO fi_documents (account, amount, cost_center, profit_center)
   VALUES ('5000100', -cost_amount, 'CC001', 'PC001-01');
   ```

3. **Customer Invoice**
   ```sql
   -- Revenue recognition
   INSERT INTO fi_documents (account, amount, profit_center, customer)
   VALUES ('4000100', invoice_amount, 'PC002-01', 'C10001');
   
   -- Accounts receivable
   INSERT INTO fi_documents (account, amount, customer, due_date)
   VALUES ('1300100', invoice_amount, 'C10001', due_date);
   ```

### 2. Purchase-to-Pay Process

```
Purchase Requisition → Purchase Order → Goods Receipt → Invoice → Payment
```

#### Financial Integration
1. **Goods Receipt**
   ```sql
   -- Inventory increase
   UPDATE material_stocks 
   SET quantity = quantity + received_qty,
        value = value + (received_qty * purchase_price)
   WHERE material = 'RAW001' AND plant = 'CHI01';
   
   -- GR/IR clearing account
   INSERT INTO fi_documents (account, amount, vendor, purchase_order)
   VALUES ('2300100', purchase_amount, 'V20001', 'PO4500000001');
   ```

2. **Invoice Verification**
   ```sql
   -- Vendor liability
   INSERT INTO fi_documents (account, amount, vendor, payment_terms)
   VALUES ('2100100', invoice_amount, 'V20001', 'NET30');
   
   -- Expense or inventory adjustment
   INSERT INTO fi_documents (account, amount, cost_center)
   VALUES ('5000200', invoice_amount, 'CC001');
   ```

### 3. Manufacturing Cost Flow

#### Standard Cost Flow
```
Raw Material → WIP → Finished Goods → COGS
```

#### Variance Analysis
1. **Price Variances**
   ```sql
   -- Material price variance
   INSERT INTO variance_analysis 
   (variance_type, material, period, planned_price, actual_price, variance_amount)
   VALUES ('PRICE', 'RAW001', '2025006', 10.00, 10.50, -500.00);
   ```

2. **Efficiency Variances**
   ```sql
   -- Labor efficiency variance
   INSERT INTO variance_analysis
   (variance_type, cost_center, period, standard_hours, actual_hours, variance_amount)
   VALUES ('EFFICIENCY', 'CC001', '2025006', 100, 105, -250.00);
   ```

### 4. Period-End Closing Process

#### Month-End Activities
1. **Cost Center Assessment**
   ```sql
   -- Distribute service cost center costs
   CALL distribute_service_costs('2025006');
   
   -- Calculate activity prices
   CALL calculate_activity_prices('2025006');
   ```

2. **Product Cost Calculation**
   ```sql
   -- Update standard costs
   CALL update_standard_costs('2025006');
   
   -- Calculate cost center variances
   CALL calculate_cost_variances('2025006');
   ```

3. **Profitability Analysis**
   ```sql
   -- CO-PA settlement
   CALL settle_copa_data('2025006');
   
   -- Generate profitability reports
   CALL generate_margin_analysis('2025006');
   ```

## Key Performance Indicators (KPIs)

### Financial KPIs
- **Gross Margin %**: (Revenue - COGS) / Revenue
- **Operating Margin %**: Operating Income / Revenue
- **Return on Assets**: Net Income / Total Assets
- **Days Sales Outstanding**: AR / (Revenue / Days)

### Operational KPIs
- **Inventory Turnover**: COGS / Average Inventory
- **Order Fulfillment Rate**: On-time deliveries / Total orders
- **Production Efficiency**: Standard hours / Actual hours
- **Quality Rate**: Good units / Total units produced

### Controlling KPIs
- **Cost Center Efficiency**: Planned costs / Actual costs
- **Activity Price Variance**: Standard price / Actual price
- **Overhead Absorption Rate**: Applied overhead / Actual overhead
- **Profit Center ROI**: Profit / Invested capital

This comprehensive guide provides the foundation for understanding how all business processes integrate within the ERP system, from master data through operational processes to financial reporting and controlling analysis.