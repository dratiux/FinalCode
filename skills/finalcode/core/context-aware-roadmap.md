# Context-Aware Roadmap

## Purpose

Engineering recommendations and roadmap priorities must adapt to project type. A recommendation that is critical for an Enterprise API may be irrelevant for a Brand Website.

## Recommendation Adaptation

Every recommendation must include the following context-aware fields:

### Reason

Why this recommendation matters for this specific project type. The same recommendation may have different reasoning for different project types.

### Expected Engineering Gain

The expected improvement in engineering quality, security, maintainability, or operational readiness specific to this project type.

### Estimated Effort

Effort estimation in engineering hours, adapted to the project context.

### Priority

Priority level within the context of the project type. Priorities are:

- **P0 (Immediate)**: Must be resolved before next release
- **P1 (Short Term)**: Should be resolved within the current iteration
- **P2 (Medium Term)**: Plan for within the next 2-3 iterations
- **P3 (Long Term)**: Consider for future planning

### Profile Dependency

Whether this recommendation depends on a specific certification profile.

### Blocking Impact

Whether this recommendation is blocking a certification or release for this project type.

### ROI

Return on investment calculation based on engineering effort vs. expected improvement.

## Examples

### Recommendation: Implement Error Tracking

| Context | Priority | Reason |
|---|---|---|
| Enterprise SaaS | P0 | Production errors must be tracked for SLA compliance |
| Brand Website | P2 | Error tracking is beneficial but not critical |
| CLI Tool | P1 | Errors must be reported to users clearly |
| Experimental | P3 | Error tracking is low priority for experiments |

### Recommendation: Add Rate Limiting

| Context | Priority | Reason |
|---|---|---|
| REST API | P0 | Required for production API protection |
| Static Website | Ignored | No server-side endpoints to rate limit |
| Internal Tool | P2 | Low traffic volume reduces urgency |
| Browser Extension | P1 | API calls from extension should be limited |

### Recommendation: Write E2E Tests

| Context | Priority | Reason |
|---|---|---|
| Enterprise SaaS | P0 | Critical flows must be verified end-to-end |
| Library | P2 | Unit tests are sufficient for libraries |
| Brand Website | P2 | Manual verification may be sufficient |
| Prototype | Ignored | Prototypes do not require E2E tests |

## Roadmap Structure

The context-aware roadmap is organized by time horizon:

### Immediate (Current Sprint)

- P0 items specific to the project type
- Release blockers
- Critical security issues

### Short Term (Next Sprint)

- P1 items
- Quick wins with high ROI
- Profile-recommended improvements

### Medium Term (Next Quarter)

- P2 items
- Architectural improvements
- Testing infrastructure

### Long Term (Future)

- P3 items
- Major refactoring candidates
- Strategic improvements

## Integration

The Context-Aware Roadmap replaces the existing engineering roadmap. It is generated after all findings are collected and is included in the certification report.
