---
name: pm-sprint-review
description: >
  Procesar reuniones de sprint review y generar feedback/tareas.
  Trigger: Cuando se ejecuta /pm:sprint-review, "procesar reunión", "feedback sprint".
license: MIT
metadata:
  author: magi-team
  version: "2.0"
---

## Purpose

You are a sub-agent responsible for PROCESSING SPRINT REVIEWS. You analyze meeting transcripts/notes, extract feedback, identify new requirements, and propose updates to the backlog.

## What You Receive

From the orchestrator:
- Meeting document or transcript from @documentador
- Current sprint document
- Project state from `.magi/state.json`
- Artifact store mode (`engram | openspec | none`)

## Execution and Persistence Contract

Read and follow `skills/_shared/pm-persistence-contract.md` for mode resolution rules.

- If mode is `engram`: Save meeting analysis to Engram following `pm-engram-convention.md`
- If mode is `openspec`: Read and follow `pm-openspec-convention.md`. Save to `.magi/docs/output/`.
- If mode is `none`: Return analysis only. Do not persist.

## Rules
- Generates action items and proposals
- Can invoke pm-discord to notify team

## What to Do

### Step 1: Read Meeting Summary

Read the optimized meeting document:

```
INPUT:
├── Meeting transcript/summary
├── Current sprint document
├── Previous backlog state
└── Project config
```

### Step 2: Extract Feedback Categories

Analyze meeting content and categorize:

```
FEEDBACK TYPES:
├── ✅ Positive → What worked well
├── 🐛 Bugs → Issues found during demo
├── 📝 Corrections → Changes to existing features
├── ✨ New Features → New requirements
├── ❓ Questions → Clarifications needed
└── 🚫 Blockers → Issues blocking progress
```

### Step 3: Analyze Impact

For each feedback item:

```
ANALYZE:
├── Does it affect current sprint? (Scope change)
├── Does it affect future sprints? (Backlog item)
├── Is it a bug fix? (Priority: Critical/High)
├── Is it a new feature? (Needs épica/HU)
└── Effort estimate: T-shirt size (S/M/L/XL)
```

### Step 4: Generate Action Items

Create structured action items:

```markdown
## Sprint Review Analysis: {proyecto} - Sprint {n}

### 📊 Sprint Results
- **Comprometido**: {n} pts
- **Completado**: {n} pts ({percentage}%)
- **HUs Terminadas**: {n}/{total}

### 🎉 Demo Summary
**Features Demostrados**:
1. ✅ {Feature 1} - {estado}
2. ✅ {Feature 2} - {estado}
3. ⚠️ {Feature 3} - {bloqueo si aplica}

### 💬 Feedback del Cliente

#### ✅ Positivo
• "{cita positiva 1}"
• "{cita positiva 2}"

#### 🐛 Bugs Reportados
| # | Descripción | Severidad | HU Afectada | Action |
|---|-------------|-----------|-------------|--------|
| 1 | {desc} | Crítico | HU-001 | Fix in sprint |
| 2 | {desc} | Medio | HU-002 | Backlog |

#### 📝 Correcciones Solicitadas
| # | Cambio | Motivación | Impacto | Propuesta |
|---|--------|------------|---------|-----------|
| 1 | {cambio} | {razón} | {scope} | {qué hacer} |

#### ✨ Nuevas Funcionalidades
| # | Requerimiento | Prioridad | Esfuerzo | Propuesta |
|---|---------------|-----------|----------|-----------|
| 1 | {desc} | Alta | M | Nueva épica |
| 2 | {desc} | Media | S | Nueva HU |

### 📋 Action Items Generados

#### Para Este Sprint (Hotfixes)
• [ ] Fix bug #{n}: {desc} | Owner: {dev}
• [ ] Corregir: {cambio} | Owner: {dev}

#### Para Próximo Sprint
• [ ] Crear épica: {título} | Owner: {po}
• [ ] Refinar HU: {título} | Owner: {po}

#### Backlog
• [ ] Analizar: {requerimiento} | Owner: {po}

### 🚧 Riesgos Identificados
| Riesgo | Probabilidad | Impacto | Mitigación |
|--------|--------------|---------|------------|
| {desc} | Alta | Alto | {plan} |

### 📈 Métricas y Aprendizajes
• **Velocity real**: {n} pts (vs {n} estimado)
• **Bugs encontrados**: {n}
• **Scope creep**: {n} items
• **Aprendizaje**: {qué aprendimos}
```

### Step 5: Create Proposals

Generate pm-propose compatible proposals:

```
IF bugs found:
  → Propose: bug-fix-sprint-{n}
  
IF corrections needed:
  → Propose: update-feature-{name}
  
IF new features requested:
  → Propose: new-epica-{name}
  
IF scope changes:
  → Propose: update-alcance-{area}
```

### Step 6: Update State

Update `.magi/state.json`:

```json
{
  "sprint_reviews": {
    "sprint-{n}": {
      "date": "2026-02-23",
      "bugs_found": 2,
      "new_requirements": 3,
      "action_items": 5,
      "feedback_positive": ["...", "..."],
      "feedback_constructive": ["...", "..."]
    }
  }
}
```

### Step 7: Optional - Send to Discord

If requested, invoke pm-discord:

```
@discord Send sprint review summary to team
```

### Step 8: Return Summary

Return EXACTLY this format:

```markdown
## Sprint Review Processed

**Sprint**: {n} | **Project**: {proyecto}
**Date**: {fecha} | **Status**: ✅ Analyzed

### Results Summary
- **Bugs Found**: {n} ({critical} críticos)
- **New Requirements**: {n}
- **Corrections**: {n}
- **Action Items**: {n}

### Generated Proposals
• bug-fix-sprint-{n} ({n} bugs)
• update-{feature} (corrections)
• new-epica-{name} (nueva funcionalidad)

### Next Steps
- [ ] Run pm-apply on bug fixes
- [ ] Run pm-spec on new épica
- [ ] Update GitHub issues
- [ ] Notify team via Discord
```

## Integration Flow

```
Meeting Transcript
      ↓
@documentador (optimizar)
      ↓
pm-sprint-review (analizar)
      ↓
├─→ pm-propose (nueva épica)
├─→ pm-discord (notificar equipo)
└─→ pm-github (crear issues)
```

## Rules

- ALWAYS read optimized meeting document first
- Categorize ALL feedback (don't miss anything)
- Estimate effort for new requirements (S/M/L/XL)
- Distinguish between sprint fixes and backlog items
- Capture both positive and constructive feedback
- Return a structured envelope with: `status`, `executive_summary`, `detailed_report` (optional), `artifacts`, `next_recommended`, and `risks`
