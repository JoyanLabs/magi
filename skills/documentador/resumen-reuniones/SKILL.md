---
name: resumen-reuniones
description: >
  Resume transcripciones de reuniones a formato Markdown AI-Ready.
  Trigger: Procesando transcripción de reunión.
license: MIT
metadata:
  author: magi-team
  version: "2.0.0"
  scope: [root]
  auto_invoke: "Procesando transcripción de reunión"
allowed-tools: Read, Edit, Write, notebooklm_*, question
---

## Propósito

Resume reuniones a Markdown AI-Ready:
1. Extraer puntos clave y decisiones
2. Detectar cambios de alcance
3. Extraer acciones asignadas

---

## Human in the Loop (OBLIGATORIO)

**ANTES de generar el documento, preguntar al usuario:**

```
📋 DATOS DE LA REUNIÓN:

1) Número de reunión: [01, 02, 03...]
2) Fecha de la reunión: [YYYY-MM-DD]
3) Tipo de reunión: [levantamiento|desarrollo|sprint-review|seguimiento]
4) Proyecto: [nombre]
```

**LUEGO mostrar resumen y confirmar:**

```
📝 Resumen generado:
- Tipo: reunion
- Número: {nn}
- Fecha: {fecha}
- Nombre de archivo: {sigla}-reunion{nn}-v1.md

⚠️ Al subir a NotebookLM usar: {sigla}-reunion{nn}-v1

¿ACCIONES?
1) ✅ Confirmar y guardar
2) Indexar en NotebookLM
3) Revisar antes de guardar
4) Cancelar
```

---

## Nomenclatura

| Tipo | Formato | Ejemplo |
|------|---------|---------|
| Levantamiento | `{sigla}-reunion{nn}-v{n}.md` | `saludents-reunion01-v1.md` |
| Sprint Review | `{sigla}-sprint{nn}-review-v{n}.md` | `saludents-sprint01-review-v1.md` |
| Seguimiento | `{sigla}-seguimiento{nn}-v{n}.md` | `saludents-seguimiento01-v1.md` |

---

## Plantilla de Frontmatter

```yaml
---
id: REUN-{SIGLA}-{NUMERO}
title: "Reunión {nn} - {título}"
type: reunion
version: "1.0.0"
fecha: {YYYY-MM-DD}
cliente: {nombre-cliente}
estado: activo
tipo-reunion: {levantamiento|desarrollo|sprint-review|seguimiento}
participantes:
  - nombre: "{nombre}"
    rol: "{rol}"
tags:
  - {tag1}
  - {tag2}
---
```

---

## Estructura del Documento

```markdown
# Reunión {nn}: {título}

## Información General

| Campo | Valor |
|-------|-------|
| Fecha | {fecha} |
| Tipo | {tipo} |
| Proyecto | {nombre} |
| Asistentes | {lista} |

## Resumen

{Resumen de 2-3 oraciones}

## Temas Tratados

### Tema 1: {Título}
**Puntos:** - {punto}

**Conclusión:** {conclusión}

## Decisiones Tomadas

| # | Decisión | Responsable | Estado |
|---|----------|-------------|--------|
| 1 | {decisión} | {responsable} | Pendiente |

## Cambios de Alcance

⚠️ IMPORTANTE: Esta reunión {(incluye|no incluye} cambios de alcance.

### Añadidos
- {elemento} - {justificación}

### Eliminados
- {elemento} - {justificación}

## Acciones

| # | Acción | Responsable | Fecha límite | Estado |
|---|--------|-------------|--------------|--------|
| 1 | {acción} | {responsable} | {fecha} | Pendiente |

---

## Metadatos de Control

| Campo | Valor |
|-------|-------|
| Procesado por | Documentador |
| Fecha procesamiento | {YYYY-MM-DD} |
| Versión | {version} |
```
