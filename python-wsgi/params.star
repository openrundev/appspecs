param("app_name", description="The name for the app", default="Python WSGI App")

param("preserve_host", type=BOOLEAN, description="Whether to preserve the original Host header", default=False)

param("secrets", description="The secrets which are allowed to be passed to the container", type=LIST, default=[["regex:.*"]])

param("dev_command",
      description="The command used to start the app in dev mode, run with the app source mounted",
      default="""export PATH=/app/.venv/bin:$PATH; if [ -f uv.lock ]; then uv sync --locked; elif [ -f requirements.txt ]; then [ -d .venv ] || uv venv .venv; uv pip install -q -r requirements.txt gunicorn; fi; exec gunicorn --reload --bind 0.0.0.0:8000 --workers ${WORKERS:-1} --threads ${THREADS:-4} --env "SCRIPT_NAME=$CL_APP_PATH" ${APP_MODULE:-app:app}""")

param("dev_reload",
      description="What a source change does in dev mode: none (gunicorn --reload reloads on its own, the default), restart (restart container) or recreate",
      default="none")
