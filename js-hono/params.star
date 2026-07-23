param("port", type=INT,
      description="The port the Hono app is listening on (inside the container)", default=3000)

param("app_name", description="The name for the app", default="Hono App")

param("preserve_host", type=BOOLEAN, description="Whether to preserve the original Host header", default=False)

param("strip_app", type=BOOLEAN,
      description="Whether to strip the OpenRun app path before proxying. Keep enabled for apps using relative paths.",
      default=True)

param("secrets", description="The secrets which are allowed to be passed to the container", type=LIST, default=[["regex:.*"]])

param("dev_command",
      description="The command used to start the app in dev mode, run in the builder stage with the app source mounted",
      default="""npm install --no-audit --no-fund; if node -e "process.exit(require('./package.json').scripts?.dev ? 0 : 1)"; then exec npm run dev; fi; sh hono_gen.sh; exec sh hono_start.sh""")

param("dev_reload",
      description="What a source change does in dev mode: restart (restart container), none (framework hot reload handles it, e.g. an npm dev script using tsx watch or node --watch) or recreate",
      default="restart")
