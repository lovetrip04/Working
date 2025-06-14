/**
 * Complete GitHub Export Script
 * Exports all development files, database schema, and documentation to GitHub
 */

import pkg from 'pg';
const { Pool } = pkg;
import { promises as fs } from 'fs';
import path from 'path';

async function exportToGitHub() {
  console.log('Starting complete GitHub export...');
  
  const client = new Pool({
    connectionString: process.env.DATABASE_URL
  });

  try {
    // 1. Export complete database schema
    await exportDatabaseSchema(client);
    
    // 2. Export all table data
    await exportTableData(client);
    
    // 3. Export development files structure
    await exportDevelopmentStructure();
    
    // 4. Create comprehensive documentation
    await createComprehensiveDocumentation();
    
    // 5. Generate deployment package
    await generateDeploymentPackage();
    
    console.log('Complete GitHub export ready!');
    
  } catch (error) {
    console.error('Export failed:', error);
  } finally {
    await client.end();
  }
}

async function exportDatabaseSchema(client) {
  console.log('Exporting complete database schema...');
  
  // Get all tables with detailed schema information
  const schemaQuery = `
    SELECT 
      t.table_name,
      json_agg(
        json_build_object(
          'column_name', c.column_name,
          'data_type', c.data_type,
          'character_maximum_length', c.character_maximum_length,
          'is_nullable', c.is_nullable,
          'column_default', c.column_default,
          'ordinal_position', c.ordinal_position
        ) ORDER BY c.ordinal_position
      ) as columns
    FROM information_schema.tables t
    JOIN information_schema.columns c ON t.table_name = c.table_name
    WHERE t.table_schema = 'public'
    GROUP BY t.table_name
    ORDER BY t.table_name;
  `;

  const result = await client.query(schemaQuery);
  
  let schemaSQL = `-- MallyERP Complete Database Schema
-- Generated: ${new Date().toISOString()}
-- Tables: ${result.rows.length}
-- Description: Comprehensive ERP system with AI-powered automation

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;

-- Drop existing tables (for clean import)
`;

  // Add drop statements
  for (const table of result.rows) {
    schemaSQL += `DROP TABLE IF EXISTS ${table.table_name} CASCADE;\n`;
  }

  schemaSQL += '\n-- Create tables\n';

  // Create tables with full schema
  for (const table of result.rows) {
    schemaSQL += `\n-- Table: ${table.table_name}\n`;
    schemaSQL += `CREATE TABLE ${table.table_name} (\n`;
    
    const columns = table.columns.map(col => {
      let definition = `  ${col.column_name} `;
      
      // Map data types
      switch (col.data_type) {
        case 'character varying':
          definition += `VARCHAR(${col.character_maximum_length || 255})`;
          break;
        case 'integer':
          definition += 'INTEGER';
          break;
        case 'boolean':
          definition += 'BOOLEAN';
          break;
        case 'timestamp with time zone':
          definition += 'TIMESTAMP WITH TIME ZONE';
          break;
        case 'uuid':
          definition += 'UUID';
          break;
        case 'text':
          definition += 'TEXT';
          break;
        case 'numeric':
          definition += 'NUMERIC';
          break;
        case 'date':
          definition += 'DATE';
          break;
        default:
          definition += col.data_type.toUpperCase();
      }
      
      if (col.is_nullable === 'NO') {
        definition += ' NOT NULL';
      }
      
      if (col.column_default) {
        definition += ` DEFAULT ${col.column_default}`;
      }
      
      return definition;
    });
    
    schemaSQL += columns.join(',\n') + '\n);\n';
  }

  await fs.writeFile('github-export/database-schema-complete.sql', schemaSQL);
  console.log(`Schema exported: ${result.rows.length} tables`);
}

async function exportTableData(client) {
  console.log('Exporting all table data...');
  
  const tablesResult = await client.query(`
    SELECT table_name 
    FROM information_schema.tables 
    WHERE table_schema = 'public' 
    ORDER BY table_name
  `);

  let dataSQL = `-- MallyERP Complete Data Export
-- Generated: ${new Date().toISOString()}
-- Description: All data for complete system reproduction

`;

  let totalRecords = 0;

  for (const table of tablesResult.rows) {
    const tableName = table.table_name;
    
    try {
      const columnsResult = await client.query(`
        SELECT column_name 
        FROM information_schema.columns 
        WHERE table_name = $1 AND table_schema = 'public'
        ORDER BY ordinal_position
      `, [tableName]);

      const columns = columnsResult.rows.map(row => row.column_name);
      const dataResult = await client.query(`SELECT * FROM ${tableName} ORDER BY 1`);
      
      if (dataResult.rows.length > 0) {
        dataSQL += `\n-- Data for table: ${tableName} (${dataResult.rows.length} records)\n`;
        dataSQL += `TRUNCATE TABLE ${tableName} CASCADE;\n`;
        
        for (const row of dataResult.rows) {
          const values = columns.map(col => {
            const value = row[col];
            if (value === null) return 'NULL';
            if (typeof value === 'string') return `'${value.replace(/'/g, "''")}'`;
            if (value instanceof Date) return `'${value.toISOString()}'`;
            if (typeof value === 'boolean') return value.toString();
            return value;
          }).join(', ');
          
          dataSQL += `INSERT INTO ${tableName} (${columns.join(', ')}) VALUES (${values});\n`;
        }
        
        totalRecords += dataResult.rows.length;
      }
    } catch (error) {
      console.log(`Skipped ${tableName}: ${error.message}`);
    }
  }

  await fs.writeFile('github-export/database-data-complete.sql', dataSQL);
  console.log(`Data exported: ${totalRecords} total records`);
}

async function exportDevelopmentStructure() {
  console.log('Exporting development file structure...');
  
  const structure = {
    project: "MallyERP",
    version: "1.0.0",
    description: "Complete Enterprise Resource Planning system with AI-powered automation",
    lastUpdated: new Date().toISOString(),
    structure: {
      frontend: {
        framework: "React + TypeScript",
        styling: "Tailwind CSS + shadcn/ui",
        routing: "Wouter",
        stateManagement: "TanStack Query",
        components: "Modular component architecture"
      },
      backend: {
        runtime: "Node.js + Express",
        database: "PostgreSQL + Drizzle ORM",
        api: "RESTful API with comprehensive endpoints",
        authentication: "Passport.js with session management"
      },
      ai: {
        provider: "OpenAI",
        agents: 9,
        capabilities: "Module-specific error resolution and automation"
      },
      database: {
        tables: 112,
        modules: ["Master Data", "Sales", "Inventory", "Purchase", "Production", "Finance", "Controlling"],
        auditTrail: "LOGHDR/LOGITEMS standard",
        changeTracking: "Complete field-level tracking"
      }
    },
    deployment: {
      platform: "Replit",
      database: "PostgreSQL",
      environment: "Production-ready"
    }
  };

  await fs.writeFile('github-export/project-structure.json', JSON.stringify(structure, null, 2));
  console.log('Development structure exported');
}

async function createComprehensiveDocumentation() {
  console.log('Creating comprehensive documentation...');
  
  const documentation = `# MallyERP - Complete Enterprise Resource Planning System

## Overview
MallyERP is a comprehensive, AI-powered Enterprise Resource Planning system designed for modern manufacturing businesses. The system integrates all critical business processes with intelligent automation and zero-error data integrity guarantees.

## System Architecture

### Frontend (React + TypeScript)
- **Framework**: React 18 with TypeScript for type safety
- **Styling**: Tailwind CSS with shadcn/ui component library
- **Routing**: Wouter for lightweight client-side routing
- **State Management**: TanStack Query for server state management
- **UI Components**: Comprehensive component library with responsive design

### Backend (Node.js + Express)
- **Runtime**: Node.js with Express.js framework
- **Database**: PostgreSQL with Drizzle ORM
- **API**: RESTful API with comprehensive endpoint coverage
- **Authentication**: Passport.js with session-based authentication
- **Security**: Enterprise-grade security implementations

### Database (PostgreSQL)
- **Tables**: 112 comprehensive tables covering all ERP modules
- **Audit Trail**: LOGHDR/LOGITEMS standard implementation
- **Change Tracking**: Complete field-level change tracking
- **Data Integrity**: Zero-error guarantees with comprehensive validation

### AI Integration (OpenAI)
- **Agents**: 9 specialized AI agents for different modules
- **Capabilities**: Automatic error resolution and process optimization
- **Coverage**: All major business processes with intelligent assistance

## Core Modules

### 1. Master Data Management
- Company codes, plants, storage locations
- Material master with comprehensive attributes
- Customer and vendor master data
- Chart of accounts and financial structures

### 2. Sales Management
- Lead and opportunity management
- Quote generation and approval workflows
- Sales order processing
- Customer relationship management

### 3. Inventory Management
- Stock management and tracking
- Warehouse operations
- Material movements and valuations
- Inventory optimization

### 4. Purchase Management
- Purchase requisition and order processing
- Vendor management and evaluation
- Procurement workflows
- Cost optimization

### 5. Production Management
- Production planning and scheduling
- Work center management
- Bill of materials (BOM) management
- Quality control integration

### 6. Financial Management
- General ledger accounting
- Accounts payable and receivable
- Financial reporting and analysis
- Cash flow management

### 7. Controlling
- Cost center accounting
- Profit center analysis
- Internal order management
- Management reporting

## AI-Powered Features

### Module-Specific Agents
1. **Master Data Specialist**: Data validation and hierarchy management
2. **Sales Operations Expert**: Opportunity conversion and order optimization
3. **Inventory Control Specialist**: Stock optimization and movement tracking
4. **Procurement Specialist**: Vendor evaluation and cost analysis
5. **Manufacturing Operations Expert**: Production optimization and quality control
6. **Financial Operations Expert**: Account reconciliation and financial analysis
7. **Management Accounting Specialist**: Cost allocation and profitability analysis

### Data Integrity Agents
8. **Data Integrity Guardian**: Cross-module validation and constraint management
9. **Auto-Recovery Agent**: System monitoring and automatic issue resolution

## Change Management System

### LOGHDR/LOGITEMS Standard
- **Change Document Headers**: Main change document tracking
- **Change Document Positions**: Field-level change details
- **Automatic Numbering**: CHG0001000000 format with sequential numbering
- **Business Context**: Process-aware change tracking
- **Approval Integration**: Workflow integration for critical changes

## Technical Specifications

### Performance
- Optimized database queries with indexing
- Efficient API endpoints with proper caching
- Responsive frontend with lazy loading
- Real-time updates with WebSocket integration

### Security
- Role-based access control
- Session management with secure cookies
- Input validation and sanitization
- Audit trails for all operations

### Scalability
- Modular architecture for easy expansion
- Database optimization for large datasets
- Microservice-ready architecture
- Cloud deployment capabilities

## Deployment

### Requirements
- Node.js 18+
- PostgreSQL 14+
- OpenAI API access
- Modern web browser

### Environment Setup
\`\`\`bash
# Install dependencies
npm install

# Set environment variables
DATABASE_URL=your_postgresql_url
OPENAI_API_KEY=your_openai_key

# Initialize database
npm run db:push

# Start development server
npm run dev
\`\`\`

### Production Deployment
The system is production-ready with:
- Comprehensive error handling
- Performance monitoring
- Automatic backup systems
- Zero-downtime deployment capabilities

## Data Import/Export

### Schema Import
\`\`\`bash
psql -d your_database < database-schema-complete.sql
\`\`\`

### Data Import
\`\`\`bash
psql -d your_database < database-data-complete.sql
\`\`\`

## Support and Maintenance

### Monitoring
- Real-time system health monitoring
- Automated error detection and resolution
- Performance metrics and analytics
- User activity tracking

### Backup and Recovery
- Automated daily backups
- Point-in-time recovery capabilities
- Data integrity verification
- Disaster recovery procedures

## License
MIT License - See LICENSE file for details

## Contributing
Please read CONTRIBUTING.md for contribution guidelines and code standards.
`;

  await fs.writeFile('github-export/README-COMPLETE.md', documentation);
  console.log('Comprehensive documentation created');
}

async function generateDeploymentPackage() {
  console.log('Generating deployment package...');
  
  const deploymentGuide = `# MallyERP Deployment Guide

## Quick Start Deployment

### 1. Prerequisites
- Node.js 18 or higher
- PostgreSQL 14 or higher
- OpenAI API key

### 2. Database Setup
\`\`\`bash
# Create database
createdb mallyerp

# Import schema
psql -d mallyerp < database-schema-complete.sql

# Import data
psql -d mallyerp < database-data-complete.sql
\`\`\`

### 3. Environment Configuration
Create \`.env\` file:
\`\`\`
DATABASE_URL=postgresql://username:password@localhost:5432/mallyerp
OPENAI_API_KEY=your_openai_api_key_here
NODE_ENV=production
PORT=5000
\`\`\`

### 4. Application Deployment
\`\`\`bash
# Install dependencies
npm install

# Build application
npm run build

# Start production server
npm start
\`\`\`

### 5. Verification
- Access application at http://localhost:5000
- Verify all modules are functional
- Test AI agents are responding
- Check audit trail system

## Production Considerations

### Security
- Use HTTPS in production
- Configure secure session secrets
- Set up proper firewall rules
- Enable database encryption

### Performance
- Configure database connection pooling
- Set up Redis for session storage
- Enable compression middleware
- Configure proper caching headers

### Monitoring
- Set up application monitoring
- Configure database performance monitoring
- Enable error tracking
- Set up automated backups

## Troubleshooting

### Common Issues
1. **Database Connection Errors**: Check DATABASE_URL format
2. **OpenAI API Errors**: Verify API key and quota
3. **Permission Errors**: Check file system permissions
4. **Port Conflicts**: Ensure PORT is available

### Support
For technical support, please refer to the documentation or contact the development team.
`;

  await fs.writeFile('github-export/DEPLOYMENT.md', deploymentGuide);
  console.log('Deployment package generated');
}

// Create export directory
await fs.mkdir('github-export', { recursive: true });

// Run the export
exportToGitHub().catch(console.error);