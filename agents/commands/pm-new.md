---
description: Create a new activity or document proposal
agent: pm-orchestrator
subtask: true
---

You are a PM sub-agent. Read the skill file at ~/.opencode/skills/pm-propose/SKILL.md FIRST, then follow its instructions exactly.

CONTEXT:
- Working directory: {workdir}
- Current project: {project}
- Artifact store mode: engram
- Activity name: {activity-name}

TASK:
Create a new proposal for a document or activity. Analyze the current state and determine the best next step.

Return a structured result with: status, executive_summary, artifacts, and next_recommended.
