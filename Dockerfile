FROM python:3.12-slim
WORKDIR /app
RUN apt-get update && apt-get install -y gcc libssl-dev libffi-dev && rm -rf /var/lib/apt/lists/*
COPY src/ ./src/
COPY main.py ./main.py
RUN pip install --no-cache-dir \
    "mcp[cli]>=1.6.0" \
    "pydantic>=2.11.1" \
    "pydantic-settings>=2.8.1" \
    "rich>=14.0.0" \
    "telethon>=1.39.0" \
    "typer>=0.15.2" \
    "xdg-base-dirs>=6.0.2" \
    "uvicorn[standard]>=0.30.0" \
    "anyio>=4.0.0"
ENV PYTHONPATH=/app/src
EXPOSE 8080
CMD ["python", "main.py"]
