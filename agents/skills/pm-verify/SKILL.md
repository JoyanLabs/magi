---
name: pm-verify
description: >
  Verificar que documentos PM estén completos y correctos.
  Trigger: Cuando se ejecuta /pm:verify, "verificar documento", "validar {tipo}".
license: MIT
metadata:
  author: magi-team
  version: "2.0"
---

## Purpose

You are a sub-agent responsible for VERIFICATION. You compare the actual document against the specification and project requirements to find gaps, mismatches, and issues. You are the quality gate before creating GitHub issues or sending to Discord.

## What You Receive

From the orchestrator:
- The generated document from pm-apply
- The specification from pm-spec
- Project config from `.magi/config.yaml`
- Document type (alcance|modulo|epica|sprint|reunion)

## Execution and Persistence Contract

Read and follow `skills/_shared/pm-persistence-contract.md` for mode resolution rules.

- If mode is `engram`: Read and follow `skills/_shared/pm-engram-convention.md`. Artifact type: `verify-report`. Retrieve `document`, `spec`, `proposal`, and `context` as dependencies.
- If mode is `openspec`: Read and follow `skills/_shared/pm-openspec-convention.md`. Save to `.magi/changes/{activity-name}/verify-report.md`.
- If mode is `none`: Return verification result only. Do not create project files.

## What to Do

### Step 1: Check Completeness

Verify the document has all required sections:

```
FOR EACH DOCUMENT TYPE:
├── Check required metadata header
├── Check all sections from spec are present
├── Check all tables are populated
└── Check all checkboxes are defined
```

#### Checklist by Document Type:

**Alcance:**
- [ ] Metadata header (id, title, type, version, schema)
- [ ] Visión del Proyecto
- [ ] Requisitos RFC 2119 (at least one SHALL)
- [ ] Escenarios BDD (Given/When/Then)
- [ ] Módulos del Sistema
- [ ] Exclusiones
- [ ] Supuestos y Restricciones
- [ ] Interdependencias
- [ ] Stack Tecnológico
- [ ] Criterios de Éxito

**Épica:**
- [ ] Metadata header with schema: spec-driven
- [ ] Descripción con valor de negocio
- [ ] Requisitos RFC 2119
- [ ] Criterios de Aceptación BDD
- [ ] Historias de Usuario
- [ ] Entidades del Dominio
- [ ] APIs Requeridas
- [ ] Interdependencias
- [ ] Definition of Done

**Sprint:**
- [ ] Metadata header
- [ ] Información General (fechas, duración, objetivo)
- [ ] Historias de Usuario del Sprint
- [ ] Resumen del Sprint (points breakdown)
- [ ] Épicas Incluidas
- [ ] Entregables con Demo Script
- [ ] GitHub Issues a Crear
- [ ] Criterios de Éxito
- [ ] Métricas a Trackear
- [ ] Riesgos del Sprint
- [ ] Definition of Done (Sprint)
- [ ] Post-Sprint Actions

### Step 2: Check Correctness (BDD Format)

Verify BDD scenarios are properly formatted:

```
FOR EACH SCENARIO:
├── Has GIVEN clause
├── Has WHEN clause  
├── Has THEN clause
├── Uses consistent terminology
└── Is testable (can be automated)
```

### Step 3: Check RFC 2119 Compliance

Verify requirements use correct keywords:

```
FOR EACH REQUIREMENT:
├── SHALL = Absolute requirement (must be implemented)
├── SHOULD = Recommended (implement if possible)
├── MAY = Optional (nice to have)
└── SHALL NOT = Explicit exclusion
```

### Step 4: Check Naming Conventions

Verify document follows naming standards:

```
CHECK:
├── Filename: {proyecto-id}-{tipo}-v{version}.md
├── ID format: {TYPE}-{n} (e.g., EPICA-001)
├── Version: Semantic (1.0.0)
└── Date: ISO format (YYYY-MM-DD)
```

### Step 5: Check Integration Readiness

Verify document is ready for next steps:

```
FOR SPRINT DOCUMENTS:
├── GitHub Issues section exists
├── Issues have clear titles
├── Labels are defined (sprint-{n}, shall/should)
└── Assignees are specified or marked as TBD

FOR ÉPICA DOCUMENTS:
├── APIs are documented
├── Entities are defined
├── Dependencies are listed
└── Can be broken into GitHub issues
```

### Step 6: Generate Verification Report

Save report if mode = `openspec`:

```
.magi/changes/{activity-name}/
├── proposal.md
├── spec.md
├── {document}.md
└── verify-report.md          ← You create this
```

### Step 7: Return Summary

Return EXACTLY this format:

```markdown
## Verification Report

**Document**: {proyecto-id}-{tipo}-v{version}.md
**Type**: {alcance|epica|sprint}
**Status**: {PASS | PASS WITH WARNINGS | FAIL}

### Completeness Check

| Section | Present | Populated |
|---------|---------|-----------|
| Metadata | ✅ | ✅ |
| Requisitos | ✅ | ⚠️ Partial |
| Escenarios BDD | ✅ | ✅ |
| ... | ... | ... |

### RFC 2119 Compliance

| Requirement | Keyword | Scenarios | Status |
|-------------|---------|-----------|--------|
| REQ-001 | SHALL | 3 | ✅ |
| REQ-002 | SHOULD | 2 | ✅ |
| REQ-003 | SHALL | 0 | ❌ Missing scenarios |

### BDD Format Check

| Scenario | GIVEN | WHEN | THEN | Testable |
|----------|-------|------|------|----------|
| Scenario 1 | ✅ | ✅ | ✅ | ✅ |
| Scenario 2 | ✅ | ⚠️ | ✅ | ✅ |

### GitHub Readiness

| Check | Status |
|-------|--------|
| Issues section exists | ✅ |
| Issues have titles | ✅ |
| Labels defined | ⚠️ Some missing |
| Ready for pm-github | ✅ |

### Issues Found

**CRITICAL** (must fix before GitHub):
- Issue 1: {description}

**WARNING** (should fix):
- Warning 1: {description}

**SUGGESTION** (nice to have):
- Suggestion 1: {description}

### Verdict

{PASS / PASS WITH WARNINGS / FAIL}

{One-line summary}

### Recommended Actions
- [ ] Fix critical issues
- [ ] Run pm-github to create issues
- [ ] Index in NotebookLM
```

## Rules

- ALWAYS read the actual document — don't trust summaries
- Compare against SPECS first (structural correctness)
- Be objective — report what IS, not what should be
- CRITICAL issues = must fix before GitHub/Discord
- WARNINGS = should fix but won't block
- SUGGESTIONS = improvements, not blockers
- In `openspec` mode, ALWAYS save `verify-report.md`
- Return a structured envelope with: `status`, `executive_summary`, `detailed_report` (optional), `artifacts`, `next_recommended`, and `risks`
