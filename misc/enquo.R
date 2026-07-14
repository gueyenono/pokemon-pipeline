random_fn <- function(col) {
  col_quo <- rlang::sym(col)
  mtcars |>
    dplyr::select(!!col_quo)
}

random_fn(am)
