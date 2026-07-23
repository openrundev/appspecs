param("app_name", description="The name for the app", default="Python ASGI App")

param("preserve_host", type=BOOLEAN, description="Whether to preserve the original Host header", default=False)

param("secrets", description="The secrets which are allowed to be passed to the container", type=LIST, default=[["regex:.*"]])

param("dev_command",
      description="The command used to start the app in dev mode, run with the app source mounted",
      default="""export PATH=/app/.venv/bin:$PATH; if [ -f uv.lock ]; then uv sync --locked; elif [ -f requirements.txt ]; then [ -d .venv ] || uv venv .venv; uv pip install -q -r requirements.txt uvicorn; fi; if [ "${WORKERS:-1}" = "1" ]; then python -c 'import watchfiles' 2>/dev/null || uv pip install -q watchfiles; exec uvicorn --root-path "$CL_APP_PATH" --reload --host 0.0.0.0 --port 5000 ${APP_MODULE:-app:app}; else exec uvicorn --root-path "$CL_APP_PATH" --host 0.0.0.0 --port 5000 --workers ${WORKERS} ${APP_MODULE:-app:app}; fi""")

param("dev_reload",
      description="What a source change does in dev mode: none (uvicorn --reload reloads on its own, the default), restart (restart container) or recreate. The dev command enables --reload only when WORKERS is unset or 1; set restart here when running multiple workers",
      default="none")
