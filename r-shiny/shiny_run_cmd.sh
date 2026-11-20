#!/usr/bin/env bash
set -euo pipefail

exec Rscript -e 'options(shiny.autoreload = identical(Sys.getenv("SHINY_AUTORELOAD"), "true")); shiny::runApp(Sys.getenv("app_file", "."), host = "0.0.0.0", port = 3838, launch.browser = FALSE)'
