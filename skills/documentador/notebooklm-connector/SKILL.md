---
name: notebooklm-connector
description: >
  Conector para usar el MCP de NotebookLM de forma segura y eficiente.
  Trigger: Cuando se necesita agregar fuentes, consultar notebooks, o generar contenido.
license: MIT
metadata:
  author: magi-team
  version: "1.0.0"
  scope: [root]
  auto_invoke: "Conectando con NotebookLM"
allowed-tools: notebooklm_*, question
---

## Propósito

Proveer herramientas y patrones para usar el MCP de NotebookLM de forma efectiva.

**NOTA:** Este skill SOLO debe ser cargado por el agente Documentador. Otros agentes deben pedirle al Documentador que realice estas operaciones.

---

## Herramientas del MCP

### Notebooks

```python
# Listar notebooks
notebook_list(max_results=10)

# Crear notebook
notebook_create(title="Nuevo Proyecto")

# Obtener detalles
notebook_get(notebook_id="...")
notebook_describe(notebook_id="...")
```

### Fuentes

```python
# Agregar fuente URL
source_add(
    notebook_id="...",
    source_type="url",
    url="https://...",
    title="Título",
    wait=True
)

# Agregar fuente texto
source_add(
    notebook_id="...",
    source_type="text",
    text="Contenido del documento...",
    title="Título del documento"
)

# Obtener contenido
source_get_content(source_id="...")
source_describe(source_id="...")
```

### Consultas

```python
# Consultar notebook
notebook_query(
    notebook_id="...",
    query="Tu pregunta aquí"
)

# Configurar chat
chat_configure(
    notebook_id="...",
    goal="learning_guide",  # default, learning_guide, custom
    response_length="longer"  # default, longer, shorter
)
```

### Studio (Contenido)

```python
# Crear podcast de audio
studio_create(
    notebook_id="...",
    artifact_type="audio",
    audio_format="deep_dive",
    confirm=True
)

# Crear cuestionario
studio_create(
    notebook_id="...",
    artifact_type="quiz",
    question_count=10,
    difficulty="medium"
)

# Generar mind map
studio_create(
    notebook_id="...",
    artifact_type="mind_map"
)

# Obtener estado
studio_status(notebook_id="...")

# Descargar
download_artifact(
    notebook_id="...",
    artifact_type="audio",
    output_path="./podcast.mp3"
)
```

---

## Mejores Prácticas

### 1. Usar wait=True

```python
# ✅ Correcto - espera procesamiento
source_add(
    notebook_id="...",
    source_type="url",
    url="https://...",
    wait=True
)

# ❌ Incorrecto - puede fallar en consultas inmediatas
source_add(
    notebook_id="...",
    source_type="url",
    url="https://..."
)
```

### 2. Consultar Fuentes Específicas

```python
# ✅ Mejor - especificar contexto
notebook_query(
    notebook_id="...",
    query="¿Cuál es la arquitectura del módulo de pacientes?"
)

# ❌ Muy genérico
notebook_query(
    notebook_id="...",
    query="dime del proyecto"
)
```

### 3. Manejar Rate Limits

- El tier gratuito tiene ~50 consultas/día
- Usar cache local cuando sea posible
- Consultar fuente directamente (`source_get_content`) para evitar queries innecesarias

---

## Proyecto San Ignacio: Notebook Config

| Campo | Valor |
|-------|-------|
| Notebook ID | `cc9fa9cf-bd89-41ca-a676-ecbe198cc7df` |
| Título | SAN IGNACIO |
| Fuentes | 12 documentos |
| Stack | Nuxt 4 + NestJS + PostgreSQL |

---

## Errores Comunes

| Error | Solución |
|-------|----------|
| "Source not ready" | Usar `wait=True` al agregar fuente |
| "Rate limit exceeded" | Esperar 24h o usar tier Pro |
| "Auth expired" | Ejecutar `nlm login` |
| "Notebook not found" | Verificar ID con `notebook_list` |

---

## Recursos

- **MCP Guide**: [docs/MCP_GUIDE.md](references/mcp-guide.md)
- **NotebookLM oficial**: https://notebooklm.google.com
