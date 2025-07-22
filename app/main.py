from datetime import datetime, timezone
from fastapi import FastAPI, Response, status
import platform
import psutil
import time

app = FastAPI()
start_time = time.time()


@app.get("/")
def read_root():
    return {"message": "Hello, World!"}


@app.get("/metrics")
def get_metrics():
    uptime = time.time() - start_time
    memory = psutil.virtual_memory()
    cpu = psutil.cpu_percent(interval=0.1)

    return {
        "uptime_seconds": round(uptime, 2),
        "memory_used_mb": round(memory.used / (1024 * 1024), 2),
        "memory_total_mb": round(memory.total / (1024 * 1024), 2),
        "cpu_percent": cpu,
        "system": platform.system(),
        "architecture": platform.architecture(),
        "timestamp": datetime.now(timezone.utc).isoformat(),
    }


@app.get("/health", status_code=status.HTTP_200_OK)
def health_check(response: Response):
    return {"status": "healthy", "timestamp": datetime.now(timezone.utc).isoformat()}
