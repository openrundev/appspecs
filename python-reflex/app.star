load("proxy.in", "proxy")
load("container.in", "container")

app = ace.app(param.app_name,
              routes=[
                  ace.proxy("/", proxy.config(container.URL, strip_app=True))
              ],
              container=container.config(
                  container.AUTO, port=param.port, health="/ping",
                  cargs={"API_URL": ace.config("_app_url", "")}
              ),
              permissions=[
                  ace.permission("proxy.in", "config", [container.URL]),
                  ace.permission("container.in", "config", [container.AUTO], secrets=param.secrets)
              ]
       ) 
