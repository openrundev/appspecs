#!/bin/sh
# Generates a server entry (dist/openrun-server.mjs) for Hono apps which do
# not define an npm start script. Used by the Containerfile image build and
# by dev mode (where the app source is bind mounted).
set -eu

if node -e "process.exit(require('./package.json').scripts?.start ? 0 : 1)"; then
    # start script is defined, no generated entry needed
    exit 0
fi

npm install --save @hono/node-server
npm install --save-dev esbuild

entry=src/index.tsx
if [ ! -f "$entry" ] && [ -f src/index.ts ]; then entry=src/index.ts; fi
if [ ! -f "$entry" ] && [ -f src/index.jsx ]; then entry=src/index.jsx; fi
if [ ! -f "$entry" ] && [ -f src/index.js ]; then entry=src/index.js; fi
if [ ! -f "$entry" ]; then
    echo "No npm start script and no src/index.tsx, src/index.ts, src/index.jsx, or src/index.js found" >&2
    exit 1
fi

mkdir -p .openrun-hono dist
printf '%s\n' \
    "import { serve } from '@hono/node-server'" \
    "import app from '../${entry}'" \
    "" \
    "const port = Number(process.env.PORT || 3000)" \
    "const hostname = process.env.HOST || process.env.HOSTNAME || '0.0.0.0'" \
    "serve({ fetch: app.fetch, port, hostname }, (info) => {" \
    "  console.log(\`Hono server listening on http://\${info.address}:\${info.port}\`)" \
    "})" \
    > .openrun-hono/server-entry.ts
npx esbuild .openrun-hono/server-entry.ts --bundle --platform=node --format=esm --packages=external --outfile=dist/openrun-server.mjs
