"""Main entry point for SSE server."""
import anyio
from mcp_telegram.server import mcp


async def main():
    """Run the SSE server."""
    # FastMCP reads HOST and PORT from environment variables
    # Set HOST=0.0.0.0 and PORT=8080 in Dockerfile
    await mcp.run_sse_async()


if __name__ == "__main__":
    anyio.run(main)
