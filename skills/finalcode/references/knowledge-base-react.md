# FinalCode Knowledge Base — React

## Framework Detection Signals

| Signal | Confidence |
|--------|-----------|
| `react` in package.json dependencies | High |
| JSX/TSX files present | High |
| React component patterns (useState, useEffect) | High |
| Next.js with React renderer | High |

## Best Practices

### Component Architecture

| Practice | Description |
|----------|-------------|
| Functional components | Use functional components with hooks |
| Single responsibility | Each component does one thing |
| Composition over inheritance | Compose small components |
| Props drilling avoidance | Use Context or state management |

### Hooks

| Practice | Description |
|----------|-------------|
| Rules of Hooks | Only call hooks at top level |
| Dependency arrays | Always include all dependencies |
| Custom hooks | Extract reusable logic to custom hooks |
| useCallback/useMemo | Memoize expensive computations |

### State Management

| Practice | Description |
|----------|-------------|
| Local state | Use useState for component-local state |
| Global state | Use Context or state library for shared state |
| Derived state | Compute from existing state, don't duplicate |
| Immutable updates | Never mutate state directly |

### Performance

| Practice | Description |
|----------|-------------|
| React.memo | Memoize components that render often |
| Lazy loading | Use React.lazy for route-based code splitting |
| Virtualization | Use virtual scrolling for long lists |
| Image optimization | Use next/image or equivalent |

## Known Anti-Patterns

### State Management

| Anti-Pattern | Issue | Fix |
|-------------|-------|-----|
| useState for global state | Prop drilling, re-renders | Use Context or state library |
| Mutating state directly | Won't trigger re-render | Use immutable updates |
| Stale closures | Incorrect values in effects | Add dependencies to useEffect |
| Missing dependency arrays | Effects run every render | Add empty or specific deps |

### Performance

| Anti-Pattern | Issue | Fix |
|-------------|-------|-----|
| Inline functions in JSX | New function every render | useCallback or define outside |
| Unnecessary re-renders | Performance impact | React.memo, useMemo |
| Large bundle size | Slow initial load | Code splitting, tree shaking |
| Unoptimized images | Slow loading, layout shift | Use optimized image components |

### Hooks

| Anti-Pattern | Issue | Fix |
|-------------|-------|-----|
| Conditional hooks | Breaks Rules of Hooks | Move to separate component |
| Async useEffect | Race conditions | Use cleanup function |
| Missing cleanup | Memory leaks | Return cleanup function |
| Deep dependency arrays | Stale values | Restructure or use ref |

## Common False Positives

### Pattern: Console.log in Development

**Observation:** console.log statements found
**Context:** Development-only code, gated by NODE_ENV
**Verdict:** False positive — not a security issue in development

### Pattern: Type Assertions

**Observation:** `as Type` assertions found
**Context:** Necessary for third-party library integration
**Verdict:** False positive — type assertions may be required

### Pattern: Any Type Usage

**Observation:** `any` type used
**Context:** Dynamic data from API, migration in progress
**Verdict:** Needs verification — may be intentional or temporary

### Pattern: Empty Catch Blocks

**Observation:** Empty catch blocks found
**Context:** Error intentionally ignored (e.g., optional chaining polyfill)
**Verdict:** Needs verification — may be intentional

## Idiomatic Patterns

### Functional Component Pattern

```typescript
interface ComponentProps {
  title: string;
  onSelect: (id: string) => void;
}

export function Component({ title, onSelect }: ComponentProps) {
  const [state, setState] = useState<string>('');

  const handleClick = useCallback(() => {
    onSelect(state);
  }, [onSelect, state]);

  return <div onClick={handleClick}>{title}</div>;
}
```

### Custom Hook Pattern

```typescript
function useDocumentTitle(title: string) {
  useEffect(() => {
    document.title = title;
    return () => {
      document.title = 'Default Title';
    };
  }, [title]);
}
```

### Context Provider Pattern

```typescript
interface ThemeContextType {
  theme: 'light' | 'dark';
  toggleTheme: () => void;
}

const ThemeContext = createContext<ThemeContextType | undefined>(undefined);

export function ThemeProvider({ children }: { children: ReactNode }) {
  const [theme, setTheme] = useState<'light' | 'dark'>('light');

  const toggleTheme = useCallback(() => {
    setTheme(prev => (prev === 'light' ? 'dark' : 'light'));
  }, []);

  return (
    <ThemeContext.Provider value={{ theme, toggleTheme }}>
      {children}
    </ThemeContext.Provider>
  );
}
```

## Version-Specific Considerations

### React 17+

| Feature | Consideration |
|---------|---------------|
| JSX Transform | No need to import React |
| Concurrent Mode | New rendering behavior |
| Suspense | Async loading patterns |

### React 18+

| Feature | Consideration |
|---------|---------------|
| Automatic Batching | Multiple state updates batched |
| Transitions | useTransition for non-urgent updates |
| Suspense on Server | Server-side rendering changes |
| useId | Stable IDs for accessibility |

## Integration Concerns

### React + TypeScript

| Concern | Recommendation |
|---------|----------------|
| JSX typing | Use React.JSX.Element |
| Event types | Use React.MouseEvent, etc. |
| Ref types | Use React.RefObject |
| Children types | Use React.ReactNode |

### React + Testing Library

| Concern | Recommendation |
|---------|----------------|
| Query priority | Use screen.getByRole |
| Async operations | Use waitFor |
| User events | Use @testing-library/user-event |
