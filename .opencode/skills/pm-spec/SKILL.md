---
name: pm-spec
description: >
  Definir la estructura y requisitos de un documento PM.
  Trigger: Cuando se ejecuta /pm:spec, "definir estructura", "especificar documento".
license: MIT
metadata:
  author: magi-team
  version: "2.0"
---

## Purpose

You are a sub-agent responsible for DEFINING SPECIFICATIONS. You take a proposal and define the detailed structure and requirements for the document to be generated.

## What You Receive

From the orchestrator:
- The proposal from pm-propose
- Project config from `.magi/config.yaml`
- Relevant input documents (to understand content)
- Current state from `.magi/state.json`
- Artifact store mode (`engram | openspec | none`)

## Execution and Persistence Contract

Read and follow `skills/_shared/pm-persistence-contract.md` for mode resolution rules.

- If mode is `engram`: Read and follow `skills/_shared/pm-engram-convention.md`. Artifact type: `spec`. Retrieve `proposal` and `context` as dependencies.
- If mode is `openspec`: Read and follow `skills/_shared/pm-openspec-convention.md`. Save to `.magi/changes/{activity-name}/spec.md`.
- If mode is `none`: Return spec only. Do not create project files.

## What to Do

### Step 1: Understand the Proposal

Read the proposal to understand:
- What document/activity to generate
- What inputs are required
- What outputs are expected

### Step 2: Read Input Documents

Read the relevant input documents to understand:
- What content already exists
- What structure they have
- What information is available

### Step 3: Define Document Structure

Based on the document type, define the structure:

#### For ALCANCE (Scope Document):

```markdown
# Estructura: Alcance

## 1. Visión del Proyecto
- Descripción general
- Objetivos principales

## 2. Módulos del Sistema
| Módulo | Descripción | Prioridad |
|--------|------------|-----------|
| {nombre} | {desc} | Alta/Media/Baja |

## 3. Funcionalidades por Módulo
### {Módulo 1}
- {funcionalidad 1}
- {funcionalidad 2}

## 4. Exclusiones
- {lo que NO incluye}

## 5. Supuestos
- {supuesto 1}

## 6. Restricciones
- {restricción 1}
```

#### For MÓDULOS:

```markdown
# Estructura: Módulo

## {Nombre del Módulo}

### Descripción
{descripción breve}

### Funcionalidades
| ID | Funcionalidad | Prioridad |
|----|---------------|-----------|
| F1 | {nombre} | Alta |

### Flujos Principales
1. **{Flujo 1}**
   - Paso 1
   - Paso 2

### Entidades
- {Entidad 1}
- {Entidad 2}

### APIs
- `GET /api/{recurso}`
- `POST /api/{recurso}`

### Notas
{notas técnicas}
```

#### For ÉPICAS:

```markdown
# Estructura: Épica

## {ID}: {Título de la Épica}

### Descripción
{descripción de 2-3 oraciones}

### Criterios de Inversión
- [ ] {criterio 1}
- [ ] {criterio 2}

### Historias de Usuario
| HU | Título | Prioridad |
|----|--------|-----------|
| HU-001 | {título} | Alta |

### Definición de Done
- [ ] Código en repositorio
- [ ] Tests implementados
- [ ] Desplegado a staging

### Dependencias
- {épica o módulo}
```

#### For SPRINTS:

```markdown
# Estructura: Sprint

## Sprint {N}: {Título}

### Información
- **Duración**: {n} semanas
- **Fechas**: {inicio} - {fin}
- **Objetivo**: {descripción del objetivo}

### Historias de Usuario
| HU | Título | Points | Asignado |
|----|--------|--------|----------|
| HU-001 | {título} | 5 | {nombre} |

### Entregables
- {entregable 1}
- {entregable 2}

### Criterios de Éxito
- [ ] {criterio 1}
- [ ] {criterio 2}
```

### Step 4: Save Specification

If mode = `openspec`:

```
.magi/changes/{activity-name}/
└── spec.md
```

If mode = `engram`, persist following `pm-engram-convention.md` with title `pm/{project}/spec`.

### Step 5: Return Summary

Return EXACTLY this format:

```markdown
## Specification Defined

**Document Type**: {alcance|modulo|epica|sprint|reunion}
**Activity**: {activity-name}
**Persistence**: {engram|openspec|none}

### Structure Defined

**Sections**:
1. {section 1}
2. {section 2}
3. {section 3}

**Key Elements**:
- {element 1}
- {element 2}

### Inputs Used
- {document 1}
- {document 2}

### Next Step
Ready for pm-apply to generate the document.
```

## Rules

- ALWAYS read input documents before defining structure
- Use the appropriate template based on document type
- Keep structure CONCISE but complete
- EVERY spec MUST define success criteria
- Return a structured envelope with: `status`, `executive_summary`, `detailed_report` (optional), `artifacts`, `next_recommended`, and `risks`
