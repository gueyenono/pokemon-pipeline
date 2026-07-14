# url <- "https://pokemondb.net/pokedex/all"

scrape_pokemon_data <- function(url) {
  html_raw <- rvest::read_html(x = url)

  main_table <- html_raw |>
    rvest::html_element(css = "table") |>
    rvest::html_table() |>
    janitor::clean_names() |>
    dplyr::rename(id = number)

  html_table_raw <- html_raw |>
    rvest::html_elements(css = "#pokedex tr")

  types <- lapply(X = html_table_raw[-1], FUN = \(row) {
    row |>
      rvest::html_elements(css = ".type-icon") |>
      rvest::html_text()
  })

  main_table$type <- types

  main_table
}
