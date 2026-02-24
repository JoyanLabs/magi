# SKILL Template

Copia este template para crear nuevos skills:

```markdown
---
name: skill-name
description: >
  Descripción breve de qué hace este skill.
  Trigger: Cuándo la IA debería cargar este skill.
license: MIT
metadata:
  author: magi-framework
  version: "1.0.0"
  scope: [root]
  auto_invoke: "Acción que triggerea este skill"
---

## When to Use

- [Punto 1: Cuándo usar este skill]
- [Punto 2: Cuándo NO usar este skill]

## Critical Patterns

### [Patrón Crítico 1]

**Regla principal que la IA debe seguir:**

```typescript
// Ejemplo de código
interface Example {
  property: string;
}
```

### [Patrón Crítico 2]

**Segunda regla importante:**

```typescript
// Ejemplo adicional
export function example(): void {
  // Implementación
}
```

## Code Examples

### Ejemplo 1: [Título del ejemplo]

```typescript
// Código mínimo de ejemplo
```

### Ejemplo 2: [Otro ejemplo]

```typescript
// Código de ejemplo
```

## Commands

```bash
# Comando 1
npm run dev

# Comando 2
npm run build

# Comando 3
npm test
```

## Context7 MCP

| Library | Context7 ID | Use For |
|---------|-------------|---------|
| [Nombre](URL) | [ID] | [Propósito] |

## Resources

- **Templates**: Ver [assets/](assets/) para plantillas
- **Documentation**: Ver [references/](references/) para documentación local
```

---

## Estructura de Directorios

```
skills/{skill-name}/
├── SKILL.md              # Este archivo
├── assets/               # Opcional
│   └── template.ts
└── references/           # Opcional
    └── docs.md
```
