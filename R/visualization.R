make_barchat <- function(attrs_by_type, col) {
  col_enquo <- rlang::sym(col)

  vizdata <- attrs_by_type |>
    dplyr::select(type, !!col_enquo) |>
    dplyr::mutate(type = reorder(type, !!col_enquo))

  ggplot2::ggplot(vizdata, mapping = ggplot2::aes(x = type)) +
    ggplot2::geom_col(mapping = ggplot2::aes(y = !!col_enquo)) +
    ggplot2::coord_flip() +
    ggplot2::theme_minimal()
}
