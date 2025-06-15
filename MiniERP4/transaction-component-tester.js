/**
 * Transaction Component Runtime Error Tester
 * Comprehensive testing tool to identify and fix runtime errors in transaction applications
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

class TransactionTester {
  constructor() {
    this.transactionComponents = [];
    this.errors = [];
    this.fixes = [];
    this.componentPath = './client/src/pages/transactions';
  }

  // Scan all transaction components
  scanTransactionComponents() {
    console.log('🔍 Scanning transaction components...');
    
    try {
      const files = fs.readdirSync(this.componentPath);
      this.transactionComponents = files
        .filter(file => file.endsWith('.tsx'))
        .map(file => ({
          name: file.replace('.tsx', ''),
          path: path.join(this.componentPath, file),
          content: ''
        }));

      console.log(`📁 Found ${this.transactionComponents.length} transaction components`);
      return this.transactionComponents;
    } catch (error) {
      console.error('❌ Error scanning components:', error.message);
      return [];
    }
  }

  // Analyze component for common runtime errors
  analyzeComponent(component) {
    console.log(`🔍 Analyzing ${component.name}...`);
    
    try {
      component.content = fs.readFileSync(component.path, 'utf8');
      const issues = [];

      // Check for undefined variable access patterns
      const undefinedPatterns = [
        // Object property access without null checking
        /(\w+)\.(\w+)\.toUpperCase\(\)/g,
        /(\w+)\.(\w+)\.toLowerCase\(\)/g,
        /(\w+)\.(\w+)\.toString\(\)/g,
        /(\w+)\.(\w+)\.map\(/g,
        /(\w+)\.(\w+)\.filter\(/g,
        /(\w+)\.(\w+)\.length/g,
        
        // Array access without checking
        /(\w+)\[(\d+|\w+)\]\.(\w+)/g,
        
        // Query data access without null checking
        /data:.*?.map\(/g,
        /data:.*?.filter\(/g,
        /data:.*?.length/g,
        
        // Missing optional chaining
        /(\w+)\.(\w+)\.(\w+)(?!\?\.)/g
      ];

      undefinedPatterns.forEach((pattern, index) => {
        const matches = component.content.match(pattern);
        if (matches) {
          matches.forEach(match => {
            issues.push({
              type: 'potential_undefined_access',
              pattern: pattern.toString(),
              match: match,
              severity: 'high',
              description: 'Potential undefined property access without null checking'
            });
          });
        }
      });

      // Check for missing query data handling
      if (component.content.includes('useQuery') && !component.content.includes('isLoading')) {
        issues.push({
          type: 'missing_loading_state',
          severity: 'medium',
          description: 'Component uses useQuery but may not handle loading state'
        });
      }

      // Check for direct array/object access without validation
      const lines = component.content.split('\n');
      lines.forEach((line, lineNumber) => {
        // Check for direct property access that could be undefined
        if (line.includes('.map(') && !line.includes('?.map(') && !line.includes('|| []')) {
          issues.push({
            type: 'unsafe_array_access',
            line: lineNumber + 1,
            content: line.trim(),
            severity: 'high',
            description: 'Array method called without null/undefined checking'
          });
        }

        // Check for toUpperCase/toLowerCase without checking
        if ((line.includes('.toUpperCase()') || line.includes('.toLowerCase()')) && 
            !line.includes('?.') && !line.includes('|| \'\'')) {
          issues.push({
            type: 'unsafe_string_method',
            line: lineNumber + 1,
            content: line.trim(),
            severity: 'high',
            description: 'String method called on potentially undefined value'
          });
        }
      });

      if (issues.length > 0) {
        this.errors.push({
          component: component.name,
          path: component.path,
          issues: issues
        });
      }

      return issues;
    } catch (error) {
      console.error(`❌ Error analyzing ${component.name}:`, error.message);
      return [];
    }
  }

  // Generate fixes for identified issues
  generateFixes(componentError) {
    const fixes = [];

    componentError.issues.forEach(issue => {
      switch (issue.type) {
        case 'unsafe_array_access':
          fixes.push({
            type: 'add_safe_array_access',
            description: 'Add null checking and default empty array',
            fix: 'Replace with optional chaining and default: (data || []).map(...) or data?.map(...) || []'
          });
          break;

        case 'unsafe_string_method':
          fixes.push({
            type: 'add_safe_string_method',
            description: 'Add null checking for string methods',
            fix: 'Replace with optional chaining: value?.toUpperCase() || \'\' or (value || \'\').toUpperCase()'
          });
          break;

        case 'potential_undefined_access':
          fixes.push({
            type: 'add_optional_chaining',
            description: 'Add optional chaining to prevent undefined access',
            fix: 'Use optional chaining (?.) operator'
          });
          break;

        case 'missing_loading_state':
          fixes.push({
            type: 'add_loading_handling',
            description: 'Add proper loading state handling',
            fix: 'Add isLoading check and loading UI'
          });
          break;
      }
    });

    return fixes;
  }

  // Apply automatic fixes to components
  applyFixes(componentError) {
    console.log(`🔧 Applying fixes to ${componentError.component}...`);
    
    try {
      let content = fs.readFileSync(componentError.path, 'utf8');
      let modified = false;

      componentError.issues.forEach(issue => {
        switch (issue.type) {
          case 'unsafe_string_method':
            if (issue.content.includes('.toUpperCase()')) {
              // Fix the specific toUpperCase error
              content = content.replace(
                /(\w+)\.toUpperCase\(\)/g,
                '($1 || \'\').toUpperCase()'
              );
              modified = true;
            }
            if (issue.content.includes('.toLowerCase()')) {
              content = content.replace(
                /(\w+)\.toLowerCase\(\)/g,
                '($1 || \'\').toLowerCase()'
              );
              modified = true;
            }
            break;

          case 'unsafe_array_access':
            // Fix array methods without null checking
            content = content.replace(
              /(\w+)\.map\(/g,
              '($1 || []).map('
            );
            content = content.replace(
              /(\w+)\.filter\(/g,
              '($1 || []).filter('
            );
            modified = true;
            break;
        }
      });

      if (modified) {
        fs.writeFileSync(componentError.path, content, 'utf8');
        console.log(`✅ Applied fixes to ${componentError.component}`);
        this.fixes.push({
          component: componentError.component,
          fixesApplied: componentError.issues.length
        });
      }

    } catch (error) {
      console.error(`❌ Error applying fixes to ${componentError.component}:`, error.message);
    }
  }

  // Run comprehensive test
  async runComprehensiveTest() {
    console.log('🚀 Starting comprehensive transaction component testing...\n');

    // Step 1: Scan components
    const components = this.scanTransactionComponents();
    if (components.length === 0) {
      console.log('❌ No components found to test');
      return;
    }

    // Step 2: Analyze each component
    console.log('\n📊 Analyzing components for runtime errors...');
    for (const component of components) {
      this.analyzeComponent(component);
    }

    // Step 3: Report findings
    this.generateReport();

    // Step 4: Apply fixes
    if (this.errors.length > 0) {
      console.log('\n🔧 Applying automatic fixes...');
      for (const error of this.errors) {
        this.applyFixes(error);
      }
    }

    // Step 5: Final report
    this.generateFinalReport();
  }

  // Generate detailed report
  generateReport() {
    console.log('\n📋 TESTING REPORT');
    console.log('==================');
    
    if (this.errors.length === 0) {
      console.log('✅ No runtime errors detected in transaction components');
      return;
    }

    console.log(`❌ Found ${this.errors.length} components with potential runtime errors:\n`);

    this.errors.forEach((error, index) => {
      console.log(`${index + 1}. ${error.component}`);
      console.log(`   Path: ${error.path}`);
      console.log(`   Issues: ${error.issues.length}`);
      
      error.issues.forEach(issue => {
        console.log(`   - ${issue.type}: ${issue.description}`);
        if (issue.line) {
          console.log(`     Line ${issue.line}: ${issue.content}`);
        }
      });
      console.log('');
    });
  }

  // Generate final report after fixes
  generateFinalReport() {
    console.log('\n🎯 FINAL REPORT');
    console.log('================');
    
    if (this.fixes.length === 0) {
      console.log('ℹ️  No fixes were applied');
      return;
    }

    console.log(`✅ Applied fixes to ${this.fixes.length} components:\n`);
    
    this.fixes.forEach(fix => {
      console.log(`- ${fix.component}: ${fix.fixesApplied} fixes applied`);
    });

    console.log('\n🔄 Recommended next steps:');
    console.log('1. Test the application in browser');
    console.log('2. Check console for remaining errors');
    console.log('3. Verify all transaction components load correctly');
    console.log('4. Run this tester again if needed');
  }

  // Quick fix for specific runtime error
  quickFixRuntimeError(componentName, errorType) {
    console.log(`🔧 Applying quick fix for ${componentName} - ${errorType}`);
    
    const componentPath = path.join(this.componentPath, `${componentName}.tsx`);
    
    if (!fs.existsSync(componentPath)) {
      console.error(`❌ Component ${componentName} not found`);
      return false;
    }

    try {
      let content = fs.readFileSync(componentPath, 'utf8');
      let modified = false;

      switch (errorType) {
        case 'toUpperCase':
          content = content.replace(
            /(\w+)\.toUpperCase\(\)/g,
            '($1 || \'\').toUpperCase()'
          );
          modified = true;
          break;

        case 'map_undefined':
          content = content.replace(
            /(\w+)\.map\(/g,
            '($1 || []).map('
          );
          modified = true;
          break;

        case 'query_data':
          // Add safe query data access
          content = content.replace(
            /data\?.map\(/g,
            '(data || []).map('
          );
          modified = true;
          break;
      }

      if (modified) {
        fs.writeFileSync(componentPath, content, 'utf8');
        console.log(`✅ Quick fix applied to ${componentName}`);
        return true;
      }

    } catch (error) {
      console.error(`❌ Error applying quick fix:`, error.message);
    }

    return false;
  }
}

// CLI Interface and Export
const tester = new TransactionTester();

if (import.meta.url === `file://${process.argv[1]}`) {
  const command = process.argv[2];
  const componentName = process.argv[3];
  const errorType = process.argv[4];

  switch (command) {
    case 'test':
      tester.runComprehensiveTest();
      break;
      
    case 'quick-fix':
      if (!componentName || !errorType) {
        console.log('Usage: node transaction-component-tester.js quick-fix <component-name> <error-type>');
        console.log('Error types: toUpperCase, map_undefined, query_data');
      } else {
        tester.quickFixRuntimeError(componentName, errorType);
      }
      break;
      
    case 'scan':
      tester.scanTransactionComponents();
      break;
      
    default:
      console.log('🧪 Transaction Component Tester');
      console.log('================================');
      console.log('Commands:');
      console.log('  node transaction-component-tester.js test        - Run comprehensive test');
      console.log('  node transaction-component-tester.js quick-fix <component> <error>  - Apply quick fix');
      console.log('  node transaction-component-tester.js scan        - Scan components only');
      console.log('');
      console.log('Quick fix for current error:');
      console.log('  node transaction-component-tester.js quick-fix AdvancedAuthorizationManagement toUpperCase');
  }
}

export default TransactionTester;