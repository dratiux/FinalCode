# Reference Contract Schema

Defines the standard contract block that every FinalCode reference document must include. This contract makes the document behave like an engineering specification rather than explanatory documentation.

## Standard Reference Contract Block

Every reference document must include this block after the Execution Metadata:

```markdown
## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| <input name> | <type> | Yes/No | <where this comes from> |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| <output name> | <type> | <what this produces> |

### Preconditions

- <condition that must be true before this document is consulted>

### Postconditions

- <condition that is guaranteed after this document is consulted>

### Required Evidence

| Evidence | Purpose |
|----------|---------|
| <evidence type> | <why this evidence is needed> |

### Generated Decisions

| Decision | Rule |
|----------|------|
| <decision type> | <rule that produces this decision> |

### Possible Outcomes

| Outcome | Condition |
|---------|-----------|
| <outcome> | <when this outcome occurs> |
```

## Field Definitions

### Inputs

What this document requires to function. Each input has:
- Name: what it is
- Type: data type (string, object, array, boolean, number)
- Required: whether it must be present
- Source: which component provides it

### Outputs

What this document produces. Each output has:
- Name: what it is
- Type: data type
- Description: what it contains

### Preconditions

Conditions that must be true before this document is consulted. If preconditions are not met, the document should not be loaded.

### Postconditions

Conditions that are guaranteed after this document is consulted. The consumer can rely on these conditions being true.

### Required Evidence

What evidence this document needs to make its decisions. If evidence is unavailable, the document must state what could not be verified.

### Generated Decisions

What decisions this document produces. Each decision has:
- Name: what is decided
- Rule: which rule produces this decision

### Possible Outcomes

What outcomes are possible. Each outcome has:
- Name: what happens
- Condition: when this outcome occurs
