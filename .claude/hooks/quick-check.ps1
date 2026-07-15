$ErrorActionPreference = "Continue"
Set-Location $env:CLAUDE_PROJECT_DIR

$messages = @()
if (Test-Path "pyproject.toml") {
    python -m ruff check src tests 2>&1 | Out-String | ForEach-Object { $messages += $_ }
}
if (Test-Path "tests") {
    python -m pytest -q 2>&1 | Out-String | ForEach-Object { $messages += $_ }
}

$result = ($messages -join "`n").Trim()
if (-not $result) { $result = "Quick checks completed; no configured Python checks were found." }
$escaped = $result | ConvertTo-Json -Compress
Write-Output "{`"hookSpecificOutput`":{`"hookEventName`":`"PostToolUse`",`"additionalContext`":$escaped}}"
exit 0
