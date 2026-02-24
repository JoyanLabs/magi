---
name: optimizacion-md
description: >
  Transforma documentos a formato Markdown optimizado para consumo por LLMs.
  Trigger: Cuando se recibe un documento raw que debe convertirse a formato AI-Ready.
license: MIT
metadata:
  author: magi-team
  version: "1.0.0"
  scope: [root]
  auto_invoke: "Optimizando documentos para LLMs"
allowed-tools: Read, Edit, Write
---

## Propósito

Optimizar documentos de cualquier formato (PDF, Word, texto) a Markdown estructurado y AI-Ready.

---

## Cuándo Usar Este Skill

- Documentos recibidos en formato PDF
- Notas o especificaciones en texto plano
- Requisitos verbales documentados
- Documentos escaneados o con formato inconsistente

---

## Pasos de Optimización

### 1. Análisis del Documento

- Identificar tipo de documento (requisitos, especificación, arquitectura)
- Extraer secciones principales
- Identificar listas, tablas, diagramas

### 2. Transformación a Markdown

```
## Reglas de Transformación

| Original          | Markdown         |
|-------------------|------------------|
| Encabezados       | # ## ###         |
| Listas            | - item           |
| Tablas            | | col | col |     |
| Código            | ```lenguaje      |
| Negrita           | **texto**        |
| Cursiva           | *texto*          |
```

### 3. Agregar Frontmatter

```yaml
---
id: {generar-id-unico}
title: "{título descriptivo}"
type: {spec|requirement|architecture|guide}
priority: {high|medium|low}
sprint: {n o null}
created: {fecha-iso}
version: "1.0.0"
---
```

### 4. Estructurar Contenido

```markdown
## Resumen

{Descripción de 2-3 oraciones}

## Detalles

{Contenido expandido}

## Criterios de Aceptación

- [ ] Criterio verificable 1
- [ ] Criterio verificable 2

## Notas

- Nota relevante 1
- Nota relevante 2
```

---

## Ejemplo: De PDF a MD

### Antes (contenido raw)
```
Módulo de Pacientes - Spec v1

1. El sistema debe permitir registrar pacientes con:
   - Datos filiatorios (nombre, dni, teléfono)
   - Historia clínica
   - Odontograma

2. El odontograma debe mostrar las caras de cada pieza:
   Mesial, Distal, Oclusal, Vestibular, Lingual
```

### Después (Markdown optimizado)

```markdown
---
id: SPEC-PAC-001
title: "Módulo de Pacientes - Registro y Gestión"
type: spec
priority: high
sprint: 2
---

## Resumen

El módulo de pacientes permite el registro completo de pacientes incluyendo datos filiatorios, historia clínica y odontograma interactivo.

## Requisitos Funcionales

### 1. Registro de Pacientes

El sistema debe permitir registrar pacientes con:

- **Datos filiatorios**
  - Nombre completo
  - DNI
  - Teléfono
  - Email

- **Historia clínica**
  - Anamnesis
  - Alergias
  - Antecedentes

### 2. Odontograma

El odontograma debe mostrar las caras de cada pieza dental:

| Cara | Descripción |
|------|-------------|
| Mesial | Superficie frontal |
| Distal | Superficie trasera |
| Oclusal | Superficie de masticación |
| Vestibular | Superficie externa |
| Lingual | Superficie interna |

## Criterios de Aceptación

- [ ] Formulario de registro con todos los campos obligatorios
- [ ] Validación de DNI único
- [ ] Creación automática de ficha de paciente
- [ ] Odontograma con selección de caras

## Notas Técnicas

- Frontend: Nuxt 4 con Pinia
- Backend: NestJS con Prisma
- Entidad: Patient, PatientRecord
```

---

## Human in the Loop

**SIEMPRE** preguntar antes de guardar con el siguiente formato:

```
╔════════════════════════════════════════════════════════════╗
║           📋 RESUMEN DEL DOCUMENTO OPTIMIZADO             ║
╚════════════════════════════════════════════════════════════╝

| Campo | Valor |
|-------|-------|
| Tipo | {optimizacion-general} |
| Título original | {título del doc original} |
| Frontmatter | ✅ Completado |
| Secciones creadas | {lista} |
| Tablas | {n} |
| Diagramas Mermaid | {n} |

📌 PUNTOS CLAVE IDENTIFICADOS:
• {Punto 1 del documento}
• {Punto 2 del documento}
• {Punto 3 del documento}

🔍 PREGUNTAS DE VALIDACIÓN:
1. {Pregunta sobre algún punto que necesite confirmación}
2. {Pregunta sobre datos específicos}

╔════════════════════════════════════════════════════════════╗
║                    ¿ACCIONES?                              ║
╠════════════════════════════════════════════════════════════╣
║ 1) ✅ Confirmar y guardar en repositorio                   ║
║ 2) ✅ Confirmar y guardar en NotebookLM                    ║
║ 3) ✅ Confirmar y guardar en AMBOS                         ║
║ 4) ✏️ Editar/Revisar documento                            ║
║ 5) ❌ Cancelar                                            ║
╚════════════════════════════════════════════════════════════╝
```

### Después de Confirmar

Agregar siempre:

```markdown
---

## Metadatos de Control

| Campo | Valor |
|-------|-------|
| Procesado por | Documentador |
| Fecha procesamiento | {YYYY-MM-DD} |
| Validado por | {humano} |
| Notas de validación | {notas del humano} |
```

---

## Recursos

- **Templates**: Ver [assets/](assets/) para ejemplos
- **Documentos de referencia**: Ver [references/](references/)
