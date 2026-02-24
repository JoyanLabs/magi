---
name: consultas
description: >
  Patrones para responder consultas de otros agentes sobre documentación del proyecto.
  Trigger: Cuando otro agente pregunta sobre el proyecto, requisitos, arquitectura, o estado.
license: MIT
metadata:
  author: magi-team
  version: "1.0.0"
  scope: [root]
  auto_invoke: "Respondiendo consultas de otros agentes"
allowed-tools: notebooklm_*, question
---

## Propósito

Estandarizar cómo el Documentador responde preguntas de otros agentes, asegurando respuestas contextualizadas y verificables.

---

## REGLA CRÍTICA: Consultar Documentos Optimizados Primero

⚠️ **Antes de responder cualquier consulta, DEBES seguir este orden:**

### Prioridad de Fuentes

| Prioridad | Tipo | Descripción |
|-----------|------|-------------|
| 1️⃣ | **Optimizados (.md)** | Documentos generados por agentes con sufijo `-v1.md`, `-aprobada-v1.md` |
| 2️⃣ | Backlogs/Sprints | Product Backlog, Sprint Backlog, Planning |
| 3️⃣ | Resumen Ejecutivo | Síntesis del proyecto |
| 4️⃣ | Originales (v0) | PDFs del cliente - solo como referencia si no hay optimizado |

### Si No Existe Documento Optimizado

```
❌ Documento optimizado no encontrado para: {tipo}

| Tipo | ¿Existe optimizado? | Original disponible |
|------|---------------------|-------------------|
| Propuesta | ❌ No | ✅ {nombre-v0.pdf} |

⚠️ ACCIÓN REQUERIDA:
Antes de responder, el documento debe ser optimizado.
- @documentador "Optimiza el documento de {tipo}"

¿Deseas que lo optimice ahora?
1) ✅ Sí, optimizar {tipo}
2) ⏭️ Consultar original de todos modos (no recomendado)
3) ❌ Cancelar consulta
```

### Si Existe Optimizado

```
✅ Documento optimizado encontrado: {nombre-optimizado-v1.md}

Respondiendo desde documento optimizado...
```

---

## Flujo de Respuesta

```
1. Recibir pregunta
2. Identificar tipo de consulta
3. Verificar si existe documento optimizado
   - SI → Consultar optimizado
   - NO → Solicitar optimización
4. Formatear respuesta
5. Incluir fuentes
6. Confirmar comprensión
```

---

## Tipos de Consulta

### Arquitectura y Patrones

**Preguntas típicas:**
- "¿Cuál es la arquitectura del sistema?"
- "¿Qué patrón se usa para X?"
- "¿Cómo está estructurado el proyecto?"

**Respuesta:**
```markdown
## Arquitectura del Sistema

Según la documentación en NotebookLM:

### Stack Tecnológico
- Frontend: Nuxt 4
- Backend: NestJS
- DB: PostgreSQL

### Patrón Arquitectura
- Hexagonal (Ports & Adapters)
- Capas: API → Application → Domain → Infrastructure

**Fuente:** [Plan_Maestro_Sistema_Clinico_v4.md](notebook_id)

¿Necesitas más detalles sobre algún componente específico?
```

---

### Requisitos y Historias de Usuario

**Preguntas típicas:**
- "¿Cuáles son los requisitos del módulo X?"
- "¿Qué criterios de aceptación tiene la HU-Y?"
- "¿Qué hace el módulo Z?"

**Respuesta:**
```markdown
## Módulo de Pacientes

### Requisitos Principales
1. Registro de pacientes con datos filiatorios
2. Odontograma por superficies
3. Historia clínica con evoluciones
4. Visor de imágenes y archivos

### Criterios de Aceptación
- [ ] Formulario de registro completo
- [ ] Validación de campos obligatorios
- [ ] Odontograma interactivo por piezas
- [ ] Carga de archivos (PDF, imágenes)

**Fuente:** [Hoja de Ruta y Arquitectura](notebook_id)

¿Hay algún criterio específico que necesites詳細?
```

---

### Estado del Proyecto

**Preguntas típicas:**
- "¿En qué sprint estamos?"
- "¿Qué módulos están desarrollados?"
- "¿Qué falta por hacer?"

**Respuesta:**
```markdown
## Estado Actual - San Ignacio

### Sprints Completados
- Sprint 0: Diseño y Setup ✅
- Sprint 1: Configuración básica ✅

### Sprint Actual
- Sprint 2: Administración de Horarios y Núcleo de Pacientes
- Fechas: 26 Feb - 11 Mar

### Próximos
- Sprint 3: Pacientes (Visualización) y Recepción

**Fuente:** [Plan Maestro v4](notebook_id)

¿Te interesa algún módulo en particular?
```

---

### Decisiones Técnicas

**Preguntas típicas:**
- "¿Por qué se eligió X?"
- "¿Cuál es la mejor práctica para Y?"

**Respuesta:**
```markdown
## Decisión: Odontograma por Superficies

### Contexto
El cliente (clínica dental) requiere registro detallado por cada cara de la pieza dental.

### Alternativas Consideradas
1. Odontograma simple (por pieza)
2. Odontograma por superficies ✅ (seleccionado)
3. Odontograma 3D

### Criterios de Selección
- Cumplimiento de norma técnica odontológica
- Detalle requerido para historias clínicas
- Facilidad de uso para doctores

**Fuente:** [Norma Técnica del Odontograma](notebook_id)

¿Necesitas más contexto sobre esta decisión?
```

---

### Estado de Documentación (del Proyecto)

**Preguntas típicas del Orquestador:**
- "¿Qué documentos existen en NotebookLM?"
- "¿Cuáles son las fuentes del proyecto?"
- "¿Qué documentos están optimizados?"

**Respuesta:**

```markdown
## 📚 Estado de Documentación - {Proyecto}

### Fuentes en NotebookLM

| # | Documento | Tipo | Estado |
|---|-----------|------|--------|
| 1 | {nombre} | {tipo} | ✅ Optimizado / 📄 Original |

### Documentos Optimizados (Markdown)
- {lista de documentos .md creados}

### Documentos Originales (PDF/Word)
- {lista de documentos raw}

### Total de fuentes: {n}

### Próximos pasos sugeridos:
- {Si faltan docs, indicar cuáles}

❓ ¿Necesitas que optimice algún documento específico?
```

---

## Plantilla de Respuesta Estándar

```markdown
## 📋 Respuesta: [Tema]

**Contexto:** [Breve resumen]

### Puntos Clave
1. [Punto 1]
2. [Punto 2]
3. [Punto 3]

### Detalles
[Información adicional si es necesario]

### Fuentes Consultadas
- [Fuente 1]
- [Fuente 2]

---
❓ ¿Necesitas más información sobre este tema?
   - Profundizar en: [tema 1]
   - Ver código/ejemplos: [tema 2]
   - другой вопрос: [pregunta libre]
```

---

## Reglas de Oro

1. **SIEMPRE citar fuentes** - Indicar qué documento se consultó
2. **Verificar información** - No asumir, consultar NotebookLM
3. **Ser conciso** - Responder lo pedido, no todo el documento
4. **Ofrecer seguimiento** - Preguntar si necesita más detalle
5. **Confirmar** - "¿Esto responde tu pregunta?"

---

## No Hacer

- ❌ Responder sin consultar fuentes
- ❌ Dar información genérica sin contexto del proyecto
- ❌ Ignorar preguntas sobre alcance (fuera del proyecto)
- ❌承诺 sin verificar en documentación

---

## Recursos

- **Notebook San Ignacio**: `cc9fa9cf-bd89-41ca-a676-ecbe198cc7df`
- **Herramientas de consulta**: Ver [notebooklm-connector](../notebooklm-connector/SKILL.md)
