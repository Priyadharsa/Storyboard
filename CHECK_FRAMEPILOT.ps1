param(
    [string]$RequestId = '',
    [int]$Port = 0
)
# Read-only API smoke check. Run while the server is running.
# Use -Port N for a custom FRAMEPILOT_PORT. Does not transmit credentials.
$ErrorActionPreference = 'Continue'
if ($Port -eq 0) { $Port = if ($env:FRAMEPILOT_PORT) { [int]$env:FRAMEPILOT_PORT } else { 8016 } }
$base = "http://127.0.0.1:$Port"
Write-Host "Checking FramePilot at $base" -ForegroundColor Cyan
$paths = @('/health', '/health/live', '/health/ready', '/book', '/production', '/api/styles', '/api/auth/me')
foreach ($path in $paths) {
    try {
        $r = Invoke-WebRequest -Uri "$base$path" -UseBasicParsing -TimeoutSec 20
        Write-Host "OK   $($r.StatusCode) $path | Request ID $($r.Headers['X-Request-ID'])" -ForegroundColor Green
    } catch {
        Write-Host "FAIL $path | $($_.Exception.Message)" -ForegroundColor Red
        if ($_.Exception.Response) {
            Write-Host "HTTP status: $([int]$_.Exception.Response.StatusCode)" -ForegroundColor Yellow
            Write-Host "Request ID: $($_.Exception.Response.Headers['X-Request-ID'])" -ForegroundColor Yellow
        }
    }
}
# This GET uses browser-session cookies in account mode. The PowerShell process
# has no cookies; a 401 would be normal, so only check it in local mode.
try {
    $me = Invoke-RestMethod -Uri "$base/api/auth/me" -TimeoutSec 10
    if ($me.mode -eq 'local') {
        $r = Invoke-WebRequest -Uri "$base/api/projects" -UseBasicParsing -TimeoutSec 20
        Write-Host "OK   $($r.StatusCode) /api/projects" -ForegroundColor Green
    } else {
        Write-Host 'Accounts mode: skipping the cookie-protected project API in PowerShell.' -ForegroundColor Yellow
    }
} catch {
    Write-Host "Account/project diagnostic: $($_.Exception.Message)" -ForegroundColor Yellow
}
$log = Join-Path $PSScriptRoot 'private_uploads\logs\framepilot.log'
Write-Host "Server log: $log" -ForegroundColor Cyan
if ($RequestId) {
    if (Test-Path $log) {
        Write-Host "Matching diagnostics for request $RequestId" -ForegroundColor Cyan
        Select-String -Path $log -SimpleMatch $RequestId -Context 0,25
    } else { Write-Host "No server log was found at $log" -ForegroundColor Yellow }
}
