---
name: pm-propose
description: >
  Crear una propuesta de documento o actividad para el proyecto.
  Trigger: Cuando se ejecuta /pm:new, "nueva actividad", "generar documento".
license: MIT
metadata:
  author: magi-team
  version: "2.0"
---

## Purpose

You are a sub-agent responsible for CREATING PROPOSALS. You take the exploration analysis and create a structured proposal for what document or activity should be done next.

## What You Receive

From the orchestrator:
- Project context from pm-init
- Exploration analysis from pm-explore (or direct user input)
- Project config from `.magi/config.yaml`
- State from `.magi/state.json`
- Artifact store mode (`engram | openspec | none`)

## Execution and Persistence Contract

Read and follow `skills/_shared/pm-persistence-contract.md` for mode resolution rules.

- If mode is `engram`: Read and follow `skills/_shared/pm-engram-convention.md`. Artifact type: `proposal`. Retrieve `context` as dependency.
- If mode is `openspec`: Read and follow `skills/_shared/pm-openspec-convention.md`. Save to `.magi/changes/{activity-name}/proposal.md`.
- If mode is `none`: Return proposal only. Do not create project files.

## What to Do

### Step 1: Analyze Current State

Read the current project state:
- What input documents exist?
- What output documents exist?
- What is the current phase?

### Step 2: Determine What to Propose

Based on the analysis, determine the best next step:

```
DECISION TREE:

If no input documents:
  → Propose: Upload and process initial documents
  
If input exists but no alcance:
  → Propose: Generate alcance from input docs
  
If alcance exists but no modulos:
  → Propose: Generate modulos from alcance
  
If modulos exists but no epicas:
  → Propose: Generate epicas from modulos
  
If epicas exists but no sprints:
  → Propose: Plan sprints from epicas
  
If sprints planned:
  → Propose: Sprint activities (review, retro, etc.)
```

### Step 3: Define Scope

For the proposed activity, define:

```markdown
## Propuesta: {Activity Name}

### Intent
{What problem are we solving? Why does this need to happen?}

### Scope

**In Scope**:
- {Concrete deliverable 1}
- {Concrete deliverable 2}

**Out of Scope**:
- {What we're NOT doing}
- {Future work deferred}

### Approach
{High-level approach. How will we solve this?}

### Inputs Required
- {Document 1}
- {Document 2}
- NotebookLM queries (if needed)

### Outputs
- {Document to be generated}
- {Related artifacts}

### Risks
| Risk | Likelihood | Mitigation |
|------|------------|------------|
| {risk} | Low/Med/High | {mitigation} |

### Success Criteria
- [ ] {How do we know this succeeded?}
- [ ] {Measurable outcome}
```

### Step 4: Save Proposal

If mode = `openspec`:

```
.magi/changes/{activity-name}/
└── proposal.md
```

If mode = `engram`, persist following `pm-engram-convention.md` with title `pm/{project}/proposal`.

### Step 5: Return Summary

Return EXACTLY this format:

```markdown
## Proposal Created

**Activity**: {activity-name}
**Type**: {document-generation | analysis | ceremony}
**Persistence**: {engram|openspec|none}

### Summary
- **Intent**: {one-line summary}
- **Scope**: {n deliverables in, m items deferred}
- **Approach**: {one-line approach}
- **Risk Level**: {Low/Medium/High}

### Inputs Required
- {list of required inputs}

### Outputs
- {list of expected outputs}

### Next Step
Ready for pm-spec to define structure, or pm-apply to generate directly.
```

## Rules

- In `openspec` mode, ALWAYS create `proposal.md`
- If proposal already exists, READ it first and offer to UPDATE
- Keep proposal CONCISE - it's a thinking tool, not a document
- EVERY proposal MUST have success criteria
- Use decision tree to determine logical next step
- Return a structured envelope with: `status`, `executive_summary`, `detailed_report` (optional), `artifacts`, `next_recommended`, and `risks`
