# FinalCode Knowledge Base — TypeScript

## Framework Detection Signals

| Signal | Confidence |
|--------|-----------|
| `typescript` in package.json dependencies | High |
| `.ts` or `.tsx` files present | High |
| `tsconfig.json` present | High |
| TypeScript compiler options | High |

## Best Practices

### Type Safety

| Practice | Description |
|----------|-------------|
| Strict mode | Enable strict compiler options |
| Explicit types | Define types explicitly |
| Type guards | Use type guards for narrowing |
| Discriminated unions | Use discriminated unions |

### Interfaces vs Types

| Use Case | Recommendation |
|----------|----------------|
| Object shapes | Use interfaces |
| Union types | Use types |
| Extending | Use interfaces |
| Composing | Use types |

### Generics

| Practice | Description |
|----------|-------------|
| Constrained generics | Use extends to constrain |
| Default types | Provide default types |
| Utility types | Use built-in utility types |
| Type inference | Let TypeScript infer when possible |

### Error Handling

| Practice | Description |
|----------|-------------|
| Typed errors | Use typed error returns |
| Never type | Use never for exhaustive checks |
| Result pattern | Use Result type for operations |
| Error boundaries | Type error responses |

## Known Anti-Patterns

### Type Safety

| Anti-Pattern | Issue | Fix |
|-------------|-------|-----|
| `any` type usage | Loses type safety | Use unknown or proper type |
| Type assertions | Bypasses type checking | Use type guards |
| Non-null assertion | Runtime errors | Use optional chaining |
| Double assertion | Type safety bypass | Use intermediate type |

### Generics

| Anti-Pattern | Issue | Fix |
|-------------|-------|-----|
| Overusing any | Loses type information | Use proper constraints |
| Complex generics | Hard to understand | Simplify types |
| Missing defaults | Hard to use | Provide default types |

### Enums

| Anti-Pattern | Issue | Fix |
|-------------|-------|-----|
| Mutable enums | Runtime issues | Use as const |
| String enums without type | Type issues | Use string literal unions |
| Enum in libraries | Bundle size | Use const objects |

## Common False Positives

### Pattern: Type Assertions

**Observation:** `as Type` assertions
**Context:** Third-party library integration, DOM manipulation
**Verdict:** False positive — assertions may be necessary

### Pattern: Any Type Usage

**Observation:** `any` type
**Context:** Migration in progress, dynamic data
**Verdict:** Needs verification — may be temporary

### Pattern: Non-null Assertion

**Observation:** `!` operator
**Context:** Guaranteed by runtime logic
**Verdict:** Needs verification — may be valid

### Pattern: Enum Usage

**Observation:** enum declarations
**Context:** Legacy code, library compatibility
**Verdict:** False positive — enums are valid TypeScript

## Idiomatic Patterns

### Discriminated Union Pattern

```typescript
type Result<T> =
  | { success: true; data: T }
  | { success: false; error: string };

function processData(result: Result<User>) {
  if (result.success) {
    console.log(result.data.name);
  } else {
    console.error(result.error);
  }
}
```

### Type Guard Pattern

```typescript
function isString(value: unknown): value is string {
  return typeof value === 'string';
}

function process(value: string | number) {
  if (isString(value)) {
    console.log(value.toUpperCase());
  } else {
    console.log(value.toFixed(2));
  }
}
```

### Branded Type Pattern

```typescript
type UserId = string & { readonly __brand: unique symbol };

function createUserId(id: string): UserId {
  return id as UserId;
}

function getUser(id: UserId) {
  // id is guaranteed to be a UserId
}
```

### Exhaustive Check Pattern

```typescript
function assertNever(value: never): never {
  throw new Error(`Unexpected value: ${value}`);
}

type Status = 'active' | 'inactive' | 'pending';

function handleStatus(status: Status) {
  switch (status) {
    case 'active':
      return 'Active';
    case 'inactive':
      return 'Inactive';
    case 'pending':
      return 'Pending';
    default:
      return assertNever(status);
  }
}
```

## Version-Specific Considerations

### TypeScript 4.7+

| Feature | Consideration |
|---------|---------------|
| Object groups | Group object patterns |
| Template string types | Advanced string types |
| Variance annotations | Explicit variance |

### TypeScript 5.0+

| Feature | Consideration |
|---------|---------------|
| Decorators | Standard decorators |
| const type parameters | Infer const types |
| Multiple config extensions | Extend multiple configs |

### TypeScript 5.2+

| Feature | Consideration |
|---------|---------------|
| Using declarations | Resource management |
| Named and anonymous parameters | Better inference |

## Integration Concerns

### TypeScript + ESLint

| Concern | Recommendation |
|---------|----------------|
| Type-aware rules | Enable type-aware rules |
| Custom rules | Add TypeScript-specific rules |
| Parser | Use @typescript-eslint/parser |

### TypeScript + Jest

| Concern | Recommendation |
|---------|----------------|
| Transform | Configure ts-jest or swc |
| Types | Add Jest types |
| Mocking | Use typed mocks |

### TypeScript + React

| Concern | Recommendation |
|---------|----------------|
| JSX | Configure jsx option |
| Props | Type component props |
| Hooks | Type hook returns |
