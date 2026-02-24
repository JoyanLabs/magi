# MAGI Framework - Plan de Implementación

> Sistema Multi-Agente Agnóstico para Automatización de Proyectos de Software

---

## 📋 Resumen Ejecutivo

MAGI es un framework de automatización multi-agente agnóstico y abstracto que permite:
- Gestionar proyectos de software con agentes AI especializados
- Integrarse con múltiples gestores de proyectos (Plane, Linear, Jira)
- Conectarse con múltiples canales de comunicación (WhatsApp, Email, Discord, Telegram)
- Mantener una base de conocimiento centralizada (NotebookLM)
- Operar con cualquier LLM (Claude, Kimi K2.5, GPT, etc.)

**Filosofía:**
- Agnóstico al LLM: Cambia de proveedor sin cambiar código
- Arquitectura de Puertos y Adaptadores: Abstrae integraciones
- Estándares Abiertos: Agent Skills, llms.txt, MCP
- Escalable: Fases pequeñas y acumulativas

---

## 🎯 Arquitectura del Sistema

```
┌─────────────────────────────────────────────────────────────────────────┐
│                           MAGI CORE                                     │
│                                                                         │
│   ┌─────────────┐    ┌─────────────┐    ┌─────────────┐              │
│   │   LLM A    │    │   LLM B    │    │   LLM C    │              │
│   │ (Kimi K2.5)│    │(Claude Code)│    │ (Futuro)   │              │
│   └──────┬──────┘    └──────┬──────┘    └──────┬──────┘              │
│          │                   │                   │                      │
│          └───────────────────┼───────────────────┘                      │
│                              ▼                                          │
│                   ┌─────────────────┐                                  │
│                   │   AGENTS LAYER  │  ← Estándar Agent Skills        │
│                   │   (Abstracto)   │                                  │
│                   └────────┬────────┘                                  │
│                            │                                            │
│          ┌─────────────────┼─────────────────┐                        │
│          ▼                 ▼                 ▼                          │
│   ┌─────────────┐   ┌─────────────┐   ┌─────────────┐                │
│   │   MCP A     │   │   MCP B     │   │   MCP C    │                │
│   │ (NotebookLM)│   │   (Plane)   │   │ (GitHub)   │                │
│   └─────────────┘   └─────────────┘   └─────────────┘                │
│                                                                         │
│   ┌─────────────────────────────────────────────────────────────┐      │
│   │                     PORTS & ADAPTERS                         │      │
│   │  ┌──────────┐    ┌──────────┐    ┌──────────┐            │      │
│   │  │IMessagePort│    │ITaskPort │    │INotifyPort│            │      │
│   │  └────┬─────┘    └────┬─────┘    └────┬─────┘            │      │
│   │       │                │                │                    │      │
│   │  ┌────▼─────┐    ┌────▼─────┐    ┌────▼─────┐            │      │
│   │  │WhatsApp  │    │  Plane   │    │  Discord │            │      │
│   │  │ Adapter  │    │  Adapter │    │  Adapter │            │      │
│   │  └──────────┘    └──────────┘    └──────────┘            │      │
│   └─────────────────────────────────────────────────────────────┘      │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 🏗️ Estructura de Archivos del Framework

```
MAGI/
├── README.md                          # Punto de entrada
├── PLAN.md                            # Este archivo
│
├── system/                            # Núcleo del sistema
│   ├── cli/                           # Interfaz CLI
│   │   ├── index.ts
│   │   └── commands/
│   ├── core/                          # Lógica core
│   │   ├── ports/                     # Interfaces (puertos)
│   │   ├── adapters/                  # Implementaciones
│   │   └── agents/                   # Agentes abstractos
│   └── config/                       # Configuración
│
├── skills/                            # Skills Library (Base de conocimiento)
│   ├── README.md
│   ├── patterns/                      # Patrones arquitectónicos
│   │   ├── hexagonal/
│   │   ├── cqrs/
│   │   └── repository/
│   ├── frameworks/                    # Frameworks
│   │   ├── nestjs/
│   │   ├── nuxt/
│   │   ├── prisma/
│   │   └── better-auth/
│   ├── integrations/                   # Integraciones
│   │   ├── mcp/
│   │   ├── plane/
│   │   ├── github/
│   │   ├── notebooklm/
│   │   ├── whatsapp/
│   │   ├── discord/
│   │   └── email/
│   └── agents/                        # Agentes especializados
│       ├── arquitecto/
│       ├── scrum-master/
│       └── documentador/
│
├── templates/                         # Plantillas de documentos
│   ├── llms.txt
│   ├── AGENTS.md
│   ├── definicion-sistema.md
│   ├── historia-usuario-bdd.md
│   ├── tracker-semantico.md
│   ├── acta-sprint-review.md
│   └── epica.md
│
├── mcp/                              # Configuraciones MCP
│   └── server.json
│
└── docs/                             # Documentación del framework
    └── ARCHITECTURE.md
```

---

## 📍 Fases de Implementación

### Fase 0: Foundation (Inicio)
**Objetivo:** Crear estructura base y plantillas

- [x] Estructura base de directorios
- [x] Templates de documentos (MAGI/templates/)
- [x] **SKILL.md template mejorado** (basado en Conasin + HITL)
- [x] **AGENTS.md template avanzado** (con agentes separados + flujo)
- [x] **Configuración MCP NotebookLM en OpenCode**

### Fase 1: Skills del Documentador (Procesamiento de Documentos)
**Objetivo:** Crear skills para optimizar documentos del cliente/consultor

- [x] `skills/documentador/SKILL.md` - Skill principal
- [x] `skills/documentador/optimizacion-md/SKILL.md` - Optimización de documentos
- [x] `skills/documentador/notebooklm-connector/SKILL.md` - Conector MCP
- [x] `skills/documentador/consultas/SKILL.md` - Respuestas a otros agentes
- [x] `skills/documentador/procesamiento-tdr/SKILL.md` - Optimizar TDR
- [x] `skills/documentador/procesamiento-propuesta/SKILL.md` - Optimizar Propuesta
- [x] `skills/documentador/procesamiento-diagnostico/SKILL.md` - Optimizar Diagnóstico
- [x] `skills/documentador/procesamiento-plan-impl/SKILL.md` - Optimizar Plan Impl.
- [x] `skills/documentador/resumen-reuniones/SKILL.md` - Resumir reuniones

### Fase 2: Skills del Arquitecto
**Objetivo:** Crear skills para definir alcance y planificación

- [x] `skills/arquitecto/SKILL.md` - Skill principal del Arquitecto
- [x] Sub-skills del Arquitecto:
  - [x] consulta-base-conocimiento/ - Consulta NotebookLM
  - [x] definicion-alcance/ - Crea resumen-alcance.md
  - [x] diseno-modulos/ - Define módulos
  - [x] planificacion-sprints/ - Planifica sprints
  - [x] creacion-epicas/ - Crea épicas
  - [x] creacion-historias-usuario/ - Crea HU

### Fase 3: Agentes en OpenCode
**Objetivo:** Crear agentes configurados para proyectos

- [x] `.opencode/agents/documentador.md` - Agente Documentador (kimi → minimax)
- [x] `.opencode/agents/arquitecto.md` - Agente Arquitecto

### Fase 4: Proyectos de Prueba
**Objetivo:** Estructuras para probar el flujo

- [x] `san-ignacio/` - Proyecto con datos (Notebook: cc9fa9cf-bd89-41ca-a676-ecbe198cc7df)
- [x] `saludent/` - Proyecto nuevo (Notebook vacío)

### Fase 4: Pruebas con San Ignacio
**Objetivo:** Probar el flujo completo

- [ ] Procesar documentos de San Ignacio (TDR, Propuesta, Diagnóstico, Plan)
- [ ] Indexar en NotebookLM
- [ ] Probar flujo: Documentador → NotebookLM → Arquitecto
- [ ] Generar documentos de alcance

### Fase 5: Skills Base
**Objetivo:** Crear skills de patrones y frameworks

- [ ] Skills patterns/ (hexagonal, cqrs, repository)
- [ ] Skills frameworks/ (nestjs, nuxt, prisma)
- [ ] Skills integrations/ (plane, github)
- [ ] Skills agents/ (arquitecto, scrum-master)

### Fase 5: Notificaciones
**Objetivo:** Conectar con canales de comunicación

- [ ] Adaptador WhatsApp (NotificationPort)
- [ ] Adaptador Email (NotificationPort)
- [ ] Adaptador Discord (NotificationPort)
- [ ] Adaptador Telegram (NotificationPort)

### Fase 6: Multi-Agent Orchestration
**Objetivo:** Implementar orquestación multi-agente

- [ ] Capa de abstracción para LLMs
- [ ] Orquestador de agentes
- [ ] Integración Claude Agent Teams / Kimi K2.5 Swarm
- [ ] Protocolo de comunicación agente-agente
- [ ] API Platform (ver sección "Evolución API" más abajo)

---

## 🔄 Flujo de Trabajo Completo

### Inicio de Nuevo Proyecto

1. `magi new proyecto-x --template mipymes`
2. CLI genera estructura base
3. Subir documentos a NotebookLM
4. MAGI procesa y guarda MD optimizados

### Definición del Sistema

1. `magi define-system`
2. Agente Arquitecto consulta NotebookLM
3. Agente Arquitecto consulta skills/patterns
4. Genera: definicion-sistema.md, diagramas, esquema-bd

### Historias de Usuario

1. `magi generate-epics`
2. Genera HU con criterios BDD
3. Guarda en docs/epicas/

### Sprint Planning

1. `magi plan-sprint 1`
2. Agente Scrum Master crea proyecto en Plane
3. Crea Sprint y Issues

### Desarrollo

1. OpenCode consulta llms.txt
2. OpenCode carga skills relevantes
3. Al completar: marca criterios, crea PR

### Sprint Review

1. `magi sprint-review`
2. Agente Scrum Master genera acta
3. Envía notificaciones (WhatsApp, Discord, Email)

---

## 🛠️ Tecnologías

| Componente | Tecnología |
|------------|------------|
| CLI Framework | TypeScript + Commander.js |
| Integraciones MCP | SDKs oficiales + adaptadores custom |
| LLM Abstraction | Interface custom |
| Workflow | Inngest AgentKit o LangChain |
| Hosting | Propio (VPS/Docker) |

---

## 📚 Estándares Utilizados

- **Agent Skills**: Estándar para skills de agentes (opencode.ai/docs/skills)
- **llms.txt**: Índice de conocimiento para LLMs (llmstxt.org)
- **MCP**: Model Context Protocol (modelcontextprotocol.io)
- **AGENTS.md**: Configuración de agentes (agents_md)

---

## 🔗 Recursos

### Documentación de Contexto (MAGI/context/)
- Arquitectura Documental Orientada a IA
- Análisis Técnico de Arquitecturas Multi-Agente
- Estrategia Integral de Arquitectura de Software

### Referencias (MAGI/ejemplo-conasin/)
- conasin-backend/ - Ejemplo con NestJS
- conasin-frontend/ - Ejemplo con Nuxt
- conasin-landing/ - Ejemplo con Astro

### Plantillas (MAGI/templates/)
- llms.txt
- AGENTS.md
- definicion-sistema.md
- historia-usuario-bdd.md
- tracker-semantico.md
- acta-sprint-review.md

---

## 🚀 Evolución API - De Herramienta a Plataforma

### Fase 6: Multi-Agent Orchestration
**Objetivo:** Implementar orquestación multi-agente

- [ ] Capa de abstracción para LLMs
- [ ] Orquestador de agentes
- [ ] Integración Claude Agent Teams / Kimi K2.5 Swarm

### Fase 7: API Platform (AgentCrew-style)
**Objetivo:** Exponer MAGI como servicio API

```python
# Visión: API estilo AgentCrew
from magi import Agent, Crew, Task

# Definir agentes especializados
arquitecto = Agent(role="Arquitecto", llm="kimi-k2.5")
documentador = Agent(role="Documentador", llm="minimax")
scrum_master = Agent(role="Scrum Master", llm="minimax", tools=[plane_mcp])

# Definir tarea
task = Task(
    description="Crear epicas para sistema de clínica dental",
    agent=arquitecto,
    context=[notebooklm_sources]
)

# Ejecutarcrew = Crew(agents=[arquitecto, documentador, scrum_master], tasks=[task])
result = crew.kickoff()
```

#### Endpoints Planificados

| Endpoint | Método | Descripción |
|----------|--------|-------------|
| `/projects` | POST | Crear nuevo proyecto |
| `/projects/{id}/analyze` | POST | Analizar documentos del proyecto |
| `/projects/{id}/epics` | POST | Generar épicas |
| `/projects/{id}/sprints` | POST | Planificar sprint |
| `/tasks` | GET/POST | Gestionar tareas en Plane |
| `/notifications` | POST | Enviar notificaciones |

#### Stack Tecnológico API

| Componente | Tecnología |
|------------|------------|
| API Framework | FastAPI |
| Auth | JWT + OAuth |
| Database | PostgreSQL |
| Queue | Redis + Celery |
| API Docs | OpenAPI 3.0 |

---

## 📡 Modelo de Comunicación Agente-Agente

```python
# Protocolo de mensajes entre agentes
class AgentMessage(BaseModel):
    sender: str          # ID del agente origen
    receiver: str        # ID del agente destino
    intent: str          # acción requerida
    payload: dict        # datos
    conversation_id: str # thread de conversación
    metadata: dict      # contexto adicional
```

### Flujo de Mensajes

1. **Orquestador** → **Documentador**: "Procesa documentos del cliente"
2. **Documentador** → **Orquestador**: "Documentos procesados, contexto indexado"
3. **Orquestador** → **Arquitecto**: "Genera definición del sistema"
4. **Arquitecto** → **Orquestador**: "Épicas y HU generadas"
5. **Orquestador** → **Scrum Master**: "Crea sprint en Plane"
6. **Scrum Master** → **Orquestador**: "Sprint creado con N issues"

---

**Versión:** 1.1.0
**Última actualización:** 2026-02-20
**Mantenedor:** [Tu Nombre/Equipo]
