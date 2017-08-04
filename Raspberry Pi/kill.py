import psutil
PROCNAME = "python"
for proc in psutil.process_iter():
    if proc.name() == PROCNAME:
        proc.kill()
