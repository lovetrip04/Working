/**
 * Script to backup PostgreSQL schema and data for GitHub
 * This creates:
 * 1. schema.sql - Contains all table definitions
 * 2. data.sql - Contains all INSERT statements to recreate the data
 */

const fs = require('fs');
const { Pool } = require('@neondatabase/serverless');
const dotenv = require('dotenv');

// Load environment variables
dotenv.config();

if (!process.env.DATABASE_URL) {
  console.error("DATABASE_URL environment variable not found!");
  process.exit(1);
}

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

async function backupSchemaAndData() {
  try {
    console.log("Starting database backup process...");
    
    // Get all tables from the public schema
    const { rows: tables } = await pool.query(`
      SELECT tablename 
      FROM pg_tables 
      WHERE schemaname = 'public'
      ORDER BY tablename;
    `);
    
    if (tables.length === 0) {
      console.log("No tables found in the database.");
      return;
    }
    
    console.log(`Found ${tables.length} tables to backup.`);
    
    // Create schema.sql file
    let schemaSQL = '-- MallyERP Database Schema\n-- Generated: ' + new Date().toISOString() + '\n\n';
    
    for (const table of tables) {
      const tableName = table.tablename;
      console.log(`Processing schema for: ${tableName}`);
      
      // Get table creation SQL
      const { rows: tableInfo } = await pool.query(`
        SELECT 
          pg_get_tabledef('${tableName}'::regclass) as table_def;
      `);
      
      if (tableInfo.length > 0 && tableInfo[0].table_def) {
        schemaSQL += tableInfo[0].table_def + ';\n\n';
      } else {
        // Fallback if pg_get_tabledef is not available
        const { rows: columns } = await pool.query(`
          SELECT 
            column_name, 
            data_type, 
            character_maximum_length,
            column_default, 
            is_nullable
          FROM 
            information_schema.columns 
          WHERE 
            table_name = '${tableName}'
          ORDER BY 
            ordinal_position;
        `);
        
        schemaSQL += `CREATE TABLE ${tableName} (\n`;
        
        const columnDefs = columns.map(col => {
          let colDef = `  "${col.column_name}" ${col.data_type}`;
          
          if (col.character_maximum_length) {
            colDef += `(${col.character_maximum_length})`;
          }
          
          if (col.column_default) {
            colDef += ` DEFAULT ${col.column_default}`;
          }
          
          if (col.is_nullable === 'NO') {
            colDef += ' NOT NULL';
          }
          
          return colDef;
        });
        
        schemaSQL += columnDefs.join(',\n');
        schemaSQL += '\n);\n\n';
      }
      
      // Get indexes
      const { rows: indexes } = await pool.query(`
        SELECT indexdef
        FROM pg_indexes
        WHERE tablename = '${tableName}'
        AND indexname != '${tableName}_pkey';
      `);
      
      for (const index of indexes) {
        schemaSQL += index.indexdef + ';\n';
      }
      
      schemaSQL += '\n';
    }
    
    // Save schema.sql
    fs.writeFileSync('schema.sql', schemaSQL);
    console.log(`Schema saved to schema.sql`);
    
    // Create data.sql file
    let dataSQL = '-- MallyERP Database Data\n-- Generated: ' + new Date().toISOString() + '\n\n';
    
    for (const table of tables) {
      const tableName = table.tablename;
      console.log(`Processing data for: ${tableName}`);
      
      // Get row count
      const { rows: countResult } = await pool.query(`SELECT COUNT(*) FROM "${tableName}"`);
      const rowCount = parseInt(countResult[0].count);
      
      if (rowCount > 0) {
        console.log(`  Table ${tableName} has ${rowCount} rows`);
        dataSQL += `-- Table: ${tableName} (${rowCount} rows)\n`;
        
        // Get column names
        const { rows: columns } = await pool.query(`
          SELECT column_name
          FROM information_schema.columns
          WHERE table_name = '${tableName}'
          ORDER BY ordinal_position;
        `);
        
        const columnNames = columns.map(col => col.column_name);
        const columnList = columnNames.map(name => `"${name}"`).join(', ');
        
        // Get all data
        const { rows: data } = await pool.query(`SELECT * FROM "${tableName}"`);
        
        // For each row, create an INSERT statement
        for (const row of data) {
          const values = columnNames.map(colName => {
            const value = row[colName];
            if (value === null) {
              return 'NULL';
            } else if (typeof value === 'string') {
              return `'${value.replace(/'/g, "''")}'`;
            } else if (value instanceof Date) {
              return `'${value.toISOString()}'`;
            } else if (typeof value === 'object') {
              return `'${JSON.stringify(value).replace(/'/g, "''")}'`;
            } else {
              return value;
            }
          });
          
          dataSQL += `INSERT INTO "${tableName}" (${columnList}) VALUES (${values.join(', ')});\n`;
        }
        
        dataSQL += '\n';
      } else {
        console.log(`  Table ${tableName} is empty`);
        dataSQL += `-- Table: ${tableName} (empty)\n\n`;
      }
    }
    
    // Save data.sql
    fs.writeFileSync('data.sql', dataSQL);
    console.log(`Data saved to data.sql`);
    
    console.log("Database backup completed successfully!");
    
  } catch (error) {
    console.error("Error during backup:", error);
  } finally {
    await pool.end();
  }
}

// Add a helper function for getting table definitions
async function setupTableDefFunction() {
  try {
    await pool.query(`
      CREATE OR REPLACE FUNCTION pg_get_tabledef(p_table regclass)
      RETURNS text AS
      $BODY$
      DECLARE
        v_table_ddl   text;
        v_column_list text;
        v_column_def  text;
        column_record record;
      BEGIN
        -- Get column list
        SELECT string_agg(format('"%s" %s%s%s', 
                             c.column_name,
                             c.data_type,
                             CASE WHEN c.character_maximum_length IS NOT NULL 
                                  THEN format('(%s)', c.character_maximum_length)
                                  ELSE ''
                             END,
                             CASE WHEN c.is_nullable = 'NO' THEN ' NOT NULL' ELSE '' END), 
                        E',\n  ') INTO v_column_list
        FROM information_schema.columns c
        WHERE c.table_name = p_table::text
        ORDER BY c.ordinal_position;

        -- Construct CREATE TABLE statement
        v_table_ddl := format('CREATE TABLE %s (\n  %s\n)', p_table, v_column_list);
        
        RETURN v_table_ddl;
      END;
      $BODY$
      LANGUAGE plpgsql;
    `);
    console.log("Created table definition helper function");
  } catch (error) {
    console.error("Error creating helper function:", error);
    console.log("Will use fallback mechanism for schema extraction");
  }
}

// Run the backup
async function runBackup() {
  try {
    await setupTableDefFunction();
    await backupSchemaAndData();
  } catch (error) {
    console.error("Error in backup process:", error);
  }
}

runBackup();