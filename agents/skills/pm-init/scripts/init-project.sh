#!/bin/bash
#===============================================================================
# PM Init Script - Inicializa la estructura .magi en un proyecto
# 
# Uso: ./init-project.sh [proyecto_id] [proyecto_nombre]
#
# Ejemplo:
#   ./init-project.sh san-ignacio "San Ignacio"
#===============================================================================

set -e

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Función para mostrar ayuda
show_help() {
    echo "Uso: $0 [proyecto_id] [proyecto_nombre]"
    echo ""
    echo "Argumentos:"
    echo "  proyecto_id      ID del proyecto (ej: san-ignacio)"
    echo "  proyecto_nombre  Nombre del proyecto (ej: 'San Ignacio')"
    echo ""
    echo "Ejemplo:"
    echo "  $0 san-ignacio 'San Ignacio'"
    exit 1
}

# Verificar argumentos
if [ -z "$1" ] || [ -z "$2" ]; then
    show_help
fi

PROYECTO_ID="$1"
PROYECTO_NOMBRE="$2"

echo -e "${YELLOW}Inicializando proyecto: ${PROYECTO_NOMBRE} (${PROYECTO_ID})${NC}"

# Crear estructura de directorios
echo -e "${YELLOW}Creando estructura de directorios...${NC}"
mkdir -p .magi/docs/input
mkdir -p .magi/docs/output
mkdir -p .magi/changes/archive

# Crear config.yaml desde template
echo -e "${YELLOW}Creando config.yaml...${NC}"

cat > .magi/config.yaml << EOF
# Configuración del Proyecto - PM Orchestrator
# IMPORTANTE: No subir a GitHub (añadir a .gitignore)

proyecto:
  id: "${PROYECTO_ID}"
  nombre: "${PROYECTO_NOMBRE}"

# Integraciones - Las variables se cargan desde .env
notebooklm:
  notebook_id: "\${NOTEBOOK_ID}"

integraciones:
  github:
    repo: "\${GITHUB_REPO}"
    project_id: "\${GITHUB_PROJECT_ID}"
  discord:
    webhook_url: "\${DISCORD_WEBHOOK}"
    channel: "proyectos-${PROYECTO_ID}"

# Estado del proyecto (se actualiza automáticamente)
estado:
  fase_actual: "inicio"
  ultimo_update: "$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
EOF

# Crear .env.example (template sin valores sensibles)
echo -e "${YELLOW}Creando .env.example...${NC}"

cat > .magi/.env.example << EOF
# Configuración del Proyecto
# Copia este archivo a .env y completa los valores

PROYECTO_ID=${PROYECTO_ID}
PROYECTO_NOMBRE=${PROYECTO_NOMBRE}

# NotebookLM
NOTEBOOK_ID=

# GitHub
GITHUB_REPO=org/repo
GITHUB_PROJECT_ID=

# Discord
DISCORD_WEBHOOK=
EOF

# Crear .env si no existe
if [ ! -f .magi/.env ]; then
    echo -e "${YELLOW}Creando .env desde template...${NC}"
    cp .magi/.env.example .magi/.env
    echo -e "${RED}⚠️  IMPORTANTE: Edita .magi/.env con los valores correctos${NC}"
else
    echo -e "${GREEN}.env ya existe, no se sobrescribirá${NC}"
fi

# Crear .gitignore
echo -e "${YELLOW}Actualizando .gitignore...${NC}"

if [ -f .gitignore ]; then
    if ! grep -q ".magi/.env" .gitignore; then
        echo "" >> .gitignore
        echo "# MAGI Config" >> .gitignore
        echo ".magi/.env" >> .gitignore
        echo ".magi/state.json" >> .gitignore
        echo ".magi/docs/output/*" >> .gitignore
        echo -e "${GREEN}.gitignore actualizado${NC}"
    else
        echo -e "${GREEN}.gitignore ya tiene las reglas de magi${NC}"
    fi
else
    cat > .gitignore << EOF
# MAGI Config
.magi/.env
.magi/state.json
.magi/docs/output/*
EOF
    echo -e "${GREEN}.gitignore creado${NC}"
fi

# Crear state.json inicial
echo -e "${YELLOW}Creando state.json...${NC}"

cat > .magi/state.json << EOF
{
  "proyecto_id": "${PROYECTO_ID}",
  "version": "1.0.0",
  "documentos": {
    "input": [],
    "output": []
  },
  "ultima_actualizacion": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
}
EOF

echo ""
echo -e "${GREEN}✅ Proyecto inicializado correctamente!${NC}"
echo ""
echo "Archivos creados:"
echo "  - .magi/config.yaml"
echo "  - .magi/.env.example"
echo "  - .magi/.env"
echo "  - .magi/state.json"
echo "  - .magi/docs/input/"
echo "  - .magi/docs/output/"
echo "  - .magi/changes/archive/"
echo ""
echo -e "${YELLOW}Próximos pasos:${NC}"
echo "  1. Edita .magi/.env con los IDs reales"
echo "  2. Ejecuta /pm:init en OpenCode"
echo "  3. Añade documentos input en .magi/docs/input/"
