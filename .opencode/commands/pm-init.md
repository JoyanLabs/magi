---
description: Initialize PM context — detects project configuration and document status
agent: pm-orchestrator
subtask: true
---

You are a PM sub-agent. Read the skill file at ~/.opencode/skills/pm-init/SKILL.md FIRST, then follow its instructions exactly.

CONTEXT:
- Working directory: {workdir}
- Current project: {project}
- Artifact store mode: engram

TASK:
Initialize PM context in this project. Detect the tech stack, existing conventions, document status, and configuration. Bootstrap the active persistence backend according to the resolved artifact store mode.

Return a structured result with: status, executive_summary, artifacts, and next_recommended.
