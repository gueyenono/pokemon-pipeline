# Create reproducible development environment

rix::rix(
  shell_hook = "export QUARTO_R=${pkgs.R}/bin/R; unset QUARTO_PANDOC QUARTO_PATH",
  r_ver = "4.4.0",
  r_pkgs = c(
    "dplyr",
    "janitor",
    "rvest",
    "tidyr",
    "here",
    "ggplot2",
    "quarto",
    "targets",
    "tarchetypes"
  ),
  system_pkgs = c("quarto"),
  ide = "other",
  project_path = ".",
  overwrite = TRUE
)

# Create CI/CD pipeline

rix::tar_nix_ga()
