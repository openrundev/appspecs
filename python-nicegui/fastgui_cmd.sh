#!/usr/bin/env bash
set -euo pipefail

exec python "${app_file:-main.py}"
