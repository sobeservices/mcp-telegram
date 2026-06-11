FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y gcc libssl-dev && rm -rf /var/lib/apt/lists/*

COPY pyproject.toml ./
COPY src/ ./src/

RUN pip install --no-cache-dir hatchling && pip install --no-cache-dir -e .

EXPOSE 8080

CMD ["python", "-c", "from mcp_telegram.server import mcp; mcp.run(transport='sse', host='0.0.0.0', port=8080)"]
