"""Main entry point for SSE server."""
import anyio
from mcp_telegram.server import mcp


async def main():
    """Run the SSE server on 0.0.0.0:8080."""
    try:
        # Try the run_sse_async method (available in mcp>=1.6.0)
        await mcp.run_sse_async(host="0.0.0.0", port=8080)
    except AttributeError:
        # Fallback: use uvicorn with the sse_app
        import uvicorn
        app = mcp.sse_app()
        config = uvicorn.Config(app, host="0.0.0.0", port=8080)
        server = uvicorn.Server(config)
        await server.serve()


if __name__ == "__main__":
    anyio.run(main)
