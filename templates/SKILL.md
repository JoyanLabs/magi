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
allowed-tools: Read, Edit, Write, Glob, Grep, Bash
---

## Human in the Loop (HITL)

**Importante:** Este skill puede requerir confirmación del usuario antes de ejecutar acciones sensibles.

```markdown
📝 [Resumen de la acción]

¿Confirmas?
1) Sí, continuar
2) No, cancelar
3) Modificar antes de continuar
```


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

## Decision Tree

```
¿Pregunta de decisión?
├── Sí → [Acción A]
└── No → ¿Otra pregunta?
    ├── Sí → [Acción B]
    └── No → [Acción C]
```

---

## Anexo: Estructura de Directorios

```
skills/{skill-name}/
├── SKILL.md              # Este archivo
├── assets/               # Opcional - plantillas, schemas, ejemplos
│   └── template.ts
└── references/           # Opcional - links a docs locales
    └── docs.md
```

---

## Anexo: Campos del Frontmatter

| Campo | Requerido | Descripción |
|-------|-----------|-------------|
| `name` | Sí | Identificador (lowercase, guiones) |
| `description` | Sí | Qué + Trigger en un bloque |
| `license` | Sí | MIT |
| `metadata.author` | Sí | magi-framework |
| `metadata.version` | Sí | Versión semántica |
| `metadata.scope` | Sí | Array: [root], [root, api], etc. |
| `metadata.auto_invoke` | Sí | Acción que triggerea |
| `metadata.status` | Opcional | draft para skills en definición |
