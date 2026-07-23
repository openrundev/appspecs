load("proxy.in", "proxy")
load("container.in", "container")

app = ace.app(param.app_name,
              routes=[
                  ace.proxy("/", proxy.config(container.URL, preserve_host=param.preserve_host))
              ],
              container=container.config(container.AUTO, port=param.port,
                                         cargs={"JAVA_VERSION": param.java_version},
                                         dev_settings={
                                             "target": "deps",
                                             "command": param.dev_command,
                                             "dir": "/app",
                                             "reload": param.dev_reload,
                                             "env_files": ["pom.xml"],
                                             "additional_mounts": ["m2-cache:/root/.m2"],
                                         }),
              permissions=[
                  ace.permission("proxy.in", "config", [container.URL]),
                  ace.permission("container.in", "config", [container.AUTO], secrets=param.secrets)
              ]
       )
