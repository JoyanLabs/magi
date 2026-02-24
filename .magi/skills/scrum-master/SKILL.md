---
name: scrum-master
description: >
  Skill para gestión de proyectos Scrum: sprints, backlog, ceremonias y seguimiento.
  Trigger: Cuando necesitas planificar sprints, gestionar backlog o facilitar ceremonias ágiles.
license: MIT
metadata:
  author: magi-team
  version: "1.1.0"
  scope: [root]
  auto_invoke: "Gestionando Scrum"
allowed-tools: mem_*, write, edit, question, plane_*
---

# Skill Scrum Master

## REGLA CRÍTICA: Acceso a Plane

⚠️ **El Scrum Master es el único agente que puede acceder a Plane.**

| Herramienta | Quién puede usar |
|-------------|-------------------|
| plane_* | ✅ Scrum Master - SÍ |
| plane_* | ❌ Orquestador - NO |
| plane_* | ❌ Documentador - NO |

## Propósito

Skill para gestionar proyectos usando metodología Scrum.

## Sincronización con Plane

**IMPORTANTE:** Antes de crear tareas en Plane, consulta el skill subordinado:
- `.magi/skills/scrum-master/plane-sincronizacion/SKILL.md`

Este skill contiene:
- Plantilla estándar de Historia de Usuario
- Formato correcto de markdown (sin líneas vacías)
- Cómo evitar duplicar títulos

## Planificación de Sprint

### Entrada

- Épicas e historias de usuario del Arquitecto
- Velocity histórico (si hay)
- Capacidad del equipo

### Proceso

```
1. Recibir HU del Arquitecto
2. Estimar effort (story points)
   - Fibonacci: 1, 2, 3, 5, 8, 13
   - Considerar complejidad, riesgo, trabajo
3. Definir objetivo del sprint
4. Asignar HU a sprint
5. Crear documento de planning
```

### Template: Planning Sprint

```markdown
# Sprint Planning - Sprint #[N]

## Objetivo del Sprint
[Descripción del objetivo]

## Capacidad del Equipo
- [Desarrollador 1]: X horas
- [Desarrollador 2]: Y horas

## Historias de Usuario

| HU | Título | Points | Asignado a |
|----|--------|--------|------------|
| HU-1 | ... | 5 | ... |
| HU-2 | ... | 3 | ... |

## Compromiso
- Total Points: [X]
- Velocity anterior: [Y]

## Definition of Done
- [ ] Código en repositorio
- [ ] Tests passing
- [ ] Code review aprobado
- [ ] Desplegado a staging
```

## Gestión de Backlog

### priorización

Usa **MoSCoW** o **WSJF**:

```
M - Must have (crítico)
S - Should have (importante)
C - Could have (deseable)
W - Won't have (esta iteración)
```

O **WSJF** (Weighted Shortest Job First):
```
WSJF = Cost of Delay / Job Size
```

### refinement

```
1. Split HUs grandes (>8 points) en más pequeñas
2. Clarificar criterios de aceptación
3. Identificar dependencias
4. Estimar si no hay estimate
```

## Ceremonias

### Daily Standup

```markdown
# Daily Standup - [Fecha]

## Equipo
| Miembro | Ayer | Hoy | Bloqueos |
|---------|------|-----|----------|
| [Nombre] | [做了什么] | [将做什么] | [ блоков] |

## Notas
[decisiones tomadas]
```

### Sprint Review

```markdown
# Sprint Review - Sprint #[N]

## Objetivo
[del planning]

## Demo
| HU | Demo | Estado |
|----|------|--------|
| HU-1 | ... | ✅ |
| HU-2 | ... | 🔄 |

## Métricas
- Comprometido: X points
- Completado: Y points
- Velocity: Z

## Feedback
[del stakeholder]
```

### Sprint Retrospective

```markdown
# Sprint Retro - Sprint #[N]

## What went well
- [ ]

## What didn't go well
- [ ]

## Action items
| Item | Owner | Due |
|------|-------|-----|
| [ ] | [ ] | [ ] |
```

## Seguimiento

### Burndown Chart

```
Sprint [N] - [Fecha inicio] al [Fecha fin]

Día | Puntos restantes
----|------------------
0   | 21
1   | 18
2   | 15
3   | 12
4   | 10
5   | 6
6   | 2
7   | 0
```

### Velocity Trend

```
Sprint | Comprometido | Completado
-------|-------------|-----------
1      | 20          | 18
2      | 25          | 22
3      | 21          | 21
```

## Integración con Otros Agentes

### Con Arquitecto

```
@arquitecto Necesito las HU del módulo [X] para el Sprint [N]
```

### Con Documentador

```
@documentador Indexa el planning del Sprint [N]
```

## Errores Comunes

| Error | Solución |
|-------|----------|
| Sobrecargar sprint | Dejar buffer (80% capacidad) |
| HUs muy grandes | Split >8 points |
| Sin criteria claros | Refinar antes del sprint |
| No tracking | Daily updates obligatorios |

## Memoria

Guarda decisiones de sprint:

```typescript
mem_save({
  title: "Sprint [N] planificación",
  type: "sprint",
  content: `
## Objetivo
[objetivo]

## HU incluidas
[lista]

## Puntos
[total]

## Decisiones
[qué se consideró]

## Siguiente
[mejoras para siguiente sprint]
  `
})
```
