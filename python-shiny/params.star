param("port", type=INT,
      description="The port the Shiny app is listening on (inside the container)", default=8000)

param("app_name", description="The name for the app", default="Shiny app")

param("app_file", description="The file name of the streamlit app to run", default="app.py")

param("secrets", description="The secrets which are allowed to be passed to the container", type=LIST, default=[["regex:.*"]])

param("dev_command",
      description="The command used to start the app in dev mode, run with the app source mounted",
      default="""export PATH=/app/.venv/bin:$PATH; if [ -f uv.lock ]; then uv sync --locked; elif [ -f requirements.txt ]; then [ -d .venv ] || uv venv .venv; uv pip install -q -r requirements.txt shiny; fi; exec bash shiny_run_cmd.sh""")

param("dev_reload",
      description="What a source change does in dev mode: none (Shiny's --reload file watcher reloads on its own, the default), restart (restart container) or recreate",
      default="none")
