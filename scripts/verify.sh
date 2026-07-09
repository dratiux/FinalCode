#!/usr/bin/env bash
# FinalCode Package Verification Script
# Validates an existing .skill package without rebuilding.
# Usage: bash scripts/verify.sh [path-to-skill-file]

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEFAULT_SKILL_FILE="$REPO_ROOT/dist/finalcode.skill"
SKILL_FILE="${1:-$DEFAULT_SKILL_FILE}"
TEMP_DIR="$REPO_ROOT/.verify-temp"
PASSED=0
FAILED=0
ERRORS=()

echo "FinalCode Package Verifier"
echo "=========================="
echo "Package: $SKILL_FILE"
echo ""

# ============================================================
# Check 1: File exists
# ============================================================
echo "[1/10] Checking file exists..."
if [ ! -f "$SKILL_FILE" ]; then
    echo "  FAIL: File not found"
    FAILED=$((FAILED + 1))
    ERRORS+=("File not found: $SKILL_FILE")
else
    SKILL_SIZE=$(stat -f%z "$SKILL_FILE" 2>/dev/null || stat --format=%s "$SKILL_FILE" 2>/dev/null || echo "0")
    echo "  PASS: File exists ($SKILL_SIZE bytes)"
    PASSED=$((PASSED + 1))
fi

if [ $FAILED -gt 0 ]; then
    echo ""
    echo "RESULT: FAIL ($FAILED errors)"
    for err in "${ERRORS[@]}"; do
        echo "  - $err"
    done
    exit 1
fi

# ============================================================
# Check 2: Archive integrity
# ============================================================
echo ""
echo "[2/10] Checking archive integrity..."

# Clean up any previous temp directory
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"

# Copy and rename to .zip for extraction
VERIFY_ZIP="$TEMP_DIR/skill.zip"
cp "$SKILL_FILE" "$VERIFY_ZIP"

if unzip -q "$VERIFY_ZIP" -d "$TEMP_DIR" 2>/dev/null; then
    echo "  PASS: Archive is valid ZIP"
    PASSED=$((PASSED + 1))
else
    echo "  FAIL: Archive is not a valid ZIP"
    FAILED=$((FAILED + 1))
    ERRORS+=("Archive is not a valid ZIP")
    rm -rf "$TEMP_DIR"
    echo ""
    echo "RESULT: FAIL ($FAILED errors)"
    for err in "${ERRORS[@]}"; do
        echo "  - $err"
    done
    exit 1
fi

# ============================================================
# Check 3: Directory structure
# ============================================================
echo ""
echo "[3/10] Checking directory structure..."

VERIFY_SKILL_MD="$TEMP_DIR/finalcode/SKILL.md"
VERIFY_REFS="$TEMP_DIR/finalcode/references"
VERIFY_CORE="$TEMP_DIR/finalcode/core"
VERIFY_PLUGINS="$TEMP_DIR/finalcode/plugins"

STRUCTURE_OK=true

if [ ! -f "$VERIFY_SKILL_MD" ]; then
    echo "  FAIL: SKILL.md missing"
    FAILED=$((FAILED + 1))
    ERRORS+=("SKILL.md missing from archive")
    STRUCTURE_OK=false
else
    echo "  SKILL.md:             OK"
    PASSED=$((PASSED + 1))
fi

if [ ! -d "$VERIFY_REFS" ]; then
    echo "  FAIL: references/ missing"
    FAILED=$((FAILED + 1))
    ERRORS+=("references/ directory missing from archive")
    STRUCTURE_OK=false
else
    echo "  references/:         OK"
    PASSED=$((PASSED + 1))
fi

if [ ! -d "$VERIFY_CORE" ]; then
    echo "  FAIL: core/ missing"
    FAILED=$((FAILED + 1))
    ERRORS+=("core/ directory missing from archive")
    STRUCTURE_OK=false
else
    echo "  core/:               OK"
    PASSED=$((PASSED + 1))
fi

if [ ! -d "$VERIFY_PLUGINS" ]; then
    echo "  FAIL: plugins/ missing"
    FAILED=$((FAILED + 1))
    ERRORS+=("plugins/ directory missing from archive")
    STRUCTURE_OK=false
else
    echo "  plugins/:            OK"
    PASSED=$((PASSED + 1))
fi

# ============================================================
# Check 4: Required files
# ============================================================
echo ""
echo "[4/10] Checking required files..."

REQUIRED_REFS=("gates.md" "security-gate.md" "examples.md" "architecture.md" "configuration.md")
for ref in "${REQUIRED_REFS[@]}"; do
    REF_PATH="$VERIFY_REFS/$ref"
    if [ ! -f "$REF_PATH" ]; then
        echo "  FAIL: Required reference missing: $ref"
        FAILED=$((FAILED + 1))
        ERRORS+=("Required reference missing: $ref")
    else
        echo "  $ref:                 OK"
        PASSED=$((PASSED + 1))
    fi
done

# ============================================================
# Check 5: No duplicate files
# ============================================================
echo ""
echo "[5/10] Checking for duplicates..."

ALL_FILES=""
if [ -f "$VERIFY_SKILL_MD" ]; then ALL_FILES="$ALL_FILES $(basename "$VERIFY_SKILL_MD")"; fi
if [ -d "$VERIFY_REFS" ]; then for f in "$VERIFY_REFS"/*; do [ -f "$f" ] && ALL_FILES="$ALL_FILES $(basename "$f")"; done; fi
if [ -d "$VERIFY_CORE" ]; then for f in "$VERIFY_CORE"/*; do [ -f "$f" ] && ALL_FILES="$ALL_FILES $(basename "$f")"; done; fi
if [ -d "$VERIFY_PLUGINS" ]; then for f in "$VERIFY_PLUGINS"/*; do [ -f "$f" ] && ALL_FILES="$ALL_FILES $(basename "$f")"; done; fi

DUPLICATES=$(echo "$ALL_FILES" | tr ' ' '\n' | sort | uniq -d)
if [ -n "$DUPLICATES" ]; then
    echo "  FAIL: Duplicate files found: $DUPLICATES"
    FAILED=$((FAILED + 1))
    ERRORS+=("Duplicate files found: $DUPLICATES")
else
    echo "  PASS: No duplicates"
    PASSED=$((PASSED + 1))
fi

# ============================================================
# Check 6: No empty files
# ============================================================
echo ""
echo "[6/10] Checking for empty files..."

EMPTY_FILES=""
if [ -f "$VERIFY_SKILL_MD" ] && [ ! -s "$VERIFY_SKILL_MD" ]; then EMPTY_FILES="$EMPTY_FILES SKILL.md"; fi
if [ -d "$VERIFY_REFS" ]; then for f in "$VERIFY_REFS"/*; do [ -f "$f" ] && [ ! -s "$f" ] && EMPTY_FILES="$EMPTY_FILES $(basename "$f")"; done; fi
if [ -d "$VERIFY_CORE" ]; then for f in "$VERIFY_CORE"/*; do [ -f "$f" ] && [ ! -s "$f" ] && EMPTY_FILES="$EMPTY_FILES $(basename "$f")"; done; fi
if [ -d "$VERIFY_PLUGINS" ]; then for f in "$VERIFY_PLUGINS"/*; do [ -f "$f" ] && [ ! -s "$f" ] && EMPTY_FILES="$EMPTY_FILES $(basename "$f")"; done; fi

if [ -n "$EMPTY_FILES" ]; then
    echo "  FAIL: Empty files found:$EMPTY_FILES"
    FAILED=$((FAILED + 1))
    ERRORS+=("Empty files found:$EMPTY_FILES")
else
    echo "  PASS: No empty files"
    PASSED=$((PASSED + 1))
fi

# ============================================================
# Check 7: File count
# ============================================================
echo ""
echo "[7/10] Checking file count..."

REF_COUNT=$(find "$VERIFY_REFS" -maxdepth 1 -type f | wc -l | tr -d ' ')
CORE_COUNT=$(find "$VERIFY_CORE" -maxdepth 1 -type f | wc -l | tr -d ' ')
PLUGINS_COUNT=$(find "$VERIFY_PLUGINS" -maxdepth 1 -type f | wc -l | tr -d ' ')
TOTAL_COUNT=$((REF_COUNT + CORE_COUNT + PLUGINS_COUNT + 1))

echo "  References:  $REF_COUNT"
echo "  Core:        $CORE_COUNT"
echo "  Plugins:     $PLUGINS_COUNT"
echo "  SKILL.md:    1"
echo "  Total:       $TOTAL_COUNT"

if [ "$TOTAL_COUNT" -lt 5 ]; then
    echo "  FAIL: Too few files (expected >= 5)"
    FAILED=$((FAILED + 1))
    ERRORS+=("Too few files in package")
else
    echo "  PASS: File count OK"
    PASSED=$((PASSED + 1))
fi

# ============================================================
# Check 8: Manifest exists
# ============================================================
echo ""
echo "[8/10] Checking manifest..."

MANIFEST_DIR="$(dirname "$(dirname "$SKILL_FILE")")"
MANIFEST_FILE="$MANIFEST_DIR/manifest.json"

if [ ! -f "$MANIFEST_FILE" ]; then
    echo "  WARN: manifest.json not found (optional)"
else
    if command -v python3 &> /dev/null; then
        MANIFEST_VERSION=$(python3 -c "import json; print(json.load(open('$MANIFEST_FILE')).get('finalcode_version', ''))" 2>/dev/null || echo "")
    elif command -v python &> /dev/null; then
        MANIFEST_VERSION=$(python -c "import json; print(json.load(open('$MANIFEST_FILE')).get('finalcode_version', ''))" 2>/dev/null || echo "")
    else
        MANIFEST_VERSION=""
    fi
    
    if [ -n "$MANIFEST_VERSION" ]; then
        echo "  PASS: Manifest valid (v$MANIFEST_VERSION)"
        PASSED=$((PASSED + 1))
    else
        echo "  WARN: Manifest missing version field"
    fi
fi

# ============================================================
# Check 9: SHA256
# ============================================================
echo ""
echo "[9/10] Checking SHA256..."

CHECKSUM_FILE="$MANIFEST_DIR/SHA256SUMS"
if [ ! -f "$CHECKSUM_FILE" ]; then
    echo "  WARN: SHA256SUMS not found (optional)"
else
    if command -v sha256sum &> /dev/null; then
        SKILL_HASH=$(sha256sum "$SKILL_FILE" | awk '{print $1}')
        EXPECTED_HASH=$(grep "finalcode.skill" "$CHECKSUM_FILE" | awk '{print $1}')
    elif command -v shasum &> /dev/null; then
        SKILL_HASH=$(shasum -a 256 "$SKILL_FILE" | awk '{print $1}')
        EXPECTED_HASH=$(grep "finalcode.skill" "$CHECKSUM_FILE" | awk '{print $1}')
    else
        SKILL_HASH=""
        EXPECTED_HASH=""
    fi
    
    if [ -n "$SKILL_HASH" ] && [ -n "$EXPECTED_HASH" ] && [ "$SKILL_HASH" = "$EXPECTED_HASH" ]; then
        echo "  PASS: SHA256 matches"
        PASSED=$((PASSED + 1))
    elif [ -n "$SKILL_HASH" ] && [ -n "$EXPECTED_HASH" ]; then
        echo "  FAIL: SHA256 mismatch"
        FAILED=$((FAILED + 1))
        ERRORS+=("SHA256 mismatch")
    else
        echo "  WARN: Cannot verify SHA256 (tool not available)"
    fi
fi

# ============================================================
# Check 10: SKILL.md frontmatter
# ============================================================
echo ""
echo "[10/10] Checking SKILL.md frontmatter..."

if head -20 "$VERIFY_SKILL_MD" | grep -q "^---" && head -20 "$VERIFY_SKILL_MD" | grep -q "name:" && head -20 "$VERIFY_SKILL_MD" | grep -q "description:"; then
    echo "  PASS: SKILL.md has valid frontmatter"
    PASSED=$((PASSED + 1))
else
    echo "  FAIL: SKILL.md missing frontmatter"
    FAILED=$((FAILED + 1))
    ERRORS+=("SKILL.md missing frontmatter")
fi

# ============================================================
# Cleanup
# ============================================================
rm -rf "$TEMP_DIR"

# ============================================================
# Summary
# ============================================================
echo ""
echo "=========================="
if [ $FAILED -eq 0 ]; then
    echo "RESULT: PASS ($PASSED checks passed)"
    exit 0
else
    echo "RESULT: FAIL ($FAILED errors, $PASSED passed)"
    for err in "${ERRORS[@]}"; do
        echo "  - $err"
    done
    exit 1
fi
