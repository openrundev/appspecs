param("app_name", description="The name for the app", default="Static Disk App")

param("index", description="The index file to serve", required=False)

param("single_file", type=BOOLEAN, description="Whether to serve only one file", default=False)
