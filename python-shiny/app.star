load("proxy.in", "proxy")
load("container.in", "container")

app = ace.app(param.app_name,
              routes=[
                  ace.proxy("/", proxy.config(container.URL, strip_app=True, preserve_host=True))
              ],
              container=container.config(
                  container.AUTO, port=param.port,
                                         dev_settings={
                                             "target": "builder",
                                             "command": param.dev_command,
                                             "dir": "/app",
                                             "reload": param.dev_reload,
                                             "additional_mounts": ["venv:/app/.venv", "uv-cache:/root/.cache/uv"],
                                         }
                                         ),
              permissions=[
                  ace.permission("proxy.in", "config", [container.URL]),
                  ace.permission("container.in", "config", [container.AUTO], secrets=param.secrets)
              ],
              redirect_bare_path=True
       )
