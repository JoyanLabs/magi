# MAGI OpenCode Agents

Este repositorio contiene los agentes personalizados para OpenCode:

- **SDD Orchestrator** (Spec-Driven Development) - Orquestador para desarrollo de software basado en especificaciones
- **PM Orchestrator** (Project Management) - Orquestador para gestión de proyectos y documentación

## Requisitos Previos

### 1. OpenCode instalado
```bash
# Instalar OpenCode
curl -fsSL https://raw.githubusercontent.com/opencode-ai/opencode/refs/heads/main/install | bash
```

### 2. UV (Gestor de paquetes - NECESARIO)
```bash
# Instalar UV (si no lo tienes)
curl -fsSL https://astral.sh/uv/install.sh | bash

# O con brew
brew install uv
```

### 3. Engram instalado (recomendado para persistencia)
```bash
# Instalar Engram
brew install engram   # macOS
# oDescarga desde: https://github.com/gentleman-programming/engram
```

### 4. NotebookLM MCP (opcional)
```bash
# Instalar notebooklm-mcp-cli con UV
uv tool install notebooklm-mcp-cli

# Autenticar (abre navegador)
nlm login
```

## Instalación

### Paso 1: Clonar el repositorio con submódulos

```bash
# Clonar con submódulos
git clone --recurse-submodules https://github.com/JoyanLabs/magi.git

# O si ya clonaste sin submódulos:
cd magi
git submodule update --init --recursive
```

### Paso 2: Ejecutar el script instalador

```bash
cd magi
./scripts/install-opencode-agents.sh
```

### Paso 3: Configurar API Keys

```bash
# IMPORTANTE: Copiar el archivo de ejemplo (NO usar el json directo con keys)
cp .opencode/opencode.json.example ~/.config/opencode/opencode.json

# Editar y reemplazar YOUR_CONTEXT7_API_KEY con tu key real
# Obtén tu key de: https://context7.com
nano ~/.config/opencode/opencode.json
```

### Paso 4: Reiniciar OpenCode

```bash
opencode
```

## Uso

### SDD Orchestrator

1. Abre OpenCode
2. Selecciona el agente `sdd-orchestrator`
3. Escribe los comandos:

| Comando | Descripción |
|---------|-------------|
| `/sdd-init` | Inicializar contexto SDD en el proyecto |
| `/sdd-new <nombre>` | Crear nueva propuesta de cambio |
| `/sdd-explore <tema>` | Investigar una idea |
| `/sdd-ff <nombre>` | Fast-forward: proposal → specs → design → tasks |
| `/sdd-apply` | Implementar tareas |
| `/sdd-verify` | Verificar implementación |
| `/sdd-archive` | Archivar y cerrar cambio |

### PM Orchestrator

1. Abre OpenCode
2. Selecciona el agente `pm-orchestrator`
3. Escribe los comandos:

| Comando | Descripción |
|---------|-------------|
| `/pm:init` | Inicializar contexto PM |
| `/pm:explore` | Analizar estado del proyecto |
| `/pm:new <actividad>` | Crear propuesta |
| `/pm:spec <actividad>` | Definir estructura del documento |
| `/pm:apply <actividad>` | Generar documento |
| `/pm:verify <documento>` | Verificar documento |
| `/pm:github <sprint>` | Crear issues en GitHub |
| `/pm:discord` | Enviar notificación a Discord |
| `/pm:archive <actividad>` | Archivar documento |
| `/pm:sprint-review` | Procesar sprint review |

## Estructura de Archivos

```
magi/
├── .gitmodules                    # Submódulos del repositorio
├── .opencode/
│   ├── skills/
│   │   ├── _shared/           # Convenciones compartidas
│   │   ├── sdd-*/            # Skills SDD
│   │   └── pm-*/             # Skills PM
│   ├── commands/
│   │   ├── sdd-*.md          # Comandos SDD
│   │   └── pm-*.md           # Comandos PM
│   ├── opencode.json         # Configuración (NO subir a git)
│   └── opencode.json.example # Template con placeholders
│
├── references/
│   ├── agent-teams-lite/    # Submódulo: SDD skills referencia
│   ├── engram/              # Submódulo: Engram
│   └── notebooklm-mcp-cli/  # Submódulo: NotebookLM MCP
│
└── scripts/
    └── install-opencode-agents.sh  # Script de instalación
```

## Referencias de Submódulos

| Repo | URL | Para qué |
|------|-----|----------|
| Engram | https://github.com/gentleman-programming/engram | Memoria persistente |
| notebooklm-mcp-cli | https://github.com/jacob-bd/notebooklm-mcp-cli | NotebookLM MCP |
| agent-teams-lite | https://github.com/Gentleman-Programming/agent-teams-lite | SDD skills referencia |

## Configuración de Artefactos

### Modo Engram (Recomendado)

Los artefactos se guardan en Engram (memoria persistente):
- No ensucia el repositorio
- Persiste entre sesiones
- Recuperable con `mem_search`

### Modo OpenSpec

Los artefactos se guardan como archivos:
- SDD: `openspec/`
- PM: `.magi/`
- Versionado en Git

### Modo None

Sin persistencia:
- Todo se pierde al cerrar la sesión
- Útil para experiments

## Desarrollo

### Actualizar skills

Los skills están en `.opencode/skills/`. Para actualizar:

1. Modifica el archivo `SKILL.md` del skill correspondiente
2. Ejecuta `./scripts/install-opencode-agents.sh` para aplicar cambios

### Agregar nuevos skills

1. Crea la carpeta en `.opencode/skills/<nombre-skill>/`
2. Crea el archivo `SKILL.md` dentro
3. Ejecuta el script de instalación

## Resolución de Problemas

### Los submódulos no se clonan

```bash
# Clonar submódulos manualmente
git submodule update --init --recursive
```

### Los comandos no se detectan

Los comandos se detectan por texto, no aparecen en autocompletado. Escribe el comando completo como:
```
/sdd-init
```

### No se guardan los artefactos

Verifica que Engram esté instalado y funcionando:
```bash
engram --version
```

### Error de permisos

Asegúrate de que las carpetas tengan permisos de escritura:
```bash
chmod -R u+w ~/.opencode/
chmod -R u+w ~/.config/opencode/
```

## Licencia

MIT
