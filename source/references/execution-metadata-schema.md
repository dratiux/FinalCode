# Execution Metadata Schema

Defines the standard metadata block that every FinalCode document must include. This metadata describes how the document participates in FinalCode execution.

## Standard Execution Metadata Block

Every document must begin with this block:

```markdown
## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | <what this document defines or controls> |
| Execution Stage | <when this document is consulted during an audit> |
| Loaded By | <which component or stage loads this document> |
| Dependencies | <other documents required before this one> |
| Outputs | <what this document produces or defines> |
| Consumers | <which components consume this document's outputs> |
| Applies To | <scope of applicability — all audits, specific gates, specific modes> |
```

## Field Definitions

### Purpose

What this document defines or controls. One of:
- Defines behavior (how a component operates)
- Defines format (output structure)
- Defines rules (engineering criteria)
- Defines configuration (settings and options)
- Defines contracts (extension interfaces)
- Provides reference (detailed specifications)

### Execution Stage

When this document is consulted during an audit:

| Stage | Description |
|-------|-------------|
| INITIALIZATION | Before any analysis begins |
| DETECTION | Framework and project detection |
| ANALYSIS | Quality gate execution |
| DECISION | Finding classification and severity |
| POLICY | Policy evaluation and blocking |
| REPORT | Report generation |
| CERTIFICATION | Final certification decision |
| PLUGIN | Plugin registration and execution |
| VALIDATION | Self-validation checks |

### Loaded By

Which component loads this document:
- Certification Engine
- Decision Engine
- Policy Engine
- Rule Registry
- Report Engine
- Plugin SDK
- Configuration System
- SKILL.md (orchestration)

### Dependencies

Other documents required before this one can be loaded. Empty if standalone.

### Outputs

What this document produces or defines:
- Rules
- Formats
- Schemas
- Policies
- Sections
- Contracts
- Configurations

### Consumers

Which components consume this document's outputs:
- All components (used universally)
- Specific engine (used by one engine)
- Plugins (extension interface)
- Configuration (settings interface)

### Applies To

Scope of applicability:
- All audits
- Specific gates (Security, Type Safety, etc.)
- Specific modes (Inspect, Repair, Refactor, Certify)
- Plugin extensions
- Configuration
