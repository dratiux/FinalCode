# FinalCode — Configuration, Profiles, Baseline, Ignore, Incremental Inspection, PR Analysis & Machine-Readable Reports

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Defines configuration schema, profiles, baseline, ignore rules, and machine-readable reports |
| Execution Stage | INITIALIZATION |
| Loaded By | Certification Engine, Policy Engine |
| Dependencies | None (standalone) |
| Outputs | Configuration schema, profile definitions, baseline format, ignore rules |
| Consumers | Certification Engine, Policy Engine, User |
| Applies To | All audits |

This file is the detailed reference for the v1.8.0 configurable engineering platform. The `source/SKILL.md` section "Configurable Engineering Platform (v1.8.0)" is the summary; this file holds the schemas, examples, and edge-case rules. FinalCode loads these features without changing any existing Quality Gate, Security Gate, operational mode, or Engineering Intelligence behavior — they only adjust *which* rules apply and *how* results are presented.

---

## 1. Project Configuration

FinalCode reads an optional configuration file. It looks for, in order:

1. `finalcode.config.json` at the repository root
2. `.finalcode/config.json`

If neither exists, FinalCode uses its **default production policy** (see Profiles below) and reports "Default production policy (no config file found)".

### Configuration Schema

```json
{
  "profile": "production",
  "enabledGates": ["architecture", "security", "testing"],
  "disabledGates": ["documentation"],
  "requiredGates": ["security", "type-safety"],
  "severityOverrides": {
    "FC-DEP-001": "medium"
  },
  "healthScoreTarget": 90,
  "testing": {
    "required": true,
    "minCoverage": 80
  },
  "ci": {
    "required": true
  },
  "documentation": {
    "required": true,
    "readmeRequired": true
  },
  "refactorPreferences": {
    "maxFunctionLength": 60,
    "preferSmallRefactors": true
  },
  "ignorePaths": ["coverage/", "generated/", "vendor/"],
  "policy": {
    "allowAny": false,
    "maxComplexity": 15,
    "requireSecurityGate": true
  }
}
```

### Field Reference

| Field | Meaning |
|---|---|
| `profile` | Built-in profile name (see Profiles). Overrides defaults. |
| `enabledGates` | Gates to run. If set, only these run. |
| `disabledGates` | Gates to skip. Cannot disable a gate listed in `requiredGates`. |
| `requiredGates` | Gates that must PASS for certification. |
| `severityOverrides` | Map of FinalCode ID → new severity (e.g. downgrade a known tolerated issue). |
| `healthScoreTarget` | Minimum Health Score for READY TO SHIP. |
| `testing` / `ci` / `documentation` | Requirement toggles surfaced in the policy engine. |
| `refactorPreferences` | Hints for Refactor Mode. |
| `ignorePaths` | Paths excluded from inspection (alternative to `.finalcodeignore`). |
| `policy` | Hard certification levers (any allowed?, max complexity, mandatory Security Gate). |

Disabling a mandatory gate (Security, or one in `requiredGates`) is rejected with a clear message: the gate is re-enabled and the override is ignored, recorded in the report.

---

## 2. Project Profiles

A profile is a named bundle of policy defaults. Selecting one changes certification requirements automatically. The selected profile is printed in every report's **Engineering Policy** section and in Repository Metadata.

| Profile | Adjustments |
|---|---|
| `production` | Strict defaults: Security Gate mandatory, tests required, Health Score target 90, `any` forbidden, max complexity 15 |
| `enterprise` | Like production plus mandatory CI, documentation, accessibility; stricter severity for compliance |
| `open-source` | Health Score target 80, documentation required, Security Gate recommended but not blocking for non-critical findings |
| `library` | Emphasizes API stability, type safety, documentation; performance/deployment gates de-emphasized |
| `cli` | Emphasizes error handling, dependencies, documentation; UI/Accessibility gates not applicable |
| `browser-extension` | Emphasizes security (permissions, CSP), dependencies; backend gates not applicable |
| `desktop` | Emphasizes error handling, security, packaging; cloud/deployment gates not applicable |
| `web-application` | Balanced; all gates apply |
| `api` | Emphasizes security, error handling, type safety, documentation; UI gates not applicable |
| `mobile` | Emphasizes error handling, security, performance on-device; desktop gates not applicable |
| `mvp` | Relaxed: Health Score target 70, tests recommended not required, `any` allowed with review; still blocks on Critical/High security |

If a profile is not applicable to the detected stack (e.g. `cli` selected for a React app), FinalCode notes the mismatch but proceeds using the profile's policy; it never fails solely because of a profile/stack mismatch.

---

## 3. Baseline System

FinalCode supports a **known-issues baseline** distinct from the v1.6.0 health `BASELINE.md`. The baseline file is `.finalcode/baseline.json`.

### Purpose

Known, accepted issues are recorded as baseline findings. On every subsequent run, FinalCode compares current findings against the baseline and reports:

- **Baseline Findings** — issues carried over from the baseline (acknowledged, not newly introduced)
- **New Findings** — issues not present in the baseline
- **Resolved Findings** — baseline issues no longer present
- **Regression Findings** — baseline issues that worsened in severity
- **Severity Changes** — findings whose severity moved up or down vs. baseline

### Schema

```json
{
  "version": 1,
  "createdAt": "2026-07-08",
  "findings": [
    {
      "id": "FC-TYPE-001",
      "severity": "medium",
      "category": "type-safety",
      "note": "Accepted pending API contract stabilization"
    }
  ]
}
```

### Behavior

- If `.finalcode/baseline.json` exists, the report adds a **Baseline Analysis** block with the five categories above.
- If it does not exist, FinalCode uses the first run's findings as the implicit baseline only when the user explicitly initializes one (e.g. "set current findings as baseline"). Otherwise the section states "No baseline configured."
- Baseline findings never auto-resolve; they move to Resolved only when the underlying issue is gone.
- This is separate from and additive to the v1.6.0 `BASELINE.md` health snapshot and `TREND.md`.

---

## 4. Ignore System

FinalCode honors a `.finalcodeignore` file at the repository root (syntax like `.gitignore`). Ignored paths are excluded from inspection.

- A matched file is never audited and never produces findings.
- Ignored paths MUST appear in **Repository Coverage** under "Files Ignored" with the reason "matched .finalcodeignore".
- If both `ignorePaths` in config and `.finalcodeignore` exist, their rules are merged.
- Common entries: `coverage/`, `generated/`, `vendor/`, `legacy/`, `build/`, `dist/`.

FinalCode must never silently ignore files outside this mechanism.

---

## 5. Incremental Inspection

When Git is available, FinalCode can inspect less than the whole repository:

| Inspection Type | When | Scope |
|---|---|---|
| `Full` | No Git, or first run, or explicitly requested | Entire repository |
| `Incremental` | Git available and a limited change set | Only changed files since the comparison base |
| `Dependency Based` | Incremental run that then expands to affected dependents | Changed files + their dependency graph |

The chosen type is printed in Repository Metadata / Documentation Standards as **Inspection Type**. An Incremental or Dependency Based run that discovers issues outside the changed set escalates to a Full run and notes the escalation in the report.

---

## 6. Pull Request Analysis

When Git is available and a target branch can be determined (default `main`/`master`, overridable via config or argument), FinalCode compares the current branch against the target and produces a PR analysis. Available in **Inspect Mode** and **Certify Mode**.

The analysis reports:

| Field | Meaning |
|---|---|
| Files Changed | Files differing from the target branch |
| New Findings | Findings introduced on this branch |
| Resolved Findings | Findings present on target but fixed on this branch |
| Regression Summary | Findings that worsened vs. target |
| Risk Level | Low / Medium / High for the change set |
| Estimated Review Time | Rough human review effort (e.g. "≈ 25 min") |

PR analysis reuses the incremental/diff machinery and never requires a Full inspection unless issues force escalation.

---

## 7. Machine-Readable Reports

In addition to the Markdown Certification Report, FinalCode generates:

- `report.json` — every finding with `id`, `severity`, `category`, `confidence`, `gate`, `status`, `files`, `recommendation`, plus metadata, policy, health score, and certification.
- `report.sarif` — SARIF 2.1.0 compatible with GitHub Code Scanning. Each finding maps to a `result` with `ruleId` = FinalCode ID, `level` derived from severity (critical/high → `error`, medium → `warning`, low/informational → `note`), and `locations` from `files`.

Both files are written to `.finalcode/reports/` alongside the Markdown report (same timestamp prefix). If JSON/SARIF generation fails, the Markdown report remains authoritative and the failure is recorded in the Reliability Statement.

---

## 8. Policy Engine Summary in Reports

Every report includes an **Engineering Policy** section:

| Field | Meaning |
|---|---|
| Profile | Selected profile name |
| Enabled Rules | Gates/policy rules active this run |
| Disabled Rules | Gates/policy rules skipped (and why) |
| Configuration Source | `finalcode.config.json`, `.finalcode/config.json`, or "default production policy" |
| Policy Version | FinalCode policy schema version (e.g. `policy-1`) |

This makes every certification reproducible and auditable.
