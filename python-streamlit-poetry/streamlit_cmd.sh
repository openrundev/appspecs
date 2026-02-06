#!/usr/bin/env bash
set -euo pipefail

run_args="run ${app_file:-streamlit_app.py}"

if [[ "${app_file:-}" = "hello" ]]; then
  run_args="hello"
fi

exec /opt/poetry/bin/poetry run streamlit $run_args \
  --server.address=0.0.0.0 \
  --server.baseUrlPath="${CL_APP_PATH:-/}"
