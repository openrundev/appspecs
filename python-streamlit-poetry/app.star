load("proxy.in", "proxy")
load("container.in", "container")

app = ace.app(param.app_name,
              routes=[
                  ace.proxy("/", proxy.config(container.URL, strip_app=False))
              ],
              container=container.config(container.AUTO, port=param.port, health="/_stcore/health",
                                         dev_settings={
                                             "command": param.dev_command,
                                             "dir": "/app",
                                             "reload": param.dev_reload,
                                             "env_files": ["pyproject.toml", "poetry.lock"],
                                             "additional_mounts": ["poetry-cache:/root/.cache/pypoetry"],
                                         }
                                         ),
              permissions=[
                  ace.permission("proxy.in", "config", [container.URL]),
                  ace.permission("container.in", "config", [container.AUTO], secrets=param.secrets)
              ]
       ) 
