# MAGI OpenCode Agents

Este repositorio contiene los agentes personalizados para OpenCode:

- **SDD Orchestrator** (Spec-Driven Development) - Orquestador para desarrollo de software basado en especificaciones
- **PM Orchestrator** (Project Management) - Orquestador para gestión de proyectos y documentación

## Requisitos Previos

1. **OpenCode instalado**
   ```bash
   # Instalar OpenCode
   curl -fsSL https://raw.githubusercontent.com/opencode-ai/opencode/refs/heads/main/install | bash
   ```

2. **Engram instalado** (recomendado para persistencia)
   ```bash
   # Instalar Engram
   brew install engram   # macOS
   # oDescarga desde: https://github.com/gentleman-programming/engram
   ```

## Instalación Rápida

### Opción 1: Usar el script instalador

```bash
cd magi
./scripts/install-opencode-agents.sh
```

### Opción 2: Instalación manual

Si prefieres hacer la instalación manualmente:

#### 1. Copiar skills

```bash
# Copiar skills a ~/.opencode/skills/
cp -r .opencode/skills/* ~/.opencode/skills/

# O crear enlaces simbólicos (recomendado para desarrollo)
ln -s $(pwd)/.opencode/skills/* ~/.opencode/skills/
```

#### 2. Copiar comandos

```bash
# Copiar comandos a ~/.config/opencode/commands/
mkdir -p ~/.config/opencode/commands/
cp .opencode/commands/*.md ~/.config/opencode/commands/
```

#### 3. Copiar configuración

```bash
# Copiar configuración de OpenCode
cp .opencode/opencode.json ~/.config/opencode/opencode.json
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
├── .opencode/
│   ├── skills/
│   │   ├── _shared/           # Convenciones compartidas
│   │   ├── sdd-*/            # Skills SDD
│   │   └── pm-*/             # Skills PM
│   ├── commands/
│   │   ├── sdd-*.md          # Comandos SDD
│   │   └── pm-*.md           # Comandos PM
│   └── opencode.json         # Configuración de agentes
│
└── scripts/
    └── install-opencode-agents.sh  # Script de instalación
```

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
