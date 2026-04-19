# MAGI Framework

> Sistema Multi-Agente para Automatización de Proyectos de Software

---

## 🧱 Estructura del Repositorio

```
magi/
├── PLAN.md                    # Plan de implementación completo
├── ROADMAP-Proyecto-Documental-AI-Ready.md  # Roadmap de documentación
│
├── framework/                 # Arquitectura del framework MAGI
│   ├── ARCHITECTURE.md        # Arquitectura v2.0 del sistema
│   ├── config.json            # Configuración multi-LLM
│   ├── schemas/               # JSON schemas (agent, message, team)
│   └── templates/             # Plantillas de documentos
│
├── agents/                    # Agentes configurados para OpenCode
│   ├── opencode.json          # Configuración de agentes y MCP
│   ├── opencode.json.example  # Template con API keys
│   ├── MCP-CONFIG-TEMPLATE.md # Referencia de configuración MCP
│   ├── agents/                # Definiciones de agentes
│   ├── commands/              # Comandos (/sdd-*, /pm-*)
│   └── skills/                # Skills SDD, PM, Cyber
│
└── research/                  # Investigaciones
    ├── INDEX.md               # Índice de investigaciones
    └── game-theory/           # Teoría de juegos & multi-agent AI
```

## 🎯 Qué es MAGI

MAGI es un framework de automatización multi-agente que combina:

- **Orquestación** de agentes especializados (Documentador, Arquitecto, Scrum Master)
- **Memoria persistente** entre sesiones (Engram)
- **Comunicación estructurada** entre agentes
- **Soporte multi-LLM** (Kimi K2.5, MiniMax, GLM-5, Claude)
- **Despliegue flexible** (host o Docker)

## 🛠️ Agentes Configurados

Este repositorio incluye 3 orquestadores listos para OpenCode:

| Agente | Comandos | Función |
|--------|----------|---------|
| **SDD Orchestrator** | `/sdd-init`, `/sdd-new`, `/sdd-apply`, `/sdd-verify`, `/sdd-archive` | Desarrollo basado en especificaciones |
| **PM Orchestrator** | `/pm:init`, `/pm:explore`, `/pm:new`, `/pm:apply`, `/pm:verify` | Gestión de proyectos y documentación |
| **Cyber Orchestrator** | `/cyber:lab`, `/cyber:recon`, `/cyber:exploit` | Pentesting y preparación eJPT |

## 📋 Instalación

```bash
# Instalar desde el repositorio
./scripts/install-opencode-agents.sh

# O manualmente:
# 1. Copiar skills y commands a ~/.config/opencode/
# 2. Configurar API keys en ~/.config/opencode/opencode.json
```

## 📚 Documentación

- [PLAN.md](PLAN.md) — Plan de implementación completo
- [framework/ARCHITECTURE.md](framework/ARCHITECTURE.md) — Arquitectura del sistema
- [research/INDEX.md](research/INDEX.md) — Centro de investigaciones

## 🔗 Recursos

- [Agent Skills Spec](https://opencode.ai/docs/skills/)
- [llms.txt Spec](https://llmstxt.cool/)
- [MCP Spec](https://modelcontextprotocol.io/)
- [Engram](https://github.com/Gentleman-Programming/engram)
- [OpenCode](https://opencode.ai)

---

**Versión:** 2.0.0
**Mantenido por:** Joyan Labs
