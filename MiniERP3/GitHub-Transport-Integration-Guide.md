# GitHub Integration for Transport Requests

## Overview

The GitHub Integration system allows you to connect your own GitHub repositories to the MallyERP transport system. This enables automatic version control, code review workflows, and deployment tracking for your ERP configuration changes.

## How It Works

### 1. Repository Connection
- Connect your GitHub repository to the transport system
- Provide repository details and access permissions
- Configure environment mappings (DEV → QA → PROD)
- Set up automated workflows

### 2. Automatic Branch Creation
When you create a transport request, the system automatically:
- Creates a feature branch named `transport/[transport-number]-[environment]`
- Example: `transport/a1100001-qa`
- Branches from your main/master branch

### 3. Configuration File Generation
The system generates structured configuration files for each transport object:
```
config/
├── master-data/
│   ├── company-code-us01.json
│   └── plant-p001.json
├── transactional/
│   ├── sales-order-12345.json
│   └── purchase-order-67890.json
└── transport-manifest.json
```

### 4. Automated Commits
Configuration changes are automatically committed to the transport branch with:
- Complete object snapshots (before/after data)
- Transport metadata and audit information
- Structured JSON format for easy processing

### 5. Pull Request Creation
Automatically creates pull requests with:
- Transport request details as PR description
- Links to transport logs and audit trails
- Environment-specific deployment instructions
- Code review assignments

### 6. Deployment Tracking
Tracks deployment status through GitHub webhooks:
- Branch creation status
- Pull request reviews and approvals
- Merge status and deployment confirmations
- Error handling and rollback procedures

## Setup Process

### Step 1: Prepare Your GitHub Repository

1. **Create Repository** (if not exists)
   ```bash
   # Create new repository on GitHub
   # or use existing repository
   ```

2. **Generate Personal Access Token**
   - Go to GitHub Settings → Developer settings → Personal access tokens
   - Create token with these permissions:
     - `repo` (Full control of private repositories)
     - `workflow` (Update GitHub Action workflows)
     - `admin:repo_hook` (Admin access to repository hooks)

3. **Repository Structure** (recommended)
   ```
   your-repo/
   ├── config/           # ERP configurations
   ├── deployments/      # Deployment scripts
   ├── docs/            # Documentation
   └── .github/
       └── workflows/   # GitHub Actions
   ```

### Step 2: Register Repository in MallyERP

1. **Navigate to Transport Admin**
   - Go to Transport → Admin → GitHub Integration

2. **Add Repository**
   ```json
   {
     "repositoryName": "your-erp-config",
     "repositoryUrl": "https://github.com/username/your-erp-config",
     "ownerUsername": "your-github-username",
     "accessToken": "ghp_xxxxxxxxxxxxxxxxxxxx",
     "defaultBranch": "main",
     "environmentMapping": {
       "DEV": "development",
       "QA": "staging", 
       "PROD": "production"
     },
     "autoCreatePR": true,
     "autoMergeApproved": false
   }
   ```

3. **Test Connection**
   - System validates repository access
   - Checks permissions and branch existence
   - Confirms webhook setup capability

### Step 3: Configure Environment Mappings

Map MallyERP environments to GitHub branches/deployments:

```json
{
  "environmentMapping": {
    "DEV": {
      "branch": "development",
      "deploymentUrl": "https://dev.yourcompany.com",
      "autoDeployOnMerge": true
    },
    "QA": {
      "branch": "staging",
      "deploymentUrl": "https://qa.yourcompany.com", 
      "autoDeployOnMerge": false,
      "requiresApproval": true
    },
    "PROD": {
      "branch": "production",
      "deploymentUrl": "https://prod.yourcompany.com",
      "autoDeployOnMerge": false,
      "requiresApproval": true,
      "requiredReviewers": ["senior-dev", "ops-team"]
    }
  }
}
```

## Transport Workflow with GitHub

### Creating Transport with GitHub Integration

1. **Create Transport Request**
   - Select objects (Company Codes, Plants, Materials, etc.)
   - Add description and target environment
   - Enable GitHub integration option

2. **Automatic GitHub Actions**
   ```
   Transport A1100001 Created
   ↓
   GitHub Branch: transport/a1100001-qa
   ↓
   Configuration Files Generated
   ↓
   Files Committed to Branch
   ↓
   Pull Request Created
   ```

3. **Configuration File Structure**
   ```json
   {
     "objectType": "Master Data",
     "objectName": "Company Code US01", 
     "tableName": "company_codes",
     "configuration": {
       "id": 1,
       "code": "US01",
       "name": "US Operations",
       "currency": "USD",
       "country": "US"
     },
     "transportMetadata": {
       "transportId": "A1100001",
       "generatedAt": "2025-06-03T17:30:00Z",
       "version": "1.0",
       "environment": "QA"
     }
   }
   ```

### Pull Request Content

Pull requests include comprehensive information:

```markdown
## Transport A1100001: Update Company Code Configuration

**Transport Details:**
- Number: A1100001
- Type: Manual Transport
- Target Environment: QA
- Owner: System Administrator

**Objects Modified:**
- Company Code US01 (company_codes)
- Plant P001 (plants) 
- Storage Location WH01 (storage_locations)

**Changes Summary:**
- Updated company code currency settings
- Modified plant capacity information
- Added new storage location configuration

**Deployment Instructions:**
1. Review configuration changes in files
2. Validate against QA environment requirements
3. Approve pull request to trigger deployment
4. Monitor deployment logs for success confirmation

**Rollback Plan:**
- Previous configurations saved in transport logs
- Automated rollback available via transport system
- Manual rollback instructions in /docs/rollback.md
```

## GitHub Actions Integration

### Sample Workflow File

Create `.github/workflows/erp-deployment.yml`:

```yaml
name: ERP Configuration Deployment

on:
  pull_request:
    branches: [ staging, production ]
  push:
    branches: [ staging, production ]

jobs:
  validate-config:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Validate Configuration Files
        run: |
          # Validate JSON structure
          find config/ -name "*.json" -exec jq empty {} \;
          
      - name: Check Transport Manifest
        run: |
          # Validate transport manifest
          jq '.transportId' transport-manifest.json
          
  deploy-to-environment:
    needs: validate-config
    runs-on: ubuntu-latest
    if: github.event_name == 'push'
    steps:
      - uses: actions/checkout@v3
      
      - name: Deploy to Environment
        run: |
          # Your deployment script
          ./deployments/deploy.sh ${{ github.ref_name }}
          
      - name: Notify MallyERP
        run: |
          # Webhook back to MallyERP
          curl -X POST "${{ secrets.MALLYERP_WEBHOOK_URL }}" \
            -H "Content-Type: application/json" \
            -d '{"status": "deployed", "environment": "${{ github.ref_name }}", "commit": "${{ github.sha }}"}'
```

## Webhook Integration

### MallyERP Webhooks to GitHub

Automatically triggered events:
- Transport creation → Branch creation
- Transport release → Pull request creation  
- Transport approval → Merge request
- Transport deployment → Status update

### GitHub Webhooks to MallyERP

Configure repository webhooks for:
- Pull request events (opened, reviewed, merged)
- Push events (deployment confirmations)
- Deployment status updates
- Branch protection rule enforcement

## Security Considerations

### Access Token Management
- Use fine-grained personal access tokens
- Rotate tokens regularly (recommended: 90 days)
- Store tokens encrypted in database
- Never expose tokens in logs or UI

### Repository Permissions
- Minimum required permissions only
- Repository-specific tokens preferred
- Branch protection rules enforced
- Required status checks configured

### Data Protection
- Configuration files contain sensitive data
- Use private repositories only
- Implement proper access controls
- Audit trail for all changes

## Error Handling and Troubleshooting

### Common Issues

1. **Repository Access Denied**
   - Verify access token permissions
   - Check repository visibility settings
   - Confirm user has repository access

2. **Branch Creation Failed**
   - Check if branch already exists
   - Verify base branch availability
   - Confirm push permissions

3. **Pull Request Creation Failed**
   - Validate branch has commits
   - Check for existing open PR
   - Verify repository settings

### Error Recovery

Automatic retry mechanisms for:
- Network connectivity issues
- Temporary GitHub API rate limits
- Transient authentication failures

Manual recovery options:
- Retry failed operations from transport interface
- Manual branch/PR creation with generated files
- Export configuration files for manual processing

## Best Practices

### Repository Organization
- Separate repositories for different environments
- Use consistent naming conventions
- Implement proper branching strategy
- Maintain comprehensive documentation

### Code Review Process
- Require peer reviews for all changes
- Use environment-specific reviewers
- Implement automated testing where possible
- Document approval criteria

### Deployment Strategy
- Blue-green deployments for production
- Staged rollouts for critical changes
- Automated rollback capabilities
- Comprehensive monitoring and alerting

### Compliance and Auditing
- Maintain complete audit trails
- Document all configuration changes
- Implement approval workflows
- Regular access reviews and updates

---

This GitHub integration provides enterprise-grade version control and deployment management for your ERP system configurations, ensuring proper change management and traceability for all transport requests.