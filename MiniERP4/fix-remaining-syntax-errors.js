/**
 * Fix Remaining JSX Syntax Errors from Back Button Implementation
 */

import fs from 'fs';

const filesToFix = [
  'client/src/pages/master-data/BillOfMaterials.tsx',
  'client/src/pages/master-data/Customer.tsx',
  'client/src/pages/master-data/Currencies.tsx',
  'client/src/pages/master-data/FiscalCalendar.tsx',
  'client/src/pages/master-data/Regions.tsx'
];

function fixSyntaxErrors() {
  filesToFix.forEach(filePath => {
    try {
      if (!fs.existsSync(filePath)) {
        console.log(`⚠️  File not found: ${filePath}`);
        return;
      }

      let content = fs.readFileSync(filePath, 'utf8');
      let modified = false;

      // Fix malformed back button structures
      const malformedPatterns = [
        // Pattern: Duplicated back button structure
        {
          regex: /<div className="flex items-center"><Link href="[^"]*" className="[^"]*"><ArrowLeft className="[^"]*" \/><\/Link><div>/g,
          replacement: ''
        },
        // Pattern: Unclosed div after back button
        {
          regex: /(<div className="flex items-center mb-6">\s*<Link href="[^"]*" className="[^"]*">\s*<ArrowLeft className="[^"]*" \/>\s*<\/Link>\s*<div>\s*<h1[^>]*>[^<]+<\/h1>\s*<p[^>]*>[^<]+<\/p>\s*<\/div>)\s*<\/div>/g,
          replacement: '$1\n        </div>'
        }
      ];

      malformedPatterns.forEach(pattern => {
        const newContent = content.replace(pattern.regex, pattern.replacement);
        if (newContent !== content) {
          content = newContent;
          modified = true;
        }
      });

      // Add missing imports if needed
      if (!content.includes('ArrowLeft') && !content.includes('import { Link }')) {
        // Add ArrowLeft to lucide-react import
        const lucideImportRegex = /import\s*\{([^}]+)\}\s*from\s*["']lucide-react["'];?/;
        const match = content.match(lucideImportRegex);
        
        if (match && !match[1].includes('ArrowLeft')) {
          const imports = match[1].trim();
          const newImports = imports + ', ArrowLeft';
          content = content.replace(lucideImportRegex, `import { ${newImports} } from "lucide-react";`);
          modified = true;
        }

        // Add Link import
        if (!content.includes('from "wouter"')) {
          const importSection = content.substring(0, content.indexOf('\n\n'));
          const restOfContent = content.substring(content.indexOf('\n\n'));
          content = importSection + '\nimport { Link } from "wouter";' + restOfContent;
          modified = true;
        }
      }

      if (modified) {
        fs.writeFileSync(filePath, content);
        console.log(`✅ Fixed syntax errors in ${filePath.split('/').pop()}`);
      } else {
        console.log(`ℹ️  No syntax errors found in ${filePath.split('/').pop()}`);
      }

    } catch (error) {
      console.log(`❌ Error processing ${filePath}:`, error.message);
    }
  });
}

fixSyntaxErrors();
console.log('🎯 Syntax error fixes complete!');