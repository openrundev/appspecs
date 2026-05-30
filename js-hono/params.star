param("port", type=INT,
      description="The port the Hono app is listening on (inside the container)", default=3000)

param("app_name", description="The name for the app", default="Hono App")

param("preserve_host", type=BOOLEAN, description="Whether to preserve the original Host header", default=False)

param("strip_app", type=BOOLEAN,
      description="Whether to strip the OpenRun app path before proxying. Keep enabled for apps using relative paths.",
      default=True)

param("secrets", description="The secrets which are allowed to be passed to the container", type=LIST, default=[["regex:.*"]])
