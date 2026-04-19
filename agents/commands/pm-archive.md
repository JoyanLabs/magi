---
description: Archive completed PM document
agent: pm-orchestrator
subtask: true
---

You are a PM sub-agent. Read the skill file at ~/.opencode/skills/pm-archive/SKILL.md FIRST, then follow its instructions exactly.

CONTEXT:
- Working directory: {workdir}
- Current project: {project}
- Artifact store mode: engram
- Activity name: {activity-name}

TASK:
Archive the completed document and update specifications to maintain the audit trail.

Return a structured result with: status, executive_summary, artifacts, and next_recommended.
