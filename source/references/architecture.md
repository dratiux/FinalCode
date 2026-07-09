# FinalCode Architecture

This document describes the FinalCode v2.3.0 architecture. It provides a comprehensive overview of the system, its components, and their relationships.

## System Overview

FinalCode is a production certification, engineering documentation, and intelligence system for OpenCode projects. It certifies whether a project is genuinely ready for production via a senior-engineering audit across 13 quality gates.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           FinalCode v2.0.0                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                      SKILL.md (Orchestration)                       │   │
│  │  • Loads reference documents on demand                             │   │
│  │  • Manages execution pipeline                                      │   │
│  │  • Coordinates all engines                                         │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                    │                                        │
│                                    ▼                                        │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                        Core Engine Layer                            │   │
│  │                                                                     │   │
│  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐  │   │
│  │  │  Decision   │ │   Policy    │ │    Rule     │ │   Report    │  │   │
│  │  │   Engine    │ │   Engine    │ │  Registry   │ │   Engine    │  │   │
│  │  └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘  │   │
│  │                                                                     │   │
│  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐  │   │
│  │  │Certification│ │ Explainab-  │ │  Finding    │ │  Health     │  │   │
│  │  │   Engine    │ │  ility Eng. │ │  Classif.   │ │  Score      │  │   │
│  │  └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘  │   │
│  │                                                                     │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                    │                                        │
│                                    ▼                                        │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                       Plugin Layer                                  │   │
│  │                                                                     │   │
│  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐  │   │
│  │  │   Plugin    │ │  Framework  │ │ Marketplace │ │  Config     │  │   │
│  │  │    SDK      │ │  Profiles   │ │ Foundation  │ │  System     │  │   │
│  │  └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘  │   │
│  │                                                                     │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                    │                                        │
│                                    ▼                                        │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                     Reference Layer                                 │   │
│  │                                                                     │   │
│  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐  │   │
│  │  │   Gates     │ │  Security   │ │  Examples   │ │  Config     │  │   │
│  │  │             │ │  Gate 2.0   │ │             │ │  Reference  │  │   │
│  │  └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘  │   │
│  │                                                                     │   │
│  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐  │   │
│  │  │  Confidence │ │  Health     │ │  Finding    │ │ Explainab-  │  │   │
│  │  │   Model     │ │   Score     │ │  Classif.   │ │  ility      │  │   │
│  │  └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘  │   │
│  │                                                                     │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Component Relationships

### Core Components

#### Decision Engine

**Location:** `source/core/decision-engine.md`

**Responsibility:** Transforms repository observations into actionable engineering decisions.

**Dependencies:** Rule Registry, Policy Engine

**Consumers:** Certification Engine, Report Engine

**Pipeline:**
1. Evidence Collection
2. Rule Matching
3. Risk Analysis
4. Classification
5. Severity Calibration
6. Release Impact Assessment
7. Report Generation

#### Policy Engine

**Location:** `source/core/policy-engine.md`

**Responsibility:** Controls how FinalCode evaluates repositories.

**Dependencies:** None (standalone)

**Consumers:** Certification Engine, Decision Engine

**Capabilities:**
- Severity thresholds
- Blocking rules
- Warning thresholds
- Documentation requirements
- Security strictness
- Testing expectations

#### Rule Registry

**Location:** `source/core/rule-registry.md`

**Responsibility:** Centralized source of truth for all engineering rules.

**Dependencies:** None (standalone)

**Consumers:** Decision Engine, Plugin SDK, Framework Profiles

**Schema:**
- Rule ID
- Version
- Owner
- Description
- Gate
- Severity
- Classification
- Detection Method
- Applicable Frameworks
- References
- Deprecation Status

#### Report Engine

**Location:** `source/core/report-engine.md`

**Responsibility:** Produces standardized FinalCode Certification Report.

**Dependencies:** Decision Engine, Health Score, Confidence Model

**Consumers:** Certification Engine

**Sections:** 37 documented sections with fixed ordering

#### Certification Engine

**Location:** `source/core/certification-engine.md`

**Responsibility:** Orchestrates the complete certification process.

**Dependencies:** All Core components

**Pipeline:**
1. Initialization
2. Validation
3. Detection
4. Analysis
5. Decision
6. Policy Evaluation
7. Report Generation
8. Certification Output

### Plugin Components

#### Plugin SDK

**Location:** `source/plugins/sdk.md`

**Responsibility:** Defines how plugins register with FinalCode.

**Dependencies:** Rule Registry, Report Engine

**Consumers:** Framework Profiles, Community Plugins

**Registration Points:**
- Rules
- Report Sections
- Framework Support
- Recommendations
- Validation Steps
- Configuration Options

#### Framework Profiles

**Location:** `source/plugins/profiles.md`

**Responsibility:** Provides modular framework support.

**Dependencies:** Plugin SDK, Rule Registry

**Profiles:**
- React
- Next.js
- Vue
- Angular
- Electron
- Node.js
- Express
- Fastify
- NestJS
- Cloudflare Workers
- Cloudflare Pages
- Supabase
- Vite
- Hono

#### Marketplace Foundation

**Location:** `source/plugins/marketplace.md`

**Responsibility:** Prepares for future community extensions.

**Dependencies:** Plugin SDK

**Features:**
- Plugin layout specification
- Registration process
- Validation requirements
- Compatibility rules
- Version compatibility

### Reference Components

#### Quality Gates

**Location:** `source/references/gates.md`

**Responsibility:** Defines checklists for 13 Quality Gates.

**Gates:**
1. Architecture
2. Code Quality
3. Dead Code
4. Dependencies
5. Type Safety
6. Error Handling
7. Testing
8. Performance
9. Security
10. Accessibility
11. UI Consistency
12. Documentation
13. GitHub Readiness

#### Security Gate 2.0

**Location:** `source/references/security-gate.md`

**Responsibility:** Provides security checklist across 14 categories.

**Categories:**
1. Authentication
2. Authorization
3. Session Management
4. Input Validation
5. Secrets Management
6. Dependency Security
7. API Security
8. Frontend Security
9. Backend Security
10. Deployment Security
11. Cloud Security
12. Rate Limiting
13. Security Headers
14. Environment Security

#### Examples

**Location:** `source/references/examples.md`

**Responsibility:** Provides worked test case outputs.

**Examples:**
- Clean repository (READY TO SHIP)
- Repository with issues (NOT READY)
- Missing repository (NO PROJECT FOUND)

#### Configuration Reference

**Location:** `source/references/configuration.md`

**Responsibility:** Provides detailed configuration reference.

**Content:**
- Configuration schema
- Project profiles
- Baseline system
- Ignore system
- Incremental inspection
- PR analysis
- Machine-readable reports

#### Confidence Model

**Location:** `source/references/confidence-model.md`

**Responsibility:** Defines Confidence Model 2.0 and Certification Confidence Model.

**Metrics:**
- Analysis Confidence
- Evidence Coverage
- Verification Coverage
- Runtime Coverage
- Repository Coverage
- Overall Reliability

#### Health Score

**Location:** `source/references/health-score.md`

**Responsibility:** Specifies Health Score formula and grade assignment.

**Formula:** 0-100 composite score from 10 weighted categories

**Grades:** A+ through F

#### Finding Classification

**Location:** `source/references/finding-classification.md`

**Responsibility:** Establishes finding-related rules.

**Content:**
- Finding status
- Classification
- IDs
- Severity calibration
- Smart occurrence classification
- Engineering categories
- Impact analysis
- Release blocker classification
- Root cause intelligence
- Standard finding format

#### Explainability Engine

**Location:** `source/references/explainability.md`

**Responsibility:** Defines Explainability Engine.

**Content:**
- Finding self-explanation
- Audit trail
- Transparency requirements
- Trust requirements

#### Architecture

**Location:** `source/references/architecture.md`

**Responsibility:** Describes overall system architecture.

**Content:**
- System overview
- Component relationships
- Dependency diagrams
- Execution flow

## Execution Flow

### 1. Initialization

```
SKILL.md loads → Core components → Plugin components → Reference components
```

### 2. Validation

```
Self-validation → Rule Registry validation → Policy validation → Plugin validation
```

### 3. Detection

```
Project detection → Framework detection → Profile loading → Rule merging
```

### 4. Analysis

```
Quality Gate checks → Security Gate 2.0 → Rule application → Evidence collection
```

### 5. Decision

```
Finding classification → Severity calibration → Release impact → Blocking rules
```

### 6. Report Generation

```
Section generation → Explainability → Health Score → Confidence Model → Certification
```

### 7. Output

```
Certification status → Exit code → Executive summary → Report output
```

## Dependency Diagram

```
SKILL.md
    │
    ├── Core Engine Layer
    │   ├── Decision Engine
    │   │   ├── Rule Registry
    │   │   └── Policy Engine
    │   ├── Policy Engine
    │   ├── Rule Registry
    │   ├── Report Engine
    │   │   ├── Decision Engine
    │   │   ├── Health Score
    │   │   └── Confidence Model
    │   ├── Certification Engine
    │   │   ├── Decision Engine
    │   │   ├── Policy Engine
    │   │   ├── Rule Registry
    │   │   └── Report Engine
    │   ├── Explainability Engine
    │   ├── Finding Classification
    │   └── Health Score
    │
    ├── Plugin Layer
    │   ├── Plugin SDK
    │   │   ├── Rule Registry
    │   │   └── Report Engine
    │   ├── Framework Profiles
    │   │   ├── Plugin SDK
    │   │   └── Rule Registry
    │   ├── Marketplace Foundation
    │   │   └── Plugin SDK
    │   └── Configuration System
    │
    └── Reference Layer
        ├── Gates
        ├── Security Gate 2.0
        ├── Examples
        ├── Configuration Reference
        ├── Confidence Model
        ├── Health Score
        ├── Finding Classification
        ├── Explainability Engine
        └── Architecture
```

## Key Principles

### Single Source of Truth

Every rule exists in one place. When a rule changes, it changes in one place only.

### Deterministic Output

Given the same input, FinalCode produces identical output. No randomness, no time-dependent behavior.

### Modular Architecture

Components are separated by responsibility. New components can be added without modifying existing ones.

### Plugin Isolation

Plugins are isolated from each other. Plugin failures do not affect Core execution.

### Backward Compatibility

New versions maintain backward compatibility. Existing configurations continue to work.

### Progressive Disclosure

Reference documents are loaded on demand. Unrelated documentation is not loaded.

## Version History

- v1.0.0: Initial release with 13 Quality Gates
- v1.1.0: Added Security Gate 2.0
- v1.2.0: Added operational modes (Inspect, Repair, Refactor, Certify)
- v1.3.0: Added Intelligence features
- v1.4.0: Added advanced Intelligence features
- v1.5.0: Added Executive Intelligence
- v1.6.0: Added Engineering Intelligence
- v1.7.0: Added Decision Intelligence
- v1.8.0: Added Configurable Engineering Platform
- v1.8.1: Added Report Quality & Decision Support
- v1.8.2: Added Decision Engine & Report Precision
- v1.9.0: Added Modular Engineering Architecture
- v2.0.0: Extensible Engineering Platform with Plugin Architecture
- v2.2.0: Evidence & Analysis Engine
- v2.3.0: Architecture Intelligence

---

# Architecture Intelligence (v2.3.0)

This section defines how FinalCode evaluates engineering structure, maintainability, dependency design, and long-term scalability.

## Architecture Map

Generate a textual architecture map describing:

- **System Layers** — Presentation, Business Logic, Data Access, Infrastructure
- **Major Modules** — Significant functional areas with responsibilities
- **Entry Points** — Application entry points (main, routes, handlers)
- **Shared Components** — Utilities, libraries, or services used across modules
- **External Integrations** — APIs, databases, message queues, third-party services
- **Data Flow** — How data moves through the system
- **Dependency Flow** — How components depend on each other

**Format:**
```
ARCHITECTURE OVERVIEW
-------------------------------------------------
System Layers:
  Presentation Layer: React components, pages, layouts
  Business Logic Layer: Services, hooks, utilities
  Data Access Layer: API clients, database queries
  Infrastructure Layer: Configuration, deployment, CI/CD

Major Modules:
  Authentication: User login, registration, session management
  Payment: Stripe integration, billing, invoices
  Notifications: Email, push, in-app messaging

Entry Points:
  src/index.tsx — Application entry
  src/app/api/ — API routes
  src/workers/ — Background jobs

Shared Components:
  src/utils/ — Common utilities
  src/hooks/ — Shared React hooks
  src/types/ — TypeScript type definitions

External Integrations:
  Stripe API — Payment processing
  SendGrid — Email delivery
  PostgreSQL — Primary database
  Redis — Caching and sessions

Data Flow:
  User → React → API Routes → Services → Database → Response

Dependency Flow:
  Presentation → Business Logic → Data Access → Infrastructure
```

## Module Health

Evaluate every major module independently:

**Format per module:**
```
<ModuleName>

Health: XX / 100
Responsibilities: <what this module does>
Dependencies: <what this module depends on>
Complexity: Low | Medium | High
Risk: Low | Medium | High
Recommendations: <specific improvements>
```

**Health Score Calculation:**
- Responsibility clarity: 25%
- Dependency quality: 25%
- Complexity management: 25%
- Test coverage: 25%

## Responsibility Analysis

Detect responsibility problems:

| Problem | Meaning |
|---------|---------|
| God Object | Class with too many responsibilities |
| God Component | Component that does too much |
| God Service | Service with excessive scope |
| Utility Overload | Utility file that should be split |
| Mixed Responsibilities | Module mixing unrelated concerns |
| Feature Leakage | Feature implemented in wrong layer |
| Cross Layer Coupling | Inappropriate cross-layer dependencies |

**Each finding must explain why it violates maintainability.**

## Dependency Intelligence

Analyze dependency quality:

| Metric | Meaning |
|--------|---------|
| Circular Dependencies | A depends on B depends on A |
| Dependency Direction | Top-down, bottom-up, or mixed |
| Layer Violations | Dependencies crossing layer boundaries |
| Tight Coupling | Components that cannot be changed independently |
| High Fan-in | Components with many dependents |
| High Fan-out | Components with many dependencies |
| Dependency Concentration | Uneven dependency distribution |

**Overall Dependency Health:** Summarize as High / Medium / Low with justification.

## Scalability Assessment

Estimate architectural scalability:

| Factor | Meaning |
|--------|---------|
| Maintainability | How easy is it to modify the system? |
| Extensibility | How easy is it to add new features? |
| Modularity | How well-separated are components? |
| Testability | How easy is it to test the system? |
| Replaceability | How easy is it to replace components? |
| Deployment Flexibility | How easy is it to deploy? |

**Each score must include justification.**

## Technical Debt Classification

Classify technical debt:

| Category | Examples |
|----------|----------|
| Structural | Poor file organization, tangled imports |
| Architectural | Wrong patterns, missing abstractions |
| Testing | Missing tests, flaky tests, low coverage |
| Documentation | Missing docs, outdated docs |
| Performance | Unoptimized queries, memory leaks |
| Security | Outdated deps, missing validation |
| Configuration | Hardcoded values, missing env vars |
| Maintainability | Complex code, deep nesting |

**Include:**
- Accumulated Debt (estimate)
- Estimated Cleanup Effort
- Engineering Risk (Low / Medium / High)

## Architecture Risk Matrix

Produce a dedicated matrix:

| Risk | Impact | Likelihood | Engineering Cost | Recommended Priority |
|------|--------|------------|------------------|---------------------|
| <risk> | <impact> | <likelihood> | <cost> | P0 / P1 / P2 / P3 |

## Design Pattern Recognition

Recognize common patterns when present:

- Repository Pattern
- Service Pattern
- Factory Pattern
- Strategy Pattern
- Adapter Pattern
- Observer Pattern
- Dependency Injection
- CQRS
- MVC
- MVVM

**Rules:**
- Never assume a pattern exists
- Only report verified patterns with evidence
- Include specific files/classes as evidence

## Anti-Pattern Detection

Detect common anti-patterns:

- God Class
- Blob
- Spaghetti Code
- Feature Envy
- Circular Dependency
- Duplicate Logic
- Primitive Obsession
- Shotgun Surgery
- Large Switch
- Magic Numbers
- Long Method

**Each finding must include evidence (specific files/classes).**

## Maintainability Forecast

Estimate future maintainability:

**Format:**
```
Current Maintainability: High | Medium | Low

Primary Risks:
  <list of risks to future maintainability>

Expected Growth Impact:
  <how maintainability will change as codebase grows>

Recommended Refactors:
  <prioritized list of refactors>
```

## Refactor Opportunity Map

Group refactors by area:

**Format:**
```
<AreaName>

Refactors:
  - <refactor description>
  - <refactor description>

Estimated Benefit: <what will improve>
Estimated Cost: <effort required>
Priority: P0 | P1 | P2 | P3
```

## Architecture Summary

Executive summary covering:

- **Strongest Architectural Decisions** — What was done well
- **Weakest Architectural Areas** — What needs improvement
- **Highest Engineering Risks** — What could cause problems
- **Largest Technical Debt** — What accumulated shortcuts exist
- **Highest ROI Improvements** — What will provide the most value
