# Engram Artifact Convention (shared across all PM skills)

## Naming Rules

ALL PM artifacts persisted to Engram MUST follow this deterministic naming:

```
title:     pm/{project-name}/{artifact-type}
topic_key: pm/{project-name}/{artifact-type}
type:      project
project:   {detected or current project name}
scope:     project
```

### Artifact Types (exact strings)

| Artifact Type | Produced By | Description |
|---------------|-------------|-------------|
| `context` | pm-init | Project context and configuration |
| `proposal` | pm-propose | Activity/document proposal |
| `spec` | pm-spec | Document structure specification |
| `document` | pm-apply | Generated document |
| `verify-report` | pm-verify | Verification report |
| `archive-report` | pm-archive | Archive closure with lineage |

**Exception**: `pm-init` uses `pm/{project-name}/context` as both title and topic_key.

### Example

```
mem_save(
  title: "pm/san-ignacio/proposal",
  topic_key: "pm/san-ignacio/proposal",
  type: "project",
  project: "san-ignacio",
  content: "# Proposal: Create Sprint Plan\n\n..."
)
```

## Recovery Protocol (2 steps — MANDATORY)

To retrieve an artifact, ALWAYS use this two-step process:

```
Step 1: Search by topic_key pattern
  mem_search(query: "pm/{project-name}/{artifact-type}", project: "{project}")
  → Returns a truncated preview with an observation ID

Step 2: Get full content (REQUIRED)
  mem_get_observation(id: {observation-id from step 1})
  → Returns complete, untruncated content
```

NEVER use `mem_search` results directly as the full artifact — they are truncated previews.
ALWAYS call `mem_get_observation` to get the complete content.

### Retrieving Multiple Artifacts

When a skill needs multiple artifacts (e.g., pm-spec needs proposal + context):

```
1. mem_search(query: "pm/{project}/context", project: "{project}") → get ID
2. mem_search(query: "pm/{project}/proposal", project: "{project}") → get ID
3. mem_get_observation(id) for EACH → full content
```

### Browsing All Artifacts for a Project

```
mem_search(query: "pm/{project}/", project: "{project}")
→ Returns all artifacts for that project
```

## Writing Artifacts

### Standard Write (new artifact)

```
mem_save(
  title: "pm/{project-name}/{artifact-type}",
  topic_key: "pm/{project-name}/{artifact-type}",
  type: "project",
  project: "{project}",
  content: "{full markdown content}"
)
```

### Update Existing Artifact

When updating an artifact you already retrieved (e.g., adding to a document):

```
mem_update(
  id: {observation-id},
  content: "{updated full content}"
)
```

Use `mem_update` when you have the exact observation ID. Use `mem_save` with the same `topic_key` for upserts (Engram deduplicates by topic_key).

## Why This Convention Exists

- **Deterministic titles** → recovery works by exact match, not fuzzy search
- **`topic_key`** → enables upserts (updating same artifact without creating duplicates)
- **`pm/` prefix** → namespaces all PM artifacts away from other Engram observations
- **Two-step recovery** → `mem_search` previews are always truncated; `mem_get_observation` is the only way to get full content
- **Lineage** → archive-report includes all observation IDs for complete traceability
