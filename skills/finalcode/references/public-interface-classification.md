# FinalCode Public Interface Classification

Every exported execution interface is classified as Stable, Experimental, Internal, or Deprecated. No plugin should depend on undocumented behavior.

## Interface Classifications

### Stable Interfaces

Stable interfaces are guaranteed to maintain backward compatibility across minor versions. Changes follow semantic versioning.

| Interface | Document | Description |
|-----------|----------|-------------|
| Rule Registration | plugins/sdk.md | Register rules with owner "plugin:<name>" |
| Report Section Registration | plugins/sdk.md | Register report sections with order >= 100 |
| Framework Registration | plugins/sdk.md | Register framework detection and rules |
| Finding Format | references/finding-classification.md | Standard finding structure |
| Exit Codes | core/certification-engine.md | 0-3 exit code convention |
| Quality Gates | references/gates.md | 13 gate criteria |
| Security Gate 2.0 | references/security-gate.md | 14 security categories |
| Health Score Formula | references/health-score.md | Weighted score calculation |
| Confidence Model 2.0 | references/confidence-model.md | Six-metric confidence model |
| Report Format | references/report-format.md | 55-section report structure |
| Certification Rules | references/certification-rules.md | Finding status, classification, severity |

### Experimental Interfaces

Experimental interfaces may change across minor versions. They are opt-in and not recommended for production plugins.

| Interface | Document | Description |
|-----------|----------|-------------|
| Configuration Registration | plugins/sdk.md | Register configuration options |
| Validation Registration | plugins/sdk.md | Register validation steps |
| Recommendation Registration | plugins/sdk.md | Register recommendations |
| Marketplace Discovery | plugins/marketplace.md | Plugin discovery architecture |
| Incremental Inspection | references/configuration.md | Partial audit support |
| PR Analysis | references/configuration.md | Branch comparison analysis |

### Internal Interfaces

Internal interfaces are for FinalCode core only. Plugins must not depend on these interfaces.

| Interface | Document | Description |
|-----------|----------|-------------|
| Decision Pipeline | core/decision-engine.md | Internal decision flow |
| Policy Inheritance | core/policy-engine.md | Internal policy merging |
| Rule Lookup | core/rule-registry.md | Internal rule resolution |
| Report Section Ordering | core/report-engine.md | Internal section sequencing |
| Certification Pipeline | core/certification-engine.md | Internal orchestration |
| Self Validation | core/certification-engine.md | Internal consistency checks |
| Deterministic Output | core/report-engine.md | Internal determinism guarantees |
| Traceability | core/decision-engine.md | Internal decision tracing |

### Deprecated Interfaces

Deprecated interfaces are scheduled for removal. They generate warnings but still function.

| Interface | Document | Deprecated In | Replacement |
|-----------|----------|---------------|-------------|
| Single Confidence Number | N/A | v1.8.1 | Confidence Model 2.0 |
| Per-Category Confidence | N/A | v1.8.1 | Confidence Model 2.0 |
| Static Blocking Rules | N/A | v1.8.2 | Release Blocker Engine |
| Flat Finding List | N/A | v1.7.0 | Decision Intelligence |
| Generic "Requires Human Decision" | N/A | v1.7.0 | Decision Analysis |

## Interface Stability Rules

### Stable Interface Guarantees

1. **Semantic Versioning:** Breaking changes require major version bump
2. **Backward Compatibility:** New features are additive
3. **Deprecation Notice:** 6-month notice before removal
4. **Migration Path:** Clear upgrade instructions provided

### Experimental Interface Rules

1. **May Change:** Any experimental interface may change without notice
2. **Opt-In Only:** Requires explicit enablement
3. **No Production Use:** Not recommended for production plugins
4. **Feedback Welcome:** Changes based on community feedback

### Internal Interface Rules

1. **No External Use:** Plugins must not depend on internal interfaces
2. **No Stability Guarantee:** May change at any time
3. **No Documentation:** Not documented for external use
4. **No Support:** No support for plugins using internal interfaces

### Deprecated Interface Rules

1. **Warning Generated:** Every use generates a deprecation warning
2. **Still Functional:** Deprecated interfaces still work
3. **Removal Timeline:** Removed after deprecation period
4. **Replacement Provided:** Clear replacement documented

## Plugin Interface Summary

| Extension Point | Classification | Stability |
|-----------------|----------------|-----------|
| Rule Registration | Stable | Guaranteed |
| Report Section Registration | Stable | Guaranteed |
| Framework Registration | Stable | Guaranteed |
| Recommendation Registration | Experimental | May change |
| Validation Registration | Experimental | May change |
| Configuration Registration | Experimental | May change |
| Plugin Manifest | Stable | Guaranteed |
| Plugin Lifecycle | Stable | Guaranteed |
| Plugin Constraints | Stable | Guaranteed |
