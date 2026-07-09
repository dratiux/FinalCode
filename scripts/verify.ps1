# FinalCode Package Verification Script (PowerShell)
# Validates an existing .skill package without rebuilding.
# Usage: pwsh scripts/verify.ps1 [path-to-skill-file]

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$DefaultSkillFile = Join-Path $RepoRoot "dist\finalcode.skill"
$SkillFile = if ($args.Count -gt 0) { $args[0] } else { $DefaultSkillFile }
$TempDir = Join-Path $RepoRoot ".verify-temp"
$Passed = 0
$Failed = 0
$Errors = @()

Write-Host "FinalCode Package Verifier"
Write-Host "=========================="
Write-Host "Package: $SkillFile"
Write-Host ""

# ============================================================
# Check 1: File exists
# ============================================================
Write-Host "[1/10] Checking file exists..."
if (-not (Test-Path $SkillFile)) {
    Write-Host "  FAIL: File not found" -ForegroundColor Red
    $Failed++
    $Errors += "File not found: $SkillFile"
} else {
    $SkillSize = (Get-Item $SkillFile).Length
    Write-Host "  PASS: File exists ($SkillSize bytes)" -ForegroundColor Green
    $Passed++
}

if ($Failed -gt 0) {
    Write-Host ""
    Write-Host "RESULT: FAIL ($Failed errors)" -ForegroundColor Red
    foreach ($Err in $Errors) {
        Write-Host "  - $Err" -ForegroundColor Red
    }
    exit 1
}

# ============================================================
# Check 2: Archive integrity
# ============================================================
Write-Host ""
Write-Host "[2/10] Checking archive integrity..."

# Clean up any previous temp directory
if (Test-Path $TempDir) {
    Remove-Item $TempDir -Recurse -Force
}
New-Item -ItemType Directory -Path $TempDir -Force | Out-Null

# Copy and rename to .zip for extraction
$VerifyZip = Join-Path $TempDir "skill.zip"
Copy-Item $SkillFile $VerifyZip -Force

try {
    Expand-Archive -Path $VerifyZip -DestinationPath $TempDir -Force
    Write-Host "  PASS: Archive is valid ZIP" -ForegroundColor Green
    $Passed++
} catch {
    Write-Host "  FAIL: Archive is not a valid ZIP" -ForegroundColor Red
    $Failed++
    $Errors += "Archive is not a valid ZIP"
    Remove-Item $TempDir -Recurse -Force
    Write-Host ""
    Write-Host "RESULT: FAIL ($Failed errors)" -ForegroundColor Red
    foreach ($Err in $Errors) {
        Write-Host "  - $Err" -ForegroundColor Red
    }
    exit 1
}

# ============================================================
# Check 3: Directory structure
# ============================================================
Write-Host ""
Write-Host "[3/10] Checking directory structure..."

$VerifySkillMd = Join-Path $TempDir "finalcode\SKILL.md"
$VerifyRefs = Join-Path $TempDir "finalcode\references"
$VerifyCore = Join-Path $TempDir "finalcode\core"
$VerifyPlugins = Join-Path $TempDir "finalcode\plugins"

$StructureOk = $true

if (-not (Test-Path $VerifySkillMd)) {
    Write-Host "  FAIL: SKILL.md missing" -ForegroundColor Red
    $Failed++
    $Errors += "SKILL.md missing from archive"
    $StructureOk = $false
} else {
    Write-Host "  SKILL.md:             OK" -ForegroundColor Green
    $Passed++
}

if (-not (Test-Path $VerifyRefs)) {
    Write-Host "  FAIL: references/ missing" -ForegroundColor Red
    $Failed++
    $Errors += "references/ directory missing from archive"
    $StructureOk = $false
} else {
    Write-Host "  references/:         OK" -ForegroundColor Green
    $Passed++
}

if (-not (Test-Path $VerifyCore)) {
    Write-Host "  FAIL: core/ missing" -ForegroundColor Red
    $Failed++
    $Errors += "core/ directory missing from archive"
    $StructureOk = $false
} else {
    Write-Host "  core/:               OK" -ForegroundColor Green
    $Passed++
}

if (-not (Test-Path $VerifyPlugins)) {
    Write-Host "  FAIL: plugins/ missing" -ForegroundColor Red
    $Failed++
    $Errors += "plugins/ directory missing from archive"
    $StructureOk = $false
} else {
    Write-Host "  plugins/:            OK" -ForegroundColor Green
    $Passed++
}

# ============================================================
# Check 4: Required files
# ============================================================
Write-Host ""
Write-Host "[4/10] Checking required files..."

$RequiredRefs = @("gates.md", "security-gate.md", "examples.md", "architecture.md", "configuration.md")
foreach ($Ref in $RequiredRefs) {
    $RefPath = Join-Path $VerifyRefs $Ref
    if (-not (Test-Path $RefPath)) {
        Write-Host "  FAIL: Required reference missing: $Ref" -ForegroundColor Red
        $Failed++
        $Errors += "Required reference missing: $Ref"
    } else {
        Write-Host "  ${Ref}:                OK" -ForegroundColor Green
        $Passed++
    }
}

# ============================================================
# Check 5: No duplicate files
# ============================================================
Write-Host ""
Write-Host "[5/10] Checking for duplicates..."

$AllFiles = @()
if (Test-Path $VerifySkillMd) { $AllFiles += (Get-Item $VerifySkillMd).Name }
Get-ChildItem "$VerifyRefs\*" -File | ForEach-Object { $AllFiles += $_.Name }
Get-ChildItem "$VerifyCore\*" -File | ForEach-Object { $AllFiles += $_.Name }
Get-ChildItem "$VerifyPlugins\*" -File | ForEach-Object { $AllFiles += $_.Name }

$Duplicates = $AllFiles | Group-Object | Where-Object { $_.Count -gt 1 }
if ($Duplicates) {
    Write-Host "  FAIL: Duplicate files found: $($Duplicates.Name -join ', ')" -ForegroundColor Red
    $Failed++
    $Errors += "Duplicate files found: $($Duplicates.Name -join ', ')"
} else {
    Write-Host "  PASS: No duplicates" -ForegroundColor Green
    $Passed++
}

# ============================================================
# Check 6: No empty files
# ============================================================
Write-Host ""
Write-Host "[6/10] Checking for empty files..."

$EmptyFiles = @()
if ((Get-Item $VerifySkillMd).Length -eq 0) { $EmptyFiles += "SKILL.md" }
Get-ChildItem "$VerifyRefs\*" -File | Where-Object { $_.Length -eq 0 } | ForEach-Object { $EmptyFiles += $_.Name }
Get-ChildItem "$VerifyCore\*" -File | Where-Object { $_.Length -eq 0 } | ForEach-Object { $EmptyFiles += $_.Name }
Get-ChildItem "$VerifyPlugins\*" -File | Where-Object { $_.Length -eq 0 } | ForEach-Object { $EmptyFiles += $_.Name }

if ($EmptyFiles.Count -gt 0) {
    Write-Host "  FAIL: Empty files found: $($EmptyFiles -join ', ')" -ForegroundColor Red
    $Failed++
    $Errors += "Empty files found: $($EmptyFiles -join ', ')"
} else {
    Write-Host "  PASS: No empty files" -ForegroundColor Green
    $Passed++
}

# ============================================================
# Check 7: File count
# ============================================================
Write-Host ""
Write-Host "[7/10] Checking file count..."

$RefCount = (Get-ChildItem "$VerifyRefs\*" -File).Count
$CoreCount = (Get-ChildItem "$VerifyCore\*" -File).Count
$PluginsCount = (Get-ChildItem "$VerifyPlugins\*" -File).Count
$TotalCount = $RefCount + $CoreCount + $PluginsCount + 1

Write-Host "  References:  $RefCount"
Write-Host "  Core:        $CoreCount"
Write-Host "  Plugins:     $PluginsCount"
Write-Host "  SKILL.md:    1"
Write-Host "  Total:       $TotalCount"

if ($TotalCount -lt 5) {
    Write-Host "  FAIL: Too few files (expected >= 5)" -ForegroundColor Red
    $Failed++
    $Errors += "Too few files in package"
} else {
    Write-Host "  PASS: File count OK" -ForegroundColor Green
    $Passed++
}

# ============================================================
# Check 8: Manifest exists
# ============================================================
Write-Host ""
Write-Host "[8/10] Checking manifest..."

$ManifestDir = Split-Path $SkillFile -Parent
$ManifestFile = Join-Path $ManifestDir "manifest.json"

if (-not (Test-Path $ManifestFile)) {
    Write-Host "  WARN: manifest.json not found (optional)" -ForegroundColor Yellow
} else {
    try {
        $Manifest = Get-Content $ManifestFile -Raw | ConvertFrom-Json
        if ($Manifest.finalcode_version) {
            Write-Host "  PASS: Manifest valid (v$($Manifest.finalcode_version))" -ForegroundColor Green
            $Passed++
        } else {
            Write-Host "  WARN: Manifest missing version field" -ForegroundColor Yellow
        }
    } catch {
        Write-Host "  WARN: Manifest is not valid JSON" -ForegroundColor Yellow
    }
}

# ============================================================
# Check 9: SHA256
# ============================================================
Write-Host ""
Write-Host "[9/10] Checking SHA256..."

$ChecksumFile = Join-Path $ManifestDir "SHA256SUMS"
if (-not (Test-Path $ChecksumFile)) {
    Write-Host "  WARN: SHA256SUMS not found (optional)" -ForegroundColor Yellow
} else {
    $SkillHash = (Get-FileHash -Path $SkillFile -Algorithm SHA256).Hash.ToLower()
    $ExpectedHash = (Get-Content $ChecksumFile | Where-Object { $_ -match "finalcode\.skill" } | Select-Object -First 1) -replace '\s+.*', ''
    if ($SkillHash -eq $ExpectedHash) {
        Write-Host "  PASS: SHA256 matches" -ForegroundColor Green
        $Passed++
    } else {
        Write-Host "  FAIL: SHA256 mismatch" -ForegroundColor Red
        $Failed++
        $Errors += "SHA256 mismatch"
    }
}

# ============================================================
# Check 10: SKILL.md frontmatter
# ============================================================
Write-Host ""
Write-Host "[10/10] Checking SKILL.md frontmatter..."

$SkillContent = Get-Content $VerifySkillMd -Raw
if ($SkillContent -match '^---\s*\nname:\s*\S+' -and $SkillContent -match 'description:\s*\S+') {
    Write-Host "  PASS: SKILL.md has valid frontmatter" -ForegroundColor Green
    $Passed++
} else {
    Write-Host "  FAIL: SKILL.md missing frontmatter" -ForegroundColor Red
    $Failed++
    $Errors += "SKILL.md missing frontmatter"
}

# ============================================================
# Cleanup
# ============================================================
Remove-Item $TempDir -Recurse -Force

# ============================================================
# Summary
# ============================================================
Write-Host ""
Write-Host "=========================="
if ($Failed -eq 0) {
    Write-Host "RESULT: PASS ($Passed checks passed)" -ForegroundColor Green
    exit 0
} else {
    Write-Host "RESULT: FAIL ($Failed errors, $Passed passed)" -ForegroundColor Red
    foreach ($Err in $Errors) {
        Write-Host "  - $Err" -ForegroundColor Red
    }
    exit 1
}
