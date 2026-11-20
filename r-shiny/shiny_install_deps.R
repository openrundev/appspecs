# Installs the R packages for the app into the system library.
#
#   Rscript shiny_install_deps.R lockfile   restore renv.lock, if present
#   Rscript shiny_install_deps.R            if there is no renv.lock, install the
#                                           packages which the source refers to
#                                           (library(), require(), pkg::fn and
#                                           DESCRIPTION), using binary packages

Sys.setenv(RENV_CONFIG_AUTOLOADER_ENABLED = "FALSE")
options(Ncpus = max(1L, parallel::detectCores()))

lockfile_only <- identical(commandArgs(trailingOnly = TRUE), "lockfile")
has_lockfile <- file.exists("renv.lock")

if (lockfile_only) {
  if (has_lockfile) {
    renv::restore(lockfile = "renv.lock", library = .libPaths()[1],
                  prompt = FALSE)
  }
} else if (!has_lockfile) {
  deps <- renv::dependencies(".", quiet = TRUE)
  pkgs <- setdiff(unique(c("shiny", deps$Package)),
                  c("R", rownames(installed.packages())))
  if (length(pkgs) > 0) {
    message("Installing packages: ", paste(pkgs, collapse = ", "))
    install.packages(pkgs)
    missing <- setdiff(pkgs, rownames(installed.packages()))
    if (length(missing) > 0) {
      stop("Could not install packages: ", paste(missing, collapse = ", "),
           ". Add an renv.lock for packages which are not on CRAN")
    }
  }
}
