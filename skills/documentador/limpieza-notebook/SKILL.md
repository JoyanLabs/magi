---
name: limpieza-notebook
description: >
  Mantiene limpio el notebook de NotebookLM: identifica duplicados, elimina fuentes no necesarias.
  Trigger: Cuando se solicita limpiar el notebook, identificar duplicados, o optimizar fuentes.
license: MIT
metadata:
  author: magi-team
  version: "1.0.0"
  scope: [root]
  auto_invoke: "Limpiando notebook de NotebookLM"
allowed-tools: notebooklm_*, question
---

## Propósito

Mantener el notebook limpio y organizado:
1. Identificar documentos duplicados
2. Eliminar fuentes no necesarias (docs originales del cliente)
3. Verificar que los documentos optimizados estén subidos
4. Gestionar el estado de source_ids en el checklist

---

## Cuándo Usar Este Skill

- Cuando el usuario solicita "limpiar notebook"
- Cuando se detectan duplicados
- Cuando se necesita verificar estado de documentos
- Mantenimiento periódico del notebook

---

## Flujo de Limpieza

### Paso 1: Listar Fuentes Actuales

```
notebooklm_notebook_get(notebook_id={notebook_id})
```

Obtener todas las fuentes del notebook.

### Paso 2: Analizar Duplicados

Comparar por:
- Nombre del documento
- Contenido similar (si es ambiguo)

### Paso 3: Presentar Resultados

```
╔════════════════════════════════════════════════════════════╗
║           🔍 ANÁLISIS DEL NOTEBOOK                       ║
╚════════════════════════════════════════════════════════════╝

📊 Estadísticas:
- Total de fuentes: {n}
- Documentos optimizados: {n}
- Posibles duplicados: {n}

📋 Fuentes en Notebook:

| # | Nombre | Tipo | Estado |
|---|--------|------|--------|
| 1 | {nombre} | {optimizado/raw} | ✅/⚠️ |

🔄 Duplicados Detectados:
| Original | Duplicado | Acción sugerida |
|----------|-----------|-----------------|
| {nombre1} | {nombre2} | Eliminar {nombre2} |

❌ Fuentes a Eliminar (no optimizadas):
- {lista de docs que deberían optimizarse}
```

### Paso 4: Confirmar con Usuario

```
¿ACCIONES?
1) ✅ Eliminar duplicados
2) ✅ Eliminar fuentes no optimizadas
3) ✅ Ambos
4) ✏️ Seleccionar manualmente
5) ❌ Cancelar
```

### Paso 5: Ejecutar Limpieza

Para eliminar una fuente:
```
notebooklm_source_delete(
    source_id="{id}",
    confirm=True
)
```

---

## Identificación de Fuentes

### Documentos Optimizados (conservar)
- Nombre con formato: `{proyecto}-{tipo}-v{n}.md`
- Ejemplos: `sanignacio-contrato-v1.md`, `sanignacio-resumen-v1.md`

### Documentos Originales del Cliente (evaluar)
- PDFs, documentos Word
- Especificaciones técnicas raw
- Normativas (referencia, no para trabajo)

### Duplicados (eliminar)
- Mismo documento subido múltiples veces
- Versiones anteriores de un documento

---

## Actualización del Checklist

Después de subir un documento:
1. Obtener el `source_id` retornado por `source_add`
2. Actualizar el archivo `.magi/checklist-documentos.json`:
   ```json
   {
     "id": "resumen-ejecutivo",
     "notebooklm_source_id": "abc123...",
     "fecha_subida": "2026-02-20"
   }
   ```

---

## REGLA: Human in the Loop - SIEMPRE Confirmar

⚠️ **ANTES de eliminar cualquier fuente, DEBES confirmar con el usuario.**

### Flujo de Confirmación

```
⚠️ ACCIÓN DESTRUCTIVA - REQUIERE CONFIRMACIÓN

Vas a eliminar {n} fuente(s):

| # | Nombre | Tipo | ID |
|---|--------|------|-----|
| 1 | {nombre} | {optimizado/original} | {id} |

⚠️ Esta acción NO se puede deshacer.

╔════════════════════════════════════════════════════════════╗
║                 ¿CONFIRMAR ELIMINACIÓN?                  ║
╠════════════════════════════════════════════════════════════╣
║ 1) ✅ Sí, eliminar todas las fuentes listadas           ║
║ 2) ✅ Sí, pero solo algunas (seleccionar)              ║
║ 3) ❌ No, cancelar                                       ║
╚════════════════════════════════════════════════════════════╝
```

**NO eliminar nunca sin confirmación explícita del usuario.**
