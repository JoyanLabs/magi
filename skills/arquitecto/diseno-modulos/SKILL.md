---
name: diseno-modulos
description: >
  Diseña los módulos del sistema en detalle.
  Trigger: Cuando se tiene el resumen de alcance y se necesita definir cada módulo.
license: MIT
metadata:
  author: magi-team
  version: "1.0.0"
  scope: [root]
  auto_invoke: "Diseñando módulos del sistema"
allowed-tools: Read, Edit, Write
---

## Propósito

Definir cada módulo del sistema con:
- Descripción detallada
- Funcionalidades
- Casos de uso
- Entidades de datos
- APIs principales

## Cuándo Usar Este Skill

- Después de tener el resumen de alcance
- Antes de crear épicas e historias de usuario

## Pasos

### 1. Obtener Información
Consulta al Documentador sobre:
- Requisitos específicos de cada módulo
- Propuesta comercial (qué se ofreció)
- Diagnóstico (qué problemas resuelve)

### 2. Diseñar Cada Módulo

```markdown
## Módulo {N}: {Nombre}

### Descripción
{Descripción de 2-3 oraciones}

### Funcionalidades Principales

| # | Funcionalidad | Prioridad | Tipo |
|---|---------------|-----------|------|
| 1 | {funcionalidad} | Alta | Core |
| 2 | {funcionalidad} | Alta | Core |
| 3 | {funcionalidad} | Media | Enh |

### Casos de Uso

#### CU-{N}: {Título}
**Actor:** {rol}
**Flujo:**
1. { paso 1}
2. { paso 2}
3. { paso 3}

**Resultado:** {resultado}

### Entidades de Datos

| Entidad | Descripción | Atributos Clave |
|---------|-------------|-----------------|
| {Entidad} | {desc} | {atributos} |

### APIs Principales

| Endpoint | Método | Descripción |
|----------|--------|-------------|
| /api/{recurso} | GET | Listar {recurso} |
| /api/{recurso} | POST | Crear {recurso} |
| /api/{recurso}/{id} | PUT | Actualizar {recurso} |
| /api/{recurso}/{id} | DELETE | Eliminar {recurso} |

### Permisos por Rol

| Rol | Acceso |
|-----|--------|
| Admin | Completo |
| Doctor | Ver, crear, editar |
| Recepción | Ver, crear |

### Notas Técnicas
{Notas relevantes}
```

## Ejemplo: Módulo Pacientes

```markdown
## Módulo 3: Pacientes

### Descripción
Módulo central del sistema que gestiona el registro de pacientes, su historia clínica y el odontograma digital interactivo. Es el módulo más crítico del sistema.

### Funcionalidades Principales

| # | Funcionalidad | Prioridad | Tipo |
|---|---------------|-----------|------|
| 1 | Registro de pacientes | Alta | Core |
| 2 | Ficha de paciente | Alta | Core |
| 3 | Odontograma interactivo | Alta | Core |
| 4 | Historia clínica | Alta | Core |
| 5 | Visor de archivos | Media | Core |
| 6 | Búsqueda y filtros | Alta | Core |

### Casos de Uso

#### CU-001: Registrar Paciente
**Actor:** Recepción
**Flujo:**
1. Recepción abre formulario de registro
2. Ingresa datos filiatorios
3. Sistema valida datos obligatorios
4. Sistema crea paciente
5. Sistema muestra ficha del paciente

**Resultado:** Paciente registrado con ID único

#### CU-002: Registrar Odontograma
**Actor:** Doctor
**Flujo:**
1. Doctor selecciona paciente
2. Doctor hace clic en pieza dental
3. Sistema muestra caras seleccionables
4. Doctor selecciona cara y aplica hallazgo
5. Sistema guarda y actualiza visualización

**Resultado:** Odontograma actualizado

### Entidades de Datos

| Entidad | Descripción | Atributos Clave |
|---------|-------------|-----------------|
| Patient | Datos del paciente | dni, nombre, apellido, telefono, email |
| PatientRecord | Historia clínica | patient_id, fecha, motivo, diagnostico |
| Odontogram | Estado dental | patient_id, fecha, tipo (adulto/infantil) |
| ToothSurface | Superficie dental | odontogram_id, tooth_number, surface, condition |
| File | Archivos del paciente | patient_id, tipo, url, nombre |

### APIs Principales

| Endpoint | Método | Descripción |
|----------|--------|-------------|
| /api/patients | GET | Listar pacientes |
| /api/patients | POST | Crear paciente |
| /api/patients/:id | GET | Ver paciente |
| /api/patients/:id | PUT | Actualizar paciente |
| /api/patients/:id/odontogram | GET | Obtener odontograma |
| /api/patients/:id/odontogram | POST | Actualizar odontograma |

### Permisos por Rol

| Rol | Acceso |
|-----|--------|
| Admin | Completo |
| Doctor | Ver todos, crear/editar sus pacientes |
| Recepción | Ver datos filiatorios, crear pacientes |

### Notas Técnicas
- Odontograma usa SVG interactivo con zonas clicables
- Cada pieza tiene 5 superficies + raíz
- Colores: rojo = diagnóstico, azul = tratamiento realizado
```

## Siguiente Paso

Después de diseñar módulos, usar:
- `planificacion-sprints` para organizar el roadmap
- `creacion-epicas` para crear épicas por módulo
