#!/usr/bin/env bash
set -euo pipefail

exec shiny run --host 0.0.0.0 --port 8000 "${app_file:-app.py}"
