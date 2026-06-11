FROM python:3.12-slim

WORKDIR /app

RUN pip install uv

COPY pyproject.toml uv.lock ./
COPY src/ ./src/

RUN uv pip install --system --no-cache .

EXPOSE 8080

CMD ["python", "-c", "from mcp_telegram.server import mcp; mcp.run(transport='sse', host='0.0.0.0', port=8080)"]
