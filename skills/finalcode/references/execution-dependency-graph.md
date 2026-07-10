# FinalCode Execution Dependency Graph

Complete execution dependency model documenting who loads each document, when it is loaded, why it is loaded, which documents depend on it, and which execution stage owns it.

## Overview

```
SKILL.md (Orchestration Layer)
    │
    ├── Core Engine Layer
    │   ├── Certification Engine ← All components
    │   ├── Decision Engine ← Rule Registry, Policy Engine
    │   ├── Policy Engine ← (standalone)
    │   ├── Rule Registry ← (standalone)
    │   ├── Report Engine ← Decision Engine, Health Score, Confidence Model
    │   └── Explainability Engine ← (standalone)
    │
    ├── Plugin Layer
    │   ├── Plugin SDK ← Rule Registry, Report Engine
    │   ├── Framework Profiles ← Plugin SDK, Rule Registry
    │   ├── Marketplace ← Plugin SDK
    │   └── Configuration ← (standalone)
    │
    └── Reference Layer
        ├── Gates ← (standalone)
        ├── Security Gate ← (standalone)
        ├── Health Score ← (standalone)
        ├── Confidence Model ← (standalone)
        ├── Finding Classification ← (standalone)
        ├── Release Engine ← (standalone)
        ├── Architecture ← (standalone)
        ├── Examples ← Report Format
        ├── Certification Rules ← (standalone)
        └── Report Format ← (standalone)
```

## Document Dependency Matrix

| Document | Loaded By | When | Why | Dependencies | Stage |
|----------|-----------|------|-----|--------------|-------|
| SKILL.md | OpenCode | Always | Orchestration | All | ALL |
| core/decision-engine.md | Certification Engine | ANALYSIS | Classify findings | Rule Registry, Policy Engine | DECISION |
| core/report-engine.md | Certification Engine | REPORT | Generate report | Decision Engine, Health Score, Confidence Model | REPORT |
| core/certification-engine.md | SKILL.md | INITIALIZATION | Orchestrate audit | All engines | ALL |
| core/policy-engine.md | Certification Engine | INITIALIZATION | Load policy | None | INITIALIZATION |
| core/rule-registry.md | Certification Engine | INITIALIZATION | Load rules | None | INITIALIZATION |
| plugins/sdk.md | Certification Engine | INITIALIZATION | Load plugins | Rule Registry, Report Engine | PLUGIN |
| plugins/profiles.md | Certification Engine | DETECTION | Detect framework | Rule Registry | DETECTION |
| plugins/marketplace.md | Plugin SDK | INITIALIZATION | Plugin discovery | Plugin SDK | PLUGIN |
| plugins/configuration.md | Certification Engine | INITIALIZATION | Load config | None | INITIALIZATION |
| references/gates.md | Decision Engine | ANALYSIS | Gate criteria | None | ANALYSIS |
| references/security-gate.md | Decision Engine | ANALYSIS | Security criteria | None | ANALYSIS |
| references/health-score.md | Report Engine | REPORT | Health calculation | None | REPORT |
| references/confidence-model.md | Report Engine | REPORT | Confidence calculation | None | REPORT |
| references/finding-classification.md | Decision Engine | DECISION | Finding rules | None | DECISION |
| references/explainability.md | Report Engine | REPORT | Explain decisions | Finding Classification | REPORT |
| references/release-engine.md | Decision Engine | DECISION | Release impact | Finding Classification | DECISION |
| references/architecture.md | SKILL.md | INITIALIZATION | System overview | None | INITIALIZATION |
| references/configuration.md | Certification Engine | INITIALIZATION | Config schema | None | INITIALIZATION |
| references/plugins.md | Plugin SDK | INITIALIZATION | Plugin architecture | Plugin SDK | PLUGIN |
| references/examples.md | Report Engine | REPORT | Formatting template | Report Format | REPORT |
| references/certification-rules.md | Decision Engine | DECISION | Certification rules | None | DECISION |
| references/report-format.md | Report Engine | REPORT | Report template | None | REPORT |

## Circular Dependency Check

No circular dependencies exist in the dependency graph.

**Verification:**
- SKILL.md → Certification Engine → Decision Engine → Rule Registry (terminal)
- SKILL.md → Certification Engine → Policy Engine (terminal)
- SKILL.md → Certification Engine → Report Engine → Health Score (terminal)
- SKILL.md → Certification Engine → Report Engine → Confidence Model (terminal)
- Plugin SDK → Rule Registry (terminal)
- Plugin SDK → Report Engine (terminal)

## Unreachable Document Check

All documents are reachable from SKILL.md through the dependency chain.

**Verification:**
- Core engines: loaded by Certification Engine
- Plugin documents: loaded by Plugin SDK or Certification Engine
- Reference documents: loaded by specific engines as needed

## Ownership Matrix

| Document | Owner | Responsible For |
|----------|-------|-----------------|
| SKILL.md | Orchestration | Execution flow, mode selection, routing |
| core/certification-engine.md | Certification Engine | Pipeline orchestration, status determination |
| core/decision-engine.md | Decision Engine | Finding classification, severity, release impact |
| core/policy-engine.md | Policy Engine | Policy loading, validation, inheritance |
| core/rule-registry.md | Rule Registry | Rule storage, lookup, validation |
| core/report-engine.md | Report Engine | Report generation, formatting, ordering |
| plugins/sdk.md | Plugin SDK | Plugin registration, lifecycle, constraints |
| plugins/profiles.md | Framework Profiles | Framework detection, rules, best practices |
| references/gates.md | Quality Gates | Gate criteria, pass/fail rules |
| references/security-gate.md | Security Gate | Security checklist, vulnerability classification |
| references/health-score.md | Health Score | Score calculation, grade assignment |
| references/confidence-model.md | Confidence Model | Confidence metrics, reliability calculation |
| references/finding-classification.md | Finding Classification | Finding format, status, lifecycle |
| references/explainability.md | Explainability Engine | Decision explanation, evidence chains |
| references/release-engine.md | Release Engine | Release blocking, deployment context |
