---
name: consulta-base-conocimiento
description: >
  Guía para consultar la base de conocimiento de NotebookLM a través del Documentador.
  Trigger: Cuando necesitas información del proyecto y debes consultarla en NotebookLM.
license: MIT
metadata:
  author: magi-team
  version: "1.0.0"
  scope: [root]
  auto_invoke: "Consultando base de conocimiento"
allowed-tools: Read, question
---

## Propósito

Este skill te enseña cómo obtener información del proyecto usando el Documentador como puente hacia NotebookLM.

## Por Qué No Consultas Directamente

NotebookLM tiene un MCP con 29 herramientas que consume mucho contexto. Para mantener el sistema eficiente:
- **Solo el Documentador** tiene acceso al MCP de NotebookLM
- **Tú consultas** a través del Documentador

## Cómo Hacer Consultas

### 1. Formular la Pregunta

Sé específico en tu pregunta:

```markdown
@documentador Consulta en NotebookLM: "¿Cuáles son los requisitos del módulo de pacientes?"
```

### 2. Tipos de Consultas

| Tipo | Ejemplo |
|------|---------|
| Requisitos | "¿Cuáles son los requisitos funcionales del módulo X?" |
| Arquitectura | "¿Cuál es la arquitectura del sistema?" |
| Alcance | "¿Qué módulos están incluidos en el alcance?" |
| Historial | "¿Qué se decidió en la reunión sobre X?" |
| Técnicos | "¿Qué tecnologías se propusieron?" |

### 3. Después de la Consulta

Una vez que el Documentador te responde:
1. Usa esa información para tu análisis
2. Si necesitas más info, haz otra pregunta específica
3. No asumas información que no te hayan confirmado

## Ejemplo de Conversación

**Tu pregunta al Documentador:**
```
@documentador Necesito información para definir el alcance del módulo de odontología. ¿Qué dice el TDR sobre el odontograma? ¿Qué propuso la propuesta comercial? ¿Qué se discutió en las reuniones?
```

**El Documentador responde:**
(Te proporciona la información de NotebookLM)

**Tú:**
Gracias. Ahora tengo contexto suficiente para diseñar el módulo.

## Cuándo Consultar

| Situación | Cuándo Consultar |
|-----------|-----------------|
| Definir módulos | Antes de crear documento de módulos |
| Planificar sprints | Después de tener módulos definidos |
| Crear épicas | Después de tener el diseño de módulos |
| Crear HU | Después de tener las épicas |
| Tomar decisiones técnicas | Cuando necesites información del proyecto |

## No Hacer

- ❌ Asumir información sin consultar
- ❌ Responder preguntas sobre el proyecto sin consultar
- ❌ Crear documentos sin verificar la información

## Sí Hacer

- ✅ Consultar al Documentador para cualquier info del proyecto
- ✅ Verificar información antes de tomar decisiones
- ✅ Ser específico en las preguntas
- ✅ Iterar las preguntas si necesitas más detalle

## Recursos

- **NotebookLM info**: El proyecto tiene un notebook en NotebookLM con todos los documentos
- **Documentador**: El único agente que puede consultar NotebookLM
