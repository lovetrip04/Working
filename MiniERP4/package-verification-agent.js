/**
 * Package Verification Agent
 * Comprehensive validation that all workspace files are included in MallyProj_Package
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

class PackageVerificationAgent {
  constructor() {
    this.workspacePath = '.';
    this.packagePath = './MallyProj_Package';
    this.excludePatterns = [
      'node_modules',
      '.git',
      '.replit',
      'replit.nix',
      'MallyProj_Package',
      '.vscode',
      'dist',
      'build',
      '.cache'
    ];
    this.missingFiles = [];
    this.extraFiles = [];
    this.verificationResults = {
      totalWorkspaceFiles: 0,
      totalPackageFiles: 0,
      missingCount: 0,
      extraCount: 0,
      verificationPassed: false
    };
  }

  /**
   * Get all files recursively from a directory
   */
  getAllFiles(dirPath, basePath = dirPath) {
    const files = [];
    
    try {
      const items = fs.readdirSync(dirPath, { withFileTypes: true });
      
      for (const item of items) {
        const fullPath = path.join(dirPath, item.name);
        const relativePath = path.relative(basePath, fullPath);
        
        // Skip excluded patterns
        if (this.shouldExclude(relativePath)) {
          continue;
        }
        
        if (item.isDirectory()) {
          files.push(...this.getAllFiles(fullPath, basePath));
        } else {
          files.push(relativePath);
        }
      }
    } catch (error) {
      console.log(`Warning: Could not read directory ${dirPath}: ${error.message}`);
    }
    
    return files;
  }

  /**
   * Check if file/directory should be excluded
   */
  shouldExclude(filePath) {
    return this.excludePatterns.some(pattern => 
      filePath.includes(pattern) || filePath.startsWith(pattern)
    );
  }

  /**
   * Verify package completeness
   */
  async verifyPackageCompleteness() {
    console.log('🔍 Starting comprehensive package verification...\n');

    // Get all workspace files
    const workspaceFiles = this.getAllFiles(this.workspacePath);
    this.verificationResults.totalWorkspaceFiles = workspaceFiles.length;
    
    // Get all package files
    const packageFiles = this.getAllFiles(this.packagePath);
    this.verificationResults.totalPackageFiles = packageFiles.length;

    console.log(`📊 Workspace files: ${workspaceFiles.length}`);
    console.log(`📦 Package files: ${packageFiles.length}\n`);

    // Find missing files
    this.missingFiles = workspaceFiles.filter(file => {
      const packageFilePath = path.join(this.packagePath, file);
      return !fs.existsSync(packageFilePath);
    });

    // Find extra files (files in package but not in workspace)
    this.extraFiles = packageFiles.filter(file => {
      const workspaceFilePath = path.join(this.workspacePath, file);
      return !fs.existsSync(workspaceFilePath);
    });

    this.verificationResults.missingCount = this.missingFiles.length;
    this.verificationResults.extraCount = this.extraFiles.length;
    this.verificationResults.verificationPassed = this.missingFiles.length === 0;

    return this.generateReport();
  }

  /**
   * Generate comprehensive verification report
   */
  generateReport() {
    console.log('📋 PACKAGE VERIFICATION REPORT');
    console.log('=====================================\n');

    if (this.verificationResults.verificationPassed) {
      console.log('✅ VERIFICATION PASSED: All workspace files included in package!\n');
    } else {
      console.log('❌ VERIFICATION FAILED: Missing files detected!\n');
    }

    console.log('📈 STATISTICS:');
    console.log(`   Workspace files: ${this.verificationResults.totalWorkspaceFiles}`);
    console.log(`   Package files: ${this.verificationResults.totalPackageFiles}`);
    console.log(`   Missing files: ${this.verificationResults.missingCount}`);
    console.log(`   Extra files: ${this.verificationResults.extraCount}\n`);

    if (this.missingFiles.length > 0) {
      console.log('🚨 MISSING FILES:');
      this.missingFiles.slice(0, 20).forEach(file => {
        console.log(`   ❌ ${file}`);
      });
      if (this.missingFiles.length > 20) {
        console.log(`   ... and ${this.missingFiles.length - 20} more files`);
      }
      console.log('');
    }

    if (this.extraFiles.length > 0) {
      console.log('ℹ️  EXTRA FILES IN PACKAGE:');
      this.extraFiles.slice(0, 10).forEach(file => {
        console.log(`   ➕ ${file}`);
      });
      if (this.extraFiles.length > 10) {
        console.log(`   ... and ${this.extraFiles.length - 10} more files`);
      }
      console.log('');
    }

    // Critical components verification
    this.verifyCriticalComponents();

    return {
      passed: this.verificationResults.verificationPassed,
      missingFiles: this.missingFiles,
      extraFiles: this.extraFiles,
      stats: this.verificationResults
    };
  }

  /**
   * Verify critical components are present
   */
  verifyCriticalComponents() {
    console.log('🔧 CRITICAL COMPONENTS VERIFICATION:');
    
    const criticalComponents = [
      { name: 'Package.json', path: 'package.json' },
      { name: 'Client Source', path: 'client/src' },
      { name: 'Server Source', path: 'server' },
      { name: 'Shared Schema', path: 'shared' },
      { name: 'Database Files', path: 'database' },
      { name: 'Documentation', path: 'README.md' },
      { name: 'Docker Config', path: 'Dockerfile' },
      { name: 'CI/CD Config', path: '.github/workflows' },
      { name: 'Scripts', path: 'scripts' },
      { name: 'Migration Scripts', path: 'migration-scripts' },
      { name: 'Tools', path: 'tools' }
    ];

    criticalComponents.forEach(component => {
      const componentPath = path.join(this.packagePath, component.path);
      const exists = fs.existsSync(componentPath);
      const status = exists ? '✅' : '❌';
      console.log(`   ${status} ${component.name}`);
    });

    console.log('');
  }

  /**
   * Auto-fix missing files
   */
  async autoFixMissingFiles() {
    if (this.missingFiles.length === 0) {
      console.log('✅ No missing files to fix!\n');
      return true;
    }

    console.log(`🔧 Auto-fixing ${this.missingFiles.length} missing files...\n`);

    let fixedCount = 0;
    for (const missingFile of this.missingFiles) {
      try {
        const sourcePath = path.join(this.workspacePath, missingFile);
        const destPath = path.join(this.packagePath, missingFile);
        
        // Create directory if it doesn't exist
        const destDir = path.dirname(destPath);
        if (!fs.existsSync(destDir)) {
          fs.mkdirSync(destDir, { recursive: true });
        }

        // Copy file
        fs.copyFileSync(sourcePath, destPath);
        fixedCount++;
        
        if (fixedCount <= 10) {
          console.log(`   ✅ Fixed: ${missingFile}`);
        }
      } catch (error) {
        console.log(`   ❌ Failed to fix: ${missingFile} - ${error.message}`);
      }
    }

    if (fixedCount > 10) {
      console.log(`   ... and ${fixedCount - 10} more files fixed`);
    }

    console.log(`\n🎉 Auto-fix completed: ${fixedCount}/${this.missingFiles.length} files fixed\n`);
    
    return fixedCount === this.missingFiles.length;
  }
}

/**
 * Run verification
 */
async function runVerification() {
  const agent = new PackageVerificationAgent();
  const result = await agent.verifyPackageCompleteness();
  
  if (!result.passed) {
    console.log('🔄 Attempting to auto-fix missing files...\n');
    const fixed = await agent.autoFixMissingFiles();
    
    if (fixed) {
      console.log('🔄 Re-running verification after auto-fix...\n');
      const finalResult = await agent.verifyPackageCompleteness();
      return finalResult;
    }
  }
  
  return result;
}

// Export for use as module
export { PackageVerificationAgent, runVerification };

// Run if called directly
if (import.meta.url === `file://${process.argv[1]}`) {
  runVerification().then(result => {
    console.log('\n🏁 FINAL VERIFICATION RESULT:');
    console.log(`   Status: ${result.passed ? 'PASSED ✅' : 'FAILED ❌'}`);
    console.log(`   Missing files: ${result.stats.missingCount}`);
    console.log(`   Package completeness: ${result.passed ? '100%' : Math.round((1 - result.stats.missingCount / result.stats.totalWorkspaceFiles) * 100)}%`);
    
    process.exit(result.passed ? 0 : 1);
  }).catch(error => {
    console.error('❌ Verification failed:', error);
    process.exit(1);
  });
}