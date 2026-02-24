# Repository Guidelines

## Cómo Usar Esta Guía

- Empieza aquí para normas generales del proyecto.
- Cada skill tiene un archivo `SKILL.md` con patrones específicos.
- Para preguntas sobre documentación: usa el agente Documentador.

---

## 🎯 Agentes MAGI

Este proyecto usa una **arquitectura multi-agente** donde cada agente tiene responsabilidades específicas:

### Agentes Especializados

| Agente | Rol | MCP Access | Skill Principal |
|--------|-----|------------|-----------------|
| 📝 **Documentador** | Gatekeeper de documentación | ✅ NotebookLM | `documentador` |
| 🏛️ **Arquitecto** | Define arquitectura y patrones | ❌ | `arquitecto` |
| 💻 **Desarrollador** | Implementa código | ❌ | `{framework}` |
| 📊 **Scrum Master** | Gestiona sprints | ❌ | `scrum-master` |

### Regla Importante

> ⚠️ **Solo el Documentador** tiene acceso al MCP de NotebookLM.
> 
> Los demás agentes deben **preguntar al Documentador** cuando necesiten información del proyecto.

---

## Available Skills

### Skills del Documentador

| Skill | Descripción | URL |
|-------|-------------|-----|
| `documentador` | Gestión documental y NotebookLM | [SKILL.md](skills/documentador/SKILL.md) |
| `optimizacion-md` | Transformar docs a Markdown AI-Ready | [SKILL.md](skills/documentador/optimizacion-md/SKILL.md) |
| `notebooklm-connector` | Uso del MCP de NotebookLM | [SKILL.md](skills/documentador/notebooklm-connector/SKILL.md) |
| `consultas` | Patrones para responder a otros agentes | [SKILL.md](skills/documentador/consultas/SKILL.md) |
| `procesamiento-tdr` | Optimizar Términos de Referencia | [SKILL.md](skills/documentador/procesamiento-tdr/SKILL.md) |
| `procesamiento-propuesta` | Optimizar Propuesta Comercial | [SKILL.md](skills/documentador/procesamiento-propuesta/SKILL.md) |
| `procesamiento-diagnostico` | Optimizar Diagnóstico | [SKILL.md](skills/documentador/procesamiento-diagnostico/SKILL.md) |
| `procesamiento-plan-impl` | Optimizar Plan de Implementación | [SKILL.md](skills/documentador/procesamiento-plan-impl/SKILL.md) |
| `resumen-reuniones` | Resumir transcripciones de reuniones | [SKILL.md](skills/documentador/resumen-reuniones/SKILL.md) |

### Skills Genéricos

| Skill | Descripción | URL |
|-------|-------------|-----|
| `typescript` | Const types, flat interfaces, utility types | [SKILL.md](skills/typescript/SKILL.md) |
| `zod-4` | API de Zod 4, validación de schemas | [SKILL.md](skills/zod-4/SKILL.md) |
| `context7-docs` | Consulta documentación actualizada via MCP | [SKILL.md](skills/context7-docs/SKILL.md) |

### Skills Específicos del Proyecto

| Skill | Descripción | URL |
|-------|-------------|-----|
| `{project}` | Overview del proyecto, navegación | [SKILL.md](skills/{project}/SKILL.md) |
| `{framework1}` | [Descripción del framework] | [SKILL.md](skills/{framework1}/SKILL.md) |
| `{framework2}` | [Descripción del framework] | [SKILL.md](skills/{framework2}/SKILL.md) |

### Skills de Integración

| Skill | Descripción | URL |
|-------|-------------|-----|
| `plane` | Gestión de proyectos en Plane | [SKILL.md](skills/plane/SKILL.md) |
| `github` | Integración con GitHub | [SKILL.md](skills/github/SKILL.md) |

### Skills del Arquitecto

| Skill | Descripción | URL |
|-------|-------------|-----|
| `arquitecto` | Define sistemas, módulos, sprints, épicas y HU | [SKILL.md](skills/arquitecto/SKILL.md) |
| `consulta-base-conocimiento` | Cómo consultar NotebookLM vía Documentador | [SKILL.md](skills/arquitecto/consulta-base-conocimiento/SKILL.md) |
| `definicion-alcance` | Crear resumen de alcance | [SKILL.md](skills/arquitecto/definicion-alcance/SKILL.md) |
| `diseno-modulos` | Definir módulos del sistema | [SKILL.md](skills/arquitecto/diseno-modulos/SKILL.md) |
| `planificacion-sprints` | Planificar sprints | [SKILL.md](skills/arquitecto/planificacion-sprints/SKILL.md) |
| `creacion-epicas` | Crear épicas | [SKILL.md](skills/arquitecto/creacion-epicas/SKILL.md) |
| `creacion-historias-usuario` | Crear historias de usuario | [SKILL.md](skills/arquitecto/creacion-historias-usuario/SKILL.md) |

### Skills de Agentes

| Skill | Descripción | URL |
|-------|-------------|-----|
| `scrum-master` | Gestiona sprints y crea actas | [SKILL.md](skills/scrum-master/SKILL.md) |

### Meta Skills

| Skill | Descripción | URL |
|-------|-------------|-----|
| `skill-creator` | Crear nuevos AI agent skills | [SKILL.md](skills/skill-creator/SKILL.md) |
| `skill-sync` | Sincronizar metadata a AGENTS.md | [SKILL.md](skills/skill-sync/SKILL.md) |

### Auto-invoke Skills

When performing these actions, ALWAYS invoke the corresponding skill FIRST:

| Action | Skill |
|--------|-------|
| **Consultando documentación del proyecto** | `documentador` |
| Buscando documentación o buenas prácticas | `context7-docs` |
| Creando commits, PRs, o usando templates de GitHub | `github` |
| Creando nuevo skill | `skill-creator` |
| Creando o actualizando documentación | `documentador` |
| Después de crear/modificar un skill | `skill-sync` |
| Gestionando sprints o planning | `scrum-master` |
| Definiendo arquitectura del sistema | `arquitecto` |
| Optimizando documentos para LLMs | `optimizacion-md` |
| Usando NotebookLM | `notebooklm-connector` |
| Preguntas generales sobre el proyecto | `documentador` |
| Respondiendo consultas de otros agentes | `consultas` |
| Trabajando con {framework1} | `{framework1}` |
| Trabajando con {framework2} | `{framework2}` |
| Usando validación de schemas | `zod-4` |
| Escribiendo tipos TypeScript | `typescript` |

---

## 🤖 Flujo de Comunicación entre Agentes

```mermaid
flowchart LR
    ARCH[🏛️ Arquitecto]
    DEV[💻 Desarrollador]
    SCRUM[📊 Scrum Master]
    DOC[📝 Documentador]
    NB[☁️ NotebookLM]
    
    ARCH -.->|"❓ Pregunta"| DOC
    DEV -.->|"❓ Pregunta"| DOC
    SCRUM -.->|"❓ Pregunta"| DOC
    
    DOC -->|"Consulta NB"| NB
    NB -->|"Respuesta"| DOC
    
    DOC -.->|"Responde + Contexto"==> ARCH
    DOC -.->|"Responde + Contexto"==> DEV
    DOC -.->|"Responde + Contexto"==> SCRUM
    
    style DOC fill:#e1f5fe,stroke:#01579b,stroke-width:3px
    style NB fill:#fff3e0,stroke:#e65100,stroke-width:2px
```

---

## NotebookLM

### Configuración

| Campo | Valor |
|-------|-------|
| Notebook ID | `{notebook-id}` |
| Título | `{nombre-proyecto}` |
| Fuentes | {n} documentos |

### Acceso

⚠️ **Solo el Documentador** tiene acceso al MCP de NotebookLM.

Para consultar información del proyecto:
1. Haz tu pregunta al agente Documentador
2. Él consultará NotebookLM
3. Te responderá con las fuentes relevantes

---

## Project Overview

[Nombre del proyecto] es una solución digital [descripción breve del proyecto].

| Componente | Tecnología |
|------------|------------|
| Frontend | [React / Vue / Next.js / Nuxt / Otro] |
| Backend | [Node.js / Python / Otro] |
| Base de Datos | [PostgreSQL / MySQL / SQLite] |
| ORM | [Prisma / TypeORM / SQLAlchemy] |
| Autenticación | [Better Auth / Auth.js / Otro] |
| Tareas Async | [Inngest / BullMQ / Otro] |
| Testing | [Vitest / Jest / Otro] |
| Linting | [ESLint / Biome / Otro] |

---

## Estructura del Proyecto

```
src/
├── app/                    # Configuración global
├── contexts/               # Módulos de negocio (arquitectura hexagonal)
│   └── {context}/
│       ├── api/            # Controllers, DTOs
│       ├── application/    # Use Cases, Commands, Queries
│       ├── domain/         # Entidades, Interfaces
│       └── infrastructure/ # Prisma, Adaptadores
└── shared/                 # Código compartido
    ├── domain/             # BaseEntity, IRepository
    └── infrastructure/     # Servicios externos
```

---

## Development Commands

```bash
# Desarrollo
pnpm dev                    # Start con hot reload

# Base de datos
npx prisma migrate dev      # Crear migración
npx prisma generate         # Regenerar cliente

# Testing
pnpm test                   # Todos los tests
pnpm test:unit              # Unit tests
pnpm test:e2e               # E2E tests

# Linting
pnpm lint                   # Check
pnpm lint:fix               # Fix
```

---

## Commit & Pull Request Guidelines

Seguir estilo conventional-commit: `<type>[scope]: <description>`

**Types:** `feat`, `fix`, `docs`, `chore`, `perf`, `refactor`, `style`, `test`

**Examples:**
- `feat(users): add user creation endpoint`
- `fix(auth): handle expired session correctly`
- `docs(readme): update installation steps`

---

## Integraciones

### MCP Servers

| Servicio | Propósito | Acceso | Config |
|----------|-----------|--------|--------|
| NotebookLM | Base de conocimiento RAG | 📝 Solo Documentador | [Config](mcp/notebooklm.json) |
| Plane | Gestión de proyectos | En desarrollo | [Config](mcp/plane.json) |
| GitHub | Gestión de código | En desarrollo | [Config](mcp/github.json) |

### APIs Externas

| Servicio | Propósito | Credenciales |
|----------|-----------|--------------|
| [API 1] | [Propósito] | Variables de entorno |
| [API 2] | [Propósito] | Variables de entorno |

---

## Context Requirements

### Obligatorio antes de codificar

1. **Preguntar al Documentador** sobre el contexto del proyecto
2. **Consultar llms.txt** para overview del proyecto
3. **Revisar la Definición del Sistema** en `./docs/01-definicion-sistema.md`

### Para consultar documentación

```bash
# Preguntar directamente al Documentador
@documentador ¿Cuáles son los requisitos del módulo X?
```

---

## Boundaries

### NO hacer

- ❌ Usar NotebookLM directamente (excepto Documentador)
- ❌ Ignorar al Documentador y asumir información
- ❌ Generar arquitecturas monolíticas o sobre-ingeniería
- ❌ Implementar funcionalidades fuera del alcance definido
- ❌ Ignorar los criterios de aceptación en historias de usuario
- ❌ Modificar la estructura de la base de datos sin aprobación

### SIempre hacer

- ✅ Preguntar al Documentador cuando necesites información del proyecto
- ✅ Verificar criterios de aceptación con checkboxes `- [ ]`
- ✅ Usar Mermaid.js para diagramas de arquitectura
- ✅ Documentar decisiones técnicas
- ✅ Mantener consistencia con el estilo existente
- ✅ Escribir tests para nueva funcionalidad

---

## Documentación del Proyecto

| Documento | Descripción |
|-----------|-------------|
| [docs/01-definicion-sistema.md](docs/01-definicion-sistema.md) | Fronteras de dominio, módulos, RBAC |
| [docs/02-diagramas-arquitectura.md](docs/02-diagramas-arquitectura.md) | Diagramas Mermaid |
| [docs/03-esquema-bd.md](docs/03-esquema-bd.md) | Esquema de base de datos |
| [docs/gestion/tracker-semantico.md](docs/gestion/tracker-semantico.md) | Seguimiento de proyecto |
| [docs/gestion/actas/](docs/gestion/actas/) | Actas de reuniones |

---

**Última actualización:** [FECHA]
**Versión:** 1.0.0
