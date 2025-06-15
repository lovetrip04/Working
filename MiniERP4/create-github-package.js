/**
 * Create Complete GitHub Package
 * Organizes all files into a comprehensive deployment package
 */

import { promises as fs } from 'fs';
import path from 'path';

async function createGitHubPackage() {
  console.log('Creating complete GitHub package...');
  
  try {
    // Create package structure
    await createPackageStructure();
    
    // Copy all source files
    await copySourceFiles();
    
    // Create deployment scripts
    await createDeploymentScripts();
    
    // Generate package manifest
    await generatePackageManifest();
    
    console.log('GitHub package created successfully!');
    
  } catch (error) {
    console.error('Package creation failed:', error);
  }
}

async function createPackageStructure() {
  const dirs = [
    'mallyerp-complete',
    'mallyerp-complete/client',
    'mallyerp-complete/server',
    'mallyerp-complete/database',
    'mallyerp-complete/documentation',
    'mallyerp-complete/deployment',
    'mallyerp-complete/scripts'
  ];
  
  for (const dir of dirs) {
    await fs.mkdir(dir, { recursive: true });
  }
  
  console.log('Package structure created');
}

async function copySourceFiles() {
  // Copy database files
  await fs.copyFile('github-export/database-schema-complete.sql', 'mallyerp-complete/database/schema.sql');
  await fs.copyFile('github-export/database-data-complete.sql', 'mallyerp-complete/database/data.sql');
  
  // Copy documentation
  const docFiles = [
    'README-COMPLETE.md',
    'HELP-DOCUMENTATION.md',
    'AI-SYSTEM-COMPLETE.md',
    'SOURCE-CODE-STRUCTURE.md',
    'DEPLOYMENT.md'
  ];
  
  for (const file of docFiles) {
    await fs.copyFile(`github-export/${file}`, `mallyerp-complete/documentation/${file}`);
  }
  
  // Copy configuration files
  await fs.copyFile('package.json', 'mallyerp-complete/package.json');
  await fs.copyFile('tsconfig.json', 'mallyerp-complete/tsconfig.json');
  await fs.copyFile('vite.config.ts', 'mallyerp-complete/vite.config.ts');
  await fs.copyFile('tailwind.config.ts', 'mallyerp-complete/tailwind.config.ts');
  await fs.copyFile('drizzle.config.ts', 'mallyerp-complete/drizzle.config.ts');
  
  console.log('Source files copied');
}

async function createDeploymentScripts() {
  // Quick start script
  const quickStart = `#!/bin/bash
# MallyERP Quick Start Deployment Script

echo "Starting MallyERP deployment..."

# Check prerequisites
if ! command -v node &> /dev/null; then
    echo "Node.js is required. Please install Node.js 18 or higher."
    exit 1
fi

if ! command -v psql &> /dev/null; then
    echo "PostgreSQL is required. Please install PostgreSQL 14 or higher."
    exit 1
fi

# Install dependencies
echo "Installing dependencies..."
npm install

# Setup database
echo "Setting up database..."
createdb mallyerp || echo "Database may already exist"
psql -d mallyerp < database/schema.sql
psql -d mallyerp < database/data.sql

# Configure environment
if [ ! -f .env ]; then
    echo "Creating environment file..."
    cat > .env << EOF
DATABASE_URL=postgresql://\${USER}@localhost:5432/mallyerp
OPENAI_API_KEY=your_openai_api_key_here
NODE_ENV=development
PORT=5000
EOF
    echo "Please update .env with your OpenAI API key"
fi

# Start application
echo "Starting MallyERP..."
npm run dev

echo "MallyERP is now running at http://localhost:5000"
`;

  await fs.writeFile('mallyerp-complete/scripts/quick-start.sh', quickStart);
  
  // Production deployment script
  const prodDeploy = `#!/bin/bash
# MallyERP Production Deployment Script

echo "Deploying MallyERP to production..."

# Build application
npm run build

# Start production server
npm start
`;

  await fs.writeFile('mallyerp-complete/scripts/deploy-production.sh', prodDeploy);
  
  console.log('Deployment scripts created');
}

async function generatePackageManifest() {
  const manifest = {
    name: "MallyERP Complete Package",
    version: "1.0.0",
    description: "Complete Enterprise Resource Planning system with AI-powered automation",
    created: new Date().toISOString(),
    contents: {
      documentation: [
        "README-COMPLETE.md - System overview and features",
        "HELP-DOCUMENTATION.md - User guide and help system", 
        "AI-SYSTEM-COMPLETE.md - AI implementation guide",
        "SOURCE-CODE-STRUCTURE.md - Source code documentation",
        "DEPLOYMENT.md - Production deployment guide"
      ],
      database: [
        "schema.sql - Complete database schema (112 tables)",
        "data.sql - Sample data (1,397 records)"
      ],
      scripts: [
        "quick-start.sh - Automated setup script",
        "deploy-production.sh - Production deployment"
      ],
      features: {
        aiAgents: 9,
        databaseTables: 112,
        modules: [
          "Master Data Management",
          "Sales Management", 
          "Inventory Management",
          "Purchase Management",
          "Production Management",
          "Financial Management",
          "Controlling"
        ],
        technologies: [
          "React 18 + TypeScript",
          "Node.js + Express",
          "PostgreSQL + Drizzle ORM",
          "OpenAI Integration",
          "Tailwind CSS + shadcn/ui"
        ]
      },
      deployment: {
        requirements: [
          "Node.js 18+",
          "PostgreSQL 14+", 
          "OpenAI API key"
        ],
        quickStart: "./scripts/quick-start.sh",
        production: "./scripts/deploy-production.sh"
      }
    }
  };
  
  await fs.writeFile('mallyerp-complete/PACKAGE-MANIFEST.json', JSON.stringify(manifest, null, 2));
  
  console.log('Package manifest generated');
}

// Run the package creation
createGitHubPackage().catch(console.error);