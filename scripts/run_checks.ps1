$ErrorActionPreference = "Stop"
Set-Location (Split-Path $PSScriptRoot -Parent)

Write-Host "== Repository status =="
git status --short

if (Test-Path "requirements.txt") {
    Write-Host "== Python environment =="
    python --version
}

if (Test-Path "pyproject.toml") {
    Write-Host "== Ruff =="
    python -m ruff check .
}

if (Test-Path "tests") {
    Write-Host "== Pytest =="
    python -m pytest -q
}

$required = @(
    "data/provenance.csv",
    "reports/evidence_audit.md",
    "reports/numerical_verification.md",
    "reports/reproducibility_audit.md",
    "manuscript/claim_evidence_map.csv",
    "results/result_manifest.json"
)

$missing = @()
foreach ($path in $required) {
    if (-not (Test-Path $path)) { $missing += $path }
}
if ($missing.Count -gt 0) {
    Write-Host "Missing required research artifacts:" -ForegroundColor Red
    $missing | ForEach-Object { Write-Host " - $_" }
    exit 1
}

Write-Host "All configured checks passed." -ForegroundColor Green
