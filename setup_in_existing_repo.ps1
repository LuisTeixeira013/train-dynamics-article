param(
    [Parameter(Mandatory=$true)]
    [string]$TargetRepository
)

$ErrorActionPreference = "Stop"
$Source = Split-Path -Parent $MyInvocation.MyCommand.Path
$Target = (Resolve-Path $TargetRepository).Path

Write-Host "Installing Claude scientific research configuration into $Target"

$items = @(".claude", "scripts", "docs", "prompts")
foreach ($item in $items) {
    Copy-Item -Path (Join-Path $Source $item) -Destination $Target -Recurse -Force
}

$sourceClaude = Join-Path $Source "CLAUDE.md"
$targetClaude = Join-Path $Target "CLAUDE.md"
if (Test-Path $targetClaude) {
    Copy-Item $targetClaude "$targetClaude.backup" -Force
    Add-Content -Path $targetClaude -Value "`n`n---`n`n"
    Get-Content $sourceClaude | Add-Content -Path $targetClaude
    Write-Host "Existing CLAUDE.md preserved as CLAUDE.md.backup and merged." -ForegroundColor Yellow
} else {
    Copy-Item $sourceClaude $targetClaude
}

Copy-Item (Join-Path $Source "README.md") (Join-Path $Target "CLAUDE_RESEARCH_SETUP.md") -Force

$gitignore = Join-Path $Target ".gitignore"
$entries = @("CLAUDE.local.md", ".claude/settings.local.json", ".claude/agent-memory-local/", ".env", ".env.*", "secrets/")
if (-not (Test-Path $gitignore)) { New-Item $gitignore -ItemType File | Out-Null }
$current = Get-Content $gitignore -ErrorAction SilentlyContinue
foreach ($entry in $entries) {
    if ($current -notcontains $entry) { Add-Content $gitignore $entry }
}

Write-Host "Setup complete. Run:" -ForegroundColor Green
Write-Host "  cd `"$Target`""
Write-Host "  claude"
Write-Host "  /doctor"
Write-Host "  /memory"
Write-Host "Then restart with: claude --agent scientific-coordinator"
