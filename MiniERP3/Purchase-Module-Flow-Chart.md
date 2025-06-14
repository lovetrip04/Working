# Purchase Module Flow Chart

## Procure to Pay Complete Process Flow

```mermaid
flowchart TD
    A[Purchase Requirement] --> B{Requirement Type}
    B -->|Material| C[Material Requirement Planning]
    B -->|Service| D[Service Requisition]
    B -->|Asset| E[Asset Purchase Request]
    
    C --> F[Purchase Requisition Creation]
    D --> F
    E --> F
    
    F --> G[Requisition Approval]
    G --> H{Approved?}
    H -->|Yes| I[Vendor Selection]
    H -->|No| J[Requisition Revision]
    J --> F
    
    I --> K[RFQ Process]
    K --> L[Vendor Quotes Evaluation]
    L --> M[Purchase Order Creation]
    M --> N[PO Approval Workflow]
    N --> O{PO Approved?}
    O -->|Yes| P[Send PO to Vendor]
    O -->|No| Q[PO Revision]
    Q --> M
    
    P --> R[Goods Receipt]
    R --> S[Quality Inspection]
    S --> T{Quality OK?}
    T -->|Yes| U[Goods Receipt Posting]
    T -->|No| V[Return to Vendor]
    V --> W[Credit Note Processing]
    
    U --> X[Invoice Receipt]
    X --> Y[3-Way Matching]
    Y --> Z{Matching OK?}
    Z -->|Yes| AA[Invoice Approval]
    Z -->|No| BB[Invoice Hold]
    BB --> CC[Resolve Discrepancies]
    CC --> Y
    
    AA --> DD[Payment Processing]
    DD --> EE[Vendor Payment]
    EE --> FF[Purchase Cycle Complete]
    
    style A fill:#e3f2fd
    style FF fill:#c8e6c9
    style H fill:#fff3e0
    style O fill:#fff3e0
    style T fill:#fff3e0
    style Z fill:#fff3e0
```

## Purchase Requisition Workflow

```mermaid
flowchart TD
    A[User Creates Requisition] --> B[Select Material/Service]
    B --> C[Specify Quantity & Delivery Date]
    C --> D[Add Cost Center/Account Assignment]
    D --> E[Submit for Approval]
    
    E --> F{Approval Required?}
    F -->|Yes| G[Route to Approver]
    F -->|No| H[Auto-Approved]
    
    G --> I[Approver Review]
    I --> J{Approved?}
    J -->|Yes| K[Requisition Approved]
    J -->|No| L[Requisition Rejected]
    J -->|Revise| M[Return for Revision]
    
    H --> K
    M --> N[User Revises]
    N --> E
    
    K --> O[Convert to Purchase Order]
    L --> P[Requisition Closed]
    
    style A fill:#e3f2fd
    style O fill:#c8e6c9
    style P fill:#ffcdd2
```

## Vendor Management Integration

```mermaid
flowchart TD
    A[Vendor Requirement] --> B{Existing Vendor?}
    B -->|Yes| C[Vendor Evaluation]
    B -->|No| D[New Vendor Registration]
    
    D --> E[Vendor Information Collection]
    E --> F[Financial Assessment]
    F --> G[Quality Certification]
    G --> H[Legal Compliance Check]
    H --> I[Vendor Approval]
    I --> J[Vendor Master Creation]
    
    C --> K[Performance Review]
    K --> L{Performance Acceptable?}
    L -->|Yes| M[Continue Partnership]
    L -->|No| N[Vendor Development]
    N --> O[Improvement Plan]
    O --> P[Re-evaluation]
    P --> L
    
    J --> Q[Vendor Available for PO]
    M --> Q
    Q --> R[Purchase Order Processing]
    
    style A fill:#e3f2fd
    style Q fill:#c8e6c9
```

## Purchase Order Processing Flow

```mermaid
flowchart TD
    A[PO Creation] --> B[Vendor Selection]
    B --> C[Material/Service Selection]
    C --> D[Pricing & Terms Negotiation]
    D --> E[Delivery Schedule]
    E --> F[Payment Terms]
    F --> G[PO Document Generation]
    
    G --> H[Internal Approval Process]
    H --> I{Approval Level}
    I -->|Level 1| J[Department Manager]
    I -->|Level 2| K[Purchasing Manager]
    I -->|Level 3| L[Finance Director]
    I -->|Level 4| M[General Manager]
    
    J --> N{Approved?}
    K --> N
    L --> N
    M --> N
    
    N -->|Yes| O[PO Approved]
    N -->|No| P[PO Rejected]
    N -->|Revise| Q[Return for Changes]
    
    Q --> R[Modify PO]
    R --> G
    
    O --> S[Send to Vendor]
    S --> T[Vendor Acknowledgment]
    T --> U[Order Tracking]
    U --> V[Goods Receipt Processing]
    
    style A fill:#e3f2fd
    style O fill:#4caf50
    style P fill:#ffcdd2
    style V fill:#c8e6c9
```

## Three-Way Matching Process

```mermaid
flowchart TD
    A[Invoice Received] --> B[Extract Invoice Data]
    B --> C[Match to Purchase Order]
    C --> D{PO Match OK?}
    D -->|No| E[PO Mismatch Hold]
    D -->|Yes| F[Match to Goods Receipt]
    
    F --> G{GR Match OK?}
    G -->|No| H[GR Mismatch Hold]
    G -->|Yes| I[Price Comparison]
    
    I --> J{Price Variance OK?}
    J -->|No| K[Price Variance Hold]
    J -->|Yes| L[Three-Way Match Success]
    
    E --> M[Resolve PO Issues]
    H --> N[Resolve GR Issues]
    K --> O[Resolve Price Issues]
    
    M --> P[Re-match Process]
    N --> P
    O --> P
    P --> C
    
    L --> Q[Invoice Approval]
    Q --> R[Payment Processing]
    R --> S[Vendor Payment]
    
    style A fill:#e3f2fd
    style L fill:#4caf50
    style S fill:#c8e6c9
    style E fill:#ffeb3b
    style H fill:#ffeb3b
    style K fill:#ffeb3b
```

## Supplier Performance Management

```mermaid
flowchart LR
    A[Purchase Data Collection] --> B[Delivery Performance]
    A --> C[Quality Performance]
    A --> D[Cost Performance]
    A --> E[Service Performance]
    
    B --> F[On-Time Delivery Rate]
    B --> G[Lead Time Analysis]
    
    C --> H[Quality Scores]
    C --> I[Defect Rates]
    
    D --> J[Price Competitiveness]
    D --> K[Cost Savings]
    
    E --> L[Communication Quality]
    E --> M[Support Responsiveness]
    
    F --> N[Supplier Scorecard]
    G --> N
    H --> N
    I --> N
    J --> N
    K --> N
    L --> N
    M --> N
    
    N --> O[Performance Rating]
    O --> P{Rating Level}
    P -->|Excellent| Q[Preferred Supplier]
    P -->|Good| R[Approved Supplier]
    P -->|Fair| S[Conditional Supplier]
    P -->|Poor| T[Supplier Development]
    
    Q --> U[Strategic Partnership]
    R --> V[Continue Business]
    S --> W[Improvement Plan]
    T --> X[Performance Review]
    
    style A fill:#e3f2fd
    style N fill:#ffeb3b
    style Q fill:#4caf50
    style T fill:#ff9800
```