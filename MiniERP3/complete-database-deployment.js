/**
 * Complete Database Deployment to GitHub
 * Exports entire database with data, constraints, sequences, indexes
 * Creates full deployment package for GitHub
 */

import pkg from 'pg';
const { Client } = pkg;
import fs from 'fs';
import path from 'path';

const client = new Client({
  connectionString: process.env.DATABASE_URL
});

async function deployCompleteDatabase() {
  console.log('🚀 Starting complete database deployment to GitHub...');
  
  try {
    await client.connect();
    console.log('✅ Connected to database');

    // Create deployment directory
    const deployDir = 'github-database-complete';
    if (!fs.existsSync(deployDir)) {
      fs.mkdirSync(deployDir, { recursive: true });
    }

    // 1. Export complete schema with constraints and indexes
    console.log('📋 Exporting complete schema...');
    await exportCompleteSchema(deployDir);

    // 2. Export all table data
    console.log('💾 Exporting all table data...');
    await exportAllTableData(deployDir);

    // 3. Export sequences
    console.log('🔢 Exporting sequences...');
    await exportSequences(deployDir);

    // 4. Export constraints and indexes
    console.log('🔗 Exporting constraints and indexes...');
    await exportConstraintsAndIndexes(deployDir);

    // 5. Create restoration scripts
    console.log('⚙️ Creating restoration scripts...');
    await createRestorationScripts(deployDir);

    // 6. Create deployment documentation
    console.log('📖 Creating deployment documentation...');
    await createDeploymentDocs(deployDir);

    // 7. Generate deployment summary
    console.log('📊 Generating deployment summary...');
    await generateDeploymentSummary(deployDir);

    console.log('🎉 Complete database deployment package created successfully!');
    console.log(`📁 Package location: ${deployDir}/`);

  } catch (error) {
    console.error('❌ Error during deployment:', error);
    throw error;
  } finally {
    await client.end();
  }
}

async function exportCompleteSchema(deployDir) {
  // Export complete schema including all DDL
  const schemaQuery = `
    SELECT 
      schemaname,
      tablename,
      tableowner,
      tablespace,
      hasindexes,
      hasrules,
      hastriggers,
      rowsecurity
    FROM pg_tables 
    WHERE schemaname = 'public'
    ORDER BY tablename;
  `;

  const tables = await client.query(schemaQuery);
  
  let completeSchema = `-- Complete Database Schema Export
-- Generated: ${new Date().toISOString()}
-- Tables: ${tables.rows.length}

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Create schema if not exists
CREATE SCHEMA IF NOT EXISTS public;

`;

  // Get table definitions
  for (const table of tables.rows) {
    const tableDDL = await getTableDDL(table.tablename);
    completeSchema += tableDDL + '\n\n';
  }

  fs.writeFileSync(path.join(deployDir, 'complete-schema.sql'), completeSchema);
}

async function getTableDDL(tableName) {
  const query = `
    SELECT 
      'CREATE TABLE public.' || table_name || ' (' ||
      array_to_string(
        array_agg(
          column_name || ' ' || 
          CASE 
            WHEN data_type = 'character varying' THEN 'varchar' ||
              CASE WHEN character_maximum_length IS NOT NULL 
                   THEN '(' || character_maximum_length || ')' 
                   ELSE '' END
            WHEN data_type = 'character' THEN 'char' ||
              CASE WHEN character_maximum_length IS NOT NULL 
                   THEN '(' || character_maximum_length || ')' 
                   ELSE '' END
            WHEN data_type = 'numeric' AND numeric_precision IS NOT NULL 
                 THEN 'numeric(' || numeric_precision || ',' || COALESCE(numeric_scale, 0) || ')'
            ELSE data_type
          END ||
          CASE WHEN is_nullable = 'NO' THEN ' NOT NULL' ELSE '' END ||
          CASE WHEN column_default IS NOT NULL THEN ' DEFAULT ' || column_default ELSE '' END
          ORDER BY ordinal_position
        ), ', '
      ) || ');' as ddl
    FROM information_schema.columns
    WHERE table_name = $1 AND table_schema = 'public'
    GROUP BY table_name;
  `;

  const result = await client.query(query, [tableName]);
  return result.rows[0]?.ddl || `-- Table ${tableName} DDL not found`;
}

async function exportAllTableData(deployDir) {
  // Get all tables
  const tablesQuery = `
    SELECT tablename 
    FROM pg_tables 
    WHERE schemaname = 'public' 
    ORDER BY tablename;
  `;

  const tables = await client.query(tablesQuery);
  let completeData = `-- Complete Database Data Export
-- Generated: ${new Date().toISOString()}
-- Tables: ${tables.rows.length}

`;

  let totalRecords = 0;

  for (const table of tables.rows) {
    const tableName = table.tablename;
    
    // Get record count
    const countResult = await client.query(`SELECT COUNT(*) FROM ${tableName}`);
    const recordCount = parseInt(countResult.rows[0].count);
    totalRecords += recordCount;

    if (recordCount > 0) {
      completeData += `-- Table: ${tableName} (${recordCount} records)\n`;
      
      // Get all data
      const dataResult = await client.query(`SELECT * FROM ${tableName}`);
      
      if (dataResult.rows.length > 0) {
        const columns = Object.keys(dataResult.rows[0]);
        const columnsList = columns.map(col => `"${col}"`).join(', ');
        
        completeData += `INSERT INTO "${tableName}" (${columnsList}) VALUES\n`;
        
        const values = dataResult.rows.map(row => {
          const rowValues = columns.map(col => {
            const value = row[col];
            if (value === null) return 'NULL';
            if (typeof value === 'string') {
              return `'${value.replace(/'/g, "''")}'`;
            }
            if (value instanceof Date) {
              return `'${value.toISOString()}'`;
            }
            if (typeof value === 'boolean') {
              return value ? 'true' : 'false';
            }
            if (Array.isArray(value)) {
              return `'${JSON.stringify(value).replace(/'/g, "''")}'`;
            }
            return value;
          });
          return `(${rowValues.join(', ')})`;
        });
        
        completeData += values.join(',\n') + ';\n\n';
      }
    } else {
      completeData += `-- Table: ${tableName} (0 records - empty)\n\n`;
    }
  }

  completeData += `-- Total Records Exported: ${totalRecords}\n`;
  fs.writeFileSync(path.join(deployDir, 'complete-data.sql'), completeData);
  
  return totalRecords;
}

async function exportSequences(deployDir) {
  const sequencesQuery = `
    SELECT 
      schemaname,
      sequencename,
      start_value,
      min_value,
      max_value,
      increment_by,
      cycle,
      cache_size,
      last_value
    FROM pg_sequences 
    WHERE schemaname = 'public';
  `;

  const sequences = await client.query(sequencesQuery);
  
  let sequenceSQL = `-- Database Sequences Export
-- Generated: ${new Date().toISOString()}
-- Sequences: ${sequences.rows.length}

`;

  for (const seq of sequences.rows) {
    sequenceSQL += `-- Sequence: ${seq.sequencename}\n`;
    sequenceSQL += `CREATE SEQUENCE IF NOT EXISTS "${seq.sequencename}"\n`;
    sequenceSQL += `    START WITH ${seq.start_value}\n`;
    sequenceSQL += `    INCREMENT BY ${seq.increment_by}\n`;
    sequenceSQL += `    MIN VALUE ${seq.min_value}\n`;
    sequenceSQL += `    MAX VALUE ${seq.max_value}\n`;
    sequenceSQL += `    CACHE ${seq.cache_size}`;
    if (seq.cycle) sequenceSQL += `\n    CYCLE`;
    sequenceSQL += `;\n`;
    sequenceSQL += `SELECT setval('"${seq.sequencename}"', ${seq.last_value}, true);\n\n`;
  }

  fs.writeFileSync(path.join(deployDir, 'sequences.sql'), sequenceSQL);
}

async function exportConstraintsAndIndexes(deployDir) {
  // Primary Keys
  const pkQuery = `
    SELECT 
      tc.table_name,
      tc.constraint_name,
      kcu.column_name
    FROM information_schema.table_constraints tc
    JOIN information_schema.key_column_usage kcu 
      ON tc.constraint_name = kcu.constraint_name
    WHERE tc.constraint_type = 'PRIMARY KEY'
      AND tc.table_schema = 'public'
    ORDER BY tc.table_name, kcu.ordinal_position;
  `;

  // Foreign Keys
  const fkQuery = `
    SELECT 
      tc.table_name,
      tc.constraint_name,
      kcu.column_name,
      ccu.table_name AS foreign_table_name,
      ccu.column_name AS foreign_column_name
    FROM information_schema.table_constraints tc
    JOIN information_schema.key_column_usage kcu 
      ON tc.constraint_name = kcu.constraint_name
    JOIN information_schema.constraint_column_usage ccu 
      ON ccu.constraint_name = tc.constraint_name
    WHERE tc.constraint_type = 'FOREIGN KEY'
      AND tc.table_schema = 'public';
  `;

  // Indexes
  const indexQuery = `
    SELECT 
      schemaname,
      tablename,
      indexname,
      indexdef
    FROM pg_indexes 
    WHERE schemaname = 'public'
      AND indexname NOT LIKE '%_pkey'
    ORDER BY tablename, indexname;
  `;

  const [pkResult, fkResult, indexResult] = await Promise.all([
    client.query(pkQuery),
    client.query(fkQuery),
    client.query(indexQuery)
  ]);

  let constraintsSQL = `-- Database Constraints and Indexes Export
-- Generated: ${new Date().toISOString()}

-- PRIMARY KEYS
`;

  // Group primary keys by table
  const pksByTable = {};
  pkResult.rows.forEach(row => {
    if (!pksByTable[row.table_name]) {
      pksByTable[row.table_name] = [];
    }
    pksByTable[row.table_name].push(row.column_name);
  });

  Object.entries(pksByTable).forEach(([table, columns]) => {
    constraintsSQL += `ALTER TABLE "${table}" ADD CONSTRAINT "${table}_pkey" PRIMARY KEY (${columns.map(c => `"${c}"`).join(', ')});\n`;
  });

  constraintsSQL += `\n-- FOREIGN KEYS\n`;
  fkResult.rows.forEach(row => {
    constraintsSQL += `ALTER TABLE "${row.table_name}" ADD CONSTRAINT "${row.constraint_name}" `;
    constraintsSQL += `FOREIGN KEY ("${row.column_name}") REFERENCES "${row.foreign_table_name}"("${row.foreign_column_name}");\n`;
  });

  constraintsSQL += `\n-- INDEXES\n`;
  indexResult.rows.forEach(row => {
    constraintsSQL += `${row.indexdef};\n`;
  });

  fs.writeFileSync(path.join(deployDir, 'constraints-indexes.sql'), constraintsSQL);
}

async function createRestorationScripts(deployDir) {
  const restoreScript = `#!/bin/bash
# Complete Database Restoration Script
# Generated: ${new Date().toISOString()}

echo "🚀 Starting complete database restoration..."

# Check if database URL is provided
if [ -z "$DATABASE_URL" ]; then
    echo "❌ ERROR: DATABASE_URL environment variable is required"
    exit 1
fi

# Step 1: Create schema
echo "📋 Creating database schema..."
psql "$DATABASE_URL" -f complete-schema.sql

# Step 2: Insert data
echo "💾 Inserting data..."
psql "$DATABASE_URL" -f complete-data.sql

# Step 3: Create sequences
echo "🔢 Creating sequences..."
psql "$DATABASE_URL" -f sequences.sql

# Step 4: Add constraints and indexes
echo "🔗 Adding constraints and indexes..."
psql "$DATABASE_URL" -f constraints-indexes.sql

echo "✅ Database restoration complete!"
echo "📊 Run 'psql $DATABASE_URL -c \"SELECT count(*) FROM information_schema.tables WHERE table_schema = 'public';\"' to verify"
`;

  fs.writeFileSync(path.join(deployDir, 'restore-database.sh'), restoreScript);
  
  // Make script executable
  try {
    fs.chmodSync(path.join(deployDir, 'restore-database.sh'), 0o755);
  } catch (error) {
    console.log('Note: Could not set execute permissions on restore script');
  }

  // Create PowerShell version for Windows
  const restorePS = `# Complete Database Restoration Script (PowerShell)
# Generated: ${new Date().toISOString()}

Write-Host "Starting complete database restoration..." -ForegroundColor Green

# Check if database URL is provided
if (-not $env:DATABASE_URL) {
    Write-Host "ERROR: DATABASE_URL environment variable is required" -ForegroundColor Red
    exit 1
}

# Step 1: Create schema
Write-Host "Creating database schema..." -ForegroundColor Yellow
psql $env:DATABASE_URL -f complete-schema.sql

# Step 2: Insert data
Write-Host "Inserting data..." -ForegroundColor Yellow
psql $env:DATABASE_URL -f complete-data.sql

# Step 3: Create sequences
Write-Host "Creating sequences..." -ForegroundColor Yellow
psql $env:DATABASE_URL -f sequences.sql

# Step 4: Add constraints and indexes
Write-Host "Adding constraints and indexes..." -ForegroundColor Yellow
psql $env:DATABASE_URL -f constraints-indexes.sql

Write-Host "Database restoration complete!" -ForegroundColor Green
Write-Host "Run verification command to check tables" -ForegroundColor Cyan
`;

  fs.writeFileSync(path.join(deployDir, 'restore-database.ps1'), restorePS);
}

async function createDeploymentDocs(deployDir) {
  const readme = `# Complete Database Deployment Package

Generated: ${new Date().toISOString()}

## Package Contents

- \`complete-schema.sql\` - Complete database schema with all table definitions
- \`complete-data.sql\` - All table data (${await getRecordCount()} records)
- \`sequences.sql\` - All database sequences with current values
- \`constraints-indexes.sql\` - Primary keys, foreign keys, and indexes
- \`restore-database.sh\` - Unix/Linux restoration script
- \`restore-database.ps1\` - Windows PowerShell restoration script

## Quick Start

### Prerequisites
- PostgreSQL client (psql) installed
- DATABASE_URL environment variable set

### Unix/Linux/macOS
\`\`\`bash
export DATABASE_URL="your_database_connection_string"
chmod +x restore-database.sh
./restore-database.sh
\`\`\`

### Windows (PowerShell)
\`\`\`powershell
$env:DATABASE_URL = "your_database_connection_string"
.\\restore-database.ps1
\`\`\`

### Manual Restoration
\`\`\`bash
# 1. Create schema
psql "$DATABASE_URL" -f complete-schema.sql

# 2. Insert data
psql "$DATABASE_URL" -f complete-data.sql

# 3. Create sequences
psql "$DATABASE_URL" -f sequences.sql

# 4. Add constraints and indexes
psql "$DATABASE_URL" -f constraints-indexes.sql
\`\`\`

## Verification

After restoration, verify the deployment:

\`\`\`sql
-- Check table count
SELECT count(*) FROM information_schema.tables WHERE table_schema = 'public';

-- Check total records
SELECT schemaname, tablename, n_tup_ins as records 
FROM pg_stat_user_tables 
ORDER BY tablename;

-- Check sequences
SELECT schemaname, sequencename, last_value 
FROM pg_sequences 
WHERE schemaname = 'public';
\`\`\`

## Database Structure

This is a complete MallyERP database containing:
- Master Data tables (Company Codes, Plants, Materials, etc.)
- Transaction tables (Sales Orders, Purchase Orders, etc.)
- Financial tables (Chart of Accounts, GL Entries, etc.)
- System tables (Change Logs, Transport System, etc.)

## Support

For issues or questions about this deployment package, refer to the main project documentation.
`;

  fs.writeFileSync(path.join(deployDir, 'README.md'), readme);
}

async function getRecordCount() {
  try {
    const query = `
      SELECT SUM(n_tup_ins) as total_records 
      FROM pg_stat_user_tables;
    `;
    const result = await client.query(query);
    return result.rows[0]?.total_records || 'Unknown';
  } catch {
    return 'Unknown';
  }
}

async function generateDeploymentSummary(deployDir) {
  // Get database statistics
  const tablesQuery = `SELECT COUNT(*) as table_count FROM information_schema.tables WHERE table_schema = 'public'`;
  const sequencesQuery = `SELECT COUNT(*) as sequence_count FROM pg_sequences WHERE schemaname = 'public'`;
  const indexesQuery = `SELECT COUNT(*) as index_count FROM pg_indexes WHERE schemaname = 'public'`;
  
  const [tablesResult, sequencesResult, indexesResult] = await Promise.all([
    client.query(tablesQuery),
    client.query(sequencesQuery),
    client.query(indexesQuery)
  ]);

  const totalRecords = await getRecordCount();

  const summary = {
    deployment: {
      timestamp: new Date().toISOString(),
      version: "1.0.0",
      type: "complete_database_export"
    },
    statistics: {
      tables: parseInt(tablesResult.rows[0].table_count),
      sequences: parseInt(sequencesResult.rows[0].sequence_count),
      indexes: parseInt(indexesResult.rows[0].index_count),
      total_records: totalRecords
    },
    files: [
      "complete-schema.sql",
      "complete-data.sql", 
      "sequences.sql",
      "constraints-indexes.sql",
      "restore-database.sh",
      "restore-database.ps1",
      "README.md",
      "deployment-summary.json"
    ],
    deployment_instructions: {
      unix: "./restore-database.sh",
      windows: ".\\restore-database.ps1",
      manual: "Follow README.md instructions"
    }
  };

  fs.writeFileSync(
    path.join(deployDir, 'deployment-summary.json'), 
    JSON.stringify(summary, null, 2)
  );

  return summary;
}

// Execute deployment
deployCompleteDatabase().catch(console.error);