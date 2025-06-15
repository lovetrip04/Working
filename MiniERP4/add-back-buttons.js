/**
 * Script to add back buttons to all Master Data and Module pages
 */

import fs from 'fs';
import path from 'path';

const masterDataPages = [
  'ApprovalLevels.tsx',
  'BillOfMaterials.tsx', 
  'ChartOfAccounts.tsx',
  'CompanyCode.tsx',
  'CreditControl.tsx',
  'Currencies.tsx',
  'Customer.tsx',
  'FiscalCalendar.tsx',
  'Material.tsx',
  'Plant.tsx',
  'PurchaseOrganization.tsx',
  'PurchaseReferences.tsx',
  'Regions.tsx',
  'SalesOrganization.tsx',
  'StorageLocation.tsx',
  'UnitOfMeasure.tsx',
  'Vendor.tsx'
];

const modulePages = [
  '../Sales.tsx',
  '../Purchase.tsx',
  '../Finance.tsx',
  '../Controlling.tsx',
  '../Production.tsx',
  '../Inventory.tsx',
  '../inventory/Inventory.tsx',
  '../purchase/Purchase.tsx',
  '../sales/Sales.tsx',
  '../finance/Finance.tsx',
  '../controlling/Controlling.tsx',
  '../production/Production.tsx'
];

function addBackButtonToFile(filePath, pageTitle) {
  try {
    let content = fs.readFileSync(filePath, 'utf8');
    
    // Check if ArrowLeft is already imported
    if (!content.includes('ArrowLeft')) {
      // Add ArrowLeft to existing lucide-react imports
      const lucideImportRegex = /import\s*\{([^}]+)\}\s*from\s*["']lucide-react["'];?/;
      const match = content.match(lucideImportRegex);
      
      if (match) {
        const imports = match[1];
        if (!imports.includes('ArrowLeft')) {
          const newImports = imports.trim() + ', ArrowLeft';
          content = content.replace(lucideImportRegex, `import { ${newImports} } from "lucide-react";`);
        }
      } else {
        // Add new import if no lucide-react import exists
        const importIndex = content.indexOf('import');
        if (importIndex !== -1) {
          const firstImportLine = content.substring(0, content.indexOf('\n', importIndex) + 1);
          content = firstImportLine + 'import { ArrowLeft } from "lucide-react";\n' + content.substring(firstImportLine.length);
        }
      }
    }
    
    // Check if Link is already imported from wouter
    if (!content.includes('import { Link }') && !content.includes('import { Link,')) {
      // Add Link import
      const importIndex = content.indexOf('import');
      if (importIndex !== -1) {
        const firstImportLine = content.substring(0, content.indexOf('\n', importIndex) + 1);
        content = firstImportLine + 'import { Link } from "wouter";\n' + content.substring(firstImportLine.length);
      }
    }
    
    // Find header patterns and add back button
    const headerPatterns = [
      // Pattern 1: Simple header with h1
      {
        regex: /(<div[^>]*>\s*<h1[^>]*class[^>]*>)([^<]+)(<\/h1>)/g,
        replacement: '$1$2$3'
      },
      // Pattern 2: Header with description
      {
        regex: /(<div[^>]*>\s*<div[^>]*>\s*<h1[^>]*>)([^<]+)(<\/h1>\s*<p[^>]*>)/g,
        replacement: function(match, before, title, after) {
          if (match.includes('ArrowLeft')) return match;
          return before.replace('<div', '<div className="flex items-center"><Link href="/master-data" className="mr-4 p-2 rounded-md hover:bg-gray-100"><ArrowLeft className="h-5 w-5" /></Link><div') + title + after;
        }
      }
    ];
    
    // Apply transformations
    headerPatterns.forEach(pattern => {
      if (typeof pattern.replacement === 'function') {
        content = content.replace(pattern.regex, pattern.replacement);
      } else {
        content = content.replace(pattern.regex, pattern.replacement);
      }
    });
    
    // Write back to file
    fs.writeFileSync(filePath, content);
    console.log(`✅ Added back button to ${path.basename(filePath)}`);
    
  } catch (error) {
    console.log(`❌ Error processing ${filePath}:`, error.message);
  }
}

// Process master data pages
const masterDataDir = 'client/src/pages/master-data';
masterDataPages.forEach(page => {
  const filePath = path.join(masterDataDir, page);
  if (fs.existsSync(filePath)) {
    addBackButtonToFile(filePath, page.replace('.tsx', ''));
  }
});

// Process module pages  
modulePages.forEach(page => {
  const filePath = path.join('client/src/pages', page);
  if (fs.existsSync(filePath)) {
    addBackButtonToFile(filePath, page.replace('.tsx', ''));
  }
});

console.log('🎯 Back button addition complete!');