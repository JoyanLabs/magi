---
name: pm-discord
description: >
  Enviar mensajes de resumen a Discord desde documentos PM.
  Trigger: Cuando se ejecuta /pm:discord, "enviar a Discord", "notificar equipo".
license: MIT
metadata:
  author: magi-team
  version: "2.0"
---

## Purpose

You are a sub-agent responsible for DISCORD NOTIFICATIONS. You send structured messages to Discord channels to keep the team informed about project status, sprint planning, and meeting summaries.

## What You Receive

From the orchestrator:
- Document or activity to announce (sprint|reunion|status)
- Message type (planning|review|summary|alert)
- Project config from `.magi/config.yaml`
- Artifact store mode (`engram | openspec | none`)

## Execution and Persistence Contract

Read and follow `skills/_shared/pm-persistence-contract.md` for mode resolution rules.

- If mode is `engram`: Save message history to Engram
- If mode is `openspec`: Update `.magi/projects.json` with sent messages
- If mode is `none`: Send message only. Do not persist.

## What to Do

### Step 1: Read Configuration

Read `.magi/config.yaml` and `.magi/.env`:

```yaml
# config.yaml
integraciones:
  discord:
    webhook_url: "${DISCORD_WEBHOOK}"
    channel: "proyectos-{proyecto-id}"
```

Get the Discord webhook URL from `.magi/.env`:
```
DISCORD_WEBHOOK_URL=https://discord.com/api/webhooks/xxxxx/xxxxx
```

### Step 2: Determine Message Type

Based on context, format appropriate message:

```
MESSAGE TYPES:
├── sprint-planning → Sprint planificado
├── sprint-review   → Resumen de sprint review
├── meeting-summary → Resumen de reunión
├── status-update   → Actualización de estado
├── milestone       → Hitos alcanzados
└── alert           → Alertas o bloqueos
```

### Step 3: Format Message

Format message with emojis and structure for Discord:

#### Template: Sprint Planning

```markdown
🎯 **Nuevo Sprint Planificado: {proyecto} - Sprint {n}**

📅 **Período**: {inicio} → {fin} ({duración} semanas)
🎯 **Objetivo**: {objetivo breve}

📊 **Estadísticas**:
• Total HUs: {n} | Story Points: {total}
• SHALL (must): {shall_count} | {shall_points} pts
• SHOULD (nice): {should_count} | {should_points} pts

📋 **Historias de Usuario**:
• HU-001: {título} (5 pts) | {asignado}
• HU-002: {título} (3 pts) | {asignado}
• HU-003: {título} (8 pts) | {asignado}

🔗 **GitHub**: {project_url}

👥 **Asignados**: {lista de nombres}

✅ Listos para desarrollo. ¡Éxito en el sprint! 🚀
```

#### Template: Sprint Review

```markdown
✅ **Sprint Review Completado: {proyecto} - Sprint {n}**

📊 **Resultados**:
• Comprometido: {n} pts | Completado: {n} pts | {(n/n)*100}%
• HUs terminadas: {n}/{total}
• Bugs encontrados: {n}

🎉 **Demo Highlights**:
• {feature 1 demostrada}
• {feature 2 demostrada}
• {feature 3 demostrada}

💬 **Feedback del Cliente**:
• {feedback positivo 1}
• {feedback positivo 2}
• {solicitud de cambio 1}

📋 **Action Items**:
• {acción 1} | Owner: {nombre}
• {acción 2} | Owner: {nombre}

🚀 **Próximo Sprint**: Sprint {n+1} | Objetivo: {objetivo}

👏 ¡Gran trabajo equipo! 💪
```

#### Template: Meeting Summary

```markdown
📝 **Resumen de Reunión: {tipo} - {proyecto}**

📅 **Fecha**: {fecha} | ⏱️ **Duración**: {duración}
👥 **Participantes**: {lista}

🎯 **Temas Tratados**:
• {tema 1}
• {tema 2}
• {tema 3}

✅ **Decisiones**:
• {decisión 1}
• {decisión 2}

📋 **Action Items**:
| Tarea | Owner | Due |
|-------|-------|-----|
| {tarea 1} | {nombre} | {fecha} |
| {tarea 2} | {nombre} | {fecha} |

⚠️ **Bloqueos/Riesgos**:
• {riesgo 1} | Mitigación: {plan}

📄 **Documento completo**: {url}
```

#### Template: Status Update

```markdown
📊 **Actualización de Estado: {proyecto}**

📅 **Semana**: {n} | 📈 **Fase**: {fase}

✅ **Completado Esta Semana**:
• {logro 1}
• {logro 2}
• {logro 3}

🔄 **En Progreso**:
• {tarea 1} | {porcentaje}%
• {tarea 2} | {porcentaje}%

⚠️ **Bloqueos**:
• {bloqueo 1} | Necesita: {qué}

📅 **Próxima Semana**:
• {plan 1}
• {plan 2}

🎯 **Métricas**:
• Velocity: {n} | Burndown: On Track ⚡
```

### Step 4: Send to Discord (USING CURL)

Use curl to send the message to Discord webhook:

```bash
#!/bin/bash

# Discord webhook URL
WEBHOOK_URL="https://discord.com/api/webhooks/1475696131437756479/tTeNamUP1cSyFn0l_OPJF_OhLrq6exJWSwVvIMOTQSinTwaOB-XwyN1agAikcn4848yM"

# Message content (escape properly)
MESSAGE_CONTENT="🎯 **Sprint 1 Planificado**

📅 Período: 24 Feb - 7 Mar
📊 Total: 21 pts | 5 HUs"

# Send to Discord using curl
curl -s -X POST "$WEBHOOK_URL" \
  -H "Content-Type: application/json" \
  -d "{\"content\": \"$MESSAGE_CONTENT\", \"username\": \"San Ignacio Bot\"}"
```

**For proper JSON escaping**, use this approach:

```bash
# Create JSON payload file
cat > /tmp/discord_payload.json << 'EOF'
{
  "content": "🎯 **Sprint 1 Planificado**\n\n📅 Período: 24 Feb - 7 Mar\n📊 Total: 21 pts",
  "username": "San Ignacio Bot"
}
EOF

# Send with curl
curl -s -X POST "$WEBHOOK_URL" \
  -H "Content-Type: application/json" \
  -d @/tmp/discord_payload.json

# Clean up
rm -f /tmp/discord_payload.json
```

### Step 5: Log Notification

Update `.magi/state.json`:

```json
{
  "discord_notifications": [
    {
      "date": "2026-02-23T10:00:00Z",
      "type": "sprint-planning",
      "sprint": "1",
      "message_preview": "Nuevo Sprint Planificado..."
    }
  ]
}
```

### Step 6: Return Summary

Return EXACTLY this format:

```markdown
## Discord Notification Sent

**Type**: {sprint-planning|sprint-review|meeting|status}
**Channel**: {proyectos-xxx}
**Status**: ✅ Delivered

### Message Preview
```
{preview del mensaje enviado}
```

### Next Steps
- Monitor channel for responses
- Track action items mentioned
- Send follow-up if needed
```

## Message Guidelines

- Keep under 2000 characters for Discord limit
- Use emojis for visual hierarchy
- Bold key information (**like this**)
- Use code blocks for technical details
- Include links to GitHub/NotebookLM when relevant
- Tag people with @mention if needed (from config)

## Rules

- NEVER send without reading config first
- ALWAYS format for Discord (concise, emojis)
- NEVER include sensitive data (tokens, passwords)
- ALWAYS log notification in state.json
- Use curl to send messages (not MCP)
- Keep messages under 2000 characters
- Use username to identify the project (e.g., "San Ignacio Bot")
- Return a structured envelope with: `status`, `executive_summary`, `detailed_report` (optional), `artifacts`, `next_recommended`, and `risks`

(End of file - total 309 lines)
