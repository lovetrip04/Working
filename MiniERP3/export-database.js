/**
 * Script to export PostgreSQL schema and data for GitHub
 * This creates SQL files to recreate the database structure and data
 */

import fs from 'fs';

import dotenv from 'dotenv';
import pg from 'pg';
const { Pool } = pg
import 'dotenv/config'


// Required for Neon database connections
neonConfig.webSocketConstructor = ws;

// Load environment variables
dotenv.config();

if (!process.env.DATABASE_URL) {
  console.error("DATABASE_URL environment variable not found!");
  process.exit(1);
}

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

// Creates SQL export files
async function exportDatabase() {
  console.log("Starting database export process...");
  
  try {
    // Get all tables in the database
    const { rows: tables } = await pool.query(`
      SELECT table_name
      FROM information_schema.tables
      WHERE table_schema = 'public'
      AND table_type = 'BASE TABLE'
      ORDER BY table_name;
    `);
    
    if (tables.length === 0) {
      console.log("No tables found in the database.");
      return;
    }
    
    console.log(`Found ${tables.length} tables to export.`);
    
    // Create schema export file
    let schemaSQL = '-- MallyERP Database Schema\n';
    schemaSQL += `-- Generated: ${new Date().toISOString()}\n\n`;
    
    // Create data export file
    let dataSQL = '-- MallyERP Database Data\n';
    dataSQL += `-- Generated: ${new Date().toISOString()}\n\n`;
    
    // Add reset sequences first
    schemaSQL += '-- Reset sequences\n';
    for (const tableInfo of tables) {
      const tableName = tableInfo.table_name;
      
      // Find sequences associated with this table
      const { rows: sequences } = await pool.query(`
        SELECT column_name, column_default
        FROM information_schema.columns
        WHERE table_name = $1
        AND column_default LIKE 'nextval%'
      `, [tableName]);
      
      for (const seq of sequences) {
        // Extract sequence name from the default value
        const match = seq.column_default.match(/'([^']+)'/);
        if (match && match[1]) {
          const seqName = match[1];
          schemaSQL += `SELECT setval('${seqName}', (SELECT COALESCE(MAX(${seq.column_name}), 1) FROM ${tableName}), true);\n`;
        }
      }
    }
    schemaSQL += '\n';
    
    // Process each table
    for (const tableInfo of tables) {
      const tableName = tableInfo.table_name;
      console.log(`Processing table: ${tableName}`);
      
      // Get table structure (columns)
      const { rows: columns } = await pool.query(`
        SELECT 
          column_name, 
          data_type, 
          character_maximum_length,
          is_nullable,
          column_default
        FROM 
          information_schema.columns 
        WHERE 
          table_name = $1
        ORDER BY 
          ordinal_position
      `, [tableName]);
      
      // Build CREATE TABLE statement
      schemaSQL += `-- Table: ${tableName}\n`;
      schemaSQL += `CREATE TABLE IF NOT EXISTS ${tableName} (\n`;
      
      const columnDefs = columns.map((col, index) => {
        let colDef = `  "${col.column_name}" ${col.data_type}`;
        
        // Add length for character types
        if (col.character_maximum_length) {
          colDef += `(${col.character_maximum_length})`;
        }
        
        // Add nullable constraint
        colDef += col.is_nullable === 'NO' ? ' NOT NULL' : '';
        
        // Add default value if exists
        if (col.column_default && !col.column_default.includes('nextval')) {
          colDef += ` DEFAULT ${col.column_default}`;
        }
        
        return colDef;
      }).join(',\n');
      
      schemaSQL += columnDefs;
      
      // Get primary key
      const { rows: primaryKeys } = await pool.query(`
        SELECT
          kcu.column_name
        FROM
          information_schema.table_constraints tc
        JOIN
          information_schema.key_column_usage kcu
          ON tc.constraint_name = kcu.constraint_name
        WHERE
          tc.table_name = $1
          AND tc.constraint_type = 'PRIMARY KEY'
        ORDER BY
          kcu.ordinal_position
      `, [tableName]);
      
      // Add primary key if exists
      if (primaryKeys.length > 0) {
        const pkColumns = primaryKeys.map(pk => `"${pk.column_name}"`).join(', ');
        schemaSQL += `,\n  PRIMARY KEY (${pkColumns})`;
      }
      
      schemaSQL += '\n);\n\n';
      
      // Get indexes for the table (excluding primary key)
      const { rows: indexes } = await pool.query(`
        SELECT
          indexname,
          indexdef
        FROM
          pg_indexes
        WHERE
          tablename = $1
          AND indexname NOT LIKE '%_pkey'
      `, [tableName]);
      
      // Add indexes
      if (indexes.length > 0) {
        schemaSQL += '-- Indexes\n';
        indexes.forEach(idx => {
          schemaSQL += `${idx.indexdef};\n`;
        });
        schemaSQL += '\n';
      }
      
      // Get foreign keys
      const { rows: foreignKeys } = await pool.query(`
        SELECT
          tc.constraint_name,
          kcu.column_name,
          ccu.table_name AS foreign_table_name,
          ccu.column_name AS foreign_column_name
        FROM
          information_schema.table_constraints tc
        JOIN
          information_schema.key_column_usage kcu
          ON tc.constraint_name = kcu.constraint_name
        JOIN
          information_schema.constraint_column_usage ccu
          ON tc.constraint_name = ccu.constraint_name
        WHERE
          tc.table_name = $1
          AND tc.constraint_type = 'FOREIGN KEY'
      `, [tableName]);
      
      // Add foreign keys
      if (foreignKeys.length > 0) {
        schemaSQL += '-- Foreign Keys\n';
        foreignKeys.forEach(fk => {
          schemaSQL += `ALTER TABLE ${tableName} ADD CONSTRAINT ${fk.constraint_name} `;
          schemaSQL += `FOREIGN KEY ("${fk.column_name}") REFERENCES ${fk.foreign_table_name}("${fk.foreign_column_name}");\n`;
        });
        schemaSQL += '\n';
      }
      
      // Export table data
      try {
        const { rows: data } = await pool.query(`SELECT * FROM ${tableName}`);
        
        if (data.length > 0) {
          dataSQL += `-- Data for table: ${tableName} (${data.length} rows)\n`;
          
          // Get column names for the INSERT statements
          const columnNames = columns.map(col => col.column_name);
          
          // Generate INSERT statements
          for (const row of data) {
            const values = columnNames.map(colName => {
              const value = row[colName];
              
              if (value === null) {
                return 'NULL';
              } else if (typeof value === 'string') {
                // Escape single quotes in strings
                return `'${value.replace(/'/g, "''")}'`;
              } else if (value instanceof Date) {
                return `'${value.toISOString()}'`;
              } else if (typeof value === 'object') {
                // Handle JSON and arrays
                return `'${JSON.stringify(value).replace(/'/g, "''")}'`;
              } else {
                return value;
              }
            });
            
            dataSQL += `INSERT INTO ${tableName} (${columnNames.map(name => `"${name}"`).join(', ')}) VALUES (${values.join(', ')});\n`;
          }
          dataSQL += '\n';
        } else {
          dataSQL += `-- No data for table: ${tableName}\n\n`;
        }
      } catch (error) {
        console.error(`Error exporting data for table ${tableName}:`, error);
        dataSQL += `-- Error exporting data for table: ${tableName}\n\n`;
      }
    }
    
    // Write files
    fs.writeFileSync('schema.sql', schemaSQL);
    fs.writeFileSync('data.sql', dataSQL);
    
    console.log("✅ Database export completed successfully!");
    console.log("📁 Files created:");
    console.log("   - schema.sql: Contains table definitions, indexes, and constraints");
    console.log("   - data.sql: Contains all data as INSERT statements");
    
  } catch (error) {
    console.error("Error during database export:", error);
  } finally {
    await pool.end();
  }
}

// Execute the export
exportDatabase();