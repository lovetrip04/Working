# Transport System Developer Implementation Guide

## Overview

This guide provides developers with practical implementation details for creating, managing, and deploying transport objects in the MallyERP system. It covers the technical aspects of how to create each transport type from the Company Code to Sales Order example.

## System Architecture

### Database Schema for Transport Management

```sql
-- Core transport tables
CREATE TABLE transport_requests (
  id SERIAL PRIMARY KEY,
  request_number VARCHAR(20) UNIQUE NOT NULL,
  request_type VARCHAR(50) NOT NULL,
  description TEXT,
  status VARCHAR(20) DEFAULT 'MODIFIABLE',
  target_environment VARCHAR(10) NOT NULL,
  created_by INTEGER,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  released_at TIMESTAMP,
  imported_at TIMESTAMP
);

CREATE TABLE transport_objects (
  id SERIAL PRIMARY KEY,
  request_id INTEGER REFERENCES transport_requests(id),
  object_type VARCHAR(50) NOT NULL,
  object_name VARCHAR(100) NOT NULL,
  table_name VARCHAR(100) NOT NULL,
  data_snapshot JSONB,
  action VARCHAR(10) DEFAULT 'CREATE',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transport_dependencies (
  id SERIAL PRIMARY KEY,
  request_id INTEGER REFERENCES transport_requests(id),
  depends_on_request VARCHAR(20) NOT NULL,
  dependency_type VARCHAR(20) DEFAULT 'REQUIRED'
);
```

### API Endpoints

```javascript
// Core transport APIs
GET    /api/transport-direct/requests
POST   /api/transport-direct/requests
PUT    /api/transport-direct/requests/:id
DELETE /api/transport-direct/requests/:id

// Transport status management
GET    /api/transport-status/requests/:id
POST   /api/transport-status/simulate-qa-failure/:id
POST   /api/transport-status/rollback/:id

// Number range management
GET    /api/number-ranges/ranges/:objectType
POST   /api/number-ranges/get-next-number
POST   /api/number-ranges/initialize
```

## Step-by-Step Implementation: Company Code to Sales Order

### Phase 1: Company Code Foundation (A1100001)

#### 1. Creating Company Code Transport

**Frontend Implementation:**
```typescript
// Location: client/src/pages/Transport.tsx
const createCompanyCodeTransport = async () => {
  const transportData = {
    description: "Company Code US01 Foundation Setup",
    target_environment: "QA",
    selected_objects: [
      {
        objectType: "COMPANY_CODE",
        objectName: "US01",
        tableName: "company_codes",
        action: "CREATE",
        data: {
          code: "US01",
          name: "US Operations Inc",
          currency: "USD",
          country: "US",
          fiscal_year_variant: "K4",
          chart_of_accounts: "USCOA"
        }
      },
      {
        objectType: "CHART_OF_ACCOUNTS",
        objectName: "USCOA",
        tableName: "chart_of_accounts",
        action: "CREATE",
        data: {
          chart_id: "USCOA",
          description: "US Standard Chart of Accounts",
          language: "EN",
          account_length: 7
        }
      }
    ]
  };

  const response = await fetch('/api/transport-direct/requests', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(transportData)
  });

  return response.json();
};
```

**Backend Processing:**
```javascript
// Location: server/routes/transportDirectRoutes.js
router.post('/requests', async (req, res) => {
  const client = await pool.connect();
  
  try {
    await client.query('BEGIN');

    // Generate transport number
    const transportNumber = await generateTransportNumber('A');
    
    // Create transport request
    const transportResult = await client.query(`
      INSERT INTO transport_requests 
      (request_number, request_type, description, target_environment, created_by)
      VALUES ($1, $2, $3, $4, $5)
      RETURNING *
    `, [transportNumber, 'CONFIGURATION', req.body.description, req.body.target_environment, 1]);

    const transport = transportResult.rows[0];

    // Add objects to transport
    for (const obj of req.body.selected_objects) {
      await client.query(`
        INSERT INTO transport_objects 
        (request_id, object_type, object_name, table_name, data_snapshot, action)
        VALUES ($1, $2, $3, $4, $5, $6)
      `, [transport.id, obj.objectType, obj.objectName, obj.tableName, JSON.stringify(obj.data), obj.action]);
    }

    await client.query('COMMIT');
    res.json({ success: true, transport: transport });

  } catch (error) {
    await client.query('ROLLBACK');
    res.status(500).json({ success: false, error: error.message });
  } finally {
    client.release();
  }
});
```

#### 2. Company Code Master Data Creation

**UI Location:** Master Data → Organizational → Company Code

**Implementation:**
```typescript
// Location: client/src/pages/master-data/CompanyCode.tsx
const createCompanyCode = async (formData: CompanyCodeForm) => {
  // Create company code in database
  const response = await fetch('/api/master-data/company-codes', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(formData)
  });

  if (response.ok) {
    // Automatically add to current transport if one exists
    await addToTransport('COMPANY_CODE', formData.code, 'company_codes', formData);
  }

  return response.json();
};

// Helper function to add objects to transport
const addToTransport = async (objectType: string, objectName: string, tableName: string, data: any) => {
  const currentTransport = getCurrentTransport(); // Get active transport
  
  if (currentTransport && currentTransport.status === 'MODIFIABLE') {
    await fetch(`/api/transport-direct/requests/${currentTransport.id}/objects`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        objectType,
        objectName,
        tableName,
        data,
        action: 'CREATE'
      })
    });
  }
};
```

### Phase 2: Number Range Configuration (A1100003)

#### 1. Number Range Creation Interface

**UI Location:** Configuration → Number Ranges

**Implementation:**
```typescript
// Location: client/src/pages/NumberRanges.tsx
const initializeNumberRanges = async () => {
  const response = await fetch('/api/number-ranges/initialize', {
    method: 'POST'
  });

  const result = await response.json();
  
  if (result.success) {
    // Automatically create transport for number ranges
    await createNumberRangeTransport();
  }

  return result;
};

const createNumberRangeTransport = async () => {
  const numberRangeConfigs = [
    {
      range_id: "GL_ASSET_US01",
      object_type: "GL_ACCOUNT",
      company_code: "US01",
      range_from: 1000000,
      range_to: 1999999,
      current_number: 1000000,
      description: "Asset GL Accounts for US01"
    },
    {
      range_id: "CUST_DOM_US01",
      object_type: "CUSTOMER",
      company_code: "US01",
      range_from: 10000,
      range_to: 69999,
      current_number: 10000,
      prefix: "C",
      description: "Domestic Customers US01"
    }
    // ... additional ranges
  ];

  await fetch('/api/number-ranges/transport-range-config', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      transport_id: 'A1100003',
      range_configs: numberRangeConfigs
    })
  });
};
```

#### 2. Automatic Number Assignment

**Implementation:**
```typescript
// Location: client/src/pages/master-data/Customer.tsx
const createCustomer = async (customerData: CustomerForm) => {
  // Get next customer number automatically
  const numberResponse = await fetch('/api/number-ranges/get-next-number', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      range_id: 'CUST_DOM_US01',
      company_code: 'US01'
    })
  });

  const numberResult = await numberResponse.json();
  
  if (numberResult.success) {
    customerData.customer_number = numberResult.formatted_number;
    
    // Create customer with assigned number
    const response = await fetch('/api/master-data/customers', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(customerData)
    });

    return response.json();
  }
};
```

### Phase 3: Transport Dependencies Management

#### 1. Dependency Validation

**Implementation:**
```javascript
// Location: server/routes/transportDirectRoutes.js
const validateDependencies = async (transportId, dependencies) => {
  for (const dep of dependencies) {
    const depResult = await pool.query(`
      SELECT status FROM transport_requests 
      WHERE request_number = $1
    `, [dep.depends_on_request]);

    if (depResult.rows.length === 0) {
      throw new Error(`Dependency transport ${dep.depends_on_request} not found`);
    }

    const depStatus = depResult.rows[0].status;
    if (!['IMPORTED', 'DEPLOYED'].includes(depStatus)) {
      throw new Error(`Dependency ${dep.depends_on_request} not yet deployed (status: ${depStatus})`);
    }
  }
};

// Add dependencies to transport
router.post('/requests/:id/dependencies', async (req, res) => {
  const { id } = req.params;
  const { dependencies } = req.body;

  try {
    await validateDependencies(id, dependencies);
    
    for (const dep of dependencies) {
      await pool.query(`
        INSERT INTO transport_dependencies (request_id, depends_on_request, dependency_type)
        VALUES ($1, $2, $3)
      `, [id, dep.depends_on_request, dep.dependency_type || 'REQUIRED']);
    }

    res.json({ success: true });
  } catch (error) {
    res.status(400).json({ success: false, error: error.message });
  }
});
```

### Phase 4: GitHub-Integrated Dev → QA → Prod Pipeline

#### 1. GitHub Branch and Pull Request Workflow

**Implementation:**
```typescript
// Location: server/integrations/githubTransportWorkflow.js
const createTransportWorkflow = async (transportRequest) => {
  const { request_number, target_environment, description } = transportRequest;
  
  // 1. Create feature branch for transport
  const branchName = `transport/${request_number.toLowerCase()}`;
  await createGitHubBranch(branchName);
  
  // 2. Generate transport files
  const transportFiles = await generateTransportFiles(transportRequest.id);
  
  // 3. Commit transport files to branch
  await commitTransportFiles(branchName, transportFiles, description);
  
  // 4. Create Pull Request for QA environment
  const prResult = await createPullRequest({
    head: branchName,
    base: 'qa',
    title: `${request_number}: ${description}`,
    body: generatePRDescription(transportRequest)
  });
  
  // 5. Update transport with GitHub metadata
  await updateTransportGitHubInfo(transportRequest.id, {
    github_branch: branchName,
    qa_pr_number: prResult.number,
    qa_pr_url: prResult.html_url
  });
  
  return { branch: branchName, pullRequest: prResult };
};

const generatePRDescription = (transport) => {
  return `
## Transport Request: ${transport.request_number}

**Description:** ${transport.description}

**Objects Included:**
${transport.objects.map(obj => `- ${obj.object_type}: ${obj.object_name}`).join('\n')}

**Deployment Checklist:**
- [ ] QA Database Schema Updated
- [ ] QA Environment Variables Set
- [ ] QA Tests Passed
- [ ] Ready for Production

**Rollback Plan:**
- Branch: \`rollback/${transport.request_number}\`
- Automated rollback available via GitHub Actions
  `;
};
```

#### 2. QA Deployment with Error Handling

**Implementation:**
```typescript
// Location: client/src/pages/Transport.tsx
const deployToQA = async (transportId: number) => {
  try {
    // 1. Merge PR to QA branch
    const mergeResult = await fetch(`/api/github-integration/merge-pr`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        transport_id: transportId,
        target_branch: 'qa',
        merge_method: 'merge'
      })
    });

    if (!mergeResult.ok) {
      throw new Error('Failed to merge PR to QA branch');
    }

    // 2. Trigger QA deployment pipeline
    const deployResult = await fetch(`/api/transport-direct/requests/${transportId}/deploy-qa`, {
      method: 'POST'
    });

    const deployment = await deployResult.json();
    
    if (deployment.success) {
      // 3. Update transport status
      await updateTransportStatus(transportId, 'QA_DEPLOYED', {
        qa_deployed_at: new Date().toISOString(),
        qa_deployment_commit: deployment.commit_sha
      });
      
      // 4. Create Production PR automatically
      await createProductionPR(transportId);
      
    } else {
      // Handle QA deployment failure
      await handleQADeploymentFailure(transportId, deployment.error);
    }

    return deployment;
  } catch (error) {
    await handleQADeploymentFailure(transportId, error.message);
    throw error;
  }
};

const handleQADeploymentFailure = async (transportId: number, errorMessage: string) => {
  // 1. Update transport status to QA_FAILED
  await updateTransportStatus(transportId, 'QA_FAILED', {
    qa_failure_reason: errorMessage,
    qa_failed_at: new Date().toISOString()
  });

  // 2. Create rollback branch automatically
  const rollbackBranch = await createRollbackBranch(transportId);
  
  // 3. Generate error analysis report
  const errorReport = await generateErrorAnalysis(transportId, errorMessage);
  
  // 4. Create GitHub Issue for error tracking
  await createGitHubIssue({
    title: `QA Deployment Failed: Transport ${transportId}`,
    body: `
## QA Deployment Failure

**Transport ID:** ${transportId}
**Error:** ${errorMessage}
**Failed At:** ${new Date().toISOString()}

**Error Analysis:**
${errorReport}

**Resolution Steps:**
1. Review error logs in QA environment
2. Fix issues in transport branch
3. Re-run QA deployment
4. Or execute rollback using branch: \`${rollbackBranch}\`

**Rollback Command:**
\`\`\`bash
git checkout ${rollbackBranch}
git push origin ${rollbackBranch}:qa --force
\`\`\`
    `,
    labels: ['transport-failure', 'qa-deployment', 'urgent']
  });

  // 5. Automatically create rollback PR
  await createRollbackPR(transportId, rollbackBranch);
};
```

#### 3. Error Resolution Workflow

**Fix and Retry Process:**
```typescript
const fixAndRetryQADeployment = async (transportId: number, fixCommitSha: string) => {
  try {
    // 1. Update transport branch with fix
    await fetch('/api/github-integration/update-transport-branch', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        transport_id: transportId,
        fix_commit_sha: fixCommitSha,
        fix_description: 'Applied fixes for QA deployment issues'
      })
    });

    // 2. Re-run QA deployment
    const retryResult = await deployToQA(transportId);
    
    // 3. Update error tracking
    if (retryResult.success) {
      await resolveGitHubIssue(transportId, 'Fixed and successfully deployed to QA');
    }
    
    return retryResult;
  } catch (error) {
    // Log retry failure and escalate
    await escalateTransportIssue(transportId, error.message);
    throw error;
  }
};
```

#### 4. Production Deployment Pipeline

**Implementation:**
```typescript
const deployToProduction = async (transportId: number) => {
  try {
    // 1. Validate QA deployment success
    const qaStatus = await validateQADeployment(transportId);
    if (!qaStatus.isValid) {
      throw new Error('QA deployment validation failed: ' + qaStatus.reason);
    }

    // 2. Create production deployment PR
    const productionPR = await fetch('/api/github-integration/create-production-pr', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        transport_id: transportId,
        qa_commit_sha: qaStatus.commit_sha
      })
    });

    const prResult = await productionPR.json();

    // 3. Require approval for production deployment
    await requestProductionApproval(transportId, prResult.pr_number);

    // 4. Execute production deployment after approval
    const deployResult = await executeProductionDeployment(transportId);
    
    if (deployResult.success) {
      await updateTransportStatus(transportId, 'PROD_DEPLOYED', {
        prod_deployed_at: new Date().toISOString(),
        prod_deployment_commit: deployResult.commit_sha
      });
    } else {
      await handleProductionFailure(transportId, deployResult.error);
    }

    return deployResult;
  } catch (error) {
    await handleProductionFailure(transportId, error.message);
    throw error;
  }
};

const handleProductionFailure = async (transportId: number, errorMessage: string) => {
  // 1. Immediately create emergency rollback
  const emergencyRollback = await createEmergencyRollback(transportId);
  
  // 2. Update transport status
  await updateTransportStatus(transportId, 'PROD_FAILED', {
    prod_failure_reason: errorMessage,
    prod_failed_at: new Date().toISOString(),
    emergency_rollback_branch: emergencyRollback.branch
  });

  // 3. Execute automatic rollback to previous stable state
  const rollbackResult = await executeEmergencyRollback(emergencyRollback.branch);
  
  // 4. Create critical incident GitHub issue
  await createCriticalIncidentIssue(transportId, errorMessage, emergencyRollback);
  
  return rollbackResult;
};
```

#### 5. GitHub-Based Rollback System

**Rollback Branch Creation:**
```typescript
const createRollbackBranch = async (transportId: number) => {
  const transport = await getTransportDetails(transportId);
  const rollbackBranch = `rollback/${transport.request_number}`;
  
  // 1. Get the last stable commit before transport
  const lastStableCommit = await getLastStableCommit('qa');
  
  // 2. Create rollback branch from stable commit
  await fetch('/api/github-integration/create-branch', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      branch_name: rollbackBranch,
      from_commit: lastStableCommit.sha
    })
  });

  // 3. Generate rollback script
  const rollbackScript = generateRollbackScript(transport);
  
  // 4. Commit rollback instructions
  await commitRollbackFiles(rollbackBranch, {
    'rollback-instructions.md': rollbackScript,
    'rollback-data.sql': generateRollbackSQL(transport),
    'rollback-config.json': JSON.stringify(generateRollbackConfig(transport))
  });

  return { branch: rollbackBranch, commit: lastStableCommit.sha };
};

const executeEmergencyRollback = async (rollbackBranch: string) => {
  // 1. Force push rollback branch to production
  await fetch('/api/github-integration/emergency-rollback', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      rollback_branch: rollbackBranch,
      target_environment: 'production',
      force_push: true
    })
  });

  // 2. Execute rollback scripts
  const rollbackResult = await fetch('/api/transport-direct/execute-rollback', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      rollback_branch: rollbackBranch,
      rollback_type: 'EMERGENCY'
    })
  });

  return rollbackResult.json();
};
```

**Rollback Script Generation:**
```typescript
const generateRollbackScript = (transport: TransportRequest) => {
  return `
# Emergency Rollback for Transport ${transport.request_number}

## Overview
This rollback restores the system to the state before transport ${transport.request_number} was deployed.

## Rollback Steps

### 1. Database Rollback
\`\`\`sql
-- Rollback executed objects
${transport.objects.map(obj => generateObjectRollback(obj)).join('\n')}
\`\`\`

### 2. Configuration Rollback
\`\`\`bash
# Restore configuration files
${generateConfigRollback(transport.objects)}
\`\`\`

### 3. Verification Steps
1. Check database integrity: \`npm run verify:database\`
2. Test critical functionality: \`npm run test:critical\`
3. Validate system status: \`npm run health:check\`

## Post-Rollback Actions
- [ ] Verify all systems operational
- [ ] Check dependent transports
- [ ] Update stakeholders
- [ ] Create incident report

## Execution Command
\`\`\`bash
./scripts/execute-rollback.sh ${transport.request_number}
\`\`\`
  `;
};
```

#### 6. Advanced Error Resolution Workflows

**Intelligent Error Analysis:**
```typescript
const generateErrorAnalysis = async (transportId: number, errorMessage: string) => {
  // 1. Analyze error patterns
  const errorPattern = await analyzeErrorPattern(errorMessage);
  
  // 2. Check similar historical issues
  const similarIssues = await findSimilarIssues(errorPattern);
  
  // 3. Generate resolution suggestions
  const resolutionSuggestions = await generateResolutionSuggestions(errorPattern, similarIssues);
  
  return `
## Error Analysis Report

**Error Pattern:** ${errorPattern.category}
**Severity:** ${errorPattern.severity}
**Impact:** ${errorPattern.impact}

### Root Cause Analysis
${errorPattern.rootCause}

### Similar Historical Issues
${similarIssues.map(issue => `- ${issue.transport_id}: ${issue.resolution}`).join('\n')}

### Recommended Resolution Steps
${resolutionSuggestions.map((step, index) => `${index + 1}. ${step}`).join('\n')}

### Prevention Measures
${errorPattern.preventionMeasures.join('\n')}
  `;
};

const escalateTransportIssue = async (transportId: number, errorMessage: string) => {
  // 1. Create high-priority GitHub issue
  await createGitHubIssue({
    title: `ESCALATED: Transport ${transportId} Critical Failure`,
    body: `
## Critical Transport Failure - Immediate Attention Required

**Transport ID:** ${transportId}
**Escalation Reason:** Multiple deployment failures
**Current Status:** FAILED - Requires manual intervention

### Error Details
${errorMessage}

### Escalation Actions Taken
- [x] Automatic rollback attempted
- [x] Error analysis generated
- [x] Rollback branch created
- [ ] Manual resolution required

### Next Steps Required
1. Review error analysis report
2. Apply manual fixes to transport branch
3. Test fixes in isolated environment
4. Re-run deployment pipeline
5. Monitor deployment closely

**Assigned to:** DevOps Team, Transport Manager
**Priority:** P0 - Critical
    `,
    labels: ['escalated', 'transport-critical', 'p0-urgent'],
    assignees: ['devops-team', 'transport-manager']
  });

  // 2. Send notification to critical channels
  await sendCriticalNotification(transportId, errorMessage);
  
  // 3. Create emergency response plan
  await createEmergencyResponsePlan(transportId);
};
```

#### 7. Multi-Environment Rollback Strategies

**QA Environment Rollback:**
```typescript
const rollbackQAEnvironment = async (transportId: number) => {
  try {
    // 1. Create QA rollback branch
    const rollbackBranch = `qa-rollback/${transportId}`;
    await createRollbackBranch(transportId, 'qa', rollbackBranch);
    
    // 2. Reset QA branch to pre-transport state
    const preTransportCommit = await getPreTransportCommit(transportId, 'qa');
    await resetBranchToCommit('qa', preTransportCommit.sha);
    
    // 3. Execute database rollback
    const dbRollback = await executeDBRollback(transportId, 'qa');
    
    // 4. Validate QA environment
    const validationResult = await validateEnvironment('qa');
    
    if (validationResult.success) {
      await updateTransportStatus(transportId, 'QA_ROLLED_BACK', {
        qa_rollback_commit: preTransportCommit.sha,
        qa_rollback_at: new Date().toISOString()
      });
    }
    
    return { success: true, rollbackBranch, preTransportCommit };
  } catch (error) {
    throw new Error(`QA rollback failed: ${error.message}`);
  }
};
```

**Production Environment Emergency Rollback:**
```typescript
const emergencyProductionRollback = async (transportId: number) => {
  // 1. Immediate system snapshot
  const systemSnapshot = await createSystemSnapshot('production');
  
  // 2. Execute hot rollback (zero downtime)
  const hotRollback = await executeHotRollback(transportId);
  
  // 3. Parallel database rollback
  const dbRollbackPromise = executeDBRollback(transportId, 'production');
  
  // 4. Configuration rollback
  const configRollbackPromise = rollbackConfiguration(transportId, 'production');
  
  // 5. Wait for all rollbacks to complete
  const [dbResult, configResult] = await Promise.all([
    dbRollbackPromise,
    configRollbackPromise
  ]);
  
  // 6. Verify system integrity
  const integrityCheck = await verifySystemIntegrity('production');
  
  if (integrityCheck.success) {
    await updateTransportStatus(transportId, 'PROD_EMERGENCY_ROLLBACK', {
      prod_rollback_snapshot: systemSnapshot.id,
      prod_rollback_at: new Date().toISOString(),
      rollback_verification: integrityCheck.report
    });
    
    // 7. Create incident report
    await createIncidentReport(transportId, systemSnapshot, integrityCheck);
  }
  
  return {
    success: integrityCheck.success,
    snapshot: systemSnapshot,
    rollback_details: { dbResult, configResult, integrityCheck }
  };
};
```

### Phase 5: GitHub Integration

#### 1. Automatic Branch Creation

**Implementation:**
```javascript
// Location: server/integrations/githubIntegration.js
const createTransportBranch = async (transportNumber, targetEnvironment) => {
  const branchName = `transport/${transportNumber.toLowerCase()}-${targetEnvironment.toLowerCase()}`;
  
  try {
    // Create branch
    const response = await fetch(`${GITHUB_API_BASE}/repos/${owner}/${repo}/git/refs`, {
      method: 'POST',
      headers: {
        'Authorization': `token ${process.env.GITHUB_TOKEN}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        ref: `refs/heads/${branchName}`,
        sha: await getMainBranchSHA()
      })
    });

    if (response.ok) {
      return { success: true, branch: branchName };
    } else {
      throw new Error(`Failed to create branch: ${response.statusText}`);
    }
  } catch (error) {
    return { success: false, error: error.message };
  }
};

// Integrate with transport creation
router.post('/requests', async (req, res) => {
  // ... existing transport creation code ...

  // Create GitHub branch automatically
  if (process.env.GITHUB_INTEGRATION_ENABLED === 'true') {
    const branchResult = await createTransportBranch(transportNumber, req.body.target_environment);
    
    if (branchResult.success) {
      await pool.query(`
        UPDATE transport_requests 
        SET github_branch = $1 
        WHERE id = $2
      `, [branchResult.branch, transport.id]);
    }
  }

  // ... rest of the code ...
});
```

#### 2. Transport File Generation

**Implementation:**
```javascript
// Location: server/transport/transportFileGenerator.js
const generateTransportFiles = async (transportId) => {
  const transport = await getTransportDetails(transportId);
  const objects = await getTransportObjects(transportId);

  const transportMetadata = {
    transport_number: transport.request_number,
    description: transport.description,
    created_at: transport.created_at,
    target_environment: transport.target_environment,
    objects: objects.map(obj => ({
      type: obj.object_type,
      name: obj.object_name,
      table: obj.table_name,
      action: obj.action
    }))
  };

  const files = {
    'transport-metadata.json': JSON.stringify(transportMetadata, null, 2),
    'deployment-instructions.md': generateDeploymentInstructions(transport),
    'rollback-plan.md': generateRollbackPlan(transport)
  };

  // Add data files for each object type
  const objectsByType = groupBy(objects, 'object_type');
  
  for (const [objectType, typeObjects] of Object.entries(objectsByType)) {
    const fileName = `${objectType.toLowerCase().replace('_', '-')}.json`;
    files[fileName] = JSON.stringify(
      typeObjects.map(obj => obj.data_snapshot), 
      null, 
      2
    );
  }

  return files;
};
```

## Best Practices for Developers

### 1. Transport Creation Workflow

```typescript
// Always follow this sequence:
1. Create master data objects in UI
2. Add objects to active transport
3. Validate dependencies
4. Release transport
5. Deploy to QA
6. Handle any failures
7. Approve for production

// Example implementation:
const transportWorkflow = async () => {
  // Step 1: Create transport
  const transport = await createTransport({
    description: "My Transport Description",
    target_environment: "QA"
  });

  // Step 2: Add objects
  await addObjectsToTransport(transport.id, objects);

  // Step 3: Add dependencies
  await addDependencies(transport.id, dependencies);

  // Step 4: Release
  await releaseTransport(transport.id);

  // Step 5: Deploy
  await deployToQA(transport.id);
};
```

### 2. Error Handling

```typescript
// Always implement comprehensive error handling
const safeTransportOperation = async (operation: () => Promise<any>) => {
  try {
    return await operation();
  } catch (error) {
    // Log error
    console.error('Transport operation failed:', error);
    
    // Update transport status
    await updateTransportStatus(transportId, 'FAILED', error.message);
    
    // Create failure log
    await createFailureLog(transportId, error);
    
    // Generate rollback plan
    await createRollbackPlan(transportId);
    
    throw error;
  }
};
```

### 3. Testing Transport Objects

```typescript
// Always test transport objects before release
const validateTransportObjects = async (transportId: number) => {
  const objects = await getTransportObjects(transportId);
  
  for (const obj of objects) {
    // Validate data structure
    if (!obj.data_snapshot || typeof obj.data_snapshot !== 'object') {
      throw new Error(`Invalid data for object ${obj.object_name}`);
    }
    
    // Validate required fields
    const requiredFields = getRequiredFields(obj.object_type);
    for (const field of requiredFields) {
      if (!obj.data_snapshot[field]) {
        throw new Error(`Missing required field ${field} for object ${obj.object_name}`);
      }
    }
    
    // Validate business rules
    await validateBusinessRules(obj);
  }
};
```

## Transport Object Types Reference

### Master Data Objects
- `COMPANY_CODE` → `company_codes` table
- `PLANT` → `plants` table
- `STORAGE_LOCATION` → `storage_locations` table
- `CUSTOMER` → `customers` table
- `VENDOR` → `vendors` table
- `MATERIAL` → `materials` table

### Configuration Objects
- `NUMBER_RANGE` → `number_ranges` table
- `CHART_OF_ACCOUNTS` → `chart_of_accounts` table
- `COST_CENTER` → `cost_centers` table
- `PROFIT_CENTER` → `profit_centers` table

### Transactional Objects
- `SALES_ORDER` → `sales_orders` table
- `PURCHASE_ORDER` → `purchase_orders` table
- `PRODUCTION_ORDER` → `production_orders` table

This comprehensive implementation guide provides developers with all the necessary technical details to create, manage, and deploy transport objects effectively in the MallyERP system.