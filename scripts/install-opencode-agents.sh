#!/bin/bash

# ==============================================================================
# MAGI OpenCode Install Script
# ==============================================================================
# Instala los orquestadores SDD y PM en OpenCode de forma GLOBAL
# Uso: ./install-opencode-agents.sh
# ==============================================================================

set -euo pipefail

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# Rutas
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
SKILLS_DIR="$REPO_DIR/.opencode/skills"
COMMANDS_DIR="$REPO_DIR/.opencode/commands"
CONFIG_SOURCE="$REPO_DIR/.opencode/opencode.json"
CONFIG_TARGET="$HOME/.config/opencode/opencode.json"
SKILLS_TARGET="$HOME/.opencode/skills"
COMMANDS_TARGET="$HOME/.config/opencode/commands"

echo ""
echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}${BOLD}║         MAGI OpenCode Agents Installer                      ║${NC}"
echo -e "${CYAN}${BOLD}║    SDD (Spec-Driven Development) + PM Orchestrators       ║${NC}"
echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""

# ==============================================================================
# Verificar prerrequisitos
# ==============================================================================

echo -e "${BOLD}1. Verificando prerrequisitos...${NC}"

# Verificar que existe OpenCode
if ! command -v opencode &> /dev/null; then
    echo -e "${RED}✗ Error: OpenCode no está instalado${NC}"
    echo "   Instala OpenCode desde: https://github.com/opencode-ai/opencode"
    exit 1
fi
echo -e "   ✓ OpenCode instalado: $(opencode --version 2>/dev/null || echo 'versión desconocida')"

# Verificar que existe el directorio de skills
if [ ! -d "$SKILLS_DIR" ]; then
    echo -e "${RED}✗ Error: No se encontró la carpeta skills en $SKILLS_DIR${NC}"
    exit 1
fi
echo -e "   ✓ Skills encontrados en $SKILLS_DIR"

# ==============================================================================
# Crear directorios necesarios (INSTALACIÓN GLOBAL)
# ==============================================================================

echo ""
echo -e "${BOLD}2. Creando estructura de directorios (global)...${NC}"

mkdir -p "$SKILLS_TARGET"
echo -e "   ✓ $SKILLS_TARGET"

mkdir -p "$(dirname "$CONFIG_TARGET")"
echo -e "   ✓ $(dirname "$CONFIG_TARGET")"

mkdir -p "$COMMANDS_TARGET"
echo -e "   ✓ $COMMANDS_TARGET"

# ==============================================================================
# Instalar skills (COPIA GLOBAL)
# ==============================================================================

echo ""
echo -e "${BOLD}3. Instalando skills (copia global)...${NC}"

# Copiar skills SDD
for skill in sdd-init sdd-explore sdd-propose sdd-spec sdd-design sdd-tasks sdd-apply sdd-verify sdd-archive; do
    if [ -d "$SKILLS_DIR/$skill" ]; then
        rm -rf "$SKILLS_TARGET/$skill"
        cp -r "$SKILLS_DIR/$skill" "$SKILLS_TARGET/"
        echo -e "   ✓ $skill"
    fi
done

# Copiar skills PM
for skill in pm-init pm-explore pm-propose pm-spec pm-apply pm-verify pm-github pm-discord pm-archive pm-sprint-review; do
    if [ -d "$SKILLS_DIR/$skill" ]; then
        rm -rf "$SKILLS_TARGET/$skill"
        cp -r "$SKILLS_DIR/$skill" "$SKILLS_TARGET/"
        echo -e "   ✓ $skill"
    fi
done

# Copiar convenciones compartidas (_shared)
if [ -d "$SKILLS_DIR/_shared" ]; then
    rm -rf "$SKILLS_TARGET/_shared"
    cp -r "$SKILLS_DIR/_shared" "$SKILLS_TARGET/"
    echo -e "   ✓ _shared/ (convenciones)"
fi

# Copiar skills Cyber (si existen)
if [ -d "$SKILLS_DIR/cyber-"* ]; then
    for skill in "$SKILLS_DIR"/cyber-*; do
        if [ -d "$skill" ]; then
            skill_name=$(basename "$skill")
            rm -rf "$SKILLS_TARGET/$skill_name"
            cp -r "$skill" "$SKILLS_TARGET/"
            echo -e "   ✓ $skill_name"
        fi
    done
fi

echo -e "   ✓ Total skills instalados: $(ls -1d $SKILLS_TARGET/*/ 2>/dev/null | wc -l)"

# ==============================================================================
# Instalar comandos
# ==============================================================================

echo ""
echo -e "${BOLD}4. Instalando comandos...${NC}"

if [ -d "$COMMANDS_DIR" ]; then
    for cmd in "$COMMANDS_DIR"/*.md; do
        if [ -f "$cmd" ]; then
            cmd_name=$(basename "$cmd")
            cp "$cmd" "$COMMANDS_TARGET/"
            echo -e "   ✓ $cmd_name"
        fi
    done
    
    echo -e "   ✓ Total comandos instalados: $(ls -1 $COMMANDS_TARGET/*.md 2>/dev/null | wc -l)"
fi

# ==============================================================================
# Configurar opencode.json
# ==============================================================================

echo ""
echo -e "${BOLD}5. Configurando OpenCode...${NC}"

if [ -f "$CONFIG_SOURCE" ]; then
    # Verificar si ya existe configuración
    if [ -f "$CONFIG_TARGET" ]; then
        echo -e "   ${YELLOW}⚠ Ya existe configuración en $CONFIG_TARGET${NC}"
        echo -e "   ${YELLOW}  Haciendo backup...${NC}"
        cp "$CONFIG_TARGET" "$CONFIG_TARGET.backup.$(date +%Y%m%d_%H%M%S)"
        
        # Verificar si ya tiene los agentes
        if grep -q '"sdd-orchestrator"' "$CONFIG_TARGET"; then
            echo -e "   ${YELLOW}  Los orquestadores SDD y PM ya están configurados${NC}"
            echo -e "   ${GREEN}  ✓ Configuración existente preservada${NC}"
            echo ""
            echo -e "   ${YELLOW}  ⚠ IMPORTANTE: El archivo de configuración actual puede contener API keys${NC}"
            echo -e "   ${YELLOW}    Por seguridad, manually copia el archivo de ejemplo y agrega tus keys:${NC}"
            echo -e "   ${CYAN}    cp $REPO_DIR/.opencode/opencode.json.example $CONFIG_TARGET${NC}"
        else
            # Agregar agentes al final
            echo -e "   ${YELLOW}  Agregando agentes al archivo existente...${NC}"
            cp "$CONFIG_SOURCE" "$CONFIG_TARGET"
            echo -e "   ✓ Configuración actualizada"
        fi
    else
        echo -e "   ${YELLOW}⚠ Archivo de configuración no encontrado${NC}"
        echo -e "   ${YELLOW}  Copia el archivo de ejemplo y agrega tus API keys:${NC}"
        echo -e "   ${CYAN}  cp $REPO_DIR/.opencode/opencode.json.example $CONFIG_TARGET${NC}"
        echo -e "   ${YELLOW}  Luego edita $CONFIG_TARGET y reemplaza YOUR_*_KEY con tus keys reales${NC}"
    fi
else
    echo -e "   ${RED}✗ No se encontró archivo de configuración fuente${NC}"
fi

# ==============================================================================
# Verificar Engram
# ==============================================================================

echo ""
echo -e "${BOLD}6. Verificando Engram (memoria persistente)...${NC}"

if command -v engram &> /dev/null; then
    echo -e "   ✓ Engram está instalado"
else
    echo -e "   ${YELLOW}⚠ Engram no está instalado (recomendado)${NC}"
    echo -e "   ${YELLOW}  Instala desde: https://github.com/gentleman-programming/engram${NC}"
fi

# ==============================================================================
# Verificar NotebookLM MCP
# ==============================================================================

echo ""
echo -e "${BOLD}7. Verificando NotebookLM MCP...${NC}"

if command -v notebooklm-mcp &> /dev/null || command -v nlm &> /dev/null; then
    echo -e "   ✓ NotebookLM MCP está instalado"
else
    echo -e "   ${YELLOW}⚠ NotebookLM MCP no está instalado (recomendado)${NC}"
    echo -e "   ${YELLOW}  Instala con: npm install -g notebooklm-mcp-cli${NC}"
    echo -e "   ${YELLOW}  O consulta: https://github.com/jacob-bd/notebooklm-mcp-cli${NC}"
fi

# ==============================================================================
# Resumen
# ==============================================================================

echo ""
echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}${BOLD}║                    ¡INSTALACIÓN COMPLETA!                     ║${NC}"
echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${BOLD}Próximos pasos:${NC}"
echo ""
echo -e "1. ${BOLD}Reinicia OpenCode${NC} (cierra y vuelve a abrir)"
echo ""
echo -e "2. ${BOLD}Configura tus API keys:${NC}"
echo "   - Edita $CONFIG_TARGET"
echo "   - Reemplaza YOUR_CONTEXT7_API_KEY con tu key"
echo "   - Agrega otras keys necesarias (Gemini, etc.)"
echo ""
echo -e "3. ${CYAN}Para usar SDD:${NC}"
echo "   - Selecciona el agente 'sdd-orchestrator'"
echo "   - Escribe: /sdd-init"
echo ""
echo -e "4. ${CYAN}Para usar PM:${NC}"
echo "   - Selecciona el agente 'pm-orchestrator'"
echo "   - Escribe: /pm:init"
echo ""
echo -e "${BOLD}Comandos disponibles:${NC}"
echo "   SDD: /sdd-init, /sdd-new, /sdd-apply, /sdd-verify, /sdd-archive"
echo "   PM:  /pm:init, /pm:explore, /pm:new, /pm:apply, /pm:verify"
echo ""
echo -e "${YELLOW}Nota: Los comandos se detectan por texto, no aparecen en autocompletado${NC}"
echo ""
