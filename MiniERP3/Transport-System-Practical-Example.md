# Transport System Practical Example: Company Code to Sales Order Configuration

## Complete Working Example: US Operations Setup

This document demonstrates a real-world transport workflow implementing a complete sales order process configuration from foundation to execution.

### Transport Sequence Overview

```
A1100001 → A1100002 → A1100003 → A1100004 → A1100005 → A1100006 → A1100007 → A1100008
   ↓          ↓          ↓          ↓          ↓          ↓          ↓          ↓
Company    Plant     Number    Customer   Sales     Material   SO Config  Complete
 Code     Structure  Ranges    Master     Org       Master     & Ranges   Process
```

### Phase 1: Foundation Transport (A1100001)

**Transport A1100001: Company Code Foundation**
```json
{
  "transport_number": "A1100001",
  "description": "US Operations Company Code Setup",
  "request_type": "CONFIGURATION",
  "target_environment": "QA",
  "objects": [
    {
      "object_type": "COMPANY_CODE",
      "object_name": "US01",
      "table_name": "company_codes",
      "action": "CREATE",
      "data": {
        "code": "US01",
        "name": "US Operations Inc",
        "currency": "USD",
        "country": "US",
        "language": "EN",
        "fiscal_year_variant": "K4",
        "chart_of_accounts": "USCOA",
        "address": {
          "street": "123 Corporate Drive",
          "city": "New York",
          "state": "NY",
          "zip": "10001"
        },
        "tax_number": "12-3456789",
        "created_at": "2025-06-03T17:45:00Z"
      }
    },
    {
      "object_type": "CHART_OF_ACCOUNTS",
      "object_name": "USCOA",
      "table_name": "chart_of_accounts",
      "action": "CREATE",
      "data": {
        "chart_id": "USCOA",
        "description": "US Standard Chart of Accounts",
        "language": "EN",
        "company_codes": ["US01"],
        "account_length": 7,
        "group_chart": "INTL"
      }
    }
  ],
  "dependencies": [],
  "status": "RELEASED"
}
```

**Database Updates After A1100001:**
```sql
INSERT INTO company_codes (code, name, currency, country, fiscal_year_variant, chart_of_accounts)
VALUES ('US01', 'US Operations Inc', 'USD', 'US', 'K4', 'USCOA');

INSERT INTO chart_of_accounts (chart_id, description, language, account_length)
VALUES ('USCOA', 'US Standard Chart of Accounts', 'EN', 7);
```

### Phase 2: Organizational Structure (A1100002)

**Transport A1100002: Plant and Storage Setup**
```json
{
  "transport_number": "A1100002",
  "description": "Chicago Plant with Storage Locations",
  "dependencies": ["A1100001"],
  "objects": [
    {
      "object_type": "PLANT",
      "object_name": "CHI01",
      "table_name": "plants",
      "action": "CREATE",
      "data": {
        "plant_code": "CHI01",
        "plant_name": "Chicago Manufacturing Plant",
        "company_code": "US01",
        "country": "US",
        "region": "IL",
        "address": {
          "street": "456 Industrial Avenue",
          "city": "Chicago",
          "state": "IL",
          "zip": "60601"
        },
        "plant_category": "MANUFACTURING",
        "planning_plant": "CHI01"
      }
    },
    {
      "object_type": "STORAGE_LOCATION",
      "object_name": "RAW1",
      "table_name": "storage_locations",
      "action": "CREATE",
      "data": {
        "storage_location": "RAW1",
        "plant_code": "CHI01",
        "description": "Raw Materials Warehouse",
        "storage_type": "RAW_MATERIALS",
        "capacity": 10000,
        "unit": "M3"
      }
    },
    {
      "object_type": "STORAGE_LOCATION",
      "object_name": "FIN1",
      "table_name": "storage_locations",
      "action": "CREATE",
      "data": {
        "storage_location": "FIN1",
        "plant_code": "CHI01",
        "description": "Finished Goods Warehouse",
        "storage_type": "FINISHED_GOODS",
        "capacity": 5000,
        "unit": "M3"
      }
    }
  ]
}
```

### Phase 3: Number Range Configuration (A1100003)

**Transport A1100003: Comprehensive Number Ranges**
```json
{
  "transport_number": "A1100003",
  "description": "Number Ranges for All Object Types",
  "dependencies": ["A1100001"],
  "objects": [
    {
      "object_type": "NUMBER_RANGE",
      "object_name": "GL_ASSET",
      "table_name": "number_ranges",
      "action": "CREATE",
      "data": {
        "range_id": "GL_ASSET_US01",
        "object_type": "GL_ACCOUNT",
        "company_code": "US01",
        "range_from": 1000000,
        "range_to": 1999999,
        "current_number": 1000000,
        "increment": 1,
        "description": "Asset GL Accounts for US01"
      }
    },
    {
      "object_type": "NUMBER_RANGE",
      "object_name": "CUST_DOMESTIC",
      "table_name": "number_ranges",
      "action": "CREATE",
      "data": {
        "range_id": "CUST_DOM_US01",
        "object_type": "CUSTOMER",
        "company_code": "US01",
        "range_from": 10000,
        "range_to": 69999,
        "current_number": 10000,
        "prefix": "C",
        "description": "Domestic Customers US01"
      }
    },
    {
      "object_type": "NUMBER_RANGE",
      "object_name": "VEND_DOMESTIC",
      "table_name": "number_ranges",
      "action": "CREATE",
      "data": {
        "range_id": "VEND_DOM_US01",
        "object_type": "VENDOR",
        "company_code": "US01",
        "range_from": 20000,
        "range_to": 29999,
        "current_number": 20000,
        "prefix": "V",
        "description": "Domestic Vendors US01"
      }
    },
    {
      "object_type": "NUMBER_RANGE",
      "object_name": "ASSET_EQUIPMENT",
      "table_name": "number_ranges",
      "action": "CREATE",
      "data": {
        "range_id": "ASSET_EQ_US01",
        "object_type": "ASSET",
        "company_code": "US01",
        "range_from": 100000,
        "range_to": 999999,
        "current_number": 100000,
        "prefix": "A",
        "description": "Equipment Assets US01"
      }
    },
    {
      "object_type": "NUMBER_RANGE",
      "object_name": "PO_STANDARD",
      "table_name": "number_ranges",
      "action": "CREATE",
      "data": {
        "range_id": "PO_STD_US01",
        "object_type": "PURCHASE_ORDER",
        "company_code": "US01",
        "range_from": 4500000000,
        "range_to": 4549999999,
        "current_number": 4500000000,
        "description": "Standard Purchase Orders US01"
      }
    }
  ]
}
```

### Phase 4: Customer Master Data (A1100004)

**Transport A1100004: Customer Master Setup**
```json
{
  "transport_number": "A1100004",
  "description": "Customer Master Data with Generated Numbers",
  "dependencies": ["A1100003"],
  "objects": [
    {
      "object_type": "CUSTOMER",
      "object_name": "C10001",
      "table_name": "customers",
      "action": "CREATE",
      "number_range_used": "CUST_DOM_US01",
      "data": {
        "customer_number": "C10001",
        "customer_name": "ABC Manufacturing Corp",
        "company_code": "US01",
        "customer_group": "CORPORATE",
        "industry": "MANUFACTURING",
        "payment_terms": "NET30",
        "credit_limit": 500000.00,
        "currency": "USD",
        "tax_classification": "TAXABLE",
        "address": {
          "street": "789 Business Boulevard",
          "city": "Detroit",
          "state": "MI",
          "zip": "48201",
          "country": "US"
        },
        "contact": {
          "phone": "+1-313-555-0123",
          "email": "orders@abcmanufacturing.com",
          "contact_person": "John Smith"
        }
      }
    },
    {
      "object_type": "CUSTOMER",
      "object_name": "C10002",
      "table_name": "customers",
      "action": "CREATE",
      "number_range_used": "CUST_DOM_US01",
      "data": {
        "customer_number": "C10002",
        "customer_name": "XYZ Retail Solutions",
        "company_code": "US01",
        "customer_group": "RETAIL",
        "industry": "RETAIL",
        "payment_terms": "NET15",
        "credit_limit": 250000.00,
        "currency": "USD",
        "address": {
          "street": "321 Commerce Street",
          "city": "Los Angeles",
          "state": "CA",
          "zip": "90210"
        }
      }
    }
  ]
}
```

### Phase 5: Sales Organization Setup (A1100005)

**Transport A1100005: Sales Organization Configuration**
```json
{
  "transport_number": "A1100005",
  "description": "Sales Organization and Distribution Setup",
  "dependencies": ["A1100001"],
  "objects": [
    {
      "object_type": "SALES_ORGANIZATION",
      "object_name": "US01",
      "table_name": "sales_organizations",
      "action": "CREATE",
      "data": {
        "sales_org": "US01",
        "name": "US Sales Organization",
        "company_code": "US01",
        "currency": "USD",
        "divisions": ["00", "01", "02"],
        "distribution_channels": ["10", "20"],
        "address": {
          "street": "123 Corporate Drive",
          "city": "New York",
          "state": "NY",
          "zip": "10001"
        }
      }
    },
    {
      "object_type": "DISTRIBUTION_CHANNEL",
      "object_name": "10",
      "table_name": "distribution_channels",
      "action": "CREATE",
      "data": {
        "channel": "10",
        "description": "Direct Sales",
        "sales_organization": "US01"
      }
    },
    {
      "object_type": "DIVISION",
      "object_name": "00",
      "table_name": "divisions",
      "action": "CREATE",
      "data": {
        "division": "00",
        "description": "Cross-Division",
        "sales_organization": "US01"
      }
    }
  ]
}
```

### Phase 6: Material Master Data (A1100006)

**Transport A1100006: Material Master Configuration**
```json
{
  "transport_number": "A1100006",
  "description": "Material Master Data for Sales",
  "dependencies": ["A1100002", "A1100005"],
  "objects": [
    {
      "object_type": "MATERIAL",
      "object_name": "MAT001001",
      "table_name": "materials",
      "action": "CREATE",
      "data": {
        "material_number": "MAT001001",
        "description": "Premium Widget Series A",
        "material_type": "FERT",
        "base_unit": "EA",
        "material_group": "WIDGETS",
        "gross_weight": 2.5,
        "weight_unit": "KG",
        "plant_data": {
          "CHI01": {
            "plant_status": "ACTIVE",
            "mrp_type": "PD",
            "lot_size": "EX",
            "safety_stock": 100,
            "reorder_point": 50,
            "storage_location": "FIN1"
          }
        },
        "sales_data": {
          "US01": {
            "sales_organization": "US01",
            "distribution_channel": "10",
            "division": "00",
            "sales_unit": "EA",
            "tax_category": "MWST",
            "item_category_group": "NORM"
          }
        },
        "purchasing_data": {
          "purchasing_group": "001",
          "purchase_unit": "EA",
          "standard_price": 45.00,
          "price_unit": 1
        }
      }
    }
  ]
}
```

### Phase 7: Sales Order Configuration (A1100007)

**Transport A1100007: Sales Order Document Types and Number Ranges**
```json
{
  "transport_number": "A1100007",
  "description": "Sales Order Configuration and Number Ranges",
  "dependencies": ["A1100005"],
  "objects": [
    {
      "object_type": "NUMBER_RANGE",
      "object_name": "SO_STANDARD",
      "table_name": "number_ranges",
      "action": "CREATE",
      "data": {
        "range_id": "SO_STD_US01",
        "object_type": "SALES_ORDER",
        "company_code": "US01",
        "sales_organization": "US01",
        "range_from": 1000000,
        "range_to": 1999999,
        "current_number": 1000000,
        "prefix": "SO",
        "description": "Standard Sales Orders US01"
      }
    },
    {
      "object_type": "SALES_DOCUMENT_TYPE",
      "object_name": "OR",
      "table_name": "sales_document_types",
      "action": "CREATE",
      "data": {
        "document_type": "OR",
        "description": "Standard Order",
        "number_range": "SO_STD_US01",
        "item_category": "TAN",
        "schedule_line_category": "CP",
        "billing_type": "F2",
        "delivery_type": "LF",
        "sales_organization": "US01"
      }
    },
    {
      "object_type": "ITEM_CATEGORY",
      "object_name": "TAN",
      "table_name": "item_categories",
      "action": "CREATE",
      "data": {
        "item_category": "TAN",
        "description": "Standard Item",
        "item_type": "MATERIAL",
        "completion_rule": "B",
        "billing_relevance": "A"
      }
    }
  ]
}
```

### Phase 8: Complete Sales Process (A1100008)

**Transport A1100008: End-to-End Sales Order Process**
```json
{
  "transport_number": "A1100008",
  "description": "Complete Sales Order Processing Configuration",
  "dependencies": ["A1100004", "A1100006", "A1100007"],
  "objects": [
    {
      "object_type": "COPY_CONTROL",
      "object_name": "OR_TO_LF",
      "table_name": "copy_control",
      "action": "CREATE",
      "data": {
        "source_document": "OR",
        "target_document": "LF",
        "copy_requirements": "001",
        "item_copy_requirements": "002",
        "data_transfer": "ALL_FIELDS"
      }
    },
    {
      "object_type": "OUTPUT_TYPE",
      "object_name": "BA00",
      "table_name": "output_types",
      "action": "CREATE",
      "data": {
        "output_type": "BA00",
        "description": "Order Confirmation",
        "application": "V1",
        "medium": "EMAIL",
        "timing": "IMMEDIATE",
        "partner_function": "AG"
      }
    },
    {
      "object_type": "PRICING_PROCEDURE",
      "object_name": "RVAA01",
      "table_name": "pricing_procedures",
      "action": "CREATE",
      "data": {
        "procedure": "RVAA01",
        "description": "Standard Pricing",
        "steps": [
          {
            "step": 10,
            "condition_type": "PR00",
            "description": "Price",
            "calculation_type": "A"
          },
          {
            "step": 20,
            "condition_type": "MWST",
            "description": "Tax",
            "calculation_type": "A"
          }
        ]
      }
    }
  ]
}
```

## Practical Testing Workflow

### Step 1: Execute Transport Sequence
```bash
# Initialize number range system
curl -X POST http://localhost:5000/api/number-ranges/initialize

# Create foundation transport
curl -X POST http://localhost:5000/api/transport-direct/requests \
  -H "Content-Type: application/json" \
  -d '{
    "description": "Company Code US01 Foundation",
    "target_environment": "QA",
    "selected_objects": [...]
  }'
```

### Step 2: Verify Database Updates
```sql
-- Check company code creation
SELECT * FROM company_codes WHERE code = 'US01';

-- Verify number ranges
SELECT range_id, object_type, current_number, remaining_count 
FROM number_ranges WHERE company_code = 'US01';

-- Check customer creation with number assignment
SELECT customer_number, customer_name, company_code 
FROM customers WHERE customer_number LIKE 'C%';
```

### Step 3: Test Sales Order Creation Process
```json
{
  "create_sales_order": {
    "document_type": "OR",
    "sales_organization": "US01",
    "distribution_channel": "10",
    "division": "00",
    "sold_to_party": "C10001",
    "items": [
      {
        "material": "MAT001001",
        "quantity": 10,
        "unit": "EA",
        "plant": "CHI01",
        "storage_location": "FIN1"
      }
    ]
  }
}
```

### Step 4: QA Failure Simulation and Database Updates
```bash
# Simulate QA deployment failure
curl -X POST http://localhost:5000/api/transport-status/simulate-qa-failure/5 \
  -H "Content-Type: application/json" \
  -d '{
    "failureType": "DATABASE_CONNECTION_TIMEOUT",
    "errorMessage": "Connection timeout during customer master import"
  }'
```

**Expected Database Updates:**
```sql
-- Transport status update
UPDATE transport_requests 
SET status = 'FAILED', 
    error_message = 'Connection timeout during customer master import'
WHERE id = 5;

-- Failure log creation
INSERT INTO transport_failure_logs 
(transport_id, failure_type, error_message, environment)
VALUES (5, 'DATABASE_CONNECTION_TIMEOUT', 'Connection timeout...', 'QA');

-- Automatic rollback plan
INSERT INTO transport_rollback_plans 
(transport_id, plan_name, rollback_type)
VALUES (5, 'Auto-Rollback for Transport A1100008', 'AUTOMATIC_QA_FAILURE');
```

## Number Range Utilization Report

### Current System Capacity
```sql
SELECT 
  object_type,
  COUNT(*) as ranges_configured,
  SUM(range_to - range_from + 1) as total_capacity,
  SUM(current_number - range_from) as numbers_assigned,
  ROUND(AVG((current_number - range_from) * 100.0 / (range_to - range_from)), 2) as avg_utilization
FROM number_ranges 
WHERE status = 'ACTIVE' 
GROUP BY object_type;
```

**Expected Results:**
| Object Type | Ranges | Total Capacity | Assigned | Utilization |
|-------------|--------|----------------|----------|-------------|
| GL_ACCOUNT  | 5      | 9,000,000      | 0        | 0%          |
| CUSTOMER    | 2      | 89,999         | 2        | 0.003%      |
| VENDOR      | 2      | 19,999         | 0        | 0%          |
| ASSET       | 4      | 399,999        | 0        | 0%          |
| PURCHASE_ORDER | 3   | 29,999,999     | 0        | 0%          |
| SALES_ORDER | 2      | 1,999,999      | 0        | 0%          |
| MATERIAL    | 3      | 2,999,999      | 1        | 0.00003%    |

## GitHub Integration with Transport System

### Repository Structure After Transport
```
/us-operations-config
  /transports
    /A1100001-company-code-foundation
      - transport-metadata.json
      - company-codes.json
      - chart-of-accounts.json
      - deployment-instructions.md
    /A1100003-number-ranges
      - number-ranges-gl.json
      - number-ranges-customers.json
      - number-ranges-vendors.json
      - number-ranges-assets.json
      - number-ranges-purchase.json
    /A1100008-complete-sales-process
      - sales-organizations.json
      - materials.json
      - customers.json
      - sales-document-types.json
      - copy-control.json
      - output-types.json
```

This comprehensive example demonstrates how the transport system manages the complete configuration lifecycle from basic company setup through complex sales order processing, with full number range management and automatic database updates when QA deployments fail.