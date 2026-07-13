# FinalCode Pull Request Review

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Reviews changes exactly like a Senior Engineer |
| Execution Mode | PR Review |
| Loaded By | Certification Engine |
| Dependencies | All engines |
| Outputs | Review verdict, risk assessment, recommendations |
| Consumers | User, Certification Engine |
| Applies To | All audits |

## Overview

Pull Request Review mode reviews code changes exactly like a Senior Engineer would. It evaluates risk, breaking changes, security impact, performance impact, architecture impact, testing needs, and provides a clear verdict.

**Why this matters:** Code reviews are critical for maintaining quality. By providing a systematic, consistent review process, FinalCode ensures every change is evaluated thoroughly.

## Review Categories

### Risk Assessment

| Risk Level | Description | Example |
|------------|-------------|---------|
| Very Low | No risk of regression | Remove unused import |
| Low | Minimal risk | Rename variable |
| Medium | Some risk | Extract function |
| High | Significant risk | Refactor module |
| Very High | Major risk | Change architecture |

### Breaking Changes

| Type | Description | Impact |
|------|-------------|--------|
| API Breaking | API signature changes | High |
| Behavioral Breaking | Behavior changes | High |
| Configuration Breaking | Configuration changes | Medium |
| Dependency Breaking | Dependency changes | Medium |
| Database Breaking | Database schema changes | Very High |

### Security Impact

| Impact | Description | Action |
|--------|-------------|--------|
| None | No security impact | No action |
| Low | Minor security improvement | Approve |
| Medium | Moderate security improvement | Approve with notes |
| High | Significant security improvement | Approve |
| Critical | Critical security fix | Approve immediately |

### Performance Impact

| Impact | Description | Action |
|--------|-------------|--------|
| None | No performance impact | No action |
| Positive | Performance improvement | Approve |
| Negative | Performance degradation | Review required |
| Significant | Significant performance change | Approve with notes |

### Architecture Impact

| Impact | Description | Action |
|--------|-------------|--------|
| None | No architecture impact | No action |
| Positive | Architecture improvement | Approve |
| Negative | Architecture degradation | Review required |
| Significant | Significant architecture change | Approve with notes |

### Testing Needs

| Need | Description | Action |
|------|-------------|--------|
| None | No testing needed | No action |
| Unit Tests | Unit tests needed | Request tests |
| Integration Tests | Integration tests needed | Request tests |
| E2E Tests | E2E tests needed | Request tests |
| Manual Testing | Manual testing needed | Request testing |

## Review Verdicts

### Approve

The PR is approved with no changes required.

**Criteria:**
- No breaking changes
- No security issues
- No performance issues
- No architecture issues
- Tests pass
- Code quality is good

### Request Changes

The PR requires changes before approval.

**Criteria:**
- Breaking changes without documentation
- Security issues found
- Performance issues found
- Architecture issues found
- Tests failing
- Code quality issues

### Block

The PR is blocked and cannot be merged.

**Criteria:**
- Critical security issues
- Database schema changes without approval
- Architecture changes without approval
- Business rule changes without approval

## Output Format

```
PULL REQUEST REVIEW
==================================================
PR: #123 - Add user authentication
Author: developer@example.com
Risk: Medium
Verdict: Request Changes

Risk Assessment: Medium
  - Adds new authentication flow
  - Changes API endpoints
  - Adds database tables

Breaking Changes: Yes
  - API: New endpoints added (non-breaking)
  - Behavioral: Authentication required for new routes
  - Configuration: New env vars required

Security Impact: Positive
  - Adds authentication
  - Adds authorization
  - Adds input validation

Performance Impact: Neutral
  - Adds database queries
  - Adds middleware
  - No significant impact

Architecture Impact: Neutral
  - Adds new module
  - Follows existing patterns
  - No architecture changes

Testing Needed: Yes
  - Unit tests for auth logic
  - Integration tests for API endpoints
  - E2E tests for login flow

Issues Found:
  1. Missing rate limiting on login endpoint (Medium)
  2. Missing account lockout after failed attempts (Medium)
  3. Missing password complexity requirements (Low)

Recommendations:
  1. Add rate limiting to prevent brute force
  2. Add account lockout after 5 failed attempts
  3. Add password complexity requirements
  4. Add unit tests for auth logic
  5. Add integration tests for API endpoints

Approval Conditions:
  1. Add rate limiting
  2. Add account lockout
  3. Add unit tests
==================================================
```

## Review Process

### Step 1: Analyze Changes

1. Read all changed files
2. Understand the changes
3. Identify the scope of changes

### Step 2: Assess Risk

1. Evaluate breaking changes
2. Evaluate security impact
3. Evaluate performance impact
4. Evaluate architecture impact

### Step 3: Check Testing

1. Check if tests are added
2. Check if tests are updated
3. Check if tests are missing

### Step 4: Identify Issues

1. Find security issues
2. Find performance issues
3. Find architecture issues
4. Find code quality issues

### Step 5: Generate Verdict

1. Determine approval status
2. List issues found
3. Provide recommendations
4. Set approval conditions

## Architecture Explainability

### Responsibilities

- Review code changes
- Assess risk and impact
- Identify issues
- Generate verdict

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Risk assessment
- Impact assessment
- Issue identification
- Verdict generation

### Consumed Decisions

- Repository Profile (from Repository Intelligence Engine)
- Classified findings (from Decision Engine)

### Produced Decisions

- Review verdict
- Risk assessment
- Issues found
- Recommendations
