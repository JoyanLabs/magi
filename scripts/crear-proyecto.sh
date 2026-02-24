#!/bin/bash

# Script para crear estructura inicial de proyecto en MAGI
# Uso: ./crear-proyecto.sh <nombre-proyecto>
# Ejemplo: ./crear-proyecto.sh saludents
#
# Este script crea un proyecto que USARA los skills de MAGI via links simbólicos
# Los skills NO se copian - se mantienen centralizados en magi/skills/

if [ -z "$1" ]; then
    echo "Error: Falta el nombre del proyecto"
    echo "Uso: $0 <nombre-proyecto>"
    echo "Ejemplo: $0 saludents"
    exit 1
fi

PROYECTO=$1
DIR_BASE=$(dirname "$0")
DIR_MAGI="$DIR_BASE"
DIR_PROYECTO="$DIR_BASE/$PROYECTO"

echo "Creating project structure for: $PROYECTO"

# Verificar que estamos en MAGI (que existen los skills)
if [ ! -d "$DIR_MAGI/skills" ]; then
    echo "Error: No se encontró la carpeta skills/ en $DIR_MAGI"
    echo "Asegúrate de ejecutar este script desde la raíz de MAGI"
    exit 1
fi

# Crear estructura de carpetas
mkdir -p "$DIR_PROYECTO/.magi"
mkdir -p "$DIR_PROYECTO/docs/contractual"
mkdir -p "$DIR_PROYECTO/docs/diagnostico"
mkdir -p "$DIR_PROYECTO/docs/planificacion"
mkdir -p "$DIR_PROYECTO/docs/backlog"
mkdir -p "$DIR_PROYECTO/docs/sprints"
mkdir -p "$DIR_PROYECTO/docs/reuniones"
mkdir -p "$DIR_PROYECTO/.opencode/agents"

# Copiar checklist desde magi
if [ -f "$DIR_MAGI/.magi/checklist-documentos.json" ]; then
    cp "$DIR_MAGI/.magi/checklist-documentos.json" "$DIR_PROYECTO/.magi/checklist-documentos.json"
    echo "✓ Copiado checklist-documentos.json"
fi

# Crear link simbólico a skills de MAGI (NO copiar - usar fuente centralizada)
if [ -L "$DIR_PROYECTO/skills" ]; then
    rm "$DIR_PROYECTO/skills"
fi
if [ -d "$DIR_PROYECTO/skills" ]; then
    mv "$DIR_PROYECTO/skills" "$DIR_PROYECTO/skills.backup.$(date +%s)"
fi
ln -s "$DIR_MAGI/skills" "$DIR_PROYECTO/skills"
echo "✓ Link simbólico: $PROYECTO/skills -> magi/skills/"

# Crear link simbólico a agents de MAGI
if [ -L "$DIR_PROYECTO/.opencode/agents" ]; then
    rm "$DIR_PROYECTO/.opencode/agents"
fi
if [ -d "$DIR_PROYECTO/.opencode/agents" ]; then
    mv "$DIR_PROYECTO/.opencode/agents" "$DIR_PROYECTO/.opencode/agents.backup.$(date +%s)"
fi
ln -s "$DIR_MAGI/.opencode/agents" "$DIR_PROYECTO/.opencode/agents"
echo "✓ Link simbólico: $PROYECTO/.opencode/agents -> magi/.opencode/agents/"

echo ""
echo "Project created: $DIR_PROYECTO"
echo ""
echo "Estructura creada:"
echo "  $PROYECTO/"
echo "  ├── .magi/"
echo "  │   └── checklist-documentos.json"
echo "  ├── docs/"
echo "  │   ├── contractual/"
echo "  │   ├── diagnostico/"
echo "  │   ├── planificacion/"
echo "  │   ├── backlog/"
echo "  │   ├── sprints/"
echo "  │   └── reuniones/"
echo "  ├── skills/ -> magi/skills/ (link simbólico)"
echo "  └── .opencode/agents/ -> magi/.opencode/agents/ (link simbólico)"
echo ""
echo "NOTA: Los cambios en magi/skills/ se reflejarán automáticamente"
echo "      en todos los proyectos que usen links simbólicos."
echo ""
echo "Actualiza manualmente:"
echo "  - notebook_id en .magi/checklist-documentos.json"
echo "  - Nombre del proyecto en el JSON"
