# Reproducible local regression check, designed for Windows PowerShell.
$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot
$py = '.\.venv\Scripts\python.exe'
if (-not (Test-Path $py)) { throw 'Run START_FRAMEPILOT.bat once to create .venv.' }
& $py -m pip install --disable-pip-version-check pytest httpx
if ($LASTEXITCODE -ne 0) { throw 'Test dependencies could not be installed.' }
& $py -m pytest -q
if ($LASTEXITCODE -ne 0) { throw 'Python regression tests failed.' }
if (Get-Command node -ErrorAction SilentlyContinue) {
  & node --test tests\*.test.mjs
  if ($LASTEXITCODE -ne 0) { throw 'JavaScript regression tests failed.' }
} else {
  Write-Host 'Node.js not installed; browser/geometry tests were skipped.' -ForegroundColor Yellow
}
Write-Host 'FramePilot regression tests passed. Live Meta and browser/WebGL still require manual verification.' -ForegroundColor Green
