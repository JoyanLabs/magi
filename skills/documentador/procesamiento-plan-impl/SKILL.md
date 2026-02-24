---
name: procesamiento-plan-impl
description: >
  Optimiza el Plan de Implementación a formato Markdown AI-Ready.
  Trigger: Cuando se recibe el plan de implementación del consultor o se genera internamente.
license: MIT
metadata:
  author: magi-team
  version: "1.0.0"
  scope: [root]
  auto_invoke: "Procesando plan de implementación"
allowed-tools: Read, Edit, Write, notebooklm_*, question
---

## Propripción

El Plan de Implementación es el documento que define cómo se ejecutará el proyecto. Este skill lo optimiza para:
1. Consultar el roadmap de desarrollo
2. Entender las fases y entregables
3. Identificar hitos y dependencias
4. Planificar sprints basados en este documento

---

## Cuándo Usar Este Skill

- Cuando el consultor proporciona un plan de implementación
- Cuando se actualiza el plan original
- Cuando se necesita consultar el roadmap de desarrollo

---

## Pasos de Procesamiento

### 1. Análisis del Plan de Implementación

**Identificar:**
- Fases del proyecto
- Entregables por fase
- Duración de cada fase
- Hitos principales
- Recursos requeridos
- Dependencias externas

### 2. Extracción de Información

```
| Sección | Información Extraída |
|---------|---------------------|
| Fases | {Lista de fases} |
| Entregables | {Lista de entregables} |
| Duración | {Fechas de inicio/fin} |
| Hitos | {Lista de hitos} |
```

### 3. Transformación a Markdown

```markdown
---
id: PLAN-{codigo}
title: "Plan de Implementación - {nombre-proyecto}"
type: plan-implementacion
version: "1.0.0"
fecha: {fecha-plan}
cliente: {nombre-cliente}
estado: {borrador|aprobado|en-ejecucion|completado}
presupuesto: {monto}
duracion: {duración}
---

# Plan de Implementación - {nombre-proyecto}

## Información General

| Campo | Valor |
|-------|-------|
| Cliente | {nombre} |
| Proyecto | {nombre} |
| Fecha | {fecha} |
| Versión | {versión} |
| Estado | {aprobado} |
| Presupuesto | {monto} |
| Duración | {duración} |

## Resumen Ejecutivo

{Descripción breve del plan}

## Fases del Proyecto

### Fase {N}: {Título de fase}

**Objetivo:** {Descripción del objetivo}

**Duración:** {inicio} - {fin} ({duración})

**Entregables:**
- {Entregable 1}
- {Entregable 2}

**Criterios de Éxito:**
- [ ] {Criterio 1}
- [ ] {Criterio 2}

---

## Hitos Principales

| Hito | Fecha | Entregable | Estado |
|------|-------|------------|--------|
| {hito-1} | {fecha} | {entregable} | {pendiente/en-progreso/completado} |
| {hito-2} | {fecha} | {entregable} | {pendiente} |

## Recursos Asignados

| Rol | Cantidad | Responsabilidad |
|-----|----------|-----------------|
| {rol} | {n} | {responsabilidad} |

## Dependencias

| Dependencia | Tipo | Mitigación |
|-------------|------|------------|
| {dep} | {interna/externa} | {mitigación} |

## Riesgos Identificados

| Riesgo | Impacto | Probabilidad | Mitigación |
|--------|---------|--------------|------------|
| {riesgo} | {alto/medio/bajo} | {alta/media/baja} | {mitigación} |

---

## Relación con Otros Documentos

| Documento | Relación |
|-----------|----------|
| TDR | {id} |
| Propuesta | {id} |
| Diagnóstico | {id} |

---

## Metadatos de Control

| Campo | Valor |
|-------|-------|
| Procesado por | Documentador |
| Fecha procesamiento | {fecha-actual} |
```

---

## Ejemplo: Plan de Implementación San Ignacio

### Input (Raw)
```
PLAN DE IMPLEMENTACIÓN - SISTEMA CLÍNICO SAN IGNACIO

Duración: 6 meses (Febrero - Julio 2026)
Presupuesto: S/. 45,000 + IGV

FASE 1: CONFIGURACIÓN (Semanas 1-2)
- Setup técnicos
- Diseño UI/UX
- Login y roles

FASE 2: NÚCLEO (Semanas 3-6)
- Módulo pacientes
- Odontograma
- Historia clínica

FASE 3: RECEPCIÓN (Semanas 7-10)
- Agenda y citas
- Caja y pagos
- CRM

FASE 4: DASHBOARD (Semanas 11-14)
- Métricas
- Reportes
- Cierre

FASE 5: ESTABILIZACIÓN (Semanas 15-16)
- Testing
- Bug fixing
- Capacitación
- Go-live
```

### Output (Markdown optimizado)

```markdown
---
id: PLAN-SANIGNACIO-001
title: "Plan de Implementación - Sistema Clínico San Ignacio"
type: plan-implementacion
version: "1.0.0"
fecha: "2025-12-05"
cliente: "Clínica Dental San Ignacio de Piura"
estado: aprobado
presupuesto: "S/. 45,000 + IGV"
duracion: "6 meses (Febrero - Julio 2026)"
---

# Plan de Implementación - Sistema Clínico San Ignacio

## Información General

| Campo | Valor |
|-------|-------|
| Cliente | Clínica Dental San Ignacio de Piura |
| Proyecto | Sistema de Gestión Clínica |
| Fecha | 2025-12-05 |
| Versión | 1.0.0 |
| Estado | Aprobado |
| Presupuesto | S/. 45,000 + IGV |
| Duración | 6 meses (Febrero - Julio 2026) |

## Resumen Ejecutivo

Desarrollo de un sistema de gestión clínica odontológica en 5 fases,starting con la configuración técnica y culminando con la estabilización y puesta en producción. El proyecto contempla un equipo de desarrollo de 3 personas y seguimiento semanal con el cliente.

## Fases del Proyecto

### Fase 1: CONFIGURACIÓN (Semanas 1-2)
**Objetivo:** Establecer la base técnica del proyecto y validar el diseño UX con el cliente.

**Duración:** 12 Feb - 25 Feb (2 semanas)

**Entregables:**
- Repositorio frontend configurado (Nuxt 4)
- Repositorio backend configurado (NestJS)
- Base de datos PostgreSQL
- Pipeline CI/CD
- Prototipo de UI/UX
- Diseño de alta fidelidad del Odontograma

**Criterios de Éxito:**
- [ ] Repositorios con CI/CD funcionando
- [ ] Entorno de desarrollo configurado
- [ ] Prototipo aprobado por el cliente
- [ ] Diseño de Odontograma validado

---

### Fase 2: NÚCLEO (Semanas 3-6)
**Objetivo:** Desarrollar los módulos core del sistema: pacientes, odontograma e historia clínica.

**Duración:** 26 Feb - 25 Mar (4 semanas)

**Entregables:**
- Módulo de gestión de pacientes (CRUD completo)
- Odontograma digital interactivo por superficies
- Historia clínica con evoluciones
- Anamnesis y antecedentes

**Criterios de Éxito:**
- [ ] Registro de pacientes funcionando
- [ ] Odontograma permite seleccionar caras
- [ ] Historia clínica guardable
- [ ] Validaciones completas

---

### Fase 3: RECEPCIÓN (Semanas 7-10)
**Objetivo:** Implementar los módulos de atención al cliente y gestión comercial.

**Duración:** 26 Mar - 22 Abr (4 semanas)

**Entregables:**
- Agenda y calendario de citas
- Sistema de agendamiento con validación
- Módulo de caja y pagos
- Pagos parciales y seguimiento de deudas
- Módulo CRM básico (bandejas de trabajo)

**Criterios de Éxito:**
- [ ] Citas agendables desde calendario
- [ ] Caja registra movimientos
- [ ] Pagos parciales funcionando
- [ ] Bandejas de recuperación de ausentismo

---

### Fase 4: DASHBOARD (Semanas 11-14)
**Objetivo:** Desarrollar herramientas de análisis y reporting.

**Duración:** 23 Abr - 20 May (4 semanas)

**Entregables:**
- Dashboard de productividad
- Reportes de ingresos
- Métricas de citas (atendidas vs canceladas)
- Reportes por doctor

**Criterios de Éxito:**
- [ ] Dashboard muestra KPIs principales
- [ ] Reportes exportables
- [ ] Métricas actualizadas en tiempo real

---

### Fase 5: ESTABILIZACIÓN (Semanas 15-16)
**Objetivo:** Asegurar calidad y preparar el go-live.

**Duración:** 21 May - 3 Jun (2 semanas)

**Entregables:**
- Testing completo (QA)
- Corrección de bugs
- Documentación de usuario
- Capacitación al personal
- Despliegue a producción
- Período de soporte post-lanzamiento

**Criterios de Éxito:**
- [ ] Tests de aceptación superados
- [ ] Zero bugs críticos
- [ ] Personal capacitado
- [ ] Sistema en producción

---

## Hitos Principales

| Hito | Fecha | Entregable | Estado |
|------|-------|------------|--------|
| Hito 1: Setup Completo | 25 Feb | Repositorios, CI/CD, Diseño aprobado | Pendiente |
| Hito 2: Núcleo Completo | 25 Mar | Pacientes, Odontograma, HC | Pendiente |
| Hito 3: Recepción Completo | 22 Abr | Agenda, Caja, CRM | Pendiente |
| Hito 4: Dashboard Completo | 20 May | Métricas, Reportes | Pendiente |
| Hito 5: Go-Live | 3 Jun | Sistema en producción | Pendiente |

## Recursos Asignados

| Rol | Cantidad | Responsabilidad |
|-----|----------|-----------------|
| Tech Lead | 1 | Arquitectura, code review |
| Backend Dev | 1 | API, Base de datos |
| Frontend Dev | 1 | UI, Componentes |

## Dependencias

| Dependencia | Tipo | Mitigación |
|-------------|------|------------|
| Acceso a infraestructura del cliente | Externa | Coordinar con IT del cliente |
| Aprobaciones de diseño | Externa | Buffer de tiempo incluido |
| Disponibilidad del cliente para UAT | Externa | Scheduling anticipado |

## Riesgos Identificados

| Riesgo | Impacto | Probabilidad | Mitigación |
|--------|---------|--------------|------------|
| Cambios de alcance | Alto | Alta | Validar scope en cada fase |
| Indisponibilidad del cliente | Medio | Media | Buffer en cronograma |
| Complejidad Odontograma | Alto | Media | Prototipo ран validado en Fase 1 |

---

## Relación con Otros Documentos

| Documento | Relación |
|-----------|----------|
| TDR | TDR-SANIGNACIO-001 |
| Propuesta | PROP-SANIGNACIO-001 |
| Diagnóstico | DIAG-SANIGNACIO-001 |

---

## Metadatos de Control

| Campo | Valor |
|-------|-------|
| Procesado por | Documentador |
| Fecha procesamiento | 2026-02-19 |
```

---

## Human in the Loop

**SIEMPRE** preguntar antes de indexar:

```markdown
📄 Plan de Implementación Procesado: {nombre-proyecto}

📊 Resumen:
- Fases: {n}
- Duración: {duración}
- Hitos: {n}
- Estado: {borrador/aprobado/en-ejecucion}

📅 Fases identificadas:
1. {fase-1}: {fechas}
2. {fase-2}: {fechas}
...

¿ACCIÓN?
1) Indexar en NotebookLM (solo este documento)
2) Indexar + guardar en repositorio (docs/plan-implementacion/)
3) Revisar antes de guardar
4) Cancelar
```

---

## Recursos

- **Template**: Ver [assets/](assets/) para ejemplo completo
- **Skill relacionado**: [optimizacion-md](../optimizacion-md/SKILL.md)
- **Skill relacionado**: [procesamiento-tdr](../procesamiento-tdr/SKILL.md)
- **Skill relacionado**: [procesamiento-propuesta](../procesamiento-propuesta/SKILL.md)
- **Skill relacionado**: [procesamiento-diagnostico](../procesamiento-diagnostico/SKILL.md)
- **Siguiente paso**: [resumen-reuniones](../resumen-reuniones/SKILL.md)
