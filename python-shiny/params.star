param("port", type=INT,
      description="The port the Shiny app is listening on (inside the container)", default=8000)

param("app_name", description="The name for the app", default="Shiny app")

param("app_file", description="The file name of the streamlit app to run", default="app.py")

param("secrets", description="The secrets which are allowed to be passed to the container", type=LIST, default=[["regex:.*"]])
