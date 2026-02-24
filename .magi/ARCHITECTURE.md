# MAGI Framework - Arquitectura v2.0

> Sistema Multi-Agente Gnóstico con Memoria Persistente y Orquestación

---

## 1. Visión General

MAGI es un framework de automatización multi-agente que combina:
- **Orquestación** de agentes especializados (Documentador, Arquitecto, Scrum Master)
- **Memoria persistente** entre sesiones (Engram)
- **Comunicación estructurada** entre agentes (estilo AgentCrew)
- **Soporte multi-LLM** (MiniMax, Kimi K2.5, GLM-5)
- **Despliegue flexible** (host o Docker)

---

## 2. Diagrama de Arquitectura

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                              MAGI Framework v2.0                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │                          Usuario / Cliente                            │  │
│  │                    (CLI, Web, WhatsApp, etc.)                         │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
│                                    │                                       │
│                                    ▼                                       │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │                        Orquestador (Leader)                           │  │
│  │  ┌─────────────────────────────────────────────────────────────────┐  │  │
│  │  │ • Coordina agentes                                              │  │  │
│  │  • Asigna tareas (task_assignment)                                 │  │  │
│  │  • Gestiona estado del proyecto                                     │  │  │
│  │  • Memoria: Engram (mem_save, mem_search)                          │  │  │
│  │  └─────────────────────────────────────────────────────────────────┘  │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
│                                    │                                       │
│           ┌────────────────────────┼────────────────────────┐              │
│           ▼                        ▼                        ▼              │
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐       │
│  │   Documentador  │    │    Arquitecto   │    │  Scrum Master   │       │
│  │   (Especialista)│    │  (Especialista) │    │  (Especialista) │       │
│  │                 │    │                 │    │                 │       │
│  │ - MCP: NL      │    │ - MCP: Plane   │    │ - MCP: GitHub   │       │
│  │ - Memoria: ✓  │    │ - Memoria: ✓  │    │ - Memoria: ✓   │       │
│  │ - Skills: 15+  │    │ - Skills: 10+  │    │ - Skills: 5+    │       │
│  └────────┬────────┘    └────────┬────────┘    └────────┬────────┘       │
│           │                      │                      │                  │
│           └──────────────────────┼──────────────────────┘                  │
│                                  │                                         │
│                                  ▼                                         │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │                    Sistema de Memoria (Engram)                        │  │
│  │                                                                       │  │
│  │   ┌─────────────┐   ┌─────────────┐   ┌─────────────┐                │  │
│  │   │ mem_save   │   │ mem_search  │   │ mem_session│                │  │
│  │   │            │   │             │   │ _summary   │                │  │
│  │   └─────┬──────┘   └──────┬──────┘   └──────┬──────┘                │  │
│  │         │                  │                 │                        │  │
│  │         └──────────────────┼─────────────────┘                        │  │
│  │                            ▼                                          │  │
│  │                  ┌─────────────────────┐                              │  │
│  │                  │   SQLite + FTS5    │                              │  │
│  │                  │  (~/.engram.db)    │                              │  │
│  │                  └─────────────────────┘                              │  │
│  │                                                                       │  │
│  │   Git Sync: Export/Import memorias entre equipos                     │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
│                                                                             │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │                    Capa de Comunicación                               │  │
│  │                                                                       │  │
│  │   Mensajes JSON:                                                     │  │
│  │   ┌──────────────┐  ┌──────────────┐  ┌──────────────┐             │  │
│  │   │task_assignment│  │task_result   │  │question     │             │  │
│  │   │task_result   │  │status_update │  │context_share│             │  │
│  │   └──────────────┘  └──────────────┘  └──────────────┘             │  │
│  │                                                                       │  │
│  │   Cola de tareas: .magi/queue/                                      │  │
│  │   Estado: .magi/estado.json                                         │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
│                                                                             │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │                    Capa de Integraciones (MCP)                         │  │
│  │                                                                       │  │
│  │   ┌─────────────┐  ┌─────────────┐  ┌─────────────┐                │  │
│  │   │ NotebookLM  │  │   Plane     │  │   GitHub    │                │  │
│  │   │   MCP       │  │    MCP      │  │    MCP      │                │  │
│  │   └─────────────┘  └─────────────┘  └─────────────┘                │  │
│  │                                                                       │  │
│  │   ┌─────────────┐  ┌─────────────┐  ┌─────────────┐                │  │
│  │   │  WhatsApp   │  │  Discord    │  │   Email     │                │  │
│  │   │   MCP       │  │    MCP      │  │    MCP      │                │  │
│  │   └─────────────┘  └─────────────┘  └─────────────┘                │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 3. Componentes Principales

### 3.1 Agentes

| Agente | Rol | Modelo LLM | Responsabilidad | MCP |
|--------|-----|------------|----------------|-----|
| **Orquestador** | Leader | **Kimi K2.5** | Coordina flujo, asigna tareas | NotebookLM |
| **Documentador** | Worker | **MiniMax M2.5** | Gestiona docs, NotebookLM | NotebookLM |
| **Arquitecto** | Worker | **MiniMax M2.5** | Define alcance, módulos, HU | - |
| **Scrum Master** | Worker | **MiniMax M2.5** | Gestiona sprints, ágil | - |

### 3.2 Multi-LLM

```
┌─────────────────────────────────────────┐
│         Configuración Multi-LLM           │
├─────────────────────────────────────────┤
│                                         │
│  ┌─────────────────────────────────┐   │
│  │   Orquestador (Kimi K2.5)       │   │
│  │   - Agent Swarm nativo          │   │
│  │   - Reasoning avanzado          │   │
│  │   - Temperatura: 0.7           │   │
│  └─────────────────────────────────┘   │
│                   │                      │
│  ┌────────┬───────┴────────┬────────┐  │
│  ▼        ▼                 ▼        ▼  │
│ ┌──────┐ ┌──────┐ ┌───────────┐ ┌────┐ │
│ │ Doc  │ │ Arq  │ │ Scrum Mstr│ │    │ │
│ │M2.5  │ │M2.5  │ │  M2.5    │ │    │ │
│ └──────┘ └──────┘ └───────────┘ └────┘ │
│                                         │
└─────────────────────────────────────────┘
```

### 3.2 Memoria (Engram)

**10 Herramientas MCP:**

| Tool | Propósito |
|------|-----------|
| `mem_save` | Guardar observación estructurada |
| `mem_search` | Búsqueda full-text |
| `mem_session_summary` | Resumen de fin de sesión |
| `mem_context` | Contexto de sesiones previas |
| `mem_timeline` | Línea temporal alrededor de observación |
| `mem_get_observation` | Contenido completo de memoria |
| `mem_save_prompt` | Guardar prompt para contexto |
| `mem_stats` | Estadísticas del sistema |
| `mem_session_start` | Registrar inicio de sesión |
| `mem_session_end` | Marcar sesión como completada |

### 3.3 Protocolo de Mensajes

```json
{
  "message_id": "uuid",
  "from": "arquitecto",
  "to": "documentador",
  "type": "question",
  "context": {
    "thread_id": "optional",
    "relevant_ids": []
  },
  "ref_message_id": "optional",
  "payload": {},
  "timestamp": "2026-02-19T12:00:00Z"
}
```

**Tipos de Mensajes:**

| Type | Descripción |
|------|-------------|
| `task_assignment` | Asignación de tarea |
| `task_result` | Resultado de tarea |
| `question` | Pregunta entre agentes |
| `status_update` | Actualización de estado |
| `context_share` | Compartir contexto |
| `user_message` | Mensaje del usuario |
| `system_command` | Comando del sistema |

---

## 4. Flujos de Trabajo

### 4.1 Flujo de Comunicación Agente ↔ Agente

```
┌──────────────┐         ┌──────────────┐         ┌──────────────┐
│   Usuario    │         │  Agente A   │         │  Agente B   │
│              │         │  (Leader)   │         │  (Worker)   │
└──────┬───────┘         └──────┬───────┘         └──────┬───────┘
       │                        │                        │
       │   "Define el alcance   │                        │
       │    del módulo X"      │                        │
       ├──────────────────────►│                        │
       │                        │                        │
       │                        │  task_assignment       │
       │                        │  (to: arquitecto)      │
       │                        ├──────────────────────►│
       │                        │                        │
       │                        │                        │ mem_search
       │                        │                        │ (buscar contexto)
       │                        │                        ├──────────┐
       │                        │                        │          │
       │                        │                        │ ◄────────┘
       │                        │                        │
       │                        │                        │ Analizar
       │                        │                        │ documento
       │                        │                        │
       │                        │  task_result           │
       │                        │  (status: completed)  │
       │                        │◄───────────────────────┤
       │                        │                        │
       │  WebSocket /          │                        │
       │  polling              │                        │
       │◄─────────────────────┤                        │
       │                        │                        │
```

### 4.2 Flujo de Memoria (Engram)

```
Session Start
     │
     ▼
┌────────────────────────────────┐
│  mem_session_start             │
│  (registrar sesión)            │
└────────────────┬───────────────┘
                 │
                 ▼
┌────────────────────────────────┐
│  Agente trabaja                │
│  - Lee documentos              │
│  - Crea tareas                 │
│  - Consulta NotebookLM          │
└────────────────┬───────────────┘
                 │
     ┌───────────┴───────────┐
     ▼                       ▼
┌──────────────┐      ┌──────────────┐
│ Decision     │      │ Bugfix       │
│ importante   │      │ significativo│
└──────┬───────┘      └──────┬───────┘
       │                     │
       ▼                     ▼
┌──────────────┐      ┌──────────────┐
│ mem_save    │      │ mem_save     │
│ (decision)  │      │ (bugfix)     │
└──────────────┘      └──────────────┘
       │                     │
       └──────────┬───────────┘
                  ▼
┌────────────────────────────────┐
│  mem_session_summary           │
│  (Goal/Discoveries/Accomplished│
│   /Files)                      │
└────────────────┬───────────────┘
                 │
                 ▼
            Session End
```

---

## 5. Estructura de Archivos

```
.magi/
├── ARCHITECTURE.md           # Este archivo
├── estado.json               # Estado del proyecto (agentes activos, tareas)
├── queue/
│   └── pending/             # Tareas pendientes
│       └── active/           # Tareas en progreso
├── schemas/
│   ├── agent.json           # Schema de definición de agentes
│   ├── message.json        # Schema de mensajes
│   └── team.json           # Schema de equipos
├── skills/
│   └── memoria/            # Skill de memoria
│       └── SKILL.md
├── template/
│   ├── PROJECT.md          # Template de proyecto
│   └── agents/
│       ├── orquestador.md
│       ├── documentador.md
│       ├── arquitecto.md
│       └── scrum-master.md
└── config.json             # Configuración global del proyecto
```

---

## 6. Modelos de Despliegue

### 6.1 Host (Desarrollo)

```
┌─────────────────────────────────────────┐
│              Host Machine                │
│  ┌─────────────────────────────────┐    │
│  │         OpenCode / CLI          │    │
│  │  ┌──────────────────────────┐  │    │
│  │  │     Agentes (Procesos)  │  │    │
│  │  │  - Orquestador           │  │    │
│  │  │  - Documentador          │  │    │
│  │  │  - Arquitecto            │  │    │
│  │  │  - Scrum Master         │  │    │
│  │  └──────────────────────────┘  │    │
│  │              │                   │    │
│  │  ┌──────────▼──────────┐       │    │
│  │  │  Engram (MCP)       │       │    │
│  │  │  SQLite (~/.engram) │       │    │
│  │  └─────────────────────┘       │    │
│  └─────────────────────────────────┘    │
└─────────────────────────────────────────┘
```

### 6.2 Docker (Producción)

```
┌─────────────────────────────────────────┐
│              Docker Host                 │
│  ┌─────────────────────────────────┐    │
│  │     magi-api (Go + Fiber)       │    │
│  │     (Puerto 8080)                │    │
│  └──────────────┬────────────────────┘    │
│                 │                         │
│  ┌──────────────▼────────────────────┐    │
│  │         NATS (JetStream)          │    │
│  └──────────────┬────────────────────┘    │
│                 │                         │
│  ┌──────────────┼────────────────────┐    │
│  │              ▼                    │    │
│  │  ┌──────────────────────────┐    │    │
│  │  │   Agent Container 1      │    │    │
│  │  │   (Sidecar + LLM CLI)   │    │    │
│  │  └──────────────┬───────────┘    │    │
│  │                 │                 │    │
│  │  ┌──────────────▼───────────┐    │    │
│  │  │   Agent Container 2      │    │    │
│  │  │   (Sidecar + LLM CLI)   │    │    │
│  │  └──────────────┬───────────┘    │    │
│  │                 │                 │    │
│  └─────────────────┼─────────────────┘    │
│                    │                      │
│        ┌───────────▼───────────┐          │
│        │    Engram Container   │          │
│        │   (SQLite + MCP)      │          │
│        └───────────────────────┘          │
└─────────────────────────────────────────┘
```

---

## 7. LLM Soportados

| Modelo | Costo | Capacidad Swarm | Configuración |
|--------|-------|-----------------|---------------|
| **MiniMax 2.5** | Bajo | Subagentes estáticos | `model: opencode/minimax-m2.5-free` |
| **Kimi K2.5** | Medio | Agent Swarm (dinámico) | API key de Moonshot AI |
| **GLM-5** | Bajo | Agentic Engineering | API key de Zhipu AI |
| **Claude** | Alto | Agent Teams | API key de Anthropic |

---

## 8. Referencias

- [AgentCrew](https://github.com/helmcode/agent_crew_api) - Orquestación multiagente
- [Engram](https://github.com/Gentleman-Programming/engram) - Memoria persistente
- [OpenCode](https://opencode.ai) - Plataforma de agentes
- [MCP](https://modelcontextprotocol.io) - Model Context Protocol

---

**Versión:** 2.0.0
**Última actualización:** 2026-02-19
