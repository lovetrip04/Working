# HR Business Domain Flow Chart

## Employee Lifecycle Management

```mermaid
flowchart TD
    A[Recruitment Need] --> B[Job Posting]
    B --> C[Application Collection]
    C --> D[Resume Screening]
    D --> E[Interview Process]
    E --> F{Candidate Selected?}
    F -->|Yes| G[Job Offer]
    F -->|No| H[Candidate Pool]
    
    G --> I[Offer Acceptance]
    I --> J{Offer Accepted?}
    J -->|Yes| K[Onboarding Process]
    J -->|No| L[Return to Pool]
    
    K --> M[Employee Master Creation]
    M --> N[System Access Setup]
    N --> O[Training Assignment]
    O --> P[Probation Period]
    P --> Q[Regular Employee]
    
    Q --> R[Performance Management]
    R --> S[Career Development]
    S --> T[Employee Development]
    T --> U{Employment Status}
    U -->|Active| V[Continue Employment]
    U -->|Termination| W[Offboarding Process]
    
    V --> X[Annual Review]
    X --> R
    W --> Y[Exit Interview]
    Y --> Z[Final Settlement]
    Z --> AA[Employee Record Closure]
    
    style A fill:#e3f2fd
    style AA fill:#c8e6c9
    style H fill:#ffeb3b
    style L fill:#ffeb3b
```

## Payroll Processing Flow

```mermaid
flowchart TD
    A[Payroll Period Start] --> B[Time & Attendance Collection]
    B --> C[Leave Management Integration]
    C --> D[Overtime Calculation]
    D --> E[Allowance & Benefits]
    E --> F[Gross Pay Calculation]
    
    F --> G[Tax Deductions]
    G --> H[Insurance Deductions]
    H --> I[Loan Deductions]
    I --> J[Other Deductions]
    J --> K[Net Pay Calculation]
    
    K --> L[Payroll Validation]
    L --> M{Validation Pass?}
    M -->|Yes| N[Payroll Approval]
    M -->|No| O[Correction Required]
    O --> P[Adjust Calculations]
    P --> F
    
    N --> Q[Bank File Generation]
    Q --> R[Payslip Generation]
    R --> S[Tax Filing Preparation]
    S --> T[Statutory Compliance]
    T --> U[Payroll Completion]
    
    U --> V[GL Posting]
    V --> W[Cost Center Assignment]
    W --> X[Management Reporting]
    
    style A fill:#e3f2fd
    style X fill:#c8e6c9
    style O fill:#ff9800
```

## Performance Management Process

```mermaid
flowchart TD
    A[Performance Cycle Start] --> B[Goal Setting]
    B --> C[KPI Definition]
    C --> D[Performance Standards]
    D --> E[Regular Check-ins]
    
    E --> F[Quarterly Reviews]
    F --> G[360-Degree Feedback]
    G --> H[Self-Assessment]
    H --> I[Manager Assessment]
    I --> J[Performance Rating]
    
    J --> K{Performance Level}
    K -->|Exceeds| L[Recognition & Rewards]
    K -->|Meets| M[Standard Review]
    K -->|Below| N[Performance Improvement Plan]
    
    L --> O[Promotion Consideration]
    M --> P[Maintain Performance]
    N --> Q[Additional Training]
    Q --> R[Monitor Progress]
    R --> S[Re-evaluation]
    S --> T{Improvement?}
    T -->|Yes| M
    T -->|No| U[HR Intervention]
    
    O --> V[Career Development]
    P --> V
    U --> W[Disciplinary Action]
    V --> X[Annual Performance Cycle]
    W --> Y[Performance Documentation]
    X --> A
    Y --> Z[HR Records]
    
    style A fill:#e3f2fd
    style V fill:#c8e6c9
    style W fill:#ffcdd2
```

## Leave Management Workflow

```mermaid
flowchart TD
    A[Leave Request] --> B[Leave Type Selection]
    B --> C{Leave Type}
    C -->|Annual| D[Annual Leave Balance Check]
    C -->|Sick| E[Medical Certificate Required]
    C -->|Maternity| F[Maternity Entitlement]
    C -->|Emergency| G[Emergency Leave Policy]
    
    D --> H{Balance Available?}
    E --> I[Medical Documentation]
    F --> J[Maternity Documentation]
    G --> K[Emergency Approval]
    
    H -->|Yes| L[Manager Approval]
    H -->|No| M[Insufficient Balance]
    I --> N[HR Review]
    J --> O[Legal Compliance Check]
    K --> P[Immediate Processing]
    
    L --> Q{Manager Approved?}
    N --> Q
    O --> Q
    P --> R[Leave Approved]
    
    Q -->|Yes| R
    Q -->|No| S[Leave Rejected]
    
    R --> T[Update Leave Balance]
    T --> U[Calendar Update]
    U --> V[Payroll Integration]
    V --> W[Leave Processing Complete]
    
    S --> X[Notification to Employee]
    M --> X
    X --> Y[Request Closure]
    
    style A fill:#e3f2fd
    style W fill:#c8e6c9
    style S fill:#ffcdd2
    style M fill:#ffcdd2
```

## Training and Development Flow

```mermaid
flowchart TD
    A[Training Need Assessment] --> B[Skills Gap Analysis]
    B --> C[Training Program Design]
    C --> D[Training Calendar]
    D --> E[Employee Nomination]
    
    E --> F[Training Approval]
    F --> G{Approved?}
    G -->|Yes| H[Training Registration]
    G -->|No| I[Training Declined]
    
    H --> J[Pre-training Assessment]
    J --> K[Training Delivery]
    K --> L[Training Completion]
    L --> M[Post-training Assessment]
    
    M --> N[Knowledge Transfer]
    N --> O[Application on Job]
    O --> P[Performance Improvement]
    P --> Q[Training Effectiveness]
    
    Q --> R{Training Effective?}
    R -->|Yes| S[Training Success]
    R -->|No| T[Additional Training]
    T --> U[Modified Approach]
    U --> K
    
    S --> V[Skill Development Record]
    V --> W[Career Path Update]
    W --> X[Succession Planning]
    I --> Y[Training Record]
    
    style A fill:#e3f2fd
    style X fill:#c8e6c9
    style I fill:#ffcdd2
```