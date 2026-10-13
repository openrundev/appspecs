param("port", type=INT,
      description="The port the Reflex app is listening on (inside the container)", default=8080)

param("app_name", description="The name for the app", default="Reflex App")

param("secrets", description="The secrets which are allowed to be passed to the container, e.g. [[\"regex:.*\"]] for all secrets. Setting this declares secret access, which needs the app to be approved", type=LIST, default=[])
