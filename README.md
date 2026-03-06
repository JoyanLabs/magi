# MAGI Framework

> Sistema Multi-Agente Agnóstico para Automatización de Proyectos de Software

## 🚀 Quick Start

### Para nuevos proyectos

1. Copia la estructura de templates:
```bash
cp -r templates/* ./tu-proyecto/
```

2. Configura los skills:
```bash
cd skills
./setup.sh --all
```

3. Personaliza AGENTS.md para tu proyecto

### Estructura básica

```
tu-proyecto/
├── llms.txt                    # Índice de conocimiento
├── AGENTS.md                   # Configuración de agentes
├── docs/                       # Documentación
│   ├── 01-definicion-sistema.md
│   ├── epicas/
│   └── gestion/
├── skills/                     # Skills del proyecto
│   ├── setup.sh
│   └── {skill-name}/
└── src/                        # Código fuente
```

## 📚 Documentación

- [PLAN.md](PLAN.md) - Plan de implementación completo
- [templates/](templates/) - Plantillas de documentos
- [skills/](skills/) - Skills base (en construcción)

## 🎯 Características

- **Agnóstico**: Funciona con cualquier LLM (Claude, Kimi, GPT, etc.)
- **Estándares Abiertos**: Agent Skills, llms.txt, MCP
- **Escalable**: Fases pequeñas y acumulativas
- **Arquitectura Hexagonal**: Puertos y adaptadores para integraciones

## 🔗 Recursos

- [Agent Skills Spec](https://opencode.ai/docs/skills/)
- [llms.txt Spec](https://llmstxt.cool/)
- [MCP Spec](https://modelcontextprotocol.io/)

## 📋 Phases

| Phase | Description | Status |
|-------|-------------|--------|
| 0 | Foundation (templates, structure) | ✅ |
| 1 | Skills Base (patterns, frameworks) | ✅ |
| 2 | CLI + NotebookLM | ✅ |
| 3 | Agentes Integration (SDD + PM) | ✅ |
| 4 | Plane + GitHub | ⏳ |
| 5 | Notifications | ⏳ |
| 6 | Multi-Agent Orchestration | ✅ |

---

## 🛠️ OpenCode Agents (SDD + PM)

Este repositorio incluye agentes configurados para OpenCode:

- **SDD Orchestrator** - Desarrollo basado en especificaciones
- **PM Orchestrator** - Gestión de proyectos

### Instalación

Ver [README-OPENCODE-AGENTS.md](README-OPENCODE-AGENTS.md) para instrucciones detalladas.

### Requisitos

1. **OpenCode**: https://github.com/opencode-ai/opencode
2. **UV** (gestor de paquetes):
   ```bash
   # Instalar UV
   curl -fsSL https://astral.sh/uv/install.sh | bash
   # O con brew
   brew install uv
   ```
3. **Engram** (memoria persistente):
   ```bash
   brew install engram
   # o: https://github.com/gentleman-programming/engram
   ```
4. **notebooklm-mcp-cli**:
   ```bash
   uv tool install notebooklm-mcp-cli
   nlm login  # Autenticar
   ```

### Referencias de submódulos

| Repo | URL |
|------|-----|
| Engram | https://github.com/gentleman-programming/engram |
| notebooklm-mcp-cli | https://github.com/jacob-bd/notebooklm-mcp-cli |
| agent-teams-lite | https://github.com/Gentleman-Programming/agent-teams-lite |

---

**Versión:** 1.1.0
**Mantenido por:** Joyan Labs
