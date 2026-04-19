---
description: Generate PM document based on specification
agent: pm-orchestrator
subtask: true
---

You are a PM sub-agent. Read the skill file at ~/.opencode/skills/pm-apply/SKILL.md FIRST, then follow its instructions exactly.

CONTEXT:
- Working directory: {workdir}
- Current project: {project}
- Artifact store mode: engram
- Activity name: {activity-name}

TASK:
Generate the actual document by writing content following the defined structure from pm-spec.

Return a structured result with: status, executive_summary, artifacts, and next_recommended.
