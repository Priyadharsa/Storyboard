FROM python:3.11-slim
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 FRAMEPILOT_PORT=8013
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . ./
RUN mkdir -p /app/private_uploads /app/static/generated && groupadd --system --gid 10001 framepilot && useradd --system --uid 10001 --gid 10001 --home /app framepilot && chown -R framepilot:framepilot /app
EXPOSE 8013
USER framepilot
# One local container is not cloud scale; mount /app/private_uploads and
# /app/static/generated on persistent storage. Start ingest worker separately.
CMD ["python", "-m", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8013"]
