load("proxy.in", "proxy")
load("container.in", "container")

app = ace.app(param.app_name,
              routes=[
                  ace.proxy("/", proxy.config(container.URL, preserve_host=param.preserve_host, strip_app=param.strip_app))
              ],
              container=container.config(container.AUTO, port=param.port,
                                         dev_settings={
                                             "target": "builder",
                                             "command": param.dev_command,
                                             "dir": "/app",
                                             "reload": param.dev_reload,
                                             "additional_mounts": ["node-modules:/app/node_modules", "npm-cache:/root/.npm"],
                                         }
                                         ),
              permissions=[
                  ace.permission("proxy.in", "config", [container.URL]),
                  ace.permission("container.in", "config", [container.AUTO], secrets=param.secrets)
              ],
              redirect_bare_path=True,
       )
