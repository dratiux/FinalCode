# FinalCode Engineering Memory

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Maintains persistent knowledge about the project |
| Execution Mode | Memory |
| Loaded By | Certification Engine |
| Dependencies | All engines |
| Outputs | Project knowledge, decisions, history |
| Consumers | All engines, User |
| Applies To | All audits |

## Overview

Engineering Memory maintains persistent knowledge about the project across audits. It remembers framework, database, deployment, authentication, architecture decisions, known technical debt, completed milestones, and previous audits. This eliminates the need to re-discover information already established.

**Why this matters:** Every audit shouldn't start from scratch. By maintaining persistent knowledge, FinalCode can build on previous understanding, track progress, and make informed decisions based on historical context.

## Memory Categories

### Project Identity

| Field | Description | Example |
|-------|-------------|---------|
| Project Name | Name of the project | "MyApp" |
| Project Type | Type of project | "Web Application" |
| Primary Framework | Main framework used | "React" |
| Primary Language | Main language used | "TypeScript" |
| Package Manager | Package manager used | "npm" |
| Build System | Build system used | "Vite" |

### Technology Stack

| Field | Description | Example |
|-------|-------------|---------|
| Frontend Framework | Frontend framework | "React 18.2.0" |
| Backend Framework | Backend framework | "Express 4.18.0" |
| Database | Database used | "PostgreSQL 14" |
| ORM | ORM used | "Prisma 5.0" |
| Authentication | Auth solution | "NextAuth.js" |
| Deployment | Deployment platform | "Vercel" |
| CI/CD | CI/CD platform | "GitHub Actions" |

### Architecture Decisions

| Field | Description | Example |
|-------|-------------|---------|
| Architecture Style | Architecture pattern | "Modular Monolith" |
| State Management | State management approach | "Zustand" |
| Styling | Styling approach | "Tailwind CSS" |
| Testing | Testing framework | "Jest + React Testing Library" |
| API Style | API design style | "REST" |
| Authentication Flow | Auth flow | "JWT + Refresh Token" |

### Known Technical Debt

| Field | Description | Example |
|-------|-------------|---------|
| Debt Items | Known debt items | List of debt items |
| Debt Level | Overall debt level | "Medium" |
| Priority Items | High-priority debt | List of priority items |
| Debt History | Debt changes over time | Debt trend |

### Completed Milestones

| Field | Description | Example |
|-------|-------------|---------|
| Milestones | Completed milestones | List of milestones |
| Completion Dates | When milestones were completed | Dates |
| Impact | Impact of milestones | Impact descriptions |

### Previous Audits

| Field | Description | Example |
|-------|-------------|---------|
| Audit Count | Number of previous audits | 5 |
| Last Audit Date | When last audit was performed | 2026-07-12 |
| Audit Results | Results of previous audits | Audit summaries |
| Trend | Quality trend over time | "Improving" |

### Previous Certifications

| Field | Description | Example |
|-------|-------------|---------|
| Certification Count | Number of certifications | 3 |
| Last Certification | Last certification result | "READY TO SHIP" |
| Certification History | Certification results over time | Certification summaries |
| Health Score Trend | Health score over time | [85, 88, 92] |

### User Preferences

| Field | Description | Example |
|-------|-------------|---------|
| Coding Style | Preferred coding style | "Functional" |
| Naming Convention | Preferred naming | "camelCase" |
| Import Style | Preferred imports | "Named exports" |
| Comment Style | Preferred comments | "JSDoc" |

## Memory Operations

### Remember

Store new information in memory:

```
REMEMBER
-------------------------------------------------
Category: Technology Stack
Field: Frontend Framework
Value: React 18.2.0
Confidence: High
Source: package.json
Last Updated: 2026-07-12
```

### Recall

Retrieve information from memory:

```
RECALL
-------------------------------------------------
Category: Technology Stack
Field: Frontend Framework
Value: React 18.2.0
Confidence: High
Last Updated: 2026-07-12
```

### Update

Update existing information:

```
UPDATE
-------------------------------------------------
Category: Known Technical Debt
Field: Debt Items
Old Value: [3 items]
New Value: [5 items]
Reason: New debt detected in audit
Last Updated: 2026-07-12
```

### Forget

Remove information from memory:

```
FORGET
-------------------------------------------------
Category: Previous Audits
Field: Audit Results
Old Value: [Audit 1, Audit 2]
Reason: Audit results outdated
Last Updated: 2026-07-12
```

## Memory Usage

### During Audit

1. **Load Memory:** Load project memory before audit
2. **Use Context:** Use memory for context-aware analysis
3. **Avoid Re-discovery:** Don't re-discover known information
4. **Update Memory:** Update memory with new findings

### Across Audits

1. **Track Progress:** Track quality improvements over time
2. **Compare Results:** Compare current vs previous audits
3. **Identify Trends:** Identify quality trends
4. **Learn from History:** Learn from previous decisions

### During Decision Making

1. **Consider History:** Consider previous decisions
2. **Avoid Repeated Mistakes:** Avoid repeating past mistakes
3. **Build on Success:** Build on previous successes
4. **Maintain Consistency:** Maintain consistent decisions

## Output Format

```
ENGINEERING MEMORY
==================================================
Project: MyApp
Last Updated: 2026-07-12

Technology Stack:
  Frontend: React 18.2.0
  Backend: Express 4.18.0
  Database: PostgreSQL 14
  ORM: Prisma 5.0
  Authentication: NextAuth.js
  Deployment: Vercel
  CI/CD: GitHub Actions

Architecture Decisions:
  Style: Modular Monolith
  State: Zustand
  Styling: Tailwind CSS
  Testing: Jest + React Testing Library
  API: REST
  Auth: JWT + Refresh Token

Known Technical Debt:
  Level: Medium
  Items: 5
  Priority: 2 critical, 3 high

Completed Milestones:
  - v1.0.0: Initial release (2026-01-15)
  - v1.1.0: Authentication (2026-02-15)
  - v1.2.0: Dashboard (2026-03-15)
  - v2.0.0: API v2 (2026-04-15)
  - v2.1.0: Performance (2026-05-15)

Previous Audits:
  Count: 5
  Last: 2026-07-10
  Trend: Improving

Previous Certifications:
  Count: 3
  Last: READY TO SHIP
  Health Score Trend: [85, 88, 92]

User Preferences:
  Style: Functional
  Naming: camelCase
  Imports: Named exports
  Comments: JSDoc
==================================================
```

## Architecture Explainability

### Responsibilities

- Maintain persistent project knowledge
- Track decisions and history
- Provide context for analysis
- Avoid re-discovery

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Memory storage
- Memory retrieval
- Memory update
- Memory cleanup

### Consumed Decisions

- Repository Profile (from Repository Intelligence Engine)
- Classified findings (from Decision Engine)
- Correlated findings (from Correlation Engine)

### Produced Decisions

- Project knowledge
- Historical context
- Trend analysis
