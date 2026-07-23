load("proxy.in", "proxy")
load("container.in", "container")

app = ace.app(param.app_name,
              routes=[
                  ace.proxy("/", proxy.config(container.URL, preserve_host=param.preserve_host))
              ],
              container=container.config(container.AUTO, port=param.port,
                                         dev_settings={
                                             "target": param.dev_target,
                                             "command": param.dev_command,
                                             "dir": param.dev_dir,
                                             "reload": param.dev_reload,
                                             "env_files": param.dev_env_files,
                                             "additional_mounts": param.dev_mounts,
                                             "port": param.dev_port,
                                         } if param.dev_dir else {}
                                         ),
              permissions=[
                  ace.permission("proxy.in", "config", [container.URL]),
                  ace.permission("container.in", "config", [container.AUTO], secrets=param.secrets)
              ]
       ) 
