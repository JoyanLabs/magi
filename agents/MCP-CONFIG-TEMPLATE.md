# Configuración MCP por Proyecto - Plantilla

## Resumen

Esta plantilla documenta cómo configurar MCPs específicos por proyecto en opencode.
La configuración global (`~/.config/opencode/opencode.json`) debe mantenerse limpia
con solo los MCPs universales (context7, engram).

## MCPs Globales (en `~/.config/opencode/opencode.json`)

```json
{
  "mcp": {
    "context7": {
      "enabled": true,
      "type": "remote",
      "url": "https://mcp.context7.com/mcp"
    },
    "engram": {
      "command": ["engram", "mcp", "--tools=agent"],
      "enabled": true,
      "type": "local"
    }
  }
}
```

## MCPs por Proyecto

### NotebookLM (Investigación/Documentación)

Para proyectos que necesiten investigación con NotebookLM.

#### Instalación

Instalado con `uv` (Python package manager):

```bash
# Verificar que tenés uv instalado
uv --version

# Instalar notebooklm-mcp-cli
uv pip install notebooklm-mcp-cli

# O si es un tool de uvx
uvx install notebooklm-mcp-cli
```

#### Configuración en opencode

```json
{
  "mcp": {
    "notebooklm": {
      "type": "local",
      "command": ["uvx", "run", "notebooklm-mcp"],
      "enabled": true
    }
  }
}
```

O si está instalado como comando directo:

```json
{
  "mcp": {
    "notebooklm": {
      "type": "local",
      "command": ["notebooklm-mcp"],
      "enabled": true
    }
  }
}
```

**Repositorio**: https://github.com/jacob-bd/notebooklm-mcp-cli

---

### Plane (Gestión de Proyectos)

Plane tiene múltiples métodos de autenticación según tu setup.

#### Opción 1: Remote HTTP con OAuth (Recomendado para Plane Cloud)

Para usuarios de Plane Cloud. Usa autenticación OAuth vía navegador.

**Prerrequisitos**:
- Node.js 22 o superior
- npx (viene con npm)

```json
{
  "mcp": {
    "plane": {
      "type": "local",
      "command": "npx",
      "args": ["mcp-remote@latest", "https://mcp.plane.so/http/mcp"],
      "enabled": true
    }
  }
}
```

**Nota**: La primera vez te va a pedir autenticación en el navegador.

#### Opción 2: Remote HTTP con API Key (Para CI/CD o automatización)

Para workflows automatizados o cuando necesitás autenticación por headers.

```json
{
  "mcp": {
    "plane": {
      "type": "local",
      "command": "npx",
      "args": ["mcp-remote@latest", "https://mcp.plane.so/http/api-key/mcp"],
      "headers": {
        "Authorization": "Bearer ${PLANE_API_KEY}",
        "X-Workspace-slug": "${PLANE_WORKSPACE_SLUG}"
      },
      "enabled": true
    }
  }
}
```

**Variables de entorno requeridas**:
```bash
export PLANE_API_KEY="tu-api-key-de-plane"
export PLANE_WORKSPACE_SLUG="tu-workspace-slug"
```

**Para obtener tu API Key**:
1. Entrá a tu workspace de Plane
2. Settings → API Keys
3. Generar nueva API Key

#### Opción 3: Local Stdio (Para Plane Self-Hosted)

Para instancias self-hosted de Plane.

**Prerrequisitos**:
- Python 3.10 o superior
- uvx (viene con uv)

```json
{
  "mcp": {
    "plane": {
      "type": "local",
      "command": "uvx",
      "args": ["plane-mcp-server", "stdio"],
      "env": {
        "PLANE_API_KEY": "${PLANE_API_KEY}",
        "PLANE_WORKSPACE_SLUG": "${PLANE_WORKSPACE_SLUG}",
        "PLANE_BASE_URL": "https://tu-instancia-plane.com/api"
      },
      "enabled": true
    }
  }
}
```

**Variables de entorno**:

| Variable | Requerida | Descripción |
|----------|-----------|-------------|
| `PLANE_API_KEY` | Sí | Tu API key de Plane |
| `PLANE_WORKSPACE_SLUG` | Sí | El slug de tu workspace |
| `PLANE_BASE_URL` | No | URL de la API (default: https://api.plane.so) |

---

## Troubleshooting

### Plane - Problemas de autenticación OAuth

Si tenés problemas con OAuth, limpiá los tokens guardados:

```bash
rm -rf ~/.mcp-auth
```

### Plane - Timeouts de conexión

1. Verificá tu conexión a internet
2. Revisá si tu firewall/proxy está bloqueando conexiones MCP
3. Verificá que tu instancia de Plane esté accesible

### NotebookLM - No encuentra el comando

Verificá la instalación:

```bash
# Si usaste uvx
which notebooklm-mcp
uvx run notebooklm-mcp --version

# Si lo instalaste con uv
uv pip list | grep notebooklm
```

---

## Estructura Recomendada

```
proyecto/
├── .opencode/
│   ├── opencode.json          # Config específica del proyecto
│   └── opencode.json.example  # Plantilla con variables
└── ...
```

## Configuración Completa de Ejemplo

Archivo `.opencode/opencode.json` con ambos MCPs:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "mcp": {
    "context7": {
      "type": "remote",
      "url": "https://mcp.context7.com/mcp",
      "headers": {
        "CONTEXT7_API_KEY": "${CONTEXT7_API_KEY}"
      },
      "enabled": true
    },
    "engram": {
      "command": ["engram", "mcp"],
      "enabled": true,
      "type": "local"
    },
    "notebooklm": {
      "type": "local",
      "command": ["uvx", "run", "notebooklm-mcp"],
      "enabled": true
    },
    "plane": {
      "type": "local",
      "command": "npx",
      "args": ["mcp-remote@latest", "https://mcp.plane.so/http/mcp"],
      "enabled": true
    }
  }
}
```

---

## Variables de Entorno

Para no exponer API keys en archivos JSON, usá variables de entorno en `~/.bashrc` o `~/.zshrc`:

```bash
# Context7
export CONTEXT7_API_KEY="tu-api-key"

# Plane (si usás API Key)
export PLANE_API_KEY="tu-api-key"
export PLANE_WORKSPACE_SLUG="tu-workspace"

# Plane Self-Hosted (si aplica)
export PLANE_BASE_URL="https://tu-instancia.com/api"
```

---

## Guardado en Memoria (Engram)

**Fecha**: 2026-03-22  
**Topic Key**: `config/opencode/mcp-plane-notebooklm`  

Esta configuración ha sido guardada en Engram para recuperación futura.

---

## Proyectos Actuales con Configuración

- **joyan/magi**: Tiene notebooklm configurado
- **san-ignacio** (dentro de magi): Usa notebooklm vía MAGI Framework

---

## Migración de Configuración Global → Por Proyecto

Si querés mover un MCP de global a por proyecto:

1. Agregarlo al `.opencode/opencode.json` del proyecto
2. Quitarlo de `~/.config/opencode/opencode.json`
3. Reiniciar opencode en el proyecto

---

## Backup de Configuración Anterior

**Fecha**: 2026-03-22  
**Archivo eliminado**: `~/opencode.json`  
**MCPs migrados**:
- notebooklm → Documentado para uso por proyecto (instalado con uv)
- plane → Documentado con múltiples métodos de autenticación
- drawio → Eliminado (no se usa)

---

## Recursos

- **Plane MCP Docs**: https://plane.so/docs/mcp-server
- **Plane MCP GitHub**: https://github.com/makeplane/plane-mcp-server
- **NotebookLM MCP CLI**: https://github.com/jacob-bd/notebooklm-mcp-cli

---

## Notas

- Los MCPs globales están disponibles en TODOS los proyectos
- Los MCPs por proyecto solo funcionan en ese proyecto específico
- Si un MCP está en ambos, el del proyecto tiene prioridad
- Para OAuth, la primera vez siempre requiere autorización en navegador
- Las API keys se obtienen desde Settings → API Keys en tu workspace de Plane
