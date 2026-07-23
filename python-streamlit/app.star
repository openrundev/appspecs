load("proxy.in", "proxy")
load("container.in", "container")

app = ace.app(param.app_name,
              routes=[
                  ace.proxy("/", proxy.config(container.URL, strip_app=False))
              ],
              container=container.config(
                  container.AUTO, port=param.port, health="/_stcore/health",
                  volumes=["cl_secret:./secrets.toml.tmpl:/app/.streamlit/secrets.toml"],
                                         dev_settings={
                                             "target": "builder",
                                             "command": param.dev_command,
                                             "dir": "/app",
                                             "reload": param.dev_reload,
                                             "env_files": ["requirements.txt", "pyproject.toml", "uv.lock"],
                                             "additional_mounts": ["venv:/app/.venv", "uv-cache:/root/.cache/uv"],
                                         }
                                         ),
              permissions=[
                  ace.permission("proxy.in", "config", [container.URL]),
                  ace.permission("container.in", "config", [container.AUTO], secrets=param.secrets)
              ]
       ) 
