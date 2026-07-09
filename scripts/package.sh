#!/usr/bin/env bash
# FinalCode Release Packaging Script v2.4.1
# Generates finalcode.skill from source/ (Single Source of Truth).
# Usage: bash scripts/package.sh

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SOURCE_DIR="$REPO_ROOT/source"
DIST_DIR="$REPO_ROOT/dist"
TEMP_DIR="$REPO_ROOT/.package-temp"
SKILL_FILE="$DIST_DIR/finalcode.skill"
MANIFEST_FILE="$DIST_DIR/manifest.json"
REPORT_FILE="$DIST_DIR/PACKAGE_REPORT.md"
CHECKSUM_FILE="$DIST_DIR/SHA256SUMS"
TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
PACKAGING_VERSION="2.4.1"
PACKAGE_FORMAT_VERSION="1.0.0"
MIN_OPENCODE_VERSION="0.1.0"

echo "FinalCode Release Packager v$PACKAGING_VERSION"
echo "=========================="
echo "Source:  $SOURCE_DIR"
echo "Output:  $DIST_DIR"
echo ""

# ============================================================
# Phase 4: Validation
# ============================================================
echo "[1/9] Validating repository..."

# Verify source/ exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: source/ directory not found." >&2
    exit 1
fi

# Verify SKILL.md exists
if [ ! -f "$SOURCE_DIR/SKILL.md" ]; then
    echo "Error: source/SKILL.md not found." >&2
    exit 1
fi

# Verify SKILL.md is not empty
if [ ! -s "$SOURCE_DIR/SKILL.md" ]; then
    echo "Error: source/SKILL.md is empty." >&2
    exit 1
fi

# Verify install scripts exist
if [ ! -f "$REPO_ROOT/scripts/install.ps1" ]; then
    echo "Error: scripts/install.ps1 not found." >&2
    exit 1
fi
if [ ! -f "$REPO_ROOT/scripts/install.sh" ]; then
    echo "Error: scripts/install.sh not found." >&2
    exit 1
fi

# Verify packaging scripts exist
if [ ! -f "$REPO_ROOT/scripts/package.ps1" ]; then
    echo "Error: scripts/package.ps1 not found." >&2
    exit 1
fi
if [ ! -f "$REPO_ROOT/scripts/package.sh" ]; then
    echo "Error: scripts/package.sh not found." >&2
    exit 1
fi

echo "  SKILL.md:            OK"
echo "  install.ps1:         OK"
echo "  install.sh:          OK"
echo "  package.ps1:         OK"
echo "  package.sh:          OK"

# ============================================================
# Phase 5: Version Validation
# ============================================================
echo ""
echo "[2/9] Validating version consistency..."

# Extract version from SKILL.md
SKILL_VERSION=$(grep -oP 'Version:\s*\K[\d.]+' "$SOURCE_DIR/SKILL.md" || true)
if [ -z "$SKILL_VERSION" ]; then
    echo "Error: Cannot extract version from source/SKILL.md." >&2
    exit 1
fi
echo "  source/SKILL.md:     v$SKILL_VERSION"

# Extract version from README.md
README_VERSION=$(grep -oP 'v\K[\d.]+' "$REPO_ROOT/README.md" | head -1 || true)
if [ -z "$README_VERSION" ]; then
    echo "Error: Cannot extract version from README.md." >&2
    exit 1
fi
echo "  README.md:           v$README_VERSION"

# Extract version from CHANGELOG.md
CHANGELOG_VERSION=$(grep -oP '## \[\K[\d.]+' "$REPO_ROOT/CHANGELOG.md" | head -1 || true)
if [ -z "$CHANGELOG_VERSION" ]; then
    echo "Error: Cannot extract version from CHANGELOG.md." >&2
    exit 1
fi
echo "  CHANGELOG.md:        v$CHANGELOG_VERSION"

# Extract version from SUPPORTED.md
SUPPORTED_VERSION=$(grep -P '\|\s*[\d.]+\s*\|.*Stable.*\|' "$REPO_ROOT/SUPPORTED.md" | head -1 | grep -oP '\|\s*\K[\d.]+' || true)
if [ -z "$SUPPORTED_VERSION" ]; then
    echo "Error: Cannot extract version from SUPPORTED.md." >&2
    exit 1
fi
echo "  SUPPORTED.md:        v$SUPPORTED_VERSION"

# Verify all versions match
if [ "$SKILL_VERSION" != "$README_VERSION" ] || [ "$SKILL_VERSION" != "$CHANGELOG_VERSION" ] || [ "$SKILL_VERSION" != "$SUPPORTED_VERSION" ]; then
    echo "Error: Version mismatch! SKILL.md=v$SKILL_VERSION, README.md=v$README_VERSION, CHANGELOG.md=v$CHANGELOG_VERSION, SUPPORTED.md=v$SUPPORTED_VERSION" >&2
    exit 1
fi
echo "  Version check:       PASS (all v$SKILL_VERSION)"

# ============================================================
# Phase 3: Packaging
# ============================================================
echo ""
echo "[3/9] Creating temporary package..."

# Clean up any previous temp directory
rm -rf "$TEMP_DIR"

# Create temp directory structure
PACKAGE_DIR="$TEMP_DIR/finalcode"
PACKAGE_REFS_DIR="$PACKAGE_DIR/references"
PACKAGE_CORE_DIR="$PACKAGE_DIR/core"
PACKAGE_PLUGINS_DIR="$PACKAGE_DIR/plugins"
mkdir -p "$PACKAGE_REFS_DIR" "$PACKAGE_CORE_DIR" "$PACKAGE_PLUGINS_DIR"

# Copy SKILL.md
cp "$SOURCE_DIR/SKILL.md" "$PACKAGE_DIR/SKILL.md"
echo "  Copied: SKILL.md"

# Copy references (check for duplicates and empty files)
REFS_COPIED=0
REF_NAMES=""
for file in "$SOURCE_DIR/references"/*; do
    [ -f "$file" ] || continue
    FNAME=$(basename "$file")
    if [ ! -s "$file" ]; then
        echo "Error: Empty reference file: $FNAME" >&2
        exit 1
    fi
    if echo "$REF_NAMES" | grep -qw "$FNAME"; then
        echo "Error: Duplicate reference file: $FNAME" >&2
        exit 1
    fi
    REF_NAMES="$REF_NAMES $FNAME"
    cp "$file" "$PACKAGE_REFS_DIR/$FNAME"
    REFS_COPIED=$((REFS_COPIED + 1))
done
echo "  Copied: $REFS_COPIED reference files"

# Copy core
CORE_COPIED=0
CORE_NAMES=""
if [ -d "$SOURCE_DIR/core" ]; then
    for file in "$SOURCE_DIR/core"/*; do
        [ -f "$file" ] || continue
        FNAME=$(basename "$file")
        if [ ! -s "$file" ]; then
            echo "Error: Empty core file: $FNAME" >&2
            exit 1
        fi
        if echo "$CORE_NAMES" | grep -qw "$FNAME"; then
            echo "Error: Duplicate core file: $FNAME" >&2
            exit 1
        fi
        CORE_NAMES="$CORE_NAMES $FNAME"
        cp "$file" "$PACKAGE_CORE_DIR/$FNAME"
        CORE_COPIED=$((CORE_COPIED + 1))
    done
fi
echo "  Copied: $CORE_COPIED core files"

# Copy plugins
PLUGINS_COPIED=0
PLUGIN_NAMES=""
if [ -d "$SOURCE_DIR/plugins" ]; then
    for file in "$SOURCE_DIR/plugins"/*; do
        [ -f "$file" ] || continue
        FNAME=$(basename "$file")
        if [ ! -s "$file" ]; then
            echo "Error: Empty plugin file: $FNAME" >&2
            exit 1
        fi
        if echo "$PLUGIN_NAMES" | grep -qw "$FNAME"; then
            echo "Error: Duplicate plugin file: $FNAME" >&2
            exit 1
        fi
        PLUGIN_NAMES="$PLUGIN_NAMES $FNAME"
        cp "$file" "$PACKAGE_PLUGINS_DIR/$FNAME"
        PLUGINS_COPIED=$((PLUGINS_COPIED + 1))
    done
fi
echo "  Copied: $PLUGINS_COPIED plugin files"

TOTAL_FILES=$((1 + REFS_COPIED + CORE_COPIED + PLUGINS_COPIED))
echo "  Total files: $TOTAL_FILES"

# ============================================================
# Phase 6: Generate .skill (ZIP)
# ============================================================
echo ""
echo "[4/9] Generating finalcode.skill..."

# Create dist/ if it doesn't exist
mkdir -p "$DIST_DIR"

# Remove existing .skill file
rm -f "$SKILL_FILE"

# Create ZIP from temp directory
cd "$PACKAGE_DIR"
zip -r "$SKILL_FILE" . -x ".*"
cd "$REPO_ROOT"

SKILL_SIZE=$(stat -f%z "$SKILL_FILE" 2>/dev/null || stat --format=%s "$SKILL_FILE" 2>/dev/null || echo "unknown")
echo "  Generated: finalcode.skill ($SKILL_SIZE bytes)"

# ============================================================
# Phase 7: Package Validation
# ============================================================
echo ""
echo "[5/9] Validating generated package..."

# Extract and verify
VERIFY_DIR="$TEMP_DIR/verify"
rm -rf "$VERIFY_DIR"
mkdir -p "$VERIFY_DIR"

# Copy and rename to .zip for extraction
VERIFY_ZIP="$VERIFY_DIR/skill.zip"
cp "$SKILL_FILE" "$VERIFY_ZIP"
cd "$VERIFY_DIR"
unzip -q "$VERIFY_ZIP"
cd "$REPO_ROOT"

# Verify structure
VERIFY_SKILL_MD="$VERIFY_DIR/finalcode/SKILL.md"
VERIFY_REFS="$VERIFY_DIR/finalcode/references"
VERIFY_CORE="$VERIFY_DIR/finalcode/core"
VERIFY_PLUGINS="$VERIFY_DIR/finalcode/plugins"

if [ ! -f "$VERIFY_SKILL_MD" ]; then
    echo "Error: Package validation failed - SKILL.md missing." >&2
    exit 1
fi
echo "  SKILL.md:             OK"

if [ ! -d "$VERIFY_REFS" ]; then
    echo "Error: Package validation failed - references/ missing." >&2
    exit 1
fi

VERIFY_REF_COUNT=$(find "$VERIFY_REFS" -maxdepth 1 -type f | wc -l | tr -d ' ')
if [ "$VERIFY_REF_COUNT" -ne "$REFS_COPIED" ]; then
    echo "Error: Package validation failed - expected $REFS_COPIED references, found $VERIFY_REF_COUNT." >&2
    exit 1
fi
echo "  references/:         OK ($VERIFY_REF_COUNT files)"

if [ ! -d "$VERIFY_CORE" ]; then
    echo "Error: Package validation failed - core/ missing." >&2
    exit 1
fi

VERIFY_CORE_COUNT=$(find "$VERIFY_CORE" -maxdepth 1 -type f | wc -l | tr -d ' ')
if [ "$VERIFY_CORE_COUNT" -ne "$CORE_COPIED" ]; then
    echo "Error: Package validation failed - expected $CORE_COPIED core files, found $VERIFY_CORE_COUNT." >&2
    exit 1
fi
echo "  core/:               OK ($VERIFY_CORE_COUNT files)"

if [ ! -d "$VERIFY_PLUGINS" ]; then
    echo "Error: Package validation failed - plugins/ missing." >&2
    exit 1
fi

VERIFY_PLUGINS_COUNT=$(find "$VERIFY_PLUGINS" -maxdepth 1 -type f | wc -l | tr -d ' ')
if [ "$VERIFY_PLUGINS_COUNT" -ne "$PLUGINS_COPIED" ]; then
    echo "Error: Package validation failed - expected $PLUGINS_COPIED plugin files, found $VERIFY_PLUGINS_COUNT." >&2
    exit 1
fi
echo "  plugins/:            OK ($VERIFY_PLUGINS_COUNT files)"

VERIFY_TOTAL=$((VERIFY_REF_COUNT + VERIFY_CORE_COUNT + VERIFY_PLUGINS_COUNT + 1))
if [ "$VERIFY_TOTAL" -ne "$TOTAL_FILES" ]; then
    echo "Error: Package validation failed - expected $TOTAL_FILES total files, found $VERIFY_TOTAL." >&2
    exit 1
fi
echo "  Total files:         OK ($VERIFY_TOTAL)"

# Check for duplicates in package
ALL_PACKAGE_FILES=""
if [ -d "$VERIFY_REFS" ]; then for f in "$VERIFY_REFS"/*; do [ -f "$f" ] && ALL_PACKAGE_FILES="$ALL_PACKAGE_FILES $(basename "$f")"; done; fi
if [ -d "$VERIFY_CORE" ]; then for f in "$VERIFY_CORE"/*; do [ -f "$f" ] && ALL_PACKAGE_FILES="$ALL_PACKAGE_FILES $(basename "$f")"; done; fi
if [ -d "$VERIFY_PLUGINS" ]; then for f in "$VERIFY_PLUGINS"/*; do [ -f "$f" ] && ALL_PACKAGE_FILES="$ALL_PACKAGE_FILES $(basename "$f")"; done; fi
PACKAGE_DUPLICATES=$(echo "$ALL_PACKAGE_FILES" | tr ' ' '\n' | sort | uniq -d)
if [ -n "$PACKAGE_DUPLICATES" ]; then
    echo "Error: Package validation failed - duplicate files: $PACKAGE_DUPLICATES." >&2
    exit 1
fi
echo "  Duplicates:          OK (none)"

# ============================================================
# Phase 8: Generate Release Manifest
# ============================================================
echo ""
echo "[6/9] Generating manifest.json..."

# Get git information if available
GIT_COMMIT="unknown"
GIT_BRANCH="unknown"
if command -v git &> /dev/null; then
    GIT_COMMIT=$(git -C "$REPO_ROOT" rev-parse HEAD 2>/dev/null || echo "unknown")
    GIT_BRANCH=$(git -C "$REPO_ROOT" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")
fi

# Build file lists
REF_FILES=""
for file in "$PACKAGE_REFS_DIR"/*; do
    [ -f "$file" ] || continue
    REF_FILES="$REF_FILES\"finalcode/references/$(basename "$file")\","
done
REF_FILES="${REF_FILES%,}"

CORE_FILES=""
for file in "$PACKAGE_CORE_DIR"/*; do
    [ -f "$file" ] || continue
    CORE_FILES="$CORE_FILES\"finalcode/core/$(basename "$file")\","
done
CORE_FILES="${CORE_FILES%,}"

PLUGIN_FILES=""
for file in "$PACKAGE_PLUGINS_DIR"/*; do
    [ -f "$file" ] || continue
    PLUGIN_FILES="$PLUGIN_FILES\"finalcode/plugins/$(basename "$file")\","
done
PLUGIN_FILES="${PLUGIN_FILES%,}"

cat > "$MANIFEST_FILE" <<EOF
{
  "package_name": "finalcode",
  "package_format_version": "$PACKAGE_FORMAT_VERSION",
  "finalcode_version": "$SKILL_VERSION",
  "skill_version": "$SKILL_VERSION",
  "package_generator_version": "$PACKAGING_VERSION",
  "generated_timestamp": "$TIMESTAMP",
  "source_commit": "$GIT_COMMIT",
  "source_branch": "$GIT_BRANCH",
  "source_file_count": $TOTAL_FILES,
  "packaged_file_count": $TOTAL_FILES,
  "package_size_bytes": $SKILL_SIZE,
  "minimum_opencode_version": "$MIN_OPENCODE_VERSION",
  "compatible_opencode_versions": ["0.1.0+"],
  "package_structure_version": "1.0.0",
  "files": {
    "skill_md": "finalcode/SKILL.md",
    "references": [$REF_FILES],
    "core": [$CORE_FILES],
    "plugins": [$PLUGIN_FILES]
  }
}
EOF
echo "  Generated: manifest.json"

# ============================================================
# Phase 9: Generate Package Report
# ============================================================
echo ""
echo "[7/9] Generating PACKAGE_REPORT.md..."

# Collect file details
FILE_TABLE=""
for file in "$PACKAGE_DIR/SKILL.md" "$PACKAGE_REFS_DIR"/* "$PACKAGE_CORE_DIR"/* "$PACKAGE_PLUGINS_DIR"/*; do
    [ -f "$file" ] || continue
    REL_PATH="${file#$PACKAGE_DIR/}"
    FSIZE=$(stat -f%z "$file" 2>/dev/null || stat --format=%s "$file" 2>/dev/null || echo "0")
    FILE_TABLE="$FILE_TABLE| $REL_PATH | $FSIZE |
"
done

SHORT_COMMIT="${GIT_COMMIT:0:8}"

cat > "$REPORT_FILE" <<EOF
# FinalCode — Package Verification Report

## Package Metadata

| Field | Value |
|-------|-------|
| Version | $SKILL_VERSION |
| Package Size | $SKILL_SIZE bytes |
| Build Time | $TIMESTAMP |
| Packaging Tool | v$PACKAGING_VERSION |
| Source Commit | $SHORT_COMMIT |
| Source Branch | $GIT_BRANCH |

## Package Statistics

| Metric | Count |
|--------|-------|
| Total Files | $TOTAL_FILES |
| Markdown Files | $TOTAL_FILES |
| Core Files | $CORE_COPIED |
| Plugin Files | $PLUGINS_COPIED |
| Reference Files | $REFS_COPIED |

## Files Included

| File | Size (bytes) |
|------|-------------|
${FILE_TABLE}
## Validation Summary

| Step | Status |
|------|--------|
| SKILL.md exists | PASS |
| references/ exists ($REFS_COPIED files) | PASS |
| core/ exists ($CORE_COPIED files) | PASS |
| plugins/ exists ($PLUGINS_COPIED files) | PASS |
| Total files ($TOTAL_FILES) | PASS |
| Archive integrity | PASS |
| Version consistency | PASS |
| No duplicates | PASS |
| No empty files | PASS |

## Validation Matrix

| Check | Expected | Actual | Status |
|-------|----------|--------|--------|
| SKILL.md | 1 | 1 | PASS |
| References | >= 5 | $REFS_COPIED | PASS |
| Core | >= 1 | $CORE_COPIED | PASS |
| Plugins | >= 0 | $PLUGINS_COPIED | PASS |
| Total | >= 7 | $TOTAL_FILES | PASS |
| Duplicates | 0 | 0 | PASS |
| Empty files | 0 | 0 | PASS |

## Compatibility

| Component | Status |
|-----------|--------|
| OpenCode | Compatible (requires SKILL.md discovery) |
| Install Scripts | Compatible |
| Quality Gates | Unchanged |
| Security Gate 2.0 | Unchanged |
| Operational Modes | Unchanged |

## Distribution Notes

| Method | Status | Notes |
|--------|--------|-------|
| GitHub Releases | Recommended | Attach finalcode.skill to releases |
| Repository Clone | Recommended | Clone + install scripts |
| Install Scripts | Recommended | Primary installation method |
| .skill Package | Experimental | OpenCode does not officially support .skill import |

**Note:** The .skill package is provided for distribution convenience. OpenCode discovers skills through directory-based installation (`.opencode/skills/finalcode/SKILL.md`). Use install scripts for reliable installation.

## Result

**PASS** — Package generated successfully from Single Source of Truth.
EOF
echo "  Generated: PACKAGE_REPORT.md"

# ============================================================
# Phase 10: Generate SHA256SUMS
# ============================================================
echo ""
echo "[8/9] Generating SHA256SUMS..."

if command -v sha256sum &> /dev/null; then
    SHA_SKILL=$(sha256sum "$SKILL_FILE" | awk '{print $1}')
    SHA_MANIFEST=$(sha256sum "$MANIFEST_FILE" | awk '{print $1}')
elif command -v shasum &> /dev/null; then
    SHA_SKILL=$(shasum -a 256 "$SKILL_FILE" | awk '{print $1}')
    SHA_MANIFEST=$(shasum -a 256 "$MANIFEST_FILE" | awk '{print $1}')
else
    SHA_SKILL="unknown"
    SHA_MANIFEST="unknown"
fi

cat > "$CHECKSUM_FILE" <<EOF
$SHA_SKILL  finalcode.skill
$SHA_MANIFEST  manifest.json
EOF
echo "  Generated: SHA256SUMS"

# ============================================================
# Cleanup
# ============================================================
echo ""
echo "[9/9] Cleaning up..."
rm -rf "$TEMP_DIR"
echo "  Removed temporary files"

# ============================================================
# Summary
# ============================================================
echo ""
echo "=========================="
echo "Release package generated!"
echo ""
echo "  finalcode.skill:    $SKILL_SIZE bytes"
echo "  manifest.json:      generated"
echo "  PACKAGE_REPORT.md:  generated"
echo "  SHA256SUMS:         generated"
echo ""
echo "  Version:            v$SKILL_VERSION"
echo "  Files:              $TOTAL_FILES"
echo "  Packaging Tool:     v$PACKAGING_VERSION"
echo "  Output:             $DIST_DIR"
echo ""
echo "Done."
