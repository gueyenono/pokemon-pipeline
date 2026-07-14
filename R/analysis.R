compute_attrs_by_type <- function(poke_data) {
  poke_data |>
    dplyr::mutate(
      type = sapply(X = type, FUN = \(x) paste(x, collapse = ","))
    ) |>
    tidyr::separate_longer_delim(cols = type, delim = ",") |>
    dplyr::summarize(
      .by = type,
      dplyr::across(.cols = total:speed, .fns = mean)
    )
}
