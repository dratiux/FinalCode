# FinalCode Execution Lifecycle

Complete lifecycle of one audit, from repository detection to final report.

## Lifecycle Overview

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        FinalCode Execution Lifecycle                        │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  1. INITIALIZATION                                                          │
│     ├── Load configuration                                                  │
│     ├── Load active policy                                                  │
│     ├── Load Rule Registry                                                  │
│     ├── Initialize Report Engine                                            │
│     └── Self-validation                                                     │
│                                                                             │
│  2. DETECTION                                                               │
│     ├── Detect project type                                                 │
│     ├── Detect frameworks                                                   │
│     ├── Load framework profiles                                             │
│     └── Merge framework rules                                               │
│                                                                             │
│  3. ANALYSIS                                                                │
│     ├── Execute Quality Gates (13)                                          │
│     ├── Execute Security Gate 2.0                                           │
│     ├── Apply Rule Registry rules                                           │
│     ├── Apply framework-specific rules                                      │
│     └── Collect evidence                                                    │
│                                                                             │
│  4. DECISION                                                                │
│     ├── Classify findings                                                   │
│     ├── Calibrate severity                                                  │
│     ├── Determine release impact                                            │
│     ├── Apply blocking rules                                                │
│     └── Calculate Health Score                                              │
│                                                                             │
│  5. POLICY                                                                  │
│     ├── Check blocking conditions                                           │
│     ├── Verify minimum score                                                │
│     ├── Check gate requirements                                             │
│     ├── Check documentation requirements                                    │
│     └── Determine certification status                                      │
│                                                                             │
│  6. REPORT                                                                  │
│     ├── Generate Executive Dashboard                                        │
│     ├── Generate all 55 sections                                            │
│     ├── Apply Explainability Engine                                          │
│     ├── Generate Certification Summary                                      │
│     └── Output machine-readable reports                                     │
│                                                                             │
│  7. CERTIFICATION                                                           │
│     ├── Determine final certification                                       │
│     ├── Set exit code                                                       │
│     ├── Generate Executive Decision Summary                                 │
│     ├── Generate Migration Notes (if applicable)                            │
│     └── Output final report                                                 │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Stage 1: INITIALIZATION

**Inputs:** User command, configuration files, policy selection

**Outputs:** Loaded configuration, active policy, validated Rule Registry

**Owner:** Certification Engine

### Steps

1. **Load Configuration**
   - Read `finalcode.config.json` or `.finalcode/config.json`
   - Apply default values for missing fields
   - Validate configuration schema

2. **Load Active Policy**
   - Select policy based on configuration, profile, or default
   - Load parent policies (inheritance)
   - Merge policy settings

3. **Load Rule Registry**
   - Load all rules from Rule Registry
   - Validate rule schemas
   - Check for duplicate rule IDs
   - Load framework-specific rules

4. **Initialize Report Engine**
   - Load report template
   - Initialize section generators
   - Load formatting rules

5. **Self-Validation**
   - Check no duplicate rule IDs
   - Check no missing references
   - Check no invalid profiles
   - Check no broken plugin registrations
   - Stop if validation fails

**Failure Conditions:**
- Invalid configuration → stop with error
- Invalid policy → stop with error
- Invalid Rule Registry → stop with error
- Validation failure → stop with error

## Stage 2: DETECTION

**Inputs:** Repository files, package.json, configuration files

**Outputs:** Detected frameworks, loaded profiles, merged rules

**Owner:** Certification Engine

### Steps

1. **Detect Project Type**
   - Analyze directory structure
   - Check for common project files
   - Determine project type (library, application, etc.)

2. **Detect Frameworks**
   - Check package.json dependencies
   - Check configuration files
   - Check source file patterns
   - Detect multiple frameworks if present

3. **Load Framework Profiles**
   - Load profiles for detected frameworks
   - Merge framework-specific rules
   - Apply framework-specific best practices

4. **Merge Framework Rules**
   - Combine Core rules with framework rules
   - Resolve rule conflicts (Core wins)
   - Validate merged rule set

**Failure Conditions:**
- Framework detection failure → skip framework, continue
- Profile loading failure → skip profile, continue
- Rule merge conflict → Core rule wins

## Stage 3: ANALYSIS

**Inputs:** Repository files, loaded rules, gate criteria

**Outputs:** Raw findings, evidence, gate results

**Owner:** Decision Engine

### Steps

1. **Execute Quality Gates (13)**
   - Architecture Gate
   - Code Quality Gate
   - Dead Code Gate
   - Dependencies Gate
   - Type Safety Gate
   - Error Handling Gate
   - Testing Gate
   - Performance Gate
   - Security Gate
   - Accessibility Gate
   - UI Consistency Gate
   - Documentation Gate
   - GitHub Readiness Gate

2. **Execute Security Gate 2.0**
   - Authentication
   - Authorization
   - Session Management
   - Input Validation
   - Secrets Management
   - Dependency Security
   - API Security
   - Frontend Security
   - Backend Security
   - Deployment Security
   - Cloud Configuration
   - Rate Limiting
   - Security Headers
   - Environment Security

3. **Apply Rule Registry Rules**
   - Match evidence against rules
   - Apply detection methods
   - Collect findings per rule

4. **Apply Framework-Specific Rules**
   - Apply framework-specific checks
   - Collect framework-specific findings

5. **Collect Evidence**
   - File paths and line numbers
   - Build output
   - Type-check results
   - Lint results
   - Test results
   - Dependency analysis
   - Runtime observations (if available)

**Failure Conditions:**
- Gate execution failure → skip gate, report as skipped
- Rule matching failure → skip rule, log warning
- Evidence collection failure → classify as "Needs Verification"

## Stage 4: DECISION

**Inputs:** Raw findings, evidence, rules, policy

**Outputs:** Classified findings, severity, release impact, Health Score

**Owner:** Decision Engine

### Steps

1. **Classify Findings**
   - Match against classification rules
   - Assign finding classification
   - Assign finding status

2. **Calibrate Severity**
   - Assess engineering impact
   - Apply severity calibration rules
   - Assign severity level

3. **Determine Release Impact**
   - Apply Release Blocker Engine
   - Classify as Release Blocker / Conditional Blocker / Engineering Recommendation / Informational
   - Document blocking conditions

4. **Apply Blocking Rules**
   - Check policy blocking conditions
   - Check gate requirements
   - Check severity thresholds

5. **Calculate Health Score**
   - Apply weighted formula
   - Calculate category scores
   - Assign grade
   - Generate deductions

**Failure Conditions:**
- Classification failure → flag as "Needs Verification"
- Severity calibration failure → use default severity
- Release impact failure → use classification-based default
- Health Score calculation failure → use minimal score

## Stage 5: POLICY

**Inputs:** Classified findings, policy, Health Score

**Outputs:** Certification status, blocking decisions

**Owner:** Certification Engine

### Steps

1. **Check Blocking Conditions**
   - Check critical findings
   - Check security vulnerabilities
   - Check missing tests
   - Check missing documentation
   - Check score below threshold

2. **Verify Minimum Score**
   - Compare Health Score to policy minimum
   - Determine if score requirement is met

3. **Check Gate Requirements**
   - Check required gates pass
   - Check optional gates status

4. **Check Documentation Requirements**
   - Check README existence
   - Check changelog existence
   - Check contributing guidelines

5. **Determine Certification Status**
   - READY TO SHIP: all requirements met
   - READY WITH WARNINGS: minimum requirements met, warnings present
   - NOT READY: blocking issues present

**Failure Conditions:**
- Policy evaluation failure → use default policy
- Score calculation failure → treat as below threshold
- Gate requirement failure → treat as NOT READY

## Stage 6: REPORT

**Inputs:** All audit data, certification status

**Outputs:** FinalCode Certification Report, machine-readable reports

**Owner:** Report Engine

### Steps

1. **Generate Executive Dashboard**
   - Overall status
   - Health Score
   - Grade
   - Security rating
   - Estimated effort

2. **Generate All 55 Sections**
   - Follow fixed section order
   - Apply formatting rules
   - Use consistent terminology

3. **Apply Explainability Engine**
   - Add explainability blocks to findings
   - Generate evidence chains
   - Document decision traces

4. **Generate Certification Summary**
   - Final certification decision
   - Exit code
   - Overall Reliability

5. **Output Machine-Readable Reports**
   - JSON report
   - SARIF report

**Failure Conditions:**
- Section generation failure → skip section, log warning
- Formatting failure → use minimal formatting
- Machine-readable report failure → skip report, log warning

## Stage 7: CERTIFICATION

**Inputs:** Report, certification status

**Outputs:** Final report, exit code, machine-readable files

**Owner:** Certification Engine

### Steps

1. **Determine Final Certification**
   - Validate certification status
   - Confirm exit code
   - Generate certification statement

2. **Set Exit Code**
   - 0: READY TO SHIP
   - 1: READY WITH WARNINGS
   - 2: NOT READY
   - 3: NO PROJECT FOUND

3. **Generate Executive Decision Summary**
   - Automatic fixes completed
   - Human decisions required
   - Blocking decisions
   - Recommended next action

4. **Generate Migration Notes**
   - Version-specific migration steps (if applicable)
   - Breaking changes (if applicable)

5. **Output Final Report**
   - Write to `.finalcode/reports/`
   - Write machine-readable files
   - Display certification status

**Failure Conditions:**
- Report output failure → use minimal report
- File write failure → output to console
- Certification validation failure → use last known status
