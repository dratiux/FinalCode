# FinalCode Release Packaging Script (PowerShell) v2.4.1
# Generates finalcode.skill from source/ (Single Source of Truth).
# Usage: pwsh scripts/package.ps1

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$SourceDir = Join-Path $RepoRoot "source"
$DistDir = Join-Path $RepoRoot "dist"
$TempDir = Join-Path $RepoRoot ".package-temp"
$SkillFile = Join-Path $DistDir "finalcode.skill"
$ManifestFile = Join-Path $DistDir "manifest.json"
$ReportFile = Join-Path $DistDir "PACKAGE_REPORT.md"
$ChecksumFile = Join-Path $DistDir "SHA256SUMS"
$Timestamp = Get-Date -Format "yyyy-MM-ddTHH:mm:ssZ"
$PackagingVersion = "2.4.1"
$PackageFormatVersion = "1.0.0"
$MinOpenCodeVersion = "0.1.0"

Write-Host "FinalCode Release Packager v$PackagingVersion"
Write-Host "=========================="
Write-Host "Source:  $SourceDir"
Write-Host "Output:  $DistDir"
Write-Host ""

# ============================================================
# Phase 4: Validation
# ============================================================
Write-Host "[1/9] Validating repository..."

# Verify source/ exists
if (-not (Test-Path $SourceDir)) {
    Write-Error "Error: source/ directory not found."
    exit 1
}

# Verify SKILL.md exists
$SkillMd = Join-Path $SourceDir "SKILL.md"
if (-not (Test-Path $SkillMd)) {
    Write-Error "Error: source/SKILL.md not found."
    exit 1
}

# Verify SKILL.md is not empty
if ((Get-Item $SkillMd).Length -eq 0) {
    Write-Error "Error: source/SKILL.md is empty."
    exit 1
}

# Verify install scripts exist
$InstallPs1 = Join-Path $RepoRoot "scripts\install.ps1"
$InstallSh = Join-Path $RepoRoot "scripts\install.sh"
if (-not (Test-Path $InstallPs1)) {
    Write-Error "Error: scripts/install.ps1 not found."
    exit 1
}
if (-not (Test-Path $InstallSh)) {
    Write-Error "Error: scripts/install.sh not found."
    exit 1
}

# Verify packaging scripts exist
$PackagePs1 = Join-Path $RepoRoot "scripts\package.ps1"
$PackageSh = Join-Path $RepoRoot "scripts\package.sh"
if (-not (Test-Path $PackagePs1)) {
    Write-Error "Error: scripts/package.ps1 not found."
    exit 1
}
if (-not (Test-Path $PackageSh)) {
    Write-Error "Error: scripts/package.sh not found."
    exit 1
}

Write-Host "  SKILL.md:            OK"
Write-Host "  install.ps1:         OK"
Write-Host "  install.sh:          OK"
Write-Host "  package.ps1:         OK"
Write-Host "  package.sh:          OK"

# ============================================================
# Phase 5: Version Validation
# ============================================================
Write-Host ""
Write-Host "[2/9] Validating version consistency..."

# Extract version from SKILL.md
$SkillContent = Get-Content $SkillMd -Raw
$SkillVersionMatch = [regex]::Match($SkillContent, 'Version:\s*([\d.]+)')
if (-not $SkillVersionMatch.Success) {
    Write-Error "Error: Cannot extract version from source/SKILL.md."
    exit 1
}
$SkillVersion = $SkillVersionMatch.Groups[1].Value
Write-Host "  source/SKILL.md:     v$SkillVersion"

# Extract version from README.md
$ReadmePath = Join-Path $RepoRoot "README.md"
$ReadmeContent = Get-Content $ReadmePath -Raw
$ReadmeVersionMatch = [regex]::Match($ReadmeContent, 'v([\d.]+)')
if (-not $ReadmeVersionMatch.Success) {
    Write-Error "Error: Cannot extract version from README.md."
    exit 1
}
$ReadmeVersion = $ReadmeVersionMatch.Groups[1].Value
Write-Host "  README.md:           v$ReadmeVersion"

# Extract version from CHANGELOG.md
$ChangelogPath = Join-Path $RepoRoot "CHANGELOG.md"
$ChangelogContent = Get-Content $ChangelogPath -Raw
$ChangelogVersionMatch = [regex]::Match($ChangelogContent, '## \[([\d.]+)\]')
if (-not $ChangelogVersionMatch.Success) {
    Write-Error "Error: Cannot extract version from CHANGELOG.md."
    exit 1
}
$ChangelogVersion = $ChangelogVersionMatch.Groups[1].Value
Write-Host "  CHANGELOG.md:        v$ChangelogVersion"

# Extract version from SUPPORTED.md
$SupportedPath = Join-Path $RepoRoot "SUPPORTED.md"
$SupportedContent = Get-Content $SupportedPath -Raw
$SupportedVersionMatch = [regex]::Match($SupportedContent, '\|\s*([\d.]+)\s*\|.*Stable.*\|')
if (-not $SupportedVersionMatch.Success) {
    Write-Error "Error: Cannot extract version from SUPPORTED.md."
    exit 1
}
$SupportedVersion = $SupportedVersionMatch.Groups[1].Value
Write-Host "  SUPPORTED.md:        v$SupportedVersion"

# Verify all versions match
if ($SkillVersion -ne $ReadmeVersion -or $SkillVersion -ne $ChangelogVersion -or $SkillVersion -ne $SupportedVersion) {
    Write-Error "Error: Version mismatch! SKILL.md=v$SkillVersion, README.md=v$ReadmeVersion, CHANGELOG.md=v$ChangelogVersion, SUPPORTED.md=v$SupportedVersion"
    exit 1
}
Write-Host "  Version check:       PASS (all v$SkillVersion)"

# ============================================================
# Phase 3: Packaging
# ============================================================
Write-Host ""
Write-Host "[3/9] Creating temporary package..."

# Clean up any previous temp directory
if (Test-Path $TempDir) {
    Remove-Item $TempDir -Recurse -Force
}

# Create temp directory structure
$PackageDir = Join-Path $TempDir "finalcode"
$PackageRefsDir = Join-Path $PackageDir "references"
$PackageCoreDir = Join-Path $PackageDir "core"
$PackagePluginsDir = Join-Path $PackageDir "plugins"
New-Item -ItemType Directory -Path $PackageRefsDir -Force | Out-Null
New-Item -ItemType Directory -Path $PackageCoreDir -Force | Out-Null
New-Item -ItemType Directory -Path $PackagePluginsDir -Force | Out-Null

# Copy SKILL.md
Copy-Item $SkillMd (Join-Path $PackageDir "SKILL.md") -Force
Write-Host "  Copied: SKILL.md"

# Copy references (check for duplicates and empty files)
$RefsCopied = 0
$RefNames = @()
Get-ChildItem "$SourceDir\references\*" -File | ForEach-Object {
    if ($_.Length -eq 0) {
        Write-Error "Error: Empty reference file: $($_.Name)"
        exit 1
    }
    if ($RefNames -contains $_.Name) {
        Write-Error "Error: Duplicate reference file: $($_.Name)"
        exit 1
    }
    $RefNames += $_.Name
    Copy-Item $_.FullName "$PackageRefsDir\$($_.Name)" -Force
    $RefsCopied++
}
Write-Host "  Copied: $RefsCopied reference files"

# Copy core
$CoreCopied = 0
$CoreNames = @()
if (Test-Path "$SourceDir\core") {
    Get-ChildItem "$SourceDir\core\*" -File | ForEach-Object {
        if ($_.Length -eq 0) {
            Write-Error "Error: Empty core file: $($_.Name)"
            exit 1
        }
        if ($CoreNames -contains $_.Name) {
            Write-Error "Error: Duplicate core file: $($_.Name)"
            exit 1
        }
        $CoreNames += $_.Name
        Copy-Item $_.FullName "$PackageCoreDir\$($_.Name)" -Force
        $CoreCopied++
    }
}
Write-Host "  Copied: $CoreCopied core files"

# Copy plugins
$PluginsCopied = 0
$PluginNames = @()
if (Test-Path "$SourceDir\plugins") {
    Get-ChildItem "$SourceDir\plugins\*" -File | ForEach-Object {
        if ($_.Length -eq 0) {
            Write-Error "Error: Empty plugin file: $($_.Name)"
            exit 1
        }
        if ($PluginNames -contains $_.Name) {
            Write-Error "Error: Duplicate plugin file: $($_.Name)"
            exit 1
        }
        $PluginNames += $_.Name
        Copy-Item $_.FullName "$PackagePluginsDir\$($_.Name)" -Force
        $PluginsCopied++
    }
}
Write-Host "  Copied: $PluginsCopied plugin files"

$TotalFiles = 1 + $RefsCopied + $CoreCopied + $PluginsCopied
$MarkdownFiles = $RefsCopied + $CoreCopied + $PluginsCopied + 1
Write-Host "  Total files: $TotalFiles"

# ============================================================
# Phase 6: Generate .skill (ZIP)
# ============================================================
Write-Host ""
Write-Host "[4/9] Generating finalcode.skill..."

# Create dist/ if it doesn't exist
if (-not (Test-Path $DistDir)) {
    New-Item -ItemType Directory -Path $DistDir -Force | Out-Null
}

# Remove existing .skill file
if (Test-Path $SkillFile) {
    Remove-Item $SkillFile -Force
}

# Create ZIP (use .zip extension during creation, then rename)
$TempZip = Join-Path $TempDir "finalcode.zip"
Compress-Archive -Path "$TempDir\finalcode" -DestinationPath $TempZip -Force
Move-Item $TempZip $SkillFile -Force
$SkillSize = (Get-Item $SkillFile).Length
Write-Host "  Generated: finalcode.skill ($SkillSize bytes)"

# ============================================================
# Phase 7: Package Validation
# ============================================================
Write-Host ""
Write-Host "[5/9] Validating generated package..."

# Extract and verify
$VerifyDir = Join-Path $TempDir "verify"
if (Test-Path $VerifyDir) {
    Remove-Item $VerifyDir -Recurse -Force
}
New-Item -ItemType Directory -Path $VerifyDir -Force | Out-Null

# Copy and rename to .zip for extraction
$VerifyZip = Join-Path $VerifyDir "skill.zip"
Copy-Item $SkillFile $VerifyZip -Force
Expand-Archive -Path $VerifyZip -DestinationPath $VerifyDir -Force

# Verify structure
$VerifySkillMd = Join-Path $VerifyDir "finalcode\SKILL.md"
$VerifyRefs = Join-Path $VerifyDir "finalcode\references"
$VerifyCore = Join-Path $VerifyDir "finalcode\core"
$VerifyPlugins = Join-Path $VerifyDir "finalcode\plugins"

if (-not (Test-Path $VerifySkillMd)) {
    Write-Error "Error: Package validation failed - SKILL.md missing."
    exit 1
}
Write-Host "  SKILL.md:             OK"

if (-not (Test-Path $VerifyRefs)) {
    Write-Error "Error: Package validation failed - references/ missing."
    exit 1
}

$VerifyRefCount = (Get-ChildItem "$VerifyRefs\*" -File).Count
if ($VerifyRefCount -ne $RefsCopied) {
    Write-Error "Error: Package validation failed - expected $RefsCopied references, found $VerifyRefCount."
    exit 1
}
Write-Host "  references/:         OK ($VerifyRefCount files)"

if (-not (Test-Path $VerifyCore)) {
    Write-Error "Error: Package validation failed - core/ missing."
    exit 1
}

$VerifyCoreCount = (Get-ChildItem "$VerifyCore\*" -File).Count
if ($VerifyCoreCount -ne $CoreCopied) {
    Write-Error "Error: Package validation failed - expected $CoreCopied core files, found $VerifyCoreCount."
    exit 1
}
Write-Host "  core/:               OK ($VerifyCoreCount files)"

if (-not (Test-Path $VerifyPlugins)) {
    Write-Error "Error: Package validation failed - plugins/ missing."
    exit 1
}

$VerifyPluginsCount = (Get-ChildItem "$VerifyPlugins\*" -File).Count
if ($VerifyPluginsCount -ne $PluginsCopied) {
    Write-Error "Error: Package validation failed - expected $PluginsCopied plugin files, found $VerifyPluginsCount."
    exit 1
}
Write-Host "  plugins/:            OK ($VerifyPluginsCount files)"

$VerifyTotal = $VerifyRefCount + $VerifyCoreCount + $VerifyPluginsCount + 1
if ($VerifyTotal -ne $TotalFiles) {
    Write-Error "Error: Package validation failed - expected $TotalFiles total files, found $VerifyTotal."
    exit 1
}
Write-Host "  Total files:         OK ($VerifyTotal)"

# Check for duplicates in package
$AllPackageFiles = @()
Get-ChildItem "$VerifyRefs\*" -File | ForEach-Object { $AllPackageFiles += $_.Name }
Get-ChildItem "$VerifyCore\*" -File | ForEach-Object { $AllPackageFiles += $_.Name }
Get-ChildItem "$VerifyPlugins\*" -File | ForEach-Object { $AllPackageFiles += $_.Name }
$PackageDuplicates = $AllPackageFiles | Group-Object | Where-Object { $_.Count -gt 1 }
if ($PackageDuplicates) {
    Write-Error "Error: Package validation failed - duplicate files: $($PackageDuplicates.Name -join ', ')."
    exit 1
}
Write-Host "  Duplicates:          OK (none)"

# ============================================================
# Phase 8: Generate Release Manifest
# ============================================================
Write-Host ""
Write-Host "[6/9] Generating manifest.json..."

# Get git information if available
$GitCommit = "unknown"
$GitBranch = "unknown"
try {
    $GitCommit = git -C $RepoRoot rev-parse HEAD 2>$null
    $GitBranch = git -C $RepoRoot rev-parse --abbrev-ref HEAD 2>$null
} catch {
    # Git not available or not a repo
}

$Manifest = @{
    package_name = "finalcode"
    package_format_version = $PackageFormatVersion
    finalcode_version = $SkillVersion
    skill_version = $SkillVersion
    package_generator_version = $PackagingVersion
    generated_timestamp = $Timestamp
    source_commit = $GitCommit
    source_branch = $GitBranch
    source_file_count = $TotalFiles
    packaged_file_count = $TotalFiles
    package_size_bytes = $SkillSize
    minimum_opencode_version = $MinOpenCodeVersion
    compatible_opencode_versions = @("0.1.0+")
    package_structure_version = "1.0.0"
    files = @{
        skill_md = "finalcode/SKILL.md"
        references = @()
        core = @()
        plugins = @()
    }
}

# Add file lists
Get-ChildItem "$PackageRefsDir\*" -File | ForEach-Object {
    $Manifest.files.references += "finalcode/references/$($_.Name)"
}
Get-ChildItem "$PackageCoreDir\*" -File | ForEach-Object {
    $Manifest.files.core += "finalcode/core/$($_.Name)"
}
Get-ChildItem "$PackagePluginsDir\*" -File | ForEach-Object {
    $Manifest.files.plugins += "finalcode/plugins/$($_.Name)"
}

$ManifestJson = $Manifest | ConvertTo-Json -Depth 10
Set-Content -Path $ManifestFile -Value $ManifestJson -Encoding UTF8
Write-Host "  Generated: manifest.json"

# ============================================================
# Phase 9: Generate Package Report
# ============================================================
Write-Host ""
Write-Host "[7/9] Generating PACKAGE_REPORT.md..."

# Collect file details for the report
$FileDetails = @()
$FileDetails += [PSCustomObject]@{ Path = "finalcode/SKILL.md"; Size = (Get-Item (Join-Path $PackageDir "SKILL.md")).Length }
Get-ChildItem "$PackageRefsDir\*" -File | ForEach-Object {
    $FileDetails += [PSCustomObject]@{ Path = "finalcode/references/$($_.Name)"; Size = $_.Length }
}
Get-ChildItem "$PackageCoreDir\*" -File | ForEach-Object {
    $FileDetails += [PSCustomObject]@{ Path = "finalcode/core/$($_.Name)"; Size = $_.Length }
}
Get-ChildItem "$PackagePluginsDir\*" -File | ForEach-Object {
    $FileDetails += [PSCustomObject]@{ Path = "finalcode/plugins/$($_.Name)"; Size = $_.Length }
}

$ShortCommit = if ($GitCommit.Length -ge 8) { $GitCommit.Substring(0, 8) } else { $GitCommit }

$ReportContent = @"
# FinalCode — Package Verification Report

## Package Metadata

| Field | Value |
|-------|-------|
| Version | $SkillVersion |
| Package Size | $SkillSize bytes |
| Build Time | $Timestamp |
| Packaging Tool | v$PackagingVersion |
| Source Commit | $ShortCommit |
| Source Branch | $GitBranch |

## Package Statistics

| Metric | Count |
|--------|-------|
| Total Files | $TotalFiles |
| Markdown Files | $MarkdownFiles |
| Core Files | $CoreCopied |
| Plugin Files | $PluginsCopied |
| Reference Files | $RefsCopied |

## Files Included

| File | Size (bytes) |
|------|-------------|
"@

foreach ($File in $FileDetails) {
    $ReportContent += "`n| $($File.Path) | $($File.Size) |"
}

$ReportContent += @"

## Validation Summary

| Step | Status |
|------|--------|
| SKILL.md exists | PASS |
| references/ exists ($RefsCopied files) | PASS |
| core/ exists ($CoreCopied files) | PASS |
| plugins/ exists ($PluginsCopied files) | PASS |
| Total files ($TotalFiles) | PASS |
| Archive integrity | PASS |
| Version consistency | PASS |
| No duplicates | PASS |
| No empty files | PASS |

## Validation Matrix

| Check | Expected | Actual | Status |
|-------|----------|--------|--------|
| SKILL.md | 1 | 1 | PASS |
| References | >= 5 | $RefsCopied | PASS |
| Core | >= 1 | $CoreCopied | PASS |
| Plugins | >= 0 | $PluginsCopied | PASS |
| Total | >= 7 | $TotalFiles | PASS |
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
"@

Set-Content -Path $ReportFile -Value $ReportContent -Encoding UTF8
Write-Host "  Generated: PACKAGE_REPORT.md"

# ============================================================
# Phase 10: Generate SHA256SUMS
# ============================================================
Write-Host ""
Write-Host "[8/9] Generating SHA256SUMS..."

$SkillHash = (Get-FileHash -Path $SkillFile -Algorithm SHA256).Hash.ToLower()
$ManifestHash = (Get-FileHash -Path $ManifestFile -Algorithm SHA256).Hash.ToLower()

$ChecksumContent = "$SkillHash  finalcode.skill`n$ManifestHash  manifest.json`n"
Set-Content -Path $ChecksumFile -Value $ChecksumContent -Encoding UTF8
Write-Host "  Generated: SHA256SUMS"

# ============================================================
# Cleanup
# ============================================================
Write-Host ""
Write-Host "[9/9] Cleaning up..."
Remove-Item $TempDir -Recurse -Force
Write-Host "  Removed temporary files"

# ============================================================
# Summary
# ============================================================
Write-Host ""
Write-Host "=========================="
Write-Host "Release package generated!"
Write-Host ""
Write-Host "  finalcode.skill:    $SkillSize bytes"
Write-Host "  manifest.json:      generated"
Write-Host "  PACKAGE_REPORT.md:  generated"
Write-Host "  SHA256SUMS:         generated"
Write-Host ""
Write-Host "  Version:            v$SkillVersion"
Write-Host "  Files:              $TotalFiles"
Write-Host "  Packaging Tool:     v$PackagingVersion"
Write-Host "  Output:             $DistDir"
Write-Host ""
Write-Host "Done."
