---
name: pm-apply
description: >
  Generar documentos PM basándose en la especificación.
  Trigger: Cuando se ejecuta /pm:apply, "generar documento", "crear {tipo}".
license: MIT
metadata:
  author: magi-team
  version: "2.0"
---

## Purpose

You are a sub-agent responsible for IMPLEMENTATION. You receive a specification from pm-spec and generate the actual document by writing content following the defined structure.

## What You Receive

From the orchestrator:
- The specification from pm-spec
- Input documents (to extract content from)
- Project config from `.magi/config.yaml`
- The specific document type to generate

## Execution and Persistence Contract

Read and follow `skills/_shared/pm-persistence-contract.md` for mode resolution rules.

- If mode is `engram`: Read and follow `skills/_shared/pm-engram-convention.md`. Artifact type: `document`. Retrieve `spec`, `proposal`, and `context` as dependencies. Also use `mem_update` to mark progress.
- If mode is `openspec`: Read and follow `skills/_shared/pm-openspec-convention.md`. Save to `.magi/changes/{activity-name}/document.md` and `.magi/docs/output/`.
- If mode is `none`: Return document only. Do not create project files.

## What to Do

### Step 1: Read Context

Before writing ANY content:
1. Read the spec — understand WHAT the document must contain
2. Read input documents — extract relevant information
3. Check project conventions from config

### Step 2: Generate Content

For each section defined in the spec:

```
FOR EACH SECTION:
├── Read relevant input docs
├── Extract key information
├── Write content following structure
├── Apply naming conventions
└── Mark as complete
```

### Step 3: Apply Naming Conventions

Use the standard naming:

```
{proyecto-id}-{tipo}-v{version}.md

Examples:
- san-ignacio-alcance-v1.md
- san-ignacio-modulos-v1.md
- san-ignacio-epica-001-v1.md
- san-ignacio-sprint-01-v1.md
```

### Step 4: Add Metadata Header

Every document MUST have this header:

```markdown
---
id: {document-id}
title: "{document title}"
type: {alcance|modulo|epica|sprint|reunion}
version: "1.0.0"
project: {proyecto-id}
date: {YYYY-MM-DD}
status: draft|review|approved
---
```

### Step 5: Write Document

Generate the full document following the spec structure.

### Step 6: Update State

Update `.magi/state.json`:

```json
{
  "documentos": {
    "output": ["alcance", "modulos", "epica-001"]
  }
}
```

### Step 7: Save Document

Save to appropriate location:

```
.magi/docs/output/
├── {proyecto-id}-alcance-v1.md
├── {proyecto-id}-modulos-v1.md
├── epicas/
│   └── {proyecto-id}-epica-001-v1.md
└── sprints/
    └── {proyecto-id}-sprint-01-v1.md
```

### Step 8: Return Summary

Return EXACTLY this format:

```markdown
## Document Generated

**Type**: {alcance|modulo|epica|sprint}
**File**: `.magi/docs/output/{filename}`
**Status**: Generated

### Content Overview

**Sections Created**:
1. {section 1}
2. {section 2}
3. {section 3}

**Key Information Extracted**:
- From {input-doc-1}: {key point}
- From {input-doc-2}: {key point}

### Metadata
- ID: {document-id}
- Version: 1.0.0
- Status: draft

### Next Steps
- [ ] Review document
- [ ] Update state in Engram
- [ ] Index in NotebookLM (optional)
```

## Document Templates

### Template: Alcance (Optimizado SDD)

```markdown
---
id: ALCANCE-{proyecto}
title: "Alcance del Sistema - {proyecto-nombre}"
type: alcance
version: "1.0.0"
project: {proyecto-id}
date: {YYYY-MM-DD}
status: draft
schema: spec-driven
---

# Alcance del Sistema

## 1. Visión

### Descripción
{Extraído de propuesta + diagnóstico}

### Objetivos de Negocio
1. {objetivo medible 1}
2. {objetivo medible 2}

## 2. Requisitos del Sistema (RFC 2119)

### REQ-001: {Título del Requisito}
**El sistema SHALL** {descripción del comportamiento obligatorio}.

#### Escenarios de Aceptación

**Scenario: {descripción del escenario}**
- **GIVEN** {condición inicial}
- **WHEN** {acción realizada}
- **THEN** {resultado esperado}
- **AND** {resultado adicional}

**Scenario: {descripción del escenario alternativo}**
- **GIVEN** {condición}
- **WHEN** {acción}
- **THEN** {resultado}

### REQ-002: {Título}
**El sistema SHOULD** {descripción del comportamiento recomendado}.

**Scenario: {descripción}**
- **GIVEN** {condición}
- **WHEN** {acción}
- **THEN** {resultado}

## 3. Módulos

| ID | Módulo | Descripción | Prioridad |
|----|--------|------------|-----------|
| MOD-001 | {nombre} | {desc} | SHALL (crítico) |
| MOD-002 | {nombre} | {desc} | SHOULD (recomendado) |
| MOD-003 | {nombre} | {desc} | MAY (opcional) |

## 4. Exclusiones (Out of Scope)

**El sistema SHALL NOT**:
- {funcionalidad explícitamente excluida 1}
- {funcionalidad explícitamente excluida 2}

## 5. Supuestos y Restricciones

### Supuestos
- **El sistema asume que**: {supuesto 1}
- **El sistema asume que**: {supuesto 2}

### Restricciones Técnicas
- **El sistema MUST comply with**: {restricción 1}
- **El sistema MUST comply with**: {restricción 2}

## 6. Interdependencias

| Requisito | Depende de | Impacto |
|-----------|------------|---------|
| REQ-001 | REQ-002 | Alto |
| MOD-001 | MOD-002 | Medio |

## 7. Stack Tecnológico

- **Frontend**: {tech}
- **Backend**: {tech}
- **Database**: {tech}
- **Integraciones**: {listado}

## 8. Criterios de Éxito

- [ ] 100% de requisitos SHALL implementados
- [ ] Todos los escenarios de aceptación pasan
- [ ] Cobertura de tests > 80%
- [ ] Aprobado por Product Owner
```

### Template: Módulo

```markdown
---
id: MOD-{n}
title: "Módulo: {nombre}"
type: modulo
version: "1.0.0"
project: {proyecto-id}
date: {YYYY-MM-DD}
status: draft
---

# Módulo: {Nombre}

## Descripción
{descripción breve del módulo}

## Funcionalidades

| ID | Funcionalidad | Descripción | Prioridad |
|----|---------------|-------------|-----------|
| F1 | {nombre} | {desc} | Alta |

## Flujos Principales

### {Flujo 1}
1. {paso 1}
2. {paso 2}

## Entidades
- **{Entidad 1}**: {descripción}
- **{Entidad 2}**: {descripción}

## APIs
- `GET /api/{recurso}` - {descripción}
- `POST /api/{recurso}` - {descripción}

## Notas Técnicas
{notas adicionales}
```

### Template: Épica (Optimizado BDD/SDD)

```markdown
---
id: EPICA-{n}
title: "{título de la épica}"
type: epica
version: "1.0.0"
project: {proyecto-id}
modulo: {nombre-modulo}
date: {YYYY-MM-DD}
status: draft
schema: spec-driven
---

# Épica {n}: {Título}

## Descripción
{descripción de 2-3 oraciones sobre el valor de negocio}

**Valor de Negocio**: {por qué es importante esta épica}

## Requisitos (RFC 2119)

### REQ-{n}.001: {Título del Requisito}
**El sistema SHALL** {comportamiento obligatorio}.

**Criterios de Aceptación (BDD)**:

**Scenario: {Escenario principal}**
- **GIVEN** {estado inicial del sistema}
- **WHEN** {usuario realiza acción}
- **THEN** {sistema responde así}
- **AND** {resultado adicional}

**Scenario: {Escenario edge case}**
- **GIVEN** {condición especial}
- **WHEN** {acción}
- **THEN** {comportamiento esperado}

**Scenario: {Escenario error}**
- **GIVEN** {condición inválida}
- **WHEN** {acción inválida}
- **THEN** {sistema maneja el error}
- **AND** {mensaje de error claro}

### REQ-{n}.002: {Título del Requisito}
**El sistema SHOULD** {comportamiento recomendado}.

**Criterios de Aceptación**:
- **GIVEN** {condición}
- **WHEN** {acción}
- **THEN** {resultado}

## Historias de Usuario

| ID | Título | Como | Quiero | Para | Points | Prioridad |
|----|--------|------|--------|------|--------|-----------|
| HU-{n}.001 | {título} | {rol} | {funcionalidad} | {beneficio} | 5 | SHALL |
| HU-{n}.002 | {título} | {rol} | {funcionalidad} | {beneficio} | 3 | SHOULD |

### HU-{n}.001: {Título}

**Descripción**: {descripción detallada}

**Criterios de Aceptación**:

**Scenario: {Caso feliz}**
- **GIVEN** {contexto}
- **WHEN** {evento}
- **THEN** {resultado}

**Scenario: {Edge case}**
- **GIVEN** {condición}
- **WHEN** {acción}
- **THEN** {comportamiento}

## Entidades del Dominio

| Entidad | Atributos | Relaciones |
|---------|-----------|------------|
| {Entidad} | {lista} | {relación} |

## APIs Requeridas

| Método | Endpoint | Descripción | Requisito |
|--------|----------|-------------|-----------|
| POST | /api/{recurso} | {desc} | REQ-{n}.001 |
| GET | /api/{recurso}/{id} | {desc} | REQ-{n}.002 |

## Interdependencias

| Dependencia | Tipo | Bloqueante |
|-------------|------|------------|
| EPICA-{n-1} | Hard | Sí |
| MOD-{x} | Soft | No |

## Definición de Done

- [ ] Todos los escenarios de aceptación implementados y pasando
- [ ] Código en repositorio con PR merged
- [ ] Tests unitarios con cobertura > 80%
- [ ] Tests de integración/E2E pasando
- [ ] Code review aprobado por 2+ reviewers
- [ ] Documentación técnica actualizada
- [ ] Desplegado a entorno de staging
- [ ] Aprobado por Product Owner en demo

## Notas Técnicas
- {nota 1}
- {nota 2}
```

### Template: Sprint (Optimizado SDD)

```markdown
---
id: SPRINT-{n}
title: "Sprint {n}: {título}"
type: sprint
version: "1.0.0"
project: {proyecto-id}
date: {YYYY-MM-DD}
status: planned
schema: spec-driven
---

# Sprint {n}: {Título}

## Información General
- **Duración**: {n} semanas ({días} días hábiles)
- **Fechas**: {inicio} - {fin}
- **Objetivo Sprint**: {descripción clara del objetivo}
- **Goal Statement**: {En una frase, qué logramos}

## Historias de Usuario del Sprint

| ID | Título | Points | Épica | Asignado | Estado | Requisito RFC |
|----|--------|--------|-------|----------|--------|---------------|
| HU-{x}.001 | {título} | 5 | EPICA-{n} | {nombre} | TODO | SHALL |
| HU-{x}.002 | {título} | 3 | EPICA-{n} | {nombre} | TODO | SHOULD |
| HU-{y}.001 | {título} | 8 | EPICA-{m} | {nombre} | TODO | SHALL |

### Resumen del Sprint
- **Total Points**: {n}
- **SHALL (must have)**: {n} points
- **SHOULD (nice to have)**: {n} points
- **Velocity Capacity**: {n} points

## Épicas Incluidas

| ID | Épica | % Sprint | Objetivo |
|----|-------|----------|----------|
| EPICA-{n} | {título} | 60% | {objetivo} |
| EPICA-{m} | {título} | 40% | {objetivo} |

## Entregables (Definition of Done por HU)

### HU-{x}.001: {Título}
**Criterios de Aceptación**:
- **GIVEN** {condición}
- **WHEN** {acción}
- **THEN** {resultado}

**Entregable**: {qué se puede demo}

### HU-{x}.002: {Título}
**Criterios de Aceptación**:
- **GIVEN** {condición}
- **WHEN** {acción}
- **THEN** {resultado}

## GitHub Issues a Crear

| Issue | Título | Labels | Asignado | Link |
|-------|--------|--------|----------|------|
| #{n} | Implementar {feature} | `sprint-{n}`, `shall` | {nombre} | - |
| #{n+1} | Tests para {feature} | `sprint-{n}`, `testing` | {nombre} | - |

## Entregables del Sprint (Demo)

### Sprint Review Demo Script
1. **{Feature 1}**: {pasos para demo}
2. **{Feature 2}**: {pasos para demo}

### Artefactos Entregables
- [ ] Código en main branch
- [ ] Tests pasando en CI
- [ ] Documentación actualizada
- [ ] Demo preparada

## Criterios de Éxito del Sprint

- [ ] **SHALL**: 100% de HUs SHALL completadas
- [ ] **SHOULD**: 80% de HUs SHOULD completadas
- [ ] All scenarios passing
- [ ] Demo exitosa con stakeholders
- [ ] Feedback documentado

## Métricas a Trackear

| Métrica | Target | Actual |
|---------|--------|--------|
| Velocity | {n} | - |
| Burndown | On track | - |
| Test Coverage | >80% | - |
| Bugs Found | <3 | - |

## Riesgos del Sprint

| ID | Riesgo | Probabilidad | Impacto | Mitigación | Owner |
|----|--------|--------------|---------|------------|-------|
| R1 | {riesgo} | Medio | Alto | {mitigación} | {nombre} |
| R2 | {riesgo} | Bajo | Medio | {mitigación} | {nombre} |

## Dependencias y Bloqueos

| ID | Dependencia | Bloquea | Estado | Mitigación |
|----|-------------|---------|--------|------------|
| DEP-001 | {desc} | HU-{x}.001 | Pendiente | {plan} |

## Definition of Done (Sprint)

- [ ] Todas las HUs SHALL implementadas con tests pasando
- [ ] All acceptance scenarios ejecutados y pasando
- [ ] Code review aprobado para todas las HUs
- [ ] Sin bugs críticos o bloqueantes abiertos
- [ ] Documentación técnica y de usuario actualizada
- [ ] Demo preparada y probada
- [ ] Feedback de stakeholders documentado
- [ ] Métricas del sprint capturadas
- [ ] Issues de GitHub cerrados o movidos a backlog
- [ ] Plan del siguiente sprint iniciado

## Post-Sprint Actions

### Para pm-sprint-review:
- [ ] Documentar feedback de stakeholders
- [ ] Identificar nuevos requisitos/correcciones
- [ ] Actualizar backlog
- [ ] Generar mensaje de resumen para Discord
```
```

## Rules

- ALWAYS read specs before generating — specs are the acceptance criteria
- ALWAYS match project naming conventions
- ALWAYS add metadata header to every document
- In `openspec` mode, save to `.magi/docs/output/` as you generate
- Update state.json AS you go, not at the end
- If you discover missing information, NOTE IT in your return summary
- NEVER generate documents that weren't assigned to you
- Return a structured envelope with: `status`, `executive_summary`, `detailed_report` (optional), `artifacts`, `next_recommended`, and `risks`
