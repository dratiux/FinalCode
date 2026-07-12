# FinalCode Knowledge Base — Next.js

## Framework Detection Signals

| Signal | Confidence |
|--------|-----------|
| `next` in package.json dependencies | High |
| `next.config.js` or `next.config.mjs` present | High |
| Pages or App Router structure | High |
| `next.config.ts` present | High |

## Best Practices

### Routing

| Practice | Description |
|----------|-------------|
| File-based routing | Use file system for route structure |
| Layouts | Use layouts for shared UI |
| Loading states | Use loading.tsx for async routes |
| Error handling | Use error.tsx for route errors |

### Data Fetching

| Practice | Description |
|----------|-------------|
| Server Components | Fetch data in Server Components |
| Caching | Use appropriate cache strategies |
| Revalidation | Use ISR for dynamic-static content |
| Streaming | Use Suspense for progressive rendering |

### Rendering

| Practice | Description |
|----------|-------------|
| SSR | Server-side rendering for SEO |
| SSG | Static generation for performance |
| ISR | Incremental static regeneration |
| Client Components | Use 'use client' only when needed |

### Performance

| Practice | Description |
|----------|-------------|
| Image optimization | Use next/image |
| Font optimization | Use next/font |
| Script optimization | Use next/script |
| Bundle analysis | Analyze bundle size regularly |

## Known Anti-Patterns

### Routing

| Anti-Pattern | Issue | Fix |
|-------------|-------|-----|
| Client-side routing only | SEO issues | Use Server Components |
| Missing loading states | Poor UX | Add loading.tsx |
| Missing error boundaries | Crash risk | Add error.tsx |
| Nested layouts missing | Inconsistent UI | Use layout.tsx |

### Data Fetching

| Anti-Pattern | Issue | Fix |
|-------------|-------|-----|
| Fetching in useEffect | Waterfall, no caching | Use Server Components |
| No cache strategy | Stale data or no caching | Use revalidation |
| Client-side data loading | Slow initial load | Server-side fetching |
| Missing error handling | Unhandled fetch errors | Add error boundaries |

### Rendering

| Anti-Pattern | Issue | Fix |
|-------------|-------|-----|
| 'use client' on all components | Loss of SSR benefits | Minimize client components |
| Server Components with hooks | Runtime error | Move to client component |
| Mixing server/client incorrectly | Data leaks | Separate concerns |

## Common False Positives

### Pattern: Client-Side State

**Observation:** useState in components
**Context:** Interactive UI elements that require client state
**Verdict:** False positive — client state is necessary for interactivity

### Pattern: API Routes

**Observation:** API routes in pages/api
**Context:** Backend endpoints for the application
**Verdict:** False positive — API routes are standard in Next.js

### Pattern: Dynamic Imports

**Observation:** dynamic() imports
**Context:** Code splitting for large components
**Verdict:** False positive — dynamic imports are recommended

## Idiomatic Patterns

### Server Component Pattern

```typescript
async function DataComponent() {
  const data = await fetchData();

  return (
    <div>
      {data.map(item => (
        <div key={item.id}>{item.name}</div>
      ))}
    </div>
  );
}
```

### Client Component Pattern

```typescript
'use client';

import { useState } from 'react';

export function InteractiveComponent() {
  const [count, setCount] = useState(0);

  return (
    <button onClick={() => setCount(prev => prev + 1)}>
      Count: {count}
    </button>
  );
}
```

### Layout Pattern

```typescript
export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
```

### Route Handler Pattern

```typescript
import { NextRequest, NextResponse } from 'next/server';

export async function GET(request: NextRequest) {
  const data = await getData();
  return NextResponse.json(data);
}
```

## Version-Specific Considerations

### Next.js 13+ (App Router)

| Feature | Consideration |
|---------|---------------|
| Server Components | Default rendering mode |
| Client Components | Explicit 'use client' directive |
| Layouts | Persistent layouts across routes |
| Loading | Built-in loading states |
| Error | Built-in error boundaries |

### Next.js 14+

| Feature | Consideration |
|---------|---------------|
| Server Actions | Form handling without API routes |
| Partial Prerendering | Dynamic and static content |
| Metadata API | SEO optimization |

## Integration Concerns

### Next.js + TypeScript

| Concern | Recommendation |
|---------|----------------|
| Route types | Use typed routes |
| API route types | Type request/response |
| Page props | Type page components |
| Layout types | Type layout components |

### Next.js + Authentication

| Concern | Recommendation |
|---------|----------------|
| Session management | Use middleware |
| Protected routes | Use middleware checks |
| API authentication | Validate in route handlers |
