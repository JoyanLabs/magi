---
name: procesamiento-tdr
description: >
  Optimiza el TDR (Términos de Referencia) del cliente a formato Markdown AI-Ready.
  Trigger: Cuando se recibe un nuevo TDR que debe procesarse para la base de conocimiento.
license: MIT
metadata:
  author: magi-team
  version: "1.0.0"
  scope: [root]
  auto_invoke: "Procesando TDR del cliente"
allowed-tools: Read, Edit, Write, notebooklm_*, question
---

## Propósito

El TDR (Términos de Referencia) es el documento base que define los requisitos del cliente. Este skill optimiza el TDR para que:
1. Sea consultable en NotebookLM
2. El Arquitecto pueda entender el alcance inicial
3. Se mantenga un registro de los requisitos originales

---

## Cuándo Usar Este Skill

- Cuando el cliente proporciona un nuevo TDR
- Cuando se actualiza el TDR original
- Cuando se necesita consultar los requisitos originales del cliente

---

## Pasos de Procesamiento

### 1. Análisis del TDR

**Identificar:**
- Nombre del proyecto
- Objetivos del proyecto
- Requisitos funcionales (lista)
- Requisitos no funcionales
- Alcance definido
- Restricciones mencionadas
- Plazos indicados
- Presupuesto (si aplica)

### 2. Extracción de Información

```
| Sección | Información Extraída |
|---------|---------------------|
| Nombre | [Nombre del proyecto] |
| Objetivos | [Lista de objetivos] |
| Requisitos | [Lista de requisitos] |
| Alcance | [Descripción del alcance] |
| Restricciones | [Lista de restricciones] |
| Plazos | [Fechas/Duración] |
```

### 3. Transformación a Markdown

```markdown
---
id: TDR-{codigo}
title: "Términos de Referencia - {nombre-proyecto}"
type: tdr
version: "1.0.0"
fecha: {fecha-documento}
cliente: {nombre-cliente}
estado: {activo|actualizado|obsoleto}
---

# Términos de Referencia - {nombre-proyecto}

## Información General

| Campo | Valor |
|-------|-------|
| Cliente | {nombre} |
| Proyecto | {nombre} |
| Fecha | {fecha} |
| Versión | {versión} |
| Estado | {activo} |

## Objetivos del Proyecto

### Objetivo Principal
{Descripción del objetivo principal}

### Objetivos Específicos
1. {Objetivo 1}
2. {Objetivo 2}
3. {Objetivo 3}

## Alcance

### Incluye
- {Elemento 1}
- {Elemento 2}

### Excluye
- {Elemento 1}
- {Elemento 2}

## Requisitos Funcionales

### RF-001: {Título}
**Descripción:** {Descripción detallada}
**Prioridad:** {Alta|Media|Baja}

### RF-002: {Título}
**Descripción:** {Descripción detallada}
**Prioridad:** {Alta|Media|Baja}

## Requisitos No Funcionales

| Requisito | Descripción | Prioridad |
|-----------|-------------|-----------|
| RNF-001 | {Descripción} | {Alta} |
| RNF-002 | {Descripción} | {Media} |

## Restricciones

- {Restricción 1}
- {Restricción 2}

## Plazos

- Inicio: {fecha}
- Fin: {fecha}
- Duración: {duración}

## Presupuesto

- Asignado: {moneda} {monto}
- Estado: {confirmado|pendiente}

---

## Notas

{Notas adicionales relevantes}

---

## Metadatos de Control

| Campo | Valor |
|-------|-------|
| Procesado por | Documentador |
| Fecha procesamiento | {fecha-actual} |
| Versión original | {n} |
| Cambios desde versión anterior | {descripción} |
```

---

## Ejemplo: TDR San Ignacio

### Input (Raw)
```
CONTRATO 0025-119 - San Ignacio
Cliente: Clínica Dental San Ignacio de Piura
Objeto: Sistema de gestión clínica odontológica

Requisitos:
1. Registro de pacientes
2. Odontograma digital
3. Gestión de citas
4. Historia clínica
5. Reporting

Presupuesto: S/. 45,000
Plazo: 6 meses
```

### Output (Markdown optimizado)

```markdown
---
id: TDR-SANIGNACIO-001
title: "TDR - Sistema de Gestión Clínica Odontológica"
type: tdr
version: "1.0.0"
fecha: "2025-01-15"
cliente: "Clínica Dental San Ignacio de Piura"
estado: activo
---

# Términos de Referencia - Sistema de Gestión Clínica Odontológica

## Información General

| Campo | Valor |
|-------|-------|
| Cliente | Clínica Dental San Ignacio de Piura |
| Proyecto | Sistema de Gestión Clínica |
| Fecha | 2025-01-15 |
| Versión | 1.0.0 |
| Estado | Activo |

## Objetivos del Proyecto

### Objetivo Principal
Desarrollar un sistema de gestión clínica odontológica que permita automatizar los procesos de atención al paciente, desde el registro hasta el seguimiento de tratamientos.

### Objetivos Específicos
1. Digitalizar el registro de pacientes y su historial clínico
2. Implementar un odontograma digital interactivo
3. Gestionar citas y agenda de profesionales
4. Generar reportes de productividad y facturación

## Alcance

### Incluye
- Módulo de pacientes (registro, historia clínica)
- Odontograma digital por superficies
- Gestión de citas y agenda
- Módulo de facturación
- Dashboard de indicadores

### Excluye
- Integración con sistemas externos de seguros
- App móvil para pacientes
- Teleconsulta

## Requisitos Funcionales

### RF-001: Registro de Pacientes
**Descripción:** El sistema debe permitir registrar pacientes con datos filiatorios completos, antecedentes médicos y contacto de emergencia.
**Prioridad:** Alta

### RF-002: Odontograma Digital
**Descripción:** El sistema debe permitir registrar el estado dental por cada superficie (mesial, distal, oclusal, vestibular, lingual).
**Prioridad:** Alta

### RF-003: Gestión de Citas
**Descripción:** El sistema debe permitir agendar, reprogramar y cancelar citas con validación de disponibilidad.
**Prioridad:** Alta

### RF-004: Historia Clínica
**Descripción:** El sistema debe permitir registrar evoluciones clínicas con registro de tratamientos realizados.
**Prioridad:** Alta

### RF-005: Reporting
**Descripción:** El sistema debe generar reportes de productividad, ingresos y citas atendidas.
**Prioridad:** Media

## Requisitos No Funcionales

| Requisito | Descripción | Prioridad |
|-----------|-------------|-----------|
| RNF-001 | Tiempo de respuesta menor a 2 segundos | Alta |
| RNF-002 | Disponibilidad 99.5% en horario laboral | Alta |
| RNF-003 | Backups diarios automáticos | Alta |
| RNF-004 | Interfaz en español | Alta |

## Restricciones

- Presupuesto fijo establecido en contrato
- Plazo no negociable de 6 meses
- Tecnología preferida: stack moderno (a definir)

## Plazos

- Inicio: Febrero 2026
- Fin: Julio 2026
- Duración: 6 meses

## Presupuesto

- Asignado: S/. 45,000
- Estado: Confirmado en contrato

---

## Metadatos de Control

| Campo | Valor |
|-------|-------|
| Procesado por | Documentador |
| Fecha procesamiento | 2026-02-19 |
| Versión original | 1 |
| Cambios desde versión anterior | N/A (primera versión) |
```

---

## Human in the Loop

**SIEMPRE** preguntar antes de indexar:

```markdown
📄 TDR Procesado: {nombre-proyecto}

📊 Resumen:
- Objetivos: {n}
- Requisitos funcionales: {n}
- Requisitos no funcionales: {n}
- Alcance incluye: {n} elementos
- Presupuesto: {monto}
- Plazo: {duración}

¿ACCIÓN?
1) Indexar en NotebookLM (solo este documento)
2) Indexar + guardar en repositorio (docs/tdr/)
3) Revisar antes de guardar
4) Cancelar
```

---

## Recursos

- **Template**: Ver [assets/](assets/) para ejemplo completo
- **Skill relacionado**: [optimizacion-md](../optimizacion-md/SKILL.md)
- **Siguiente paso**: [procesamiento-propuesta](../procesamiento-propuesta/SKILL.md)
