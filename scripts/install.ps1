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

# Create .finalcode directory if missing
$FinalcodeDir = Join-Path $RepoRoot ".finalcode"
if (-not (Test-Path $FinalcodeDir)) {
    New-Item -ItemType Directory -Path "$FinalcodeDir\reports" -Force | Out-Null
    Write-Host "Created: .finalcode/reports/"
}

# Copy SKILL.md
Copy-Item $skillFile "$TargetDir\SKILL.md" -Force
Write-Host "Installed: SKILL.md"

# Copy references
Get-ChildItem "$refsDir\*" -File | ForEach-Object {
    Copy-Item $_.FullName "$TargetDir\references\$($_.Name)" -Force
    Write-Host "Installed: references/$($_.Name)"
}

Write-Host ""
Write-Host "Done. FinalCode skill installed to .opencode\skills\finalcode\"
