# FramePilot AI v0.12.0 Windows launcher.
# Creates a LOCAL Windows .venv on first run, installs dependencies and starts the app.
# Safe to re-run: neither your .env nor uploaded reference images are overwritten.
$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot

$python = Join-Path $PSScriptRoot '.venv\Scripts\python.exe'
if (-not (Test-Path -LiteralPath $python)) {
    Write-Host 'Creating Windows virtual environment (.venv)...' -ForegroundColor Cyan
    if (Get-Command py -ErrorAction SilentlyContinue) {
        & py -3 -m venv .venv
    } elseif (Get-Command python -ErrorAction SilentlyContinue) {
        & python -m venv .venv
    } else {
        throw 'Python 3 was not found. Install Python 3 from python.org, enable the launcher, and run START_FRAMEPILOT.bat again.'
    }
    if ($LASTEXITCODE -ne 0) { throw 'Could not create .venv. Verify Python and the venv module.' }
}
if (-not (Test-Path -LiteralPath $python)) { throw 'The virtual environment is missing its Windows Python executable.' }

$requirementsHash = (Get-FileHash -Path 'requirements.txt' -Algorithm SHA256).Hash
$stamp = Join-Path $PSScriptRoot '.venv\.framepilot-requirements-hash'
$oldHash = if (Test-Path $stamp) { (Get-Content $stamp -Raw).Trim() } else { '' }
if ($oldHash -ne $requirementsHash) {
    Write-Host 'Installing project dependencies inside .venv...' -ForegroundColor Cyan
    & $python -m pip install --disable-pip-version-check -r requirements.txt
    if ($LASTEXITCODE -ne 0) { throw 'Dependency installation failed. Check the pip error above.' }
    Set-Content -Path $stamp -Value $requirementsHash -Encoding ASCII
} else {
    Write-Host 'Existing dependencies verified by requirements hash.' -ForegroundColor Green
}

if (-not (Test-Path -LiteralPath '.env')) {
    Copy-Item '.env.example' '.env'
    Write-Host '.env created from template. Fill in MODEL_API_KEY to enable Meta AI.' -ForegroundColor Yellow
}
Write-Host 'The API key stays in your local .env; do not commit or upload that file.' -ForegroundColor Yellow
if (-not (Get-Command tesseract -ErrorAction SilentlyContinue)) { Write-Host 'SCANNED PDF IMPORT: Tesseract executable not found on PATH. Install Tesseract OCR to import scans; searchable PDFs work without it.' -ForegroundColor Yellow }
$port = if ($env:FRAMEPILOT_PORT) { [int]$env:FRAMEPILOT_PORT } else { 8016 }
if ($port -lt 1024 -or $port -gt 65535) { throw 'FRAMEPILOT_PORT must be 1024-65535.' }
Write-Host "Opening FramePilot v0.13.0 at http://127.0.0.1:$port/book" -ForegroundColor Green
Write-Host 'Imports run in a separate persistent worker, and uploaded files are kept off the public webroot.' -ForegroundColor Cyan
$worker = $null
try {
    $worker = Start-Process -FilePath $python -ArgumentList @('-m','app.ingest_worker') -WorkingDirectory $PSScriptRoot -PassThru -WindowStyle Hidden
    & $python -m uvicorn app.main:app --host 127.0.0.1 --port $port
} finally {
    if ($worker) { Stop-Process -Id $worker.Id -Force -ErrorAction SilentlyContinue }
}
