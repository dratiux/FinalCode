# FinalCode API Contract Validation

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Validates API contracts between client, server, and shared types |
| Execution Stage | ANALYSIS |
| Loaded By | Engineering Review Mode, Production Audit |
| Dependencies | Repository Intelligence Engine, Engineering Graph |
| Outputs | API compatibility report with mismatches |
| Consumers | Report Engine, User |
| Applies To | All audits |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| repositoryProfile | object | Yes | Repository Intelligence Engine |
| engineeringGraph | object | Yes | Engineering Graph |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| apiReport | object | API compatibility report |
| missingFields | array | Missing fields in contracts |
| typeMismatches | array | Type mismatches between client/server |
| breakingChanges | array | Breaking changes detected |
| unusedEndpoints | array | Unused API endpoints |
| orphanDTOs | array | Orphan data transfer objects |

### Preconditions

- Repository Profile must be generated
- Engineering Graph must be built
- API files must be identified

### Postconditions

- API contracts are validated
- Mismatches are identified
- Breaking changes are detected

## Purpose

API Contract Validation automatically compares client, server, shared types, and validation schemas. It detects missing fields, type mismatches, breaking changes, unused endpoints, and orphan DTOs.

**Why this matters:** API contracts can drift apart between client and server, causing runtime errors. By validating contracts, FinalCode ensures API compatibility and prevents integration issues.

## Validation Methods

### Client-Server Comparison

Compare client and server API definitions:

| Check | Description |
|-------|-------------|
| Endpoint match | Client endpoints match server endpoints |
| Request schema match | Client request schemas match server |
| Response schema match | Client response schemas match server |
| Header match | Client headers match server |

### Type Comparison

Compare shared types between client and server:

| Check | Description |
|-------|-------------|
| Type definition match | Types are defined consistently |
| Field types match | Field types are consistent |
| Optional fields match | Optional fields are consistent |
| Enum values match | Enum values are consistent |

### Schema Validation

Compare validation schemas:

| Check | Description |
|-------|-------------|
| Validation rules match | Validation rules are consistent |
| Required fields match | Required fields are consistent |
| Format validation match | Format validation is consistent |
| Constraint match | Constraints are consistent |

## Detection Methods

### Missing Fields

Detect fields missing in contracts:

| Detection Method | Description |
|-----------------|-------------|
| Schema comparison | Compare client and server schemas |
| Type analysis | Analyze type definitions |
| Field usage analysis | Analyze field usage |

### Type Mismatches

Detect type mismatches between client and server:

| Detection Method | Description |
|-----------------|-------------|
| Type comparison | Compare type definitions |
| Field type analysis | Analyze field types |
| Return type analysis | Analyze return types |

### Breaking Changes

Detect breaking changes in API:

| Detection Method | Description |
|-----------------|-------------|
| Endpoint analysis | Analyze endpoint changes |
| Schema analysis | Analyze schema changes |
| Header analysis | Analyze header changes |
| Status code analysis | Analyze status code changes |

### Unused Endpoints

Detect unused API endpoints:

| Detection Method | Description |
|-----------------|-------------|
| Client usage analysis | Analyze client API calls |
| Route analysis | Analyze route definitions |
| Handler analysis | Analyze route handlers |

### Orphan DTOs

Detect orphan data transfer objects:

| Detection Method | Description |
|-----------------|-------------|
| DTO usage analysis | Analyze DTO usage |
| Import analysis | Analyze DTO imports |
| Reference analysis | Analyze DTO references |

## Output Format

```
API CONTRACT VALIDATION
==================================================
Overall Status: Warning

Missing Fields: 2
  1. UserResponse missing 'createdAt' field (Server has it)
  2. CreateUserRequest missing 'email' field (Client has it)

Type Mismatches: 3
  1. UserResponse.id: string (Client) vs number (Server)
  2. CreateUserRequest.age: number (Client) vs string (Server)
  3. UserResponse.email: string (Client) vs Email (Server)

Breaking Changes: 1
  1. DELETE /api/users/:id returns 204 (was 200)

Unused Endpoints: 2
  1. GET /api/users/:id (not used by client)
  2. PUT /api/users/:id (not used by client)

Orphan DTOs: 1
  1. OldUserDTO (not used anywhere)

Recommendations:
  1. Add 'createdAt' field to UserResponse
  2. Remove 'email' field from CreateUserRequest or add to server
  3. Align id types between client and server
  4. Align age types between client and server
  5. Update client to handle 204 response
  6. Remove unused endpoints or document them
  7. Remove OldUserDTO

Compatibility Score: 75%
==================================================
```

## Architecture Explainability

### Responsibilities

- Compare client and server contracts
- Detect missing fields
- Detect type mismatches
- Detect breaking changes
- Detect unused endpoints
- Detect orphan DTOs

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Contract comparison
- Mismatch detection
- Breaking change detection
- Recommendation generation

### Consumed Decisions

- Repository Profile (from Repository Intelligence Engine)
- Engineering Graph (from Engineering Graph Engine)

### Produced Decisions

- API compatibility report
- Missing fields
- Type mismatches
- Breaking changes
