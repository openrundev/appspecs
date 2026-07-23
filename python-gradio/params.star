param("app_name", description="The name for the app", default="Gradio App")

param("app_file", description="The file name of the gradio app to run", default="run.py")

param("secrets", description="The secrets which are allowed to be passed to the container", type=LIST, default=[["regex:.*"]])

param("dev_command",
      description="The command used to start the app in dev mode, run with the app source mounted",
      default="""export PATH=/app/.venv/bin:$PATH; if [ -f uv.lock ]; then uv sync --locked; elif [ -f requirements.txt ]; then [ -d .venv ] || uv venv .venv; uv pip install -q -r requirements.txt gradio; fi; exec bash gradio_cmd.sh""")

param("dev_reload",
      description="What a source change does in dev mode: restart (restart container), none (framework hot reload handles it) or recreate",
      default="restart")
