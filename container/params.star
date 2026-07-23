param("port", type=INT,
      description="The port the app is listening on (inside the container)", required=False)

param("app_name", description="The name for the app", default="App")

param("preserve_host", type=BOOLEAN, description="Whether to preserve the original Host header", default=False)

param("secrets", description="The secrets which are allowed to be passed to the container", type=LIST, default=[["regex:.*"]])

param("dev_dir",
      description="Enables fast dev reload when set: the directory inside the container where the app source is mounted (e.g. /app)",
      default="")

param("dev_command",
      description="The command used to start the app in dev mode. Defaults to the container file CMD/ENTRYPOINT",
      default="")

param("dev_target",
      description="The container file stage to build for dev mode (docker build --target)",
      default="")

param("dev_port", type=INT,
      description="The port the dev mode command listens on, if different from the port used by the built image",
      default=0)

param("dev_reload",
      description="What a source change does in dev mode: restart (restart container), none (framework hot reload handles it) or recreate",
      default="restart")

param("dev_env_files", type=LIST,
      description="Files whose changes trigger a dev image rebuild (e.g. requirements.txt)",
      default=[])

param("dev_mounts", type=LIST,
      description="Extra dev mode volume mounts for build/dependency caches (e.g. m2-cache:/root/.m2)",
      default=[])
