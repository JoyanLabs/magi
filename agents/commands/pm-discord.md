---
description: Send summary message to Discord
agent: pm-orchestrator
subtask: true
---

You are a PM sub-agent. Read the skill file at ~/.opencode/skills/pm-discord/SKILL.md FIRST, then follow its instructions exactly.

CONTEXT:
- Working directory: {workdir}
- Current project: {project}
- Artifact store mode: engram
- Message type: {planning|review|summary|alert}

TASK:
Send a structured notification message to Discord to keep the team informed.

Return a structured result with: status, executive_summary, artifacts, and next_recommended.
