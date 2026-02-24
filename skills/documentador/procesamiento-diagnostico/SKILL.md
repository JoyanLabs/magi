---
name: procesamiento-diagnostico
description: >
  Optimiza el Documento de Diagnóstico a formato Markdown AI-Ready.
  Trigger: Cuando se recibe el diagnóstico del consultor externo.
license: MIT
metadata:
  author: magi-team
  version: "1.0.0"
  scope: [root]
  auto_invoke: "Procesando diagnóstico del cliente"
allowed-tools: Read, Edit, Write, notebooklm_*, question
---

## Propósito

El Diagnóstico es un documento del consultor que analiza la situación actual del cliente. Este skill lo optimiza para:
1. Entender la situación actual del negocio
2. Identificar problemas y oportunidades
3. Conocer el contexto antes de definir el alcance
4. Consultar información del cliente durante el diseño

---

## Cuándo Usar Este Skill

- Cuando el consultor externo proporciona un diagnóstico
- Cuando se actualiza el diagnóstico original
- Cuando se necesita consultar la situación actual del cliente

---

## Pasos de Procesamiento

### 1. Análisis del Diagnóstico

**Identificar:**
- Empresa/Organización
- Sector/Industria
- Tamaño (empleados, sucursales)
- Sistemas actuales (si existen)
- Problemas identificados
- Oportunidades de mejora
- Recomendaciones del consultor

### 2. Extracción de Información

```
| Sección | Información Extraída |
|---------|---------------------|
| Empresa | {Nombre, sector, tamaño} |
| Situación Actual | {Estado de sistemas actuales} |
| Problemas | {Lista de problemas} |
| Oportunidades | {Lista de oportunidades} |
| Recomendaciones | {Lista de recomendaciones} |
```

### 3. Transformación a Markdown

```markdown
---
id: DIAG-{codigo}
title: "Diagnóstico - {nombre-cliente}"
type: diagnostico
version: "1.0.0"
fecha: {fecha-diagnostico}
consultor: {nombre-consultor}
cliente: {nombre-cliente}
estado: {activo|actualizado|obsoleto}
---

# Diagnóstico - {nombre-cliente}

## Información General

| Campo | Valor |
|-------|-------|
| Cliente | {nombre} |
| Sector | {sector} |
| Tamaño | {descripción} |
| Fecha diagnóstico | {fecha} |
| Consultor | {nombre} |
| Versión | {versión} |

## Situación Actual

### Empresa
{Descripción de la empresa, historia, posicionamiento}

### Sistemas Actuales
{Descripción de los sistemas actuales, si existen}

| Sistema | Estado | Observaciones |
|--------|--------|---------------|
| {sis-1} | {actual} | {obs} |
| {sis-2} | {obsoleto} | {obs} |

### Procesos Actuales
{Descripción de los procesos actuales}

## Problemas Identificados

### Problema 1: {Título}
**Descripción:** {Descripción del problema}
**Impacto:** {Alto/Medio/Bajo}
**Urgencia:** {Alta/Media/Baja}

### Problema 2: {Título}
**Descripción:** {Descripción del problema}
**Impacto:** {Alto/Medio/Bajo}
**Urgencia:** {Alta/Media/Baja}

## Oportunidades de Mejora

### Oportunidad 1: {Título}
**Descripción:** {Descripción}
**Beneficio potencial:** {Descripción}

### Oportunidad 2: {Título}
**Descripción:** {Descripción}
**Beneficio potencial:** {Descripción}

## Recomendaciones del Consultor

### Corto Plazo
1. {Recomendación 1}
2. {Recomendación 2}

### Mediano Plazo
1. {Recomendación 1}
2. {Recomendación 2}

### Largo Plazo
1. {Recomendación 1}
2. {Recomendación 2}

## Contexto Adicional

{Información relevante adicional}

---

## Relación con Otros Documentos

| Documento | Relación |
|-----------|----------|
| TDR | {id} |
| Propuesta | {id} |

---

## Metadatos de Control

| Campo | Valor |
|-------|-------|
| Procesado por | Documentador |
| Fecha procesamiento | {fecha-actual} |
```

---

## Ejemplo: Diagnóstico San Ignacio

### Input (Raw)
```
DIAGNÓSTICO - CLÍNICA DENTAL SAN IGNACIO

Cliente: Clínica Dental San Ignacio de Piura
Sector: Salud / Odontología
Tamaño: 3 consultorios, 5 doctores, 2 recepcionistas

Situación Actual:
- Gestión de pacientes en Excel y papel
- Citas por WhatsApp
- Sin historial clínico digital
- Odontograma en papel

Problemas:
1. Alta tasa de ausentismo (30% de citas)
2. Pérdida de información de pacientes
3. Dificultad para generar reportes
4. Tiempo perdido buscando historial

Oportunidades:
1. Digitalización completa
2. Sistema de recordatorios
3. CRM para seguimiento
4. Dashboard de productividad
```

### Output (Markdown optimizado)

```markdown
---
id: DIAG-SANIGNACIO-001
title: "Diagnóstico - Clínica Dental San Ignacio"
type: diagnostico
version: "1.0.0"
fecha: "2025-10-15"
consultor: "Consultora ProInnóvate"
cliente: "Clínica Dental San Ignacio de Piura"
estado: activo
---

# Diagnóstico - Clínica Dental San Ignacio

## Información General

| Campo | Valor |
|-------|-------|
| Cliente | Clínica Dental San Ignacio de Piura |
| Sector | Salud / Odontología |
| Tamaño | 3 consultorios, 5 doctores, 2 recepcionistas |
| Fecha diagnóstico | 2025-10-15 |
| Consultor | Consultora ProInnóvate |
| Versión | 1.0.0 |

## Situación Actual

### Empresa
Clínica dental establecida en Piura con más de 10 años de trayectoria. Cuenta con 3 consultorios fully equipped, atención de 5 doctores especialistas y 2 personas en recepción/administración.

### Sistemas Actuales

| Sistema | Estado | Observaciones |
|--------|--------|---------------|
| Gestión de pacientes | Manual (Excel + papel) | Alta fragmentación |
| Citas/Agenda | WhatsApp | Sin visibilidad de disponibilidad |
| Historial clínico | Papel | Difícil acceso y búsqueda |
| Odontograma | Papel | No estandarizado |
| Facturación | Excel | Manual, propenso a errores |

### Procesos Actuales
- Registro de pacientes: Formato físico, guardado en archivador
- Agendamiento: Por WhatsApp, sin sistema de recordatorios
- Atención: Doctor anota en papel, recepcionista transcribe a Excel
- Seguimiento: No existe, paciente debe llamar para nueva cita
- Reportes: Ninguno automatizado

## Problemas Identificados

### Problema 1: Alta tasa de ausentismo
**Descripción:** El 30% de las citas agendadas no son cumplidas por los pacientes. No hay sistema de recordatorios ni seguimiento.
**Impacto:** Alto
**Urgencia:** Alta

### Problema 2: Pérdida de información
**Descripción:** Los historiales en papel se extravían o dañan. No hay backup.
**Impacto:** Alto
**Urgencia:** Alta

### Problema 3: Dificultad para generar reportes
**Descripción:** Datos dispersos en Excel, difíciles de consolidar.
**Impacto:** Medio
**Urgencia:** Media

### Problema 4: Ineficiencia en búsqueda de historial
**Descripción:** Tiempo significativo buscando expedientes físicos.
**Impacto:** Medio
**Urgencia:** Media

## Oportunidades de Mejora

### Oportunidad 1: Digitalización completa
**Descripción:** Centralizar toda la información en un sistema integrado.
**Beneficio:** Eficiencia operativa, datos seguros, acceso rápido.

### Oportunidad 2: Sistema de recordatorios
**Descripción:** Automatizar envío de recordatorios por WhatsApp/email.
**Beneficio:** Reducir ausentismo estimado en 50%.

### Oportunidad 3: CRM clínico
**Descripción:** Seguimiento automatizado de pacientes post-tratamiento.
**Beneficio:** Mejora en satisfacción y retención de pacientes.

### Oportunidad 4: Dashboard de productividad
**Descripción:** Métricas en tiempo real de atenciones, ingresos, productividad por doctor.
**Beneficio:** Toma de decisiones basada en datos.

## Recomendaciones del Consultor

### Corto Plazo
1. Implementar sistema de gestión de pacientes digital
2. Establecer proceso de agendamiento centralizado

### Mediano Plazo
1. Implementar módulo de CRM para reducir ausentismo
2. Digitalizar odontograma

### Largo Plazo
1. Integración con laboratorios externos
2. Portal de pacientes

---

## Relación con Otros Documentos

| Documento | Relación |
|-----------|----------|
| TDR | TDR-SANIGNACIO-001 |
| Propuesta | PROP-SANIGNACIO-001 |

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
📄 Diagnóstico Procesado: {nombre-cliente}

📊 Resumen:
- Sector: {sector}
- Problemas identificados: {n}
- Oportunidades: {n}
- Recomendaciones: {n}

⚠️ Puntos clave para el Arquitecto:
- Problema principal: {problema}
- Oportunidad principal: {oportunidad}

¿ACCIÓN?
1) Indexar en NotebookLM (solo este documento)
2) Indexar + guardar en repositorio (docs/diagnosticos/)
3) Revisar antes de guardar
4) Cancelar
```

---

## Recursos

- **Template**: Ver [assets/](assets/) para ejemplo completo
- **Skill relacionado**: [optimizacion-md](../optimizacion-md/SKILL.md)
- **Skill relacionado**: [procesamiento-tdr](../procesamiento-tdr/SKILL.md)
- **Skill relacionado**: [procesamiento-propuesta](../procesamiento-propuesta/SKILL.md)
- **Siguiente paso**: [procesamiento-plan-impl](../procesamiento-plan-impl/SKILL.md)
