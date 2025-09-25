load("proxy.in", "proxy")
load("container.in", "container")

app = ace.app(param.app_name,
              routes=[
                  ace.proxy("/", proxy.config(container.URL, strip_app=True))
              ],
              container=container.config(container.AUTO),
              permissions=[
                  ace.permission("proxy.in", "config", [container.URL]),
                  ace.permission("container.in", "config", [container.AUTO], secrets=param.secrets)
              ],
              redirect_bare_path=True, # gradio uses ./ path for static assets which requires the app path to end with /
       ) 
