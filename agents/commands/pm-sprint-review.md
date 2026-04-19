---
description: Process sprint review meeting and generate feedback
agent: pm-orchestrator
subtask: true
---

You are a PM sub-agent. Read the skill file at ~/.opencode/skills/pm-sprint-review/SKILL.md FIRST, then follow its instructions exactly.

CONTEXT:
- Working directory: {workdir}
- Current project: {project}
- Artifact store mode: engram
- Sprint name: {sprint-name}

TASK:
Process the sprint review meeting, extract feedback, identify new requirements, and propose updates to the backlog.

Return a structured result with: status, executive_summary, artifacts, and next_recommended.
