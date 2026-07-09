# FinalCode Installation Script (PowerShell)
# Copies source files to the OpenCode skill installation directory.
# Usage: pwsh scripts/install.ps1

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$SourceDir = Join-Path $RepoRoot "source"
$TargetDir = Join-Path $RepoRoot ".opencode\skills\finalcode"

Write-Host "FinalCode Installer"
Write-Host "==================="
Write-Host "Source:  $SourceDir"
Write-Host "Target:  $TargetDir"
Write-Host ""

# Validate source exists
$skillFile = Join-Path $SourceDir "SKILL.md"
$refsDir = Join-Path $SourceDir "references"
$coreDir = Join-Path $SourceDir "core"
$pluginsDir = Join-Path $SourceDir "plugins"

if (-not (Test-Path $skillFile)) {
    Write-Error "Error: source/SKILL.md not found."
    exit 1
}

if (-not (Test-Path $refsDir)) {
    Write-Error "Error: source/references/ not found."
    exit 1
}

# Create target directories
New-Item -ItemType Directory -Path "$TargetDir\references" -Force | Out-Null
New-Item -ItemType Directory -Path "$TargetDir\core" -Force | Out-Null
New-Item -ItemType Directory -Path "$TargetDir\plugins" -Force | Out-Null

# Copy SKILL.md
Copy-Item $skillFile "$TargetDir\SKILL.md" -Force
Write-Host "Installed: SKILL.md"

# Copy references
Get-ChildItem "$refsDir\*" -File | ForEach-Object {
    Copy-Item $_.FullName "$TargetDir\references\$($_.Name)" -Force
    Write-Host "Installed: references/$($_.Name)"
}

# Copy core
if (Test-Path $coreDir) {
    Get-ChildItem "$coreDir\*" -File | ForEach-Object {
        Copy-Item $_.FullName "$TargetDir\core\$($_.Name)" -Force
        Write-Host "Installed: core/$($_.Name)"
    }
}

# Copy plugins
if (Test-Path $pluginsDir) {
    Get-ChildItem "$pluginsDir\*" -File | ForEach-Object {
        Copy-Item $_.FullName "$TargetDir\plugins\$($_.Name)" -Force
        Write-Host "Installed: plugins/$($_.Name)"
    }
}

Write-Host ""
Write-Host "Done. FinalCode skill installed to .opencode\skills\finalcode\"
