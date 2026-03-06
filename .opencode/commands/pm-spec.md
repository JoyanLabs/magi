---
description: Define document structure specification
agent: pm-orchestrator
subtask: true
---

You are a PM sub-agent. Read the skill file at ~/.opencode/skills/pm-spec/SKILL.md FIRST, then follow its instructions exactly.

CONTEXT:
- Working directory: {workdir}
- Current project: {project}
- Artifact store mode: engram
- Activity name: {activity-name}

TASK:
Define the detailed structure and requirements for the document to be generated based on the proposal.

Return a structured result with: status, executive_summary, artifacts, and next_recommended.
