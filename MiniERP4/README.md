# MallyERP System - Mally's AI-Enabled Enterprise Solution

A comprehensive Enterprise Resource Planning system designed for modern manufacturing businesses, offering integrated modules for Sales, Inventory, Finance, HR, and Production with a modular, scalable architecture. MallyERP is built with React, TypeScript, Node.js, and PostgreSQL, following enterprise-standard integration principles.

![MallyERP Dashboard](attached_assets/image_1747891930435.png)

## Project Overview

MallyERP is a comprehensive enterprise resource planning solution that integrates various business processes including sales, procurement, inventory management, production, and finance. The system follows industry best practices for data integration and cross-module communication, using enterprise-standard methodologies.

### AI-Enabled Features

MallyERP leverages artificial intelligence across multiple modules to enhance business processes:

- **Intelligent Forecasting**: AI-driven sales and material requirements forecasting
- **Smart Procurement**: Automated vendor selection and purchase order optimization
- **Predictive Maintenance**: AI-based equipment maintenance scheduling
- **Anomaly Detection**: Identifying unusual patterns in financial transactions
- **Natural Language Processing**: Conversational interfaces for system interaction
- **Recommendation Engine**: Suggested actions based on historical data patterns
- **Automated Report Generation**: AI-generated business insights and reports

## Architecture

The application is built with a modern tech stack:

- **Frontend**: React with TypeScript, utilizing modular design patterns
- **Backend**: Express.js with comprehensive API layers
- **Database**: PostgreSQL with Drizzle ORM for type-safe database access
- **UI Framework**: TailwindCSS with shadcn/ui component system

### System Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────────────┐
│                                                                         │
│                           Client Layer                                  │
│                                                                         │
│  ┌───────────────┐ ┌───────────────┐ ┌────────────┐ ┌───────────────┐  │
│  │ React Components │ State Management │ Form Validation │ Data Visualization │  │
│  └───────────────┘ └───────────────┘ └────────────┘ └───────────────┘  │
│                                                                         │
└───────────────────────────────┬─────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                                                                         │
│                        API Gateway Layer                                │
│                                                                         │
│  ┌───────────────┐ ┌───────────────┐ ┌────────────┐ ┌───────────────┐  │
│  │ Authentication │ │ API Routing    │ │ Validation  │ │ Error Handling │  │
│  └───────────────┘ └───────────────┘ └────────────┘ └───────────────┘  │
│                                                                         │
└───────────────────────────────┬─────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                                                                         │
│                        Business Logic Layer                             │
│                                                                         │
│  ┌──────────────┐  ┌─────────────┐  ┌────────────┐  ┌────────────────┐ │
│  │ Sales Business Domain │  │ Procurement │  │ Production │  │ Finance Business Domain │ │
│  └──────────────┘  └─────────────┘  └────────────┘  └────────────────┘ │
│                                                                         │
│  ┌──────────────┐  ┌─────────────┐  ┌────────────┐  ┌────────────────┐ │
│  │ Inventory    │  │ HR Business Domain   │  │ QA Business Domain  │  │ Reporting      │ │
│  └──────────────┘  └─────────────┘  └────────────┘  └────────────────┘ │
│                                                                         │
└───────────────────────────────┬─────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                                                                         │
│                         Data Access Layer                               │
│                                                                         │
│  ┌───────────────┐ ┌───────────────┐ ┌────────────┐ ┌───────────────┐  │
│  │ Drizzle ORM   │ │ Query Builder  │ │ Migrations  │ │ Transactions   │  │
│  └───────────────┘ └───────────────┘ └────────────┘ └───────────────┘  │
│                                                                         │
└───────────────────────────────┬─────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                                                                         │
│                        Database Layer                                   │
│                                                                         │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │                                                                 │   │
│  │                        PostgreSQL                               │   │
│  │                                                                 │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

### Data Flow Diagram

```
┌───────────────┐     ┌───────────────┐     ┌───────────────┐
│  Master Data  │────▶│ Transactional │────▶│   Financial   │
│  Management   │     │    Business Domains    │     │    Business Domains    │
└───────────────┘     └───────────────┘     └───────────────┘
        │                     │                     │
        │                     │                     │
        ▼                     ▼                     ▼
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│                  Integrated Data Warehouse                  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
                              │
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│              Reporting & Analytics Dashboard                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## Business Domains & Features

### Master Data Management

The system includes robust master data management capabilities, which serve as the foundation for all business processes:

#### Organizational Master Data
- Company Codes: Legal entities in the organization
- Plants: Manufacturing sites and warehouses
- Storage Locations: Physical inventory locations within plants
- Sales Organizations: Sales units in the organization
- Purchase Organizations: Procurement units in the organization
- Credit Control Areas: Financial risk management units

#### Core Master Data
- Materials: Products, raw materials, and finished goods
- Units of Measure: Management of measurement units with conversion factors
- Customers: Customer information and preferences
- Vendors: Supplier and vendor information
- Chart of Accounts: Financial account structure

#### Additional Master Data
- Work Centers: Production capacity units
- Cost Centers: Organizational cost assignment units
- Profit Centers: Profit accountability units
- Employees: Employee records and HR data
- Tax Master: Tax codes and configurations
- Currencies: Currency definitions with exchange rates

### Operational Business Domains

#### Sales Business Domain
- Lead Management
- Opportunity Tracking
- Quotation Creation & Approval
- Sales Order Processing
- Billing & Invoicing

#### Procurement Business Domain
- Purchase Requisition
- Purchase Orders
- Goods Receipt
- Invoice Verification

#### Inventory Management
- Stock Overview
- Goods Movements
- Stock Transfers
- Inventory Valuation
- Low Stock Alerts

#### Production Management
- Production Orders
- Material Requirements Planning (MRP)
- Capacity Planning
- Shop Floor Control
- Production Reporting

#### Finance Business Domain
- General Ledger
- Accounts Payable
- Accounts Receivable
- Asset Management
- Financial Reporting

## Database Management

### Sample Data
The repository includes comprehensive data across all modules with:

- Complete organizational structure (company codes, plants, storage locations)
- Master data for all modules (materials, customers, vendors, employees, etc.)
- Reference data (tax codes, currencies, UoMs, approval levels)
- Ready-to-use configuration for testing all features
- Transaction data (orders, invoices, inventory movements, etc.)

#### Important Note About Data
When pushing to GitHub, all the data will be included since it's already stored in the PostgreSQL database. The schema and data are essential parts of the application that demonstrate the functionality of all modules and their integration points. The database scripts in the `scripts/` and `migration-scripts/` folders will also be pushed, which contain the code that was used to generate and populate the data.

### Database Migration Process
For development and deployment, follow these steps:

1. **Initial Setup with Sample Data**:
   ```bash
   psql -d your_database_name < database/db_backup.sql
   ```

2. **Making Schema Changes**:
   - Update models in `shared/schema.ts`
   - Run `npm run db:push` to apply changes to the database
   - For complex migrations, create a dedicated script in `migration-scripts/`

3. **Creating a New Database Backup**:
   ```bash
   pg_dump your_database_url > database/db_backup.sql
   ```

4. **Deploying to Production**:
   - Run migrations first: `npm run db:push`
   - Import essential reference data
   - Perform data validation

## Database Structure

The database is structured around several key schemas:

### Organizational Schema
Contains tables for organizational structures like company codes, plants, storage locations, and organizational relationships.

### Core Master Data Schema
Includes materials, customers, vendors, and other fundamental data elements used across the system.

### Financial Schema
Contains chart of accounts, currencies, fiscal periods, and other financial reference data.

### Transactional Schemas
Separate schemas for sales documents, purchase documents, inventory movements, production orders, and financial postings.

## Integration Approach

The system follows an integrated approach where:

1. Master data is created first and referenced across all operational areas
2. Transactional data flows across modules (e.g., sales orders → inventory → finance)
3. Each module contributes to a central data warehouse for reporting and analytics

## Development Roadmap

The system is being developed in phases:

1. **Phase 1**: Master Data Components
   - Focus on all master data elements
   - Setup of organizational structures

2. **Phase 2**: Transactional Business Domains
   - Procurement, Inventory, Production, and Sales
   - Basic process flows between modules

3. **Phase 3**: Financial Components
   - General Ledger
   - Accounts Payable/Receivable
   - Manufacturing-specific costing

4. **Phase 4**: Analytics & Reporting
   - Business Intelligence dashboards
   - Cross-module KPIs and metrics
   - System integrations

## Technical Implementation Details

### Frontend
- React with TypeScript for type safety
- Custom hooks for data fetching and state management
- Responsive design for all devices
- Modular component architecture
- TanStack Query for data fetching, caching, and state management

### Backend
- Express.js for API routing
- Comprehensive middleware stack for authentication, validation, and error handling
- Structured API routes by business domain
- Type-safe request/response using shared schemas with frontend

### Database
- PostgreSQL for reliable data storage
- Drizzle ORM for type-safe database access
- Database migrations using Drizzle Kit
- Comprehensive schema design with proper relationships
- Transactional integrity across operations

### DevOps
- Automated testing with Jest and React Testing Library
- CI/CD pipeline for automated deployments
- Logging and monitoring solutions
- Database backup and recovery procedures

## Getting Started

### Prerequisites
- Node.js (v16 or higher)
- PostgreSQL (v13 or higher)

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/MiniERP.git
   cd MiniERP
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Set up environment variables:
   Create a `.env` file with the following variables:
   ```
   DATABASE_URL=postgresql://username:password@localhost:5432/mallyerp
   ```

4. Database Setup:
   
   You have two options for setting up the database:
   
   **Option A: Run all database scripts to create tables and populate with data**
   ```bash
   # First create the database
   createdb mallyerp
   
   # Then run the data generation scripts in order
   node scripts/generate-master-data.js
   node scripts/material-master-with-categories.js
   node scripts/create-organizational-master-data.js
   node scripts/create-core-master-data.js
   node scripts/create-sales-module-tables.js
   node scripts/populate-products.js
   node scripts/populate-final-empty-tables.js
   
   # Verify the data was created successfully
   node scripts/check-master-data-tables.js
   ```
   
   **Option B: Use Drizzle migrations (for empty tables only)**
   ```bash
   npm run db:push
   ```
   
   The repository contains all necessary scripts in the `scripts/` and `migration-scripts/` folders to recreate the entire database structure and populate it with comprehensive sample data for testing all features.
   
5. Start the development server:
   ```bash
   npm run dev
   ```

### Pushing to GitHub
When pushing to GitHub, include all code files, scripts, and configuration files. The data itself doesn't need to be exported separately as the scripts to generate it are included in the repository.

Here's what to include in your repository:
- All source code (client/, server/, shared/)
- All database scripts (scripts/, migration-scripts/)
- Configuration files (drizzle.config.ts, etc.)
- Documentation files (README.md)
- Sample assets (attached_assets/)

The database data is created through the scripts, so there's no need to include database dump files directly.

### Admin Setup
For initial setup, navigate to `/master-data` to create:
1. Company Codes
2. Plants
3. Storage Locations
4. Chart of Accounts
5. Other master data

## Contributing

We welcome contributions to the MallyERP project! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Inspired by industry-leading enterprise systems
- Built with best practices for enterprise software development
- Uses modern web technologies and architectural patterns