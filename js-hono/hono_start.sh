#!/bin/sh
set -eu

export PORT="${PORT:-3000}"
export HOST="${HOST:-0.0.0.0}"
export HOSTNAME="${HOSTNAME:-0.0.0.0}"
export BASE_PATH="${BASE_PATH:-${CL_APP_PATH:-/}}"

if node -e "process.exit(require('./package.json').scripts?.start ? 0 : 1)"; then
  exec npm run start
fi

exec node dist/openrun-server.mjs
