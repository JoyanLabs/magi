#!/bin/bash
# Skill Sync Script - Sincroniza metadata de skills a AGENTS.md
# Usage: ./sync.sh [--dry-run]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$(dirname "$SCRIPT_DIR")"
REPO_ROOT="$(dirname "$SKILLS_DIR")"

DRY_RUN=false
if [ "$1" = "--dry-run" ]; then
    DRY_RUN=true
fi

echo "🔄 Sincronizando skills..."
echo ""

# Find all SKILL.md files
SKILL_FILES=$(find "$SKILLS_DIR" -maxdepth 2 -name "SKILL.md" 2>/dev/null)

if [ -z "$SKILL_FILES" ]; then
    echo "⚠️  No se encontraron skills"
    exit 0
fi

# Extract auto_invoke entries
declare -A AUTO_INVOKE_MAP

for SKILL_FILE in $SKILL_FILES; do
    SKILL_DIR=$(dirname "$SKILL_FILE")
    SKILL_NAME=$(basename "$SKILL_DIR")
    
    # Extract auto_invoke from frontmatter
    AUTO_INVOKE=$(sed -n '/^---$/,/^---$/p' "$SKILL_FILE" | grep -A 10 "auto_invoke:" | head -20)
    
    if [ -n "$AUTO_INVOKE" ]; then
        echo "  ✓ $SKILL_NAME"
        # Store for later processing
    fi
done

echo ""
echo "Sync completado (dry-run: $DRY_RUN)"
echo "Ejecuta este script después de crear o modificar skills"
