/**
 * Comprehensive Back Button Implementation
 * Adds consistent back buttons to all Master Data and Module pages
 */

import fs from 'fs';
import path from 'path';

const pagesToUpdate = [
  // Master Data pages
  { file: 'client/src/pages/master-data/ApprovalLevels.tsx', title: 'Approval Levels' },
  { file: 'client/src/pages/master-data/BillOfMaterials.tsx', title: 'Bill of Materials' },
  { file: 'client/src/pages/master-data/ChartOfAccounts.tsx', title: 'Chart of Accounts' },
  { file: 'client/src/pages/master-data/CreditControl.tsx', title: 'Credit Control Areas' },
  { file: 'client/src/pages/master-data/Currencies.tsx', title: 'Currencies' },
  { file: 'client/src/pages/master-data/Customer.tsx', title: 'Customers' },
  { file: 'client/src/pages/master-data/FiscalCalendar.tsx', title: 'Fiscal Calendar' },
  { file: 'client/src/pages/master-data/PurchaseOrganization.tsx', title: 'Purchase Organizations' },
  { file: 'client/src/pages/master-data/PurchaseReferences.tsx', title: 'Purchase References' },
  { file: 'client/src/pages/master-data/Regions.tsx', title: 'Regions' },
  { file: 'client/src/pages/master-data/SalesOrganization.tsx', title: 'Sales Organizations' },
  { file: 'client/src/pages/master-data/StorageLocation.tsx', title: 'Storage Locations' },
  
  // Module pages
  { file: 'client/src/pages/Sales.tsx', title: 'Sales Module', route: '/sales' },
  { file: 'client/src/pages/Purchase.tsx', title: 'Purchase Module', route: '/purchase' },
  { file: 'client/src/pages/Finance.tsx', title: 'Finance Module', route: '/finance' },
  { file: 'client/src/pages/Controlling.tsx', title: 'Controlling Module', route: '/controlling' },
  { file: 'client/src/pages/Production.tsx', title: 'Production Module', route: '/production' },
  { file: 'client/src/pages/Inventory.tsx', title: 'Inventory Module', route: '/inventory' }
];

function addBackButtonToPage(filePath, pageTitle, backRoute = '/master-data') {
  try {
    if (!fs.existsSync(filePath)) {
      console.log(`⚠️  File not found: ${filePath}`);
      return;
    }

    let content = fs.readFileSync(filePath, 'utf8');
    
    // Add ArrowLeft import if missing
    if (!content.includes('ArrowLeft')) {
      const lucideImportRegex = /import\s*\{([^}]+)\}\s*from\s*["']lucide-react["'];?/;
      const match = content.match(lucideImportRegex);
      
      if (match) {
        const imports = match[1].trim();
        if (!imports.includes('ArrowLeft')) {
          const newImports = imports + ', ArrowLeft';
          content = content.replace(lucideImportRegex, `import { ${newImports} } from "lucide-react";`);
        }
      }
    }
    
    // Add Link import if missing
    if (!content.includes('from "wouter"')) {
      const importSection = content.substring(0, content.indexOf('\n\n'));
      const restOfContent = content.substring(content.indexOf('\n\n'));
      content = importSection + '\nimport { Link } from "wouter";' + restOfContent;
    }
    
    // Add back button to header patterns
    const headerPatterns = [
      // Pattern 1: Simple h1 header
      {
        regex: /(<div[^>]*>\s*<h1[^>]*>)([^<]+)(<\/h1>)/,
        replacement: function(match, before, title, after) {
          if (match.includes('ArrowLeft')) return match;
          return `<div className="flex items-center mb-6">
          <Link href="${backRoute}" className="mr-4 p-2 rounded-md hover:bg-gray-100">
            <ArrowLeft className="h-5 w-5" />
          </Link>
          <div>
            ${before}${title}${after}`;
        }
      },
      
      // Pattern 2: Header with description
      {
        regex: /(<div[^>]*>\s*<div[^>]*>\s*<h1[^>]*>)([^<]+)(<\/h1>\s*<p[^>]*>[^<]+<\/p>\s*<\/div>)/,
        replacement: function(match, before, title, after) {
          if (match.includes('ArrowLeft')) return match;
          return match.replace('<div>', '<div className="flex items-center"><Link href="' + backRoute + '" className="mr-4 p-2 rounded-md hover:bg-gray-100"><ArrowLeft className="h-5 w-5" /></Link><div>') + '</div>';
        }
      }
    ];
    
    // Apply transformations
    let updated = false;
    headerPatterns.forEach(pattern => {
      const newContent = content.replace(pattern.regex, pattern.replacement);
      if (newContent !== content) {
        content = newContent;
        updated = true;
      }
    });
    
    if (updated) {
      fs.writeFileSync(filePath, content);
      console.log(`✅ Added back button to ${path.basename(filePath)}`);
    } else {
      console.log(`ℹ️  No header pattern found in ${path.basename(filePath)}`);
    }
    
  } catch (error) {
    console.log(`❌ Error processing ${filePath}:`, error.message);
  }
}

// Process all pages
pagesToUpdate.forEach(page => {
  const backRoute = page.route || '/master-data';
  addBackButtonToPage(page.file, page.title, backRoute);
});

console.log('🎯 Back button implementation complete!');