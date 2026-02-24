---
name: resumen-ejecutivo
description: >
  Genera un documento de síntesis que resume todos los documentos del proyecto.
  Este documento sirve como "single source of truth" para consultas rápidas.
  Trigger: Cuando se completan los 5 documentos base (contrato, propuesta, diagnóstico, plan, reuniones).
license: MIT
metadata:
  author: magi-team
  version: "1.0.0"
  scope: [root]
  auto_invoke: "Generando resumen ejecutivo del proyecto"
allowed-tools: Read, Edit, Write, notebooklm_*, question
---

## Propósito

El Resumen Ejecutivo es un documento de **síntesis** que:
1. Consolida la información clave de todos los documentos
2. Serve as "single source of truth" para consultas rápidas
3. Facilita la navegación a documentos específicos
4. Permite entender el proyecto en 5 minutos

---

## Cuándo Usar Este Skill

- Cuando se completan los 5 documentos base
- Cuando el Orquestador lo solicita
- Cuando se necesita una visión rápida del proyecto
- Antes de planificar un sprint (para tener contexto completo)

---

## Requisitos Previos

Antes de generar el resumen, DEBES tener:
- ✅ Contrato optimizado
- ✅ Propuesta optimizada
- ✅ Diagnóstico optimizado
- ✅ Plan de Implementación optimizado
- ✅ Reuniones de Levantamiento optimizadas

Si faltan algunos → Indicar al usuario cuáles faltan.

---

## Pasos para Generar

### 1. Consultar Documentos en NotebookLM

```python
notebooklm_notebook_query(
    notebook_id="{notebook_id}",
    query="-Dame información sobre: empresa, alcance, módulos planificados, stakeholders, fechas clave"
)
```

### 2. Extraer Información Clave

| Sección | Preguntas a NotebookLM |
|---------|----------------------|
| Empresa | ¿Quién es el cliente? ¿En qué sector opera? |
| Alcance | ¿Qué está incluido? ¿Qué está excluido? |
| Módulos | ¿Qué módulos/funcionalidades se van a desarrollar? |
| Stakeholders | ¿Quiénes son los contactos clave? |
| Fechas | ¿Cuáles son las fechas de inicio, hitos, entrega? |
| Problemas | ¿Qué problemas resuelve el proyecto? |
| Objetivos | ¿Cuáles son los objetivos del proyecto? |

### 3. Generar Documento

```
---
id: RESUMEN-{PROYECTO}
title: "Resumen Ejecutivo - {Nombre del Proyecto}"
type: resumen
proyecto: {id-proyecto}
version: "1.0.0"
fecha: {YYYY-MM-DD}
---

# Resumen Ejecutivo - {Nombre del Proyecto}

## 1. Visión del Proyecto

{Descripción en 2-3 oraciones del proyecto y su propósito}

## 2. Información del Cliente

| Campo | Valor |
|-------|-------|
| Cliente | {nombre} |
| Sector | {sector} |
| Tamaño | {descripción} |
| Ubicación | {ciudad, país} |
| Contacto principal | {nombre, cargo} |

## 3. Alcance del Proyecto

### Incluido ✅
- {Funcionalidad 1}
- {Funcionalidad 2}
- {Funcionalidad 3}

### Excluido ❌
- {Funcionalidad 1}
- {Funcionalidad 2}

## 4. Módulos Planificados

| Módulo | Descripción | Prioridad |
|--------|-------------|-----------|
| {mod-1} | {desc} | Alta |
| {mod-2} | {desc} | Media |
| {mod-3} | {desc} | Baja |

## 5. Problemas a Resolver

| # | Problema | Impacto | Solución Propuesta |
|---|----------|---------|-------------------|
| 1 | {prob} | {alto/medio/bajo} | {soluc} |
| 2 | {prob} | {alto/medio/bajo} | {soluc} |

## 6. Fechas Clave

| Milestone | Fecha | Estado |
|-----------|-------|--------|
| Inicio del proyecto | {fecha} | ✅ Completado |
| Diagnóstico | {fecha} | ✅ Completado |
| Plan de Implementación | {fecha} | ✅ Completado |
| Sprint 1 | {fecha} | 🔄 En progreso |
| Sprint 2 | {fecha} | ⏳ Pendiente |
| Entrega Final | {fecha} | ⏳ Pendiente |

## 7. Equipo

| Rol | Nombre | Responsabilidad |
|-----|--------|-----------------|
| Project Manager | {nombre} | {responsabilidad} |
| Desarrollador | {nombre} | {responsabilidad} |
| Consultor | {nombre} | {responsabilidad} |

## 8. Estado de Documentación

| Documento | Estado | Fecha Optimización |
|-----------|--------|-------------------|
| Contrato | ✅ Optimizado | {fecha} |
| Propuesta | ✅ Optimizado | {fecha} |
| Diagnóstico | ✅ Optimizado | {fecha} |
| Plan de Implementación | ✅ Optimizado | {fecha} |
| Reuniones | ✅ Optimizado | {fecha} |

## 9. Notas Importantes

- {Nota 1 sobre decisiones tomadas}
- {Nota 2 sobre dependencias}
- {Nota 3 sobre riesgos identificados}

## 10. Referencias

Para más detalles, consultar:
- [Documento 1](link-o-referencia)
- [Documento 2](link-o-referencia)
- [Documento 3](link-o-referencia)

---

## Metadatos de Control

| Campo | Valor |
|-------|-------|
| Generado por | Documentador |
| Fecha generación | {YYYY-MM-DD} |
| Basado en | {lista de documentos consultacos} |
| Revisado por | {pendiente validación} |
