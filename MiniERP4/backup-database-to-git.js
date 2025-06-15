/**
 * Complete Database Backup Script for Git
 * Exports all 94 tables with schema and data for version control
 */

import fs from 'fs';
import { exec } from 'child_process';
import util from 'util';
import pkg from 'pg';
const { Pool } = pkg;
const execPromise = util.promisify(exec);

// Database connection
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

async function backupCompleteDatabase() {
  console.log('🚀 Starting complete database backup for Git...');
  
  try {
    // Create backup directory
    await execPromise('mkdir -p database-backup');
    
    // Get all table names
    const client = await pool.connect();
    const tablesResult = await client.query(`
      SELECT tablename 
      FROM pg_tables 
      WHERE schemaname = 'public' 
      ORDER BY tablename
    `);
    
    const tables = tablesResult.rows.map(row => row.tablename);
    console.log(`📊 Found ${tables.length} tables to backup`);
    
    // Create schema backup
    console.log('📋 Creating schema backup...');
    const { stdout: schemaSQL } = await execPromise(`pg_dump "${process.env.DATABASE_URL}" --schema-only --no-owner --no-privileges`);
    fs.writeFileSync('database-backup/schema.sql', schemaSQL);
    
    // Create data backup for each table
    console.log('💾 Creating data backup...');
    let dataSQL = '-- Complete Database Data Backup\n';
    dataSQL += `-- Generated: ${new Date().toISOString()}\n`;
    dataSQL += `-- Tables: ${tables.length}\n\n`;
    
    for (const table of tables) {
      try {
        const countResult = await client.query(`SELECT COUNT(*) FROM ${table}`);
        const count = parseInt(countResult.rows[0].count);
        
        if (count > 0) {
          dataSQL += `-- Table: ${table} (${count} records)\n`;
          const { stdout: tableData } = await execPromise(`pg_dump "${process.env.DATABASE_URL}" --data-only --table=${table} --no-owner --no-privileges`);
          dataSQL += tableData + '\n';
        } else {
          dataSQL += `-- Table: ${table} (0 records)\n\n`;
        }
        
        console.log(`✅ ${table}: ${count} records`);
      } catch (error) {
        console.log(`⚠️  ${table}: Error - ${error.message}`);
        dataSQL += `-- Table: ${table} - Error during backup\n\n`;
      }
    }
    
    fs.writeFileSync('database-backup/data.sql', dataSQL);
    client.release();
    
    // Create summary file
    const summary = {
      backup_date: new Date().toISOString(),
      total_tables: tables.length,
      tables: tables,
      files_created: [
        'database-backup/schema.sql',
        'database-backup/data.sql',
        'database-backup/backup-summary.json'
      ]
    };
    
    fs.writeFileSync('database-backup/backup-summary.json', JSON.stringify(summary, null, 2));
    
    // Copy to root for Git
    await execPromise('cp database-backup/schema.sql schema.sql');
    await execPromise('cp database-backup/data.sql data.sql');
    
    console.log('🎉 Database backup completed successfully!');
    console.log('📁 Files created:');
    console.log('  - schema.sql (table definitions)');
    console.log('  - data.sql (all data)');
    console.log('  - database-backup/ (detailed backup)');
    
    return {
      success: true,
      tables: tables.length,
      files: ['schema.sql', 'data.sql']
    };
    
  } catch (error) {
    console.error('❌ Backup failed:', error.message);
    throw error;
  } finally {
    await pool.end();
  }
}

// Run backup
backupCompleteDatabase()
  .then(result => {
    console.log(`✅ Backup complete: ${result.tables} tables backed up`);
    process.exit(0);
  })
  .catch(error => {
    console.error('❌ Backup failed:', error);
    process.exit(1);
  });