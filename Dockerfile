FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y gcc libssl-dev libffi-dev && rm -rf /var/lib/apt/lists/*

COPY src/ ./src/

RUN pip install --no-cache-dir \
    "mcp[cli]>=1.6.0" \
    "pydantic>=2.11.1" \
    "pydantic-settings>=2.8.1" \
    "rich>=14.0.0" \
    "telethon>=1.39.0" \
    "typer>=0.15.2" \
    "xdg-base-dirs>=6.0.2"

ENV PYTHONPATH=/app/src
ENV HOST=0.0.0.0
ENV PORT=8080

EXPOSE 8080

CMD ["python", "-c", "from mcp_telegram.server import mcp; mcp.run(transport='sse')"]
