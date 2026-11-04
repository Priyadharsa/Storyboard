#!/usr/bin/env bash
# macOS / Linux launcher for the FramePilot browser application.
set -Eeuo pipefail
cd "$(dirname "$0")"
PYTHON="${FRAMEPILOT_PYTHON:-python3}"
if ! command -v "$PYTHON" >/dev/null 2>&1; then
  echo "Python 3.10+ required. Install Python and rerun this script." >&2
  exit 1
fi
if [[ ! -f .venv/bin/python ]]; then
  echo "Creating virtual environment..."
  "$PYTHON" -m venv .venv
fi
REQUIREMENTS_HASH="$(.venv/bin/python -c 'import hashlib; print(hashlib.sha256(open("requirements.txt","rb").read()).hexdigest())')"
STAMP=.venv/.framepilot-requirements-hash
if [[ ! -f "$STAMP" || "$(cat "$STAMP")" != "$REQUIREMENTS_HASH" ]]; then
  echo "Installing dependencies into virtual environment..."
  .venv/bin/python -m pip install --disable-pip-version-check -r requirements.txt
  printf '%s' "$REQUIREMENTS_HASH" > "$STAMP"
else
  echo "Dependencies unchanged; skipping pip install."
fi
if [[ ! -f .env ]]; then
  cp .env.example .env
  echo "Created .env; add your Meta API key locally before using AI features."
fi
if ! command -v tesseract >/dev/null 2>&1; then
  echo "NOTE: Tesseract is required for scanned-PDF OCR. Searchable PDFs work without it."
fi
cleanup(){
  if [[ -n "${WORKER_PID:-}" ]]; then kill "$WORKER_PID" 2>/dev/null || true; wait "$WORKER_PID" 2>/dev/null || true; fi
}
trap cleanup EXIT INT TERM
.venv/bin/python -m app.ingest_worker &
WORKER_PID=$!
PORT="${FRAMEPILOT_PORT:-8016}"
echo "Opening FramePilot on http://127.0.0.1:${PORT}/book"
.venv/bin/python -m uvicorn app.main:app --host "${FRAMEPILOT_HOST:-127.0.0.1}" --port "$PORT"
