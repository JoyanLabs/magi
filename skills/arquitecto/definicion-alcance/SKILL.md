---
name: definicion-alcance
description: >
  Crea el documento de resumen de alcance del sistema.
  Trigger: Cuando se necesita crear el documento de alcance basado en TDR, Propuesta, Diagnóstico y Plan de Implementación.
license: MIT
metadata:
  author: magi-team
  version: "1.0.0"
  scope: [root]
  auto_invoke: "Definiendo alcance del sistema"
allowed-tools: Read, Edit, Write
---

## Propósito

Crear el documento de resumen de alcance que define:
- Visión del sistema
- Módulos incluidos
- Stack tecnológico
- Alcance general

## Cuándo Usar Este Skill

- Cuando tienes la información del proyecto (TDR, Propuesta, Diagnóstico)
- Cuando necesitas formalizar el alcance antes de diseñar módulos

## Pasos para Definir Alcance

### 1. Obtener Información
Consulta al Documentador sobre:
- TDR del proyecto
- Propuesta comercial
- Diagnóstico del consultor
- Plan de Implementación
- Reuniones relevantes

### 2. Analizar y Sintetizar

Identifica:
- **Objetivos del proyecto** (del TDR)
- **Módulos propuestos** (de la Propuesta)
- **Problemas a resolver** (del Diagnóstico)
- **Cronograma** (del Plan de Implementación)

### 3. Crear el Documento

```markdown
---
id: ALCANCE-{SIGLA}
title: "Alcance - {nombre-proyecto}"
type: alcance
version: "1.0.0"
fecha: {YYYY-MM-DD}
cliente: {nombre-cliente}
estado: borrador
---

# Alcance - {nombre-proyecto}

## Visión del Sistema

{Descripción de 2-3 oraciones sobre qué es el sistema}

## Objetivos

### Objetivo Principal
{Descripción del objetivo principal}

### Objetivos Específicos
1. {Objetivo 1}
2. {Objetivo 2}
3. {Objetivo 3}

## Módulos del Sistema

| Módulo | Descripción | Prioridad | Sprint |
|--------|------------|-----------|--------|
| {mod-1} | {desc} | Alta | 1-2 |
| {mod-2} | {desc} | Alta | 2-3 |
| {mod-3} | {desc} | Media | 4 |

## Stack Tecnológico

| Componente | Tecnología | Justificación |
|------------|------------|---------------|
| Frontend | {tech} | {razón} |
| Backend | {tech} | {razón} |
| Base de Datos | {tech} | {razón} |
| Auth | {tech} | {razón} |
| Otros | {tech} | {razón} |

## Alcance Incluido

### Funcionalidades Core
- {funcionalidad 1}
- {funcionalidad 2}

### Funcionalidades Secundarias
- {funcionalidad 3}

## Alcance Excluido

- {funcionalidad no incluida 1}
- {funcionalidad no incluida 2}

## Cronograma

| Sprint | Fechas | Entregables |
|--------|--------|-------------|
| 0 | {fechas} | Setup, prototipo |
| 1 | {fechas} | Módulo X |
| 2 | {fechas} | Módulo Y |

## Presupuesto

{Monto y condiciones}

## Supuestos

- {supuesto 1}
- {supuesto 2}

## Riesgos Identificados

| Riesgo | Impacto | Mitigación |
|--------|---------|------------|
| {riesgo} | {alto} | {mitigación} |

---

## Metadatos

| Campo | Valor |
|-------|-------|
| Creado por | Arquitecto |
| Fecha | {fecha} |
| Versión | 1.0.0 |
| Estado | Borrador |
```

## Ejemplo: San Ignacio

```markdown
---
id: ALCANCE-SANIGNACIO
title: "Alcance - Sistema de Gestión Clínica San Ignacio"
type: alcance
version: "1.0.0"
fecha: "2026-02-19"
cliente: "Clínica Dental San Ignacio de Piura"
estado: borrador
---

# Alcance - Sistema de Gestión Clínica San Ignacio

## Visión del Sistema

Sistema de gestión clínica odontológica que permite digitalizar los procesos de atención al paciente, desde el registro hasta el seguimiento de tratamientos, con énfasis en reducir el ausentismo mediante un módulo CRM.

## Objetivos

### Objetivo Principal
Desarrollar un sistema de gestión clínica que automatice los procesos de atención y reduzca el 30% de ausentismo actual.

### Objetivos Específicos
1. Digitalizar registro de pacientes y historial clínico
2. Implementar odontograma digital interactivo
3. Gestionar citas y agenda de profesionales
4. Implementar módulo CRM para seguimiento de pacientes

## Módulos del Sistema

| Módulo | Descripción | Prioridad | Sprint |
|--------|------------|-----------|--------|
| Configuración | Usuarios, roles, seguridad | Alta | 1 |
| Pacientes | Registro, historia clínica, odontograma | Alta | 2-3 |
| Recepción | Agenda, citas, caja | Alta | 3-4 |
| CRM | Bandejas, alertas, seguimientos | Alta | 4 |
| Dashboard | Métricas, reportes | Media | 5 |

## Stack Tecnológico

| Componente | Tecnología | Justificación |
|------------|------------|---------------|
| Frontend | Nuxt 4 | SSR, moderno, buena DX |
| Backend | NestJS | Arquitectura modular, TypeScript |
| Base de Datos | PostgreSQL | Robusta, relacional |
| ORM | Prisma | Type-safe, migraciones fáciles |
| Auth | Better Auth | Open source, completo |

## Alcance Incluido

### Funcionalidades Core
- Registro completo de pacientes
- Odontograma digital por superficies
- Agenda y gestión de citas
- Historia clínica con evoluciones
- Dashboard de productividad

### Funcionalidades CRM
- Bandejas de seguimiento
- Triggers automáticos
- Alertas de ausentismo
- Registro de gestión de pacientes

## Alcance Excluido

- App móvil para pacientes
- Integración con sistemas de seguros
- Teleconsulta

## Cronograma

| Sprint | Fechas | Entregables |
|--------|--------|-------------|
| 0 | 12-18 Feb | Setup, prototipo, diseño Odontograma |
| 1 | 19-25 Feb | Configuración, usuarios |
| 2 | 26 Feb - 11 Mar | Pacientes, Odontograma |
| 3 | 12-25 Mar | Recepción, agenda, caja |
| 4 | 26 Mar - 8 Abr | CRM, roles, triggers |
| 5 | 9-22 Abr | Dashboard, cierre |

## Presupuesto

S/. 45,000 + IGV (según contrato)

## Supuestos

- Cliente provee acceso a infraestructura
- Reuniones de validación en max 5 días hábiles
- No hay cambios de alcance sin adicionales

---

## Metadatos

| Campo | Valor |
|-------|-------|
| Creado por | Arquitecto |
| Fecha | 2026-02-19 |
| Versión | 1.0.0 |
| Estado | Borrador |
```

## Siguiente Paso

Después de crear el resumen de alcance, usar el skill `diseno-modulos` para definir cada módulo en detalle.
