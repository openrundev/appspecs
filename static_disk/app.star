app = ace.app(param.app_name,
              static_only=True,
              index=param.index,
              single_file=param.single_file,
              settings={"routing": {"static_from_disk": True}})
