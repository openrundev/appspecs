param("image", description="The image to start the container with")

param("port", type=INT, description="The port to expose from the container")

param("app_name", description="The name for the app", default="Image Based App")

param("preserve_host", type=BOOLEAN, description="Whether to preserve the original Host header", default=False)

param("secrets", description="The secrets which are allowed to be passed to the container, e.g. [[\"regex:.*\"]] for all secrets. Setting this declares secret access, which needs the app to be approved", type=LIST, default=[])