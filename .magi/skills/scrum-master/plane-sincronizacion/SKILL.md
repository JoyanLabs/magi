---
name: plane-sincronizacion
description: >
  Skill para sincronizar sprints y tareas con Plane. Trigger: Cuando necesitas crear sprints o tareas en Plane.
license: MIT
metadata:
  author: magi-team
  version: "1.1.0"
  scope: [scrum_master]
  auto_invoke: "Sincronizando con Plane"
---

# Skill: Sincronización con Plane

## Propósito

Este skill te enseña a sincronizar sprints y tareas con Plane.

## Importante: Features Gratuitos vs Pagados

**✅ PUEDES USAR (Gratis):**
- Projects, Issues (HU), Cycles, Modules
- Story Points (Estimates)
- Labels

**❌ EVITAR (Requieren Pro):**
- Custom Issue Types
- Custom Properties
- Time Tracking

## Plantilla de Historia de Usuario para Plane

Al crear una HU en Plane, USA ESTE FORMATO EXACTO:

```
**Prioridad:** Media
**Estimación:** 2 SP
**Rol:** Doctor/Recepcionista

### Descripción
Como [rol], quiero [funcionalidad] para [beneficio].

### Criterios de Aceptación
- [Criterio 1]
- [Criterio 2]
- [Criterio 3]

### Tareas Técnicas
- [Tarea técnica 1]
- [Tarea técnica 2]
```

**REGLAS OBLIGATORIAS:**
1. **NO repitas el título** en la descripción - El título ya está en el campo "name" de la tarea
2. **Sin líneas vacías** entre viñetas - Escribe `- criterio` directamente, sin saltos de línea extras
3. **Usa encabezados** `###` para secciones (Descripción, Criterios, Tareas)
4. **Máximo 500 caracteres** en descripción
5. **Una línea vacía** solo entre secciones principales (no entre items)

**❌ INCORRECTO:**
```
### Criterios de Aceptación

*

* Criterio 1

*

* Criterio 2

*

```

**✅ CORRECTO:**
```
### Criterios de Aceptación
- Criterio 1
- Criterio 2
```

## Configuración

- **Workspace**: peruintercorp
- **Proyecto**: SANIGNACIO (Project ID: `0c41848b-b17d-4cc8-b7fc-79e59e136eca`)
- **API**: PLANE_API_KEY configurado en MCP

## Flujo: Crear Sprint en Plane

### Paso 1: Listar Cycles Existentes

```python
list_cycles(project_id="0c41848b-b17d-4cc8-b7fc-79e59e136eca")
```

### Paso 2: Crear Nuevo Cycle (Sprint)

```python
create_cycle(
    project_id="0c41848b-b17d-4cc8-b7fc-79e59e136eca",
    name="Sprint 1",
    start_date="2026-02-19",
    end_date="2026-02-25"
)
```

### Paso 3: Listar Issues

```python
plane_list_project_issues(project_id="0c41848b-b17d-4cc8-b7fc-79e59e136eca")
```

### Paso 4: Crear Issue (HU)

```python
plane_create_issue(
    project_id="0c41848b-b17d-4cc8-b7fc-79e59e136eca",
    issue_data={
        "name": "HU-001: Definición de Roles del Sistema",
        "description_html": "<b>3 SP</b> | Alta<br><br>Como Admin quiero definir roles para controlar acceso.<br><br><b>Criterios:</b><br>- Tabla de roles existe<br>- 3 roles definidos",
        "point": 3,
        "priority": {"id": "urgent"},
        "labels": ["Back"]
    }
)
```

**IMPORTANTE:**
- El **nombre** debe tener el formato "HU-001: Título" (NO duplicar el título)
- La **descripción** debe ser concisa (máx 500 caracteres)
- Usar labels para categorizar (Back, Front, UX/UI)

### Paso 5: Agregar al Cycle

```python
plane_add_cycle_issues(
    project_id="0c41848b-b17d-4cc8-b7fc-79e59e136eca",
    cycle_id="<cycle-id>",
    issues=["<issue-id-1>", "<issue-id-2>"]
)
```

## Estados de Work Items

| Estado | Descripción |
|--------|-------------|
| `backlog` | En backlog, sin iniciar |
| `unstarted` | Listo para iniciar |
| `in_progress` | En progreso |
| `completed` | Completado |
| `cancelled` | Cancelado |

## Actualización de Estado

```python
# Cuando starts una tarea
update_work_item(
    id="<work-item-id>",
    state="in_progress"
)

# Cuando completes una tarea
update_work_item(
    id="<work-item-id>",
    state="completed"
)
```

## Ejemplo Completo: Sprint 1

```python
# 1. Crear ciclo
cycle = plane_create_cycle(
    project_id="0c41848b-b17d-4cc8-b7fc-79e59e136eca",
    cycle_data={
        "name": "Sprint 1 (19-25 Feb)",
        "start_date": "2026-02-19",
        "end_date": "2026-02-25"
    }
)
cycle_id = cycle["id"]

# 2. Crear HUs
hu1 = plane_create_issue(
    project_id="0c41848b-b17d-4cc8-b7fc-79e59e136eca",
    issue_data={
        "name": "HU-001: Definir Roles",
        "point": 3
    }
)
hu2 = plane_create_issue(
    project_id="0c41848b-b17d-4cc8-b7fc-79e59e136eca", 
    issue_data={
        "name": "HU-002: Permisos",
        "point": 5
    }
)

# 3. Asignar al sprint
plane_add_cycle_issues(
    project_id="0c41848b-b17d-4cc8-b7fc-79e59e136eca",
    cycle_id=cycle_id,
    issues=[hu1["id"], hu2["id"]]
)
```

## Errores Comunes

| Error | Solución |
|-------|----------|
| Project not found | Verificar que el project_id es correcto |
| Unauthorized | Verificar API key |
| Cycle not found | Usar el ID retornado por create_cycle |

## Integración con Documentos

Después de crear el sprint en Plane:

1. Generar documento de planning
2. Indexar en NotebookLM:
   ```python
   notebooklm_source_add(
       source_type="text",
       text="[contenido del planning]",
       title="Sprint 1 Planning"
   )
   ```
