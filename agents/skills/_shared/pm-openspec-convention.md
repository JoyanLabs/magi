# OpenSpec File Convention (shared across all PM skills)

## Directory Structure

```
.magi/
├── config.yaml              <- Project-specific PM config
├── docs/                   <- Project documents
│   ├── input/              <- Input documents (TDR, propuesta, etc.)
│   └── output/             <- Generated documents (alcance, módulos, épicas, sprints)
├── projects.json           <- Project registry
├── state.json              <- Current state (optional)
└── changes/                <- Active activities
    ├── archive/            <- Completed activities (YYYY-MM-DD-{activity-name}/)
    └── {activity-name}/    <- Active activity folder
        ├── proposal.md     <- from pm-propose
        ├── spec.md         <- from pm-spec
        ├── document.md     <- from pm-apply (generated document)
        └── verify-report.md <- from pm-verify
```

## Artifact File Paths

| Skill | Creates / Reads | Path |
|-------|----------------|------|
| pm-init | Creates | `.magi/config.yaml`, `.magi/docs/`, `.magi/projects.json` |
| pm-propose | Creates | `.magi/changes/{activity-name}/proposal.md` |
| pm-spec | Creates | `.magi/changes/{activity-name}/spec.md` |
| pm-apply | Creates | `.magi/changes/{activity-name}/document.md`, `.magi/docs/output/` |
| pm-verify | Creates | `.magi/changes/{activity-name}/verify-report.md` |
| pm-archive | Moves | `.magi/changes/{activity-name}/` → `.magi/changes/archive/YYYY-MM-DD-{activity-name}/` |

## Reading Artifacts

Each skill reads its dependencies from the filesystem:

```
Context:     .magi/config.yaml, .magi/projects.json
Proposal:    .magi/changes/{activity-name}/proposal.md
Spec:        .magi/changes/{activity-name}/spec.md
Document:    .magi/changes/{activity-name}/document.md
Verify:      .magi/changes/{activity-name}/verify-report.md
Input docs:  .magi/docs/input/
Output docs: .magi/docs/output/
```

## Writing Rules

- ALWAYS create the change directory (`.magi/changes/{activity-name}/`) before writing artifacts
- If a file already exists, READ it first and UPDATE it (don't overwrite blindly)
- If the change directory already exists with artifacts, the activity is being CONTINUED
- Use the `.magi/config.yaml` `rules` section to apply project-specific constraints per phase

## Config File Reference

```yaml
# .magi/config.yaml
schema: project-management

proyecto:
  id: "san-ignacio"
  nombre: "San Ignacio"

notebooklm:
  notebook_id: "${NOTEBOOK_ID}"

integraciones:
  github:
    repo: "${GITHUB_REPO}"
  discord:
    channel: "proyectos"

rules:
  proposal:
    - Include success criteria
    - Identify required inputs
  spec:
    - Use standard templates
    - Define clear structure
  apply:
    - Follow existing document patterns
  verify:
    - Compare against spec requirements
  archive:
    - Warn before losing traceability

# Optional: Default commands
default_commands:
  test: "pnpm test"
  build: "pnpm build"
```

## Archive Structure

When archiving, the activity folder moves to:
```
.magi/changes/archive/YYYY-MM-DD-{activity-name}/
```

Use today's date in ISO format. The archive is an AUDIT TRAIL — never delete or modify archived activities.

## Document Templates

Standard document types in `.magi/docs/output/`:

| Document Type | Template Location | Description |
|---------------|------------------|-------------|
| Alcance | (generated) | Project scope definition |
| Módulo | (generated) | Module specification |
| Épica | (generated) | Epic grouping |
| Sprint | (generated) | Sprint plan |
| Acta | (generated) | Meeting minutes |
