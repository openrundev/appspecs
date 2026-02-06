#!/usr/bin/env bash
set -euo pipefail

export GRADIO_ROOT_PATH="${CL_APP_PATH:-}"
export GRADIO_SERVER_NAME=0.0.0.0

exec python "${app_file:-run.py}"
