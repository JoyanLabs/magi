# Roadmap: Implementación de Arquitectura Documental AI-Ready para Proyectos Mipymes Digitales

> Este documento establece los pasos para implementar el sistema de documentación orientado a inteligencia artificial, basado en las plantillas y estructuras definidas en los documentos de contexto de MAGI.

---

## Fase 1: Preparación y Configuración Inicial

### 1.1 Definición del Proyecto Específico

- [ ] **Identificar el proyecto Mipyme Digital** a documentar
- [ ] **Recopilar documentación existente** de Fase 1:
  - Informe de Diagnóstico
  - Plan de Implementación
  - Acta de levantamiento de requerimientos
- [ ] **Extraer información clave:**
  - Código de contrato ProInnóvate
  - Presupuesto asignado
  - Plazo de ejecución
  - Indicadores de éxito

### 1.2 Estructura de Directorios

- [ ] **Crear estructura base del repositorio:**
```
proyecto-mipyme/
├── llms.txt                    # Índice de conocimiento
├── AGENTS.md                   # Configuración de agentes
├── .opencode/
│   └── skills/                 # Habilidades personalizadas
├── docs/
│   ├── 01-definicion-sistema.md
│   ├── 02-diagramas-arquitectura.md
│   ├── 03-esquema-bd.md
│   ├── epicas/
│   │   ├── epica-01-seguridad.md
│   │   ├── epica-02-core.md
│   │   └── epica-03-integraciones.md
│   ├── gestion/
│   │   ├── tracker-semantico.md
│   │   └── actas/
│   └── recursos/
│       ├── glosario.md
│       └── bases-proinnovate.md
└── src/                        # Código fuente
```

### 1.3 Configuración de Herramientas AI

- [ ] **Instalar y configurar OpenCode** o herramienta de agente de codificación
- [ ] **Configurar servidor MCP** (NotebookLM u otro)
- [ ] **Verificar conexión** entre herramientas y repositorio

---

## Fase 2: Documentación Core

### 2.1 Definición del Sistema

- [ ] **Completar plantilla `definicion-sistema.md`:**
  - Sección 1: Justificación y objetivos
  - Sección 2: Fronteras de dominio y módulos
  - Sección 3: Matriz RBAC
  - Sección 4: Integraciones externas
  - Sección 5: Restricciones técnicas
  - Sección 6: Diagramas Mermaid

### 2.2 Documentación de Arquitectura

- [ ] **Crear `02-diagramas-arquitectura.md`:**
  - Topología de infraestructura (Mermaid architecture-beta)
  - Flujos de transacciones principales
  - Diagrama de componentes

- [ ] **Crear `03-esquema-bd.md`:**
  - Definiciones de tablas
  - Índices de rendimiento
  - Políticas de retención

### 2.3 Tracker Semántico

- [ ] **Completar `tracker-semantico.md`:**
  - Metadatos del proyecto
  - Indicadores de éxito ProInnóvate
  - Hitos contractuales
  - Miembros del equipo
  - Registro de sprints

---

## Fase 3: Especificaciones de Épicas

### 3.1 Descomposición de Épicas

- [ ] **Identificar épicas funcionales** del Plan de Implementación
- [ ] **Crear archivo por épica** usando plantilla de historia de usuario
- [ ] **Definir historias de usuario** para cada épica:
  - Narrativa de valor
  - Criterios de aceptación (checkboxes)
  - Casos límite
  - Requerimientos de datos

### 3.2 Historias de Usuario BDD

- [ ] **Escribir cada historia con:**
  - Frontmatter YAML (identificador, prioridad, sprint)
  - Formato "Como, Quiero, Para"
  - Criterios de aceptación verificables (`- [ ]`)
  - Edge cases
  - Modificaciones de esquema de BD

---

## Fase 4: Configuración de Agentes

### 4.1 AGENTS.md

- [ ] **Personalizar plantilla `AGENTS.md`:**
  - Tech stack específico del proyecto
  - Code conventions del equipo
  - Commands disponibles
  - Boundaries y restricciones
  - Agent personas (opcional)

### 4.2 Skills (Habilidades)

- [ ] **Identificar skills necesarias:**
  - Skill para generación de migraciones
  - Skill para testing
  - Skill para sincronización con Plane/GitHub
  - Skill para documentación

- [ ] **Crear archivos `SKILL.md`** en `.opencode/skills/`

### 4.3 Integración MCP

- [ ] **Configurar servidor MCP** para el proyecto
- [ ] **Definir recursos** (documentos como resources)
- [ ] **Definir herramientas** (funciones ejecutables)

---

## Fase 5: Gestión de Proyecto

### 5.1 Proceso de Trabajo

- [ ] **Establecer flujo de trabajo:**
  1. Agent consulta `llms.txt` para discovery
  2. Agent lee `AGENTS.md` para contexto global
  3. Agent carga skills relevantes si necesita
  4. Agent lee documentos específicos de `docs/`
  5. Agent implementa y marca criterios de aceptación

### 5.2 Actas de Sprint

- [ ] **Crear proceso de documentación:**
  - Usar plantilla `acta-sprint-review.md` después de cada sprint
  - Registrar feedback del cliente
  - Crear action items derivados

### 5.3 Actualización de Tracker

- [ ] **Actualizar `tracker-semantico.md`:**
  - Después de cada sprint
  - Con progreso real vs planificado
  - Con blockers y riesgos

---

## Fase 6: Operación y Mejora Continua

### 6.1 Monitoreo

- [ ] **Verificar que agentes usen la documentación**
- [ ] **Medir efectividad:**
  - Tiempo de desarrollo por historia
  - Ciclos de revisión
  - Calidad del código generado

### 6.2 Iteración

- [ ] **Ajustar plantillas** según experiencia
- [ ] **Agregar nuevos skills** según necesidades
- [ ] **Refinar AGENTS.md** con aprendizajes
- [ ] **Actualizar documentación** con decisiones técnicas

---

## Checklist de Implementación

### Antes de Iniciar Codificación

- [ ] `llms.txt` creado y actualizado
- [ ] `AGENTS.md` configurado
- [ ] `01-definicion-sistema.md` completado
- [ ] `tracker-semantico.md` iniciado
- [ ] Server MCP configurado

### Antes de Cada Sprint

- [ ] Épicas descompuestas en historias
- [ ] Historias con criterios de aceptación completos
- [ ] Action items del sprint anterior marcados

### Después de Cada Sprint

- [ ] Acta de sprint review creada
- [ ] Tracker semántico actualizado
- [ ] Criterios de aceptación marcados como completados
- [ ] Nueva documentación integrada

---

## Referencias

- **Documentos de Contexto MAGI:**
  - `context/Arquitectura Documental Orientada a Inteligencia Artificial...`
  - `context/Análisis Técnico de Arquitecturas Multi-Agente...`
  - `context/Estrategia Integral de Arquitectura...`

- **Estándares:**
  - llms.txt: https://llmstxt.org/
  - AGENTS.md: https://agents.md/
  - OpenCode Skills: https://opencode.ai/docs/skills/
  - MCP: https://modelcontextprotocol.io/

- **Plantillas en MAGI/templates:**
  - `llms.txt`
  - `AGENTS.md`
  - `definicion-sistema.md`
  - `historia-usuario-bdd.md`
  - `tracker-semantico.md`
  - `acta-sprint-review.md`

---

**Última actualización:** [Fecha]
**Versión:** 1.0.0
