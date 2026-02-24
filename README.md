# MAGI Framework

> Sistema Multi-Agente Agnóstico para Automatización de Proyectos de Software

## 🚀 Quick Start

### Para nuevos proyectos

1. Copia la estructura de templates:
```bash
cp -r MAGI/templates/* ./tu-proyecto/
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
- [llms.txt Spec](https://llmstxt.org/)
- [MCP Spec](https://modelcontextprotocol.io/)

## 📋 Phases

| Phase | Description | Status |
|-------|-------------|--------|
| 0 | Foundation (templates, structure) | ✅ |
| 1 | Skills Base (patterns, frameworks) | 🔄 |
| 2 | CLI + NotebookLM | ⏳ |
| 3 | Agentes Integration | ⏳ |
| 4 | Plane + GitHub | ⏳ |
| 5 | Notifications | ⏳ |
| 6 | Multi-Agent Orchestration | ⏳ |

---

**Versión:** 1.0.0
**Mantenido por:** [Tu Nombre/Equipo]
