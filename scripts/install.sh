#!/usr/bin/env bash
# FinalCode Installation Script
# Copies source files to the OpenCode skill installation directory.
# Usage: bash scripts/install.sh

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SOURCE_DIR="$REPO_ROOT/source"
TARGET_DIR="$REPO_ROOT/.opencode/skills/finalcode"

echo "FinalCode Installer"
echo "==================="
echo "Source:  $SOURCE_DIR"
echo "Target:  $TARGET_DIR"
echo ""

# Validate source exists
if [ ! -f "$SOURCE_DIR/SKILL.md" ]; then
  echo "Error: source/SKILL.md not found." >&2
  exit 1
fi

if [ ! -d "$SOURCE_DIR/references" ]; then
  echo "Error: source/references/ not found." >&2
  exit 1
fi

# Create target directories
mkdir -p "$TARGET_DIR/references"
mkdir -p "$TARGET_DIR/core"
mkdir -p "$TARGET_DIR/plugins"

# Copy SKILL.md
cp "$SOURCE_DIR/SKILL.md" "$TARGET_DIR/SKILL.md"
echo "Installed: SKILL.md"

# Copy references
for file in "$SOURCE_DIR/references"/*; do
  [ -f "$file" ] || continue
  cp "$file" "$TARGET_DIR/references/$(basename "$file")"
  echo "Installed: references/$(basename "$file")"
done

# Copy core
if [ -d "$SOURCE_DIR/core" ]; then
  for file in "$SOURCE_DIR/core"/*; do
    [ -f "$file" ] || continue
    cp "$file" "$TARGET_DIR/core/$(basename "$file")"
    echo "Installed: core/$(basename "$file")"
  done
fi

# Copy plugins
if [ -d "$SOURCE_DIR/plugins" ]; then
  for file in "$SOURCE_DIR/plugins"/*; do
    [ -f "$file" ] || continue
    cp "$file" "$TARGET_DIR/plugins/$(basename "$file")"
    echo "Installed: plugins/$(basename "$file")"
  done
fi

echo ""
echo "Done. FinalCode skill installed to .opencode/skills/finalcode/"
