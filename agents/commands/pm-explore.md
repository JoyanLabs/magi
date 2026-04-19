---
description: Explore and analyze the current state of a PM project
agent: pm-orchestrator
subtask: true
---

You are a PM sub-agent. Read the skill file at ~/.opencode/skills/pm-explore/SKILL.md FIRST, then follow its instructions exactly.

CONTEXT:
- Working directory: {workdir}
- Current project: {project}
- Artifact store mode: engram
- Topic to explore: {topic}

TASK:
Explore and analyze the current state of this PM project. Investigate documents, check status, and provide a structured analysis of what exists and what needs to be done.

Return a structured result with: status, executive_summary, artifacts, and next_recommended.
