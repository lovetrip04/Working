/**
 * Approver Agent System
 * Purpose: Prevent unnecessary changes to working code
 * Ensures changes are strictly limited to what the user requested
 */

class ApproverAgent {
  constructor() {
    this.approvalHistory = [];
    this.rejectionHistory = [];
  }

  /**
   * Reviews proposed changes against user request
   * @param {Object} changeRequest - Details of proposed changes
   * @param {string} originalUserRequest - What the user actually asked for
   * @returns {Object} - Approval decision with reasoning
   */
  reviewChangeRequest(changeRequest, originalUserRequest) {
    const timestamp = new Date().toISOString();
    
    const review = {
      timestamp,
      originalRequest: originalUserRequest,
      proposedChanges: changeRequest.changes,
      files: changeRequest.files,
      approved: false,
      reasoning: "",
      recommendations: []
    };

    // Core validation rules
    const validationResults = this.validateChanges(changeRequest, originalUserRequest);
    
    if (validationResults.approved) {
      review.approved = true;
      review.reasoning = validationResults.reasoning;
      this.approvalHistory.push(review);
      console.log(`✅ APPROVED: ${validationResults.reasoning}`);
    } else {
      review.approved = false;
      review.reasoning = validationResults.reasoning;
      review.recommendations = validationResults.recommendations;
      this.rejectionHistory.push(review);
      console.log(`❌ REJECTED: ${validationResults.reasoning}`);
    }

    return review;
  }

  /**
   * Core validation logic
   */
  validateChanges(changeRequest, originalUserRequest) {
    const { changes, files, description } = changeRequest;
    
    // **PRIMARY RULE: NO SAP TERMS OR WORDS - HIGHEST PRIORITY**
    if (this.containsSAPTerms(description, files, changes)) {
      return {
        approved: false,
        reasoning: "**CRITICAL VIOLATION**: Code contains SAP terms or references. This is strictly forbidden.",
        recommendations: [
          "Remove all SAP terminology immediately", 
          "Use generic business terms only",
          "Replace any SAP-specific concepts with universal business language"
        ]
      };
    }
    
    // Rule 1: Changes must directly address the user's request
    if (!this.isDirectlyRelated(description, originalUserRequest)) {
      return {
        approved: false,
        reasoning: "Proposed changes do not directly address the user's specific request",
        recommendations: ["Focus only on the exact issue mentioned by the user"]
      };
    }

    // Rule 2: Do not modify working functionality unless explicitly requested
    if (this.touchesWorkingCode(files, originalUserRequest)) {
      return {
        approved: false,
        reasoning: "Changes would modify working code that was not mentioned in the user's request",
        recommendations: ["Only modify code that is specifically broken or requested to be changed"]
      };
    }

    // Rule 3: No "improvements" or "enhancements" unless asked
    if (this.isUnnecessaryImprovement(description, originalUserRequest)) {
      return {
        approved: false,
        reasoning: "Proposed changes include improvements not requested by the user",
        recommendations: ["Remove any enhancements or optimizations not specifically requested"]
      };
    }

    // Rule 4: No bulk changes across multiple modules unless required
    if (this.isBulkChange(files) && !this.requiresBulkChanges(originalUserRequest)) {
      return {
        approved: false,
        reasoning: "Bulk changes across multiple modules not justified by user request",
        recommendations: ["Limit changes to the specific module or component mentioned"]
      };
    }

    return {
      approved: true,
      reasoning: "Changes are directly related to user request and do not touch working code unnecessarily"
    };
  }

  /**
   * Check if changes directly relate to user request
   */
  isDirectlyRelated(description, userRequest) {
    const userKeywords = this.extractKeywords(userRequest.toLowerCase());
    const changeKeywords = this.extractKeywords(description.toLowerCase());
    
    // At least 60% keyword overlap required
    const overlap = userKeywords.filter(keyword => 
      changeKeywords.some(changeKeyword => 
        changeKeyword.includes(keyword) || keyword.includes(changeKeyword)
      )
    );
    
    return overlap.length >= userKeywords.length * 0.6;
  }

  /**
   * Check if changes touch working code unnecessarily
   */
  touchesWorkingCode(files, userRequest) {
    // If user specifically mentioned files/modules, those are safe to modify
    const mentionedInRequest = this.extractMentionedFiles(userRequest);
    
    return files.some(file => {
      // If file is mentioned in request, it's safe to modify
      if (mentionedInRequest.some(mentioned => file.includes(mentioned))) {
        return false;
      }
      
      // If file contains working functionality not related to the issue
      return this.isWorkingFunctionality(file, userRequest);
    });
  }

  /**
   * Check if changes are unnecessary improvements
   */
  isUnnecessaryImprovement(description, userRequest) {
    const improvementWords = [
      'enhance', 'improve', 'optimize', 'refactor', 'upgrade', 
      'modernize', 'beautify', 'clean up', 'better', 'best practice'
    ];
    
    const hasImprovementWords = improvementWords.some(word => 
      description.toLowerCase().includes(word)
    );
    
    const userRequestedImprovement = improvementWords.some(word =>
      userRequest.toLowerCase().includes(word)
    );
    
    return hasImprovementWords && !userRequestedImprovement;
  }

  /**
   * Check if this is a bulk change
   */
  isBulkChange(files) {
    return files.length > 3; // More than 3 files = bulk change
  }

  /**
   * Check if user request requires bulk changes
   */
  requiresBulkChanges(userRequest) {
    const bulkKeywords = ['all', 'every', 'across', 'throughout', 'system-wide', 'globally'];
    return bulkKeywords.some(keyword => userRequest.toLowerCase().includes(keyword));
  }

  /**
   * Extract keywords from text
   */
  extractKeywords(text) {
    return text
      .replace(/[^\w\s]/g, ' ')
      .split(/\s+/)
      .filter(word => word.length > 3)
      .filter(word => !['this', 'that', 'with', 'have', 'will', 'been', 'from'].includes(word));
  }

  /**
   * Extract mentioned files/modules from user request
   */
  extractMentionedFiles(userRequest) {
    const patterns = [
      /(\w+\.tsx?)/g,
      /(\w+\s+module)/gi,
      /(\w+\s+component)/gi,
      /(\w+\s+page)/gi
    ];
    
    const mentioned = [];
    patterns.forEach(pattern => {
      const matches = userRequest.match(pattern);
      if (matches) {
        mentioned.push(...matches);
      }
    });
    
    return mentioned;
  }

  /**
   * **PRIMARY VALIDATION: Check for SAP terms - HIGHEST PRIORITY**
   */
  containsSAPTerms(description, files, changes) {
    const sapTerms = [
      // Core SAP terms
      'sap', 'abap', 'hana', 'fiori', 'ui5', 'basis', 'netweaver',
      // SAP modules
      'fico', 'co', 'fi', 'mm', 'sd', 'pp', 'hr', 'pm', 'qm', 'ps',
      // SAP technical terms
      'bapi', 'badi', 'rfc', 'idoc', 'ale', 'edi', 'lsmw', 'smartforms',
      // SAP business terms  
      'migo', 'me21n', 'va01', 'vf01', 'fb01', 'fs00', 'mb51', 'md04',
      // SAP organizational
      'client', 'mandant', 'bukrs', 'werks', 'vkorg', 'vtweg', 'spart',
      // SAP data terms
      'mandt', 'spras', 'waers', 'meins', 'kunnr', 'lifnr', 'matnr',
      // SAP table names (standard tables)
      'mara', 'marc', 'mard', 'mbew', 'makt', 'vbak', 'vbap', 'likp', 'lips',
      'ekko', 'ekpo', 'eban', 'mseg', 'mkpf', 'bkpf', 'bseg', 'kna1', 'knb1',
      'lfa1', 'lfb1', 't001', 't001k', 't001l', 't024', 't024e', 'skb1',
      // Other SAP references
      'transaction', 'tcode', 'customizing', 'IMG', 'spro'
    ];
    
    const allText = [description, ...files, ...changes].join(' ').toLowerCase();
    
    // Check for explicit SAP terms
    for (const term of sapTerms) {
      if (allText.includes(term.toLowerCase())) {
        console.log(`🚨 SAP TERM DETECTED: "${term}" found in proposed changes`);
        return true;
      }
    }
    
    // Check for SAP naming conventions (Z* and Y* custom objects)
    const sapNamingPatterns = [
      /\bz[a-z0-9_]+/gi,  // Z custom objects (tables, programs, etc.)
      /\by[a-z0-9_]+/gi   // Y custom objects (tables, programs, etc.)
    ];
    
    for (const pattern of sapNamingPatterns) {
      const matches = allText.match(pattern);
      if (matches && matches.length > 0) {
        console.log(`🚨 SAP NAMING CONVENTION DETECTED: "${matches[0]}" found in proposed changes`);
        return true;
      }
    }
    
    return false;
  }

  /**
   * Check if file contains working functionality
   */
  isWorkingFunctionality(file, userRequest) {
    // If the user mentioned an error or issue in this file, it's not working
    const hasErrorMention = userRequest.toLowerCase().includes('error') || 
                           userRequest.toLowerCase().includes('issue') ||
                           userRequest.toLowerCase().includes('problem') ||
                           userRequest.toLowerCase().includes('fix');
    
    if (hasErrorMention && userRequest.toLowerCase().includes(file.toLowerCase())) {
      return false; // Not working, safe to modify
    }
    
    return true; // Assume it's working unless proven otherwise
  }

  /**
   * Get approval summary
   */
  getSummary() {
    return {
      totalRequests: this.approvalHistory.length + this.rejectionHistory.length,
      approved: this.approvalHistory.length,
      rejected: this.rejectionHistory.length,
      approvalRate: this.approvalHistory.length / (this.approvalHistory.length + this.rejectionHistory.length) * 100
    };
  }

  /**
   * Clear history
   */
  clearHistory() {
    this.approvalHistory = [];
    this.rejectionHistory = [];
  }
}

// Global instance
const approverAgent = new ApproverAgent();

/**
 * Main approval function to be called before making any changes
 */
function requestApproval(changeRequest, originalUserRequest) {
  console.log('\n🔍 APPROVER AGENT: Reviewing proposed changes...');
  console.log(`📝 User Request: ${originalUserRequest}`);
  console.log(`🔧 Proposed Changes: ${changeRequest.description}`);
  console.log(`📁 Files to modify: ${changeRequest.files.join(', ')}`);
  
  const decision = approverAgent.reviewChangeRequest(changeRequest, originalUserRequest);
  
  if (!decision.approved) {
    console.log(`\n💡 Recommendations:`);
    decision.recommendations.forEach(rec => console.log(`   • ${rec}`));
  }
  
  return decision;
}

module.exports = {
  ApproverAgent,
  approverAgent,
  requestApproval
};