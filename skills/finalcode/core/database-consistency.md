# FinalCode Database Consistency Audit

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Analyzes database schema, migrations, and consistency |
| Execution Stage | ANALYSIS |
| Loaded By | Engineering Review Mode, Production Audit |
| Dependencies | Repository Intelligence Engine, Engineering Graph |
| Outputs | Database consistency report with issues and risk |
| Consumers | Report Engine, User |
| Applies To | All audits |

## Reference Contract

| Input | Type | Required | Source |
|-------|------|----------|--------|
| repositoryProfile | object | Yes | Repository Intelligence Engine |
| engineeringGraph | object | Yes | Engineering Graph |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| databaseReport | object | Database consistency report |
| missingIndexes | array | Missing database indexes |
| unsafeMigrations | array | Unsafe migration patterns |
| unusedTables | array | Unused database tables |
| schemaDrift | array | Schema drift between environments |
| validationInconsistencies | array | Validation inconsistencies |
| migrationRisk | string | Migration risk level |

### Preconditions

- Repository Profile must be generated
- Engineering Graph must be built
- Database files must be identified

### Postconditions

- Database schema is analyzed
- Migrations are validated
- Consistency issues are identified

## Purpose

Database Consistency Audit analyzes schema, migrations, indexes, foreign keys, constraints, ORM models, and validation layer. It detects missing indexes, unsafe migrations, unused tables, schema drift, and validation inconsistencies.

**Why this matters:** Database issues can cause production outages and data integrity problems. By auditing database consistency, FinalCode prevents database-related issues before they occur.

## Analysis Methods

### Schema Analysis

Analyze database schema:

| Check | Description |
|-------|-------------|
| Table structure | Analyze table structure |
| Column types | Analyze column types |
| Constraints | Analyze constraints |
| Foreign keys | Analyze foreign keys |
| Indexes | Analyze indexes |

### Migration Analysis

Analyze database migrations:

| Check | Description |
|-------|-------------|
| Migration history | Analyze migration history |
| Migration order | Analyze migration order |
| Migration dependencies | Analyze migration dependencies |
| Migration rollback | Analyze rollback capability |

### ORM Model Analysis

Analyze ORM models:

| Check | Description |
|-------|-------------|
| Model structure | Analyze model structure |
| Model relationships | Analyze model relationships |
| Model validation | Analyze model validation |
| Model hooks | Analyze model hooks |

### Validation Layer Analysis

Analyze validation layer:

| Check | Description |
|-------|-------------|
| Validation rules | Analyze validation rules |
| Validation consistency | Analyze validation consistency |
| Validation coverage | Analyze validation coverage |

## Detection Methods

### Missing Indexes

Detect missing database indexes:

| Detection Method | Description |
|-----------------|-------------|
| Query analysis | Analyze query patterns |
| Foreign key analysis | Analyze foreign key usage |
| Filter analysis | Analyze filter patterns |
| Sort analysis | Analyze sort patterns |

### Unsafe Migrations

Detect unsafe migration patterns:

| Detection Method | Description |
|-----------------|-------------|
| Migration analysis | Analyze migration operations |
| Data loss analysis | Analyze data loss risk |
| Downtime analysis | Analyze downtime risk |
| Rollback analysis | Analyze rollback capability |

### Unused Tables

Detect unused database tables:

| Detection Method | Description |
|-----------------|-------------|
| Query analysis | Analyze query patterns |
| ORM analysis | Analyze ORM usage |
| Reference analysis | Analyze table references |

### Schema Drift

Detect schema drift between environments:

| Detection Method | Description |
|-----------------|-------------|
| Schema comparison | Compare schemas across environments |
| Migration comparison | Compare migration states |
| Version comparison | Compare schema versions |

### Validation Inconsistencies

Detect validation inconsistencies:

| Detection Method | Description |
|-----------------|-------------|
| Schema validation | Compare schema constraints |
| ORM validation | Compare ORM validation |
| API validation | Compare API validation |

## Output Format

```
DATABASE CONSISTENCY AUDIT
==================================================
Overall Status: Warning

Missing Indexes: 3
  1. users.email (used in WHERE clauses)
  2. posts.author_id (foreign key, used in JOINs)
  3. orders.created_at (used in ORDER BY)

Unsafe Migrations: 1
  1. 003_add_column.sql: Adds NOT NULL column without default
     Risk: High
     Recommendation: Add column with default, then update

Unused Tables: 1
  1. old_users (not referenced in any queries)

Schema Drift: 2
  1. users table: 'status' column missing in production
  2. posts table: 'views' column type differs (int vs bigint)

Validation Inconsistencies: 2
  1. User model: email validation differs from API validation
  2. Post model: title max length differs from schema

Migration Risk: Medium
  - 1 unsafe migration detected
  - 2 schema drift issues
  - Requires careful deployment

Recommendations:
  1. Add index on users.email
  2. Add index on posts.author_id
  3. Add index on orders.created_at
  4. Fix unsafe migration in 003_add_column.sql
  5. Remove unused table old_users
  6. Sync users.status column across environments
  7. Align posts.views column type
  8. Unify User email validation
  9. Unify Post title max length

Database Health: 75%
==================================================
```

## Architecture Explainability

### Responsibilities

- Analyze database schema
- Analyze migrations
- Analyze ORM models
- Detect missing indexes
- Detect unsafe migrations
- Detect unused tables
- Detect schema drift
- Detect validation inconsistencies

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Schema analysis
- Migration analysis
- Issue detection
- Risk estimation

### Consumed Decisions

- Repository Profile (from Repository Intelligence Engine)
- Engineering Graph (from Engineering Graph Engine)

### Produced Decisions

- Database consistency report
- Missing indexes
- Unsafe migrations
- Migration risk
