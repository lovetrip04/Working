# Controlling Business Domain Flow Chart

## Cost Center Accounting Process

```mermaid
flowchart TD
    A[Cost Center Setup] --> B[Define Cost Center Hierarchy]
    B --> C[Assign Responsibility Areas]
    C --> D[Set Cost Categories]
    D --> E[Plan Budget Allocation]
    E --> F[Cost Center Active]
    
    F --> G[Primary Cost Posting]
    G --> H[Direct Cost Assignment]
    H --> I[Secondary Cost Allocation]
    I --> J[Activity-Based Costing]
    J --> K[Cost Driver Analysis]
    K --> L[Overhead Distribution]
    
    L --> M[Actual vs Plan Analysis]
    M --> N[Variance Calculation]
    N --> O{Variance Significant?}
    O -->|Yes| P[Variance Investigation]
    O -->|No| Q[Standard Reporting]
    
    P --> R[Root Cause Analysis]
    R --> S[Corrective Actions]
    S --> T[Management Report]
    Q --> T
    
    style A fill:#e3f2fd
    style T fill:#c8e6c9
```

## Profit Center Accounting Flow

```mermaid
flowchart TD
    A[Profit Center Definition] --> B[Revenue Assignment]
    B --> C[Cost Allocation]
    C --> D[Transfer Pricing]
    D --> E[Profitability Calculation]
    
    E --> F[Revenue Analysis]
    F --> G[Cost Structure Analysis]
    G --> H[Margin Calculation]
    H --> I[ROI Analysis]
    
    I --> J[Performance Measurement]
    J --> K[Benchmark Comparison]
    K --> L[Trend Analysis]
    L --> M[Management Dashboard]
    
    M --> N{Performance Target Met?}
    N -->|Yes| O[Maintain Strategy]
    N -->|No| P[Strategy Review]
    P --> Q[Action Plan Development]
    Q --> R[Implementation]
    R --> S[Monitor Progress]
    S --> J
    
    style A fill:#e3f2fd
    style M fill:#ffeb3b
    style O fill:#c8e6c9
    style P fill:#ff9800
```

## Internal Orders Process

```mermaid
flowchart TD
    A[Project/Activity Requirement] --> B[Internal Order Creation]
    B --> C[Budget Assignment]
    C --> D[Approval Workflow]
    D --> E{Approved?}
    E -->|Yes| F[Order Release]
    E -->|No| G[Order Rejection]
    
    F --> H[Cost Collection]
    H --> I[Resource Assignment]
    I --> J[Progress Tracking]
    J --> K[Actual Cost Posting]
    K --> L[Budget Monitoring]
    
    L --> M{Budget Exceeded?}
    M -->|Yes| N[Budget Alert]
    M -->|No| O[Continue Execution]
    
    N --> P[Budget Review]
    P --> Q[Additional Approval]
    Q --> R{Approved?}
    R -->|Yes| S[Budget Increase]
    R -->|No| T[Project Hold]
    
    S --> O
    O --> U[Project Completion]
    U --> V[Cost Settlement]
    V --> W[Order Closure]
    
    style A fill:#e3f2fd
    style W fill:#c8e6c9
    style G fill:#ffcdd2
    style T fill:#ffcdd2
```

## Activity-Based Costing (ABC) Flow

```mermaid
flowchart TD
    A[Activity Identification] --> B[Activity Type Definition]
    B --> C[Cost Driver Analysis]
    C --> D[Resource Consumption Measurement]
    D --> E[Activity Rate Calculation]
    
    E --> F[Cost Object Identification]
    F --> G[Activity Consumption Tracking]
    G --> H[Cost Assignment]
    H --> I[ABC Cost Calculation]
    
    I --> J[Traditional Costing Comparison]
    J --> K[Cost Accuracy Analysis]
    K --> L[Process Improvement Opportunities]
    L --> M[Resource Optimization]
    
    M --> N[Activity Monitoring]
    N --> O[Performance Metrics]
    O --> P[Cost Reduction Initiatives]
    P --> Q[Continuous Improvement]
    
    style A fill:#e3f2fd
    style Q fill:#c8e6c9
```

## Profitability Analysis (CO-PA) Process

```mermaid
flowchart TD
    A[Market Segment Definition] --> B[Customer Profitability]
    B --> C[Product Profitability]
    C --> D[Sales Channel Analysis]
    D --> E[Geographic Profitability]
    
    E --> F[Revenue Collection]
    F --> G[Cost Assignment]
    G --> H[Margin Calculation]
    H --> I[Profitability Reports]
    
    I --> J[Customer Analysis]
    J --> K[Product Portfolio Review]
    K --> L[Channel Effectiveness]
    L --> M[Territory Performance]
    
    M --> N[Strategic Decisions]
    N --> O[Resource Allocation]
    O --> P[Investment Priorities]
    P --> Q[Market Focus]
    
    Q --> R[Performance Monitoring]
    R --> S[Trend Analysis]
    S --> T[Forecasting]
    T --> U[Strategic Planning]
    
    style A fill:#e3f2fd
    style U fill:#c8e6c9
```

## Variance Analysis Workflow

```mermaid
flowchart TD
    A[Budget Planning] --> B[Standard Setting]
    B --> C[Actual Data Collection]
    C --> D[Variance Calculation]
    D --> E[Variance Categorization]
    
    E --> F{Variance Type}
    F -->|Price| G[Price Variance Analysis]
    F -->|Quantity| H[Quantity Variance Analysis]
    F -->|Efficiency| I[Efficiency Variance Analysis]
    F -->|Volume| J[Volume Variance Analysis]
    
    G --> K[Market Price Changes]
    H --> L[Usage Pattern Analysis]
    I --> M[Process Efficiency Review]
    J --> N[Demand Fluctuation Analysis]
    
    K --> O[Root Cause Identification]
    L --> O
    M --> O
    N --> O
    
    O --> P[Corrective Action Planning]
    P --> Q[Implementation]
    Q --> R[Monitoring]
    R --> S[Variance Tracking]
    S --> T[Performance Improvement]
    
    style A fill:#e3f2fd
    style T fill:#c8e6c9
```

## Cost Allocation and Settlement

```mermaid
flowchart TD
    A[Primary Costs] --> B[Cost Center Assignment]
    B --> C[Secondary Cost Allocation]
    C --> D[Allocation Base Selection]
    D --> E[Distribution Keys]
    E --> F[Cost Allocation Calculation]
    
    F --> G[Sender Cost Centers]
    G --> H[Receiver Cost Centers]
    H --> I[Allocation Validation]
    I --> J{Allocation Correct?}
    J -->|Yes| K[Settlement Process]
    J -->|No| L[Allocation Adjustment]
    L --> F
    
    K --> M[Final Cost Assignment]
    M --> N[Product Costing]
    N --> O[Inventory Valuation]
    O --> P[Cost of Goods Sold]
    P --> Q[Period End Activities]
    
    Q --> R[Closing Entries]
    R --> S[Cost Reports]
    S --> T[Management Analysis]
    
    style A fill:#e3f2fd
    style T fill:#c8e6c9
```