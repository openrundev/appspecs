param("port", type=INT,
      description="The port the Shiny app is listening on (inside the container)", default=3838)

param("app_name", description="The name for the app", default="Shiny app")

param("app_file", description="The Shiny app to run, relative to the source root: a directory with app.R (or ui.R and server.R), or an .R file", default=".")

param("secrets", description="The secrets which are allowed to be passed to the container, e.g. [[\"regex:.*\"]] for all secrets. Setting this declares secret access, which needs the app to be approved", type=LIST, default=[])

param("dev_command",
      description="The command used to start the app in dev mode, run in the builder stage with the app source mounted",
      default="""Rscript shiny_install_deps.R; export SHINY_AUTORELOAD=true; exec bash shiny_run_cmd.sh""")

param("dev_reload",
      description="What a source change does in dev mode: none (Shiny's autoreload file watcher reloads on its own, the default), restart (restart container) or recreate",
      default="none")
