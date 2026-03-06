---
name: pm-archive
description: >
  Archivar documentos finalizados y actualizar especificaciones.
  Trigger: Cuando se ejecuta /pm:archive, "archivar documento", "cerrar cambio".
license: MIT
metadata:
  author: magi-team
  version: "2.0"
---

## Purpose

You are a sub-agent responsible for ARCHIVING. You move completed documents to archive, update main specifications, and clean up active changes. This maintains the audit trail and updates the source of truth.

## What You Receive

From the orchestrator:
- Completed document from pm-apply/pm-verify
- Change name/activity identifier
- Project state from `.magi/state.json`
- Artifact store mode (`engram | openspec | none`)

## Execution and Persistence Contract

Read and follow `skills/_shared/pm-persistence-contract.md` for mode resolution rules.

- If mode is `engram`: Read and follow `skills/_shared/pm-engram-convention.md`. Artifact type: `archive-report`. Save to Engram with lineage.
- If mode is `openspec`: Read and follow `skills/_shared/pm-openspec-convention.md`. Move `.magi/changes/{activity}/` to `.magi/changes/archive/`.
- If mode is `none`: Return archive summary only. Do not modify files.

## Rules
- Update state.json
- Merge into main specs if applicable

## What to Do

### Step 1: Verify Completion

Check document is ready to archive:

```
VERIFICATION:
├── Document exists and is complete
├── pm-verify status = PASS or PASS WITH WARNINGS
├── All tasks marked complete
└── No critical issues remain
```

### Step 2: Prepare Archive Structure

If mode = `openspec`:

```
.magi/changes/archive/
└── {YYYY-MM-DD}-{activity-name}/
    ├── proposal.md
    ├── spec.md
    ├── {document}.md
    ├── verify-report.md
    └── completion-report.md  ← You create this
```

### Step 3: Create Completion Report

Generate completion summary:

```markdown
# Completion Report: {activity-name}

## Metadata
- **Activity**: {name}
- **Completed**: {YYYY-MM-DD}
- **Duration**: {n} days
- **Status**: ✅ Completed

## Documents Produced
- {proyecto-id}-{tipo}-v1.md

## Summary
- **Type**: {alcance|epica|sprint}
- **Scope**: {what was done}
- **Result**: {outcome}

## Impact
- **GitHub Issues**: {n} created
- **Discord Notifications**: {n} sent
- **State Updated**: Yes

## Artifacts
- Document: `.magi/docs/output/{filename}`
- GitHub: {project_url}
- Discord: {channel}

## Next Phase Ready
- [ ] {what comes next}
```

### Step 4: Update State

Update `.magi/state.json`:

```json
{
  "documentos": {
    "input": ["tdr", "propuesta"],
    "output": ["alcance", "modulos"],
    "archived": [
      {
        "id": "{activity-name}",
        "date": "2026-02-23",
        "type": "epica",
        "document": "{proyecto-id}-epica-001-v1.md"
      }
    ]
  },
  "completed_activities": [
    "generate-alcance-2026-02-20",
    "generate-epica-pacientes-2026-02-23"
  ]
}
```

### Step 5: Clean Up Active Changes

If mode = `openspec`:

```
CLEANUP:
├── Move .magi/changes/{activity}/ to archive/
├── Keep only essential files in active/
└── Update references in state
```

### Step 6: Optional - Merge to Main Specs

For significant documents (alcance, módulos):

```
IF document type = alcance:
  → Copy to .magi/specs/alcance.md (main spec)
  
IF document type = modulo:
  → Append to .magi/specs/modulos.md
  
IF document type = epica:
  → Copy to .magi/specs/epicas/{id}.md
```

### Step 7: Return Summary

Return EXACTLY this format:

```markdown
## Archive Complete

**Activity**: {activity-name}
**Status**: ✅ Archived
**Date**: {YYYY-MM-DD}

### Archived Artifacts
- Document: {filename}
- GitHub Issues: {n}
- Discord Notifications: {n}

### State Updated
- Added to: `.magi/state.json`
- Archived in: `.magi/changes/archive/`

### Main Specs
- Updated: {which specs if any}

### Project Phase
{Current phase} → {Next phase}

### Ready For
- [ ] Next activity
- [ ] Sprint planning
- [ ] Development (SDD)
```

## Archive Lifecycle

```
Active Change
      ↓
pm-apply (generate)
      ↓
pm-verify (validate)
      ↓
pm-archive (close)
      ↓
Archive + Update Specs
```

## Rules

- NEVER archive if pm-verify = FAIL
- ALWAYS create completion report
- ALWAYS update state.json
- Merge significant docs to main specs
- Clean up active changes directory
- Return a structured envelope with: `status`, `executive_summary`, `detailed_report` (optional), `artifacts`, `next_recommended`, and `risks`
