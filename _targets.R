r_paths <- list.files(
  path = here::here("R"),
  full.names = TRUE,
  pattern = "\\.R$"
)

lapply(X = r_paths, FUN = source) |>
  invisible()

list(
  # Scrape data
  targets::tar_target(
    poke_data,
    scrape_pokemon_data(url = "https://pokemondb.net/pokedex/all")
  ),

  # Compute summary statistics
  targets::tar_target(
    attrs_by_type,
    compute_attrs_by_type(poke_data)
  ),

  # Generate quarto report
  tarchetypes::tar_quarto(
    report,
    path = here::here("reporting/report.qmd"),
    cue = targets::tar_cue(mode = "always")
  )
)
