---
name: memoria
description: >
  Sistema de memoria persistente para MAGI Framework. Usa Engram para guardar,
  buscar y recuperar contexto entre sesiones. Trigger: Siempre - memoria es fundamental.
license: MIT
metadata:
  author: magi-team
  version: "1.0.0"
  scope: [root]
  auto_invoke: "Gestionando memoria"
allowed-tools: mem_*
---

## Propósito

Este skill te enseña cómo usar el sistema de memoria persistente de Engram para:
- Guardar decisiones importantes
- Buscar contexto de proyectos previos
- Recuperar información entre sesiones
- Mantener continuidad en proyectos de largo plazo

## Por Qué Usar Memoria

Como agente de MAGI, trabajas en proyectos de largo horizonte donde:
- Los documentos del cliente contienen información crucial
- Las decisiones de arquitectura deben recordarse
- El contexto de reuniones pasadas es relevante
- Las preferencias del cliente deben mantenerse

**La memoria te hace más efectivo** - no tienes que pedir información que ya se ha discutido.

## Las 10 Herramientas de Engram

### 1. mem_save - Guardar Observación

**Uso:** Después de cualquier trabajo significativo, guarda una memoria.

```typescript
mem_save({
  title: "Breve título descriptivo",
  type: "decision|bugfix|pattern|preference|discovery|architecture|requirement",
  content: `
## Qué happened
Descripción de lo que ocurrió.

## Por qué importa
Explicación de la importancia.

## Dónde
Archivos o módulos relacionados.

## Aprendido
Qué aprendimos o qué deberíamos recordar.
  `
})
```

**Cuándo GUARDAR (obligatorio):**
- ✅ Decisiones de arquitectura
- ✅ Convenciones de código adoptadas
- ✅ Bugfixes significativos
- ✅ Preferencias del cliente
- ✅ Descubrimientos importantes
- ✅ Requisitos clarified
- ✅ Cambios en scope

### 2. mem_search - Buscar en Memorias

**Uso:** Antes de empezar trabajo que podría haber sido discutido antes.

```typescript
mem_search({
  query: "palabras clave de búsqueda"
})
```

**Retorna:** Lista de memorias relevantes con IDs.

### 3. mem_timeline - Línea Temporal

**Uso:** Después de una búsqueda, ve el contexto alrededor de una memoria específica.

```typescript
mem_timeline({
  observation_id: "id-obtenido-de-búsqueda"
})
```

### 4. mem_get_observation - Ver Contenido Completo

**Uso:** Obtén el contenido completo de una memoria específica.

```typescript
mem_get_observation({
  id: "id-de-la-memoria"
})
```

### 5. mem_session_summary - Resumen de Sesión

**Uso:** Al final de cada sesión, antes de terminar.

```typescript
mem_session_summary({
  content: `
## Goal
Quéíamos lograr en esta sesión.

## Discoveries
Qué descubrimos o aprendimos.

## Accomplished
Qué completamos.

## Files
Archivos modificados o creados.

## Next
Qué queda por hacer en la próxima sesión.
  `
})
```

### 6. mem_context - Contexto de Sesiones Previas

**Uso:** Al inicio de una nueva sesión, recupera contexto previo.

```typescript
mem_context({
  project: "nombre-del-proyecto"  // opcional
})
```

### 7. mem_session_start - Iniciar Sesión

**Uso:** Al comenzar a trabajar en un proyecto.

```typescript
mem_session_start({
  project: "san-ignacio"  // nombre del proyecto
})
```

### 8. mem_session_end - Finalizar Sesión

**Uso:** Al terminar una sesión (junto con mem_session_summary).

```typescript
mem_session_end({})
```

### 9. mem_save_prompt - Guardar Prompt

**Uso:** Guardar un prompt útil para reuse futuro.

```typescript
mem_save_prompt({
  title: "Título del prompt",
  prompt: "Contenido del prompt a guardar"
})
```

### 10. mem_stats - Estadísticas

**Uso:** Ver estadísticas del sistema de memoria.

```typescript
mem_stats({})
```

## Protocolo de Memoria MAGI

### Inicio de Sesión
```
1. mem_session_start(project="nombre-proyecto")
2. mem_context() → recupera contexto previo
3. Si hay tareas pendientes, revisarlas
```

### Durante la Sesión
```
Después de cada decisión/descubrimiento:
  → mem_save()

Antes de trabajo que podría repetir contexto previo:
  → mem_search()
  → mem_timeline()
  → mem_get_observation()
```

### Fin de Sesión
```
1. mem_session_summary()
2. mem_session_end()
```

## Ejemplos de Uso en MAGI

### Ejemplo 1: Decisión de Arquitectura

```typescript
// Después de discutir la arquitectura con el cliente
mem_save({
  title: "Arquitectura Hexagonal para Backend",
  type: "architecture",
  content: `
## Qué
Se decidió usar arquitectura hexagonal para el backend.

## Por qué
- Separación clara de responsabilidades
- Fácil testing
- Cambio de implementación sin cambiar dominio

## Dónde
Backend en NestJS.

## Aprendido
El cliente prefirió hexagonal sobre DDD por simplicidad.
  `
})
```

### Ejemplo 2: Preferencia del Cliente

```typescript
// Después de una reunión con el cliente
mem_save({
  title: "Odontograma por superficies requerido",
  type: "requirement",
  content: `
## Qué
El cliente requiere odontograma por cada cara de la pieza dental.

## Por qué
Norma técnica de odontología exige detalle por superficies.

## Dónde
Módulo de odontología.

## Aprendido
No basta con odontograma simple, debe ser por superficies.
  `
})
```

### Ejemplo 3: Buscar Contexto

```typescript
// Antes de crear nuevas historias de usuario
mem_search({ query: "odontograma requisitos" })
// Retorna memorias relevantes sobre odontograma
```

## Errores Comunes

| Error | Solución |
|-------|----------|
| Olvidar guardar decisiones | Haz mem_save después de cada decisión |
| No buscar antes de preguntar | Usa mem_search primero |
| No iniciar sesión | Siempre usa mem_session_start al comenzar |
| No resumir sesión | Siempre usa mem_session_summary al terminar |

## Configuración de Proyecto

En MAGI, el proyecto de memoria se detecta automáticamente del directorio actual.
Puedes especificarlo explícitamente en las funciones que lo soportan.

## Recursos

- **Engram Docs:** https://github.com/Gentleman-Programming/engram
- **MCP Tools:** Las 10 herramientas de Engram están disponibles vía MCP
