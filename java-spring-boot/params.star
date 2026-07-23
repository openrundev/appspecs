param("port", type=INT,
      description="The port the app is listening on (inside the container)", default=8080)

param("app_name", description="The name for the app", default="Spring Boot App")

param("java_version", description="The Java (Temurin) version to use for build and runtime", default="21")

param("dev_command",
      description="The command used to start the app in dev mode, run in the build stage with the source mounted",
      default="mvn -B spring-boot:run -Dspring-boot.run.arguments=--server.port=${PORT}")

param("dev_reload",
      description="What a source change does in dev mode: restart (restart container), none (framework hot reload handles it) or recreate",
      default="restart")

param("preserve_host", type=BOOLEAN, description="Whether to preserve the original Host header", default=False)

param("secrets", description="The secrets which are allowed to be passed to the container", type=LIST, default=[["regex:.*"]])
