#' Save the first two columns of a tibble as a FASTA file
#' @param t a \link[tibble]{tibble}
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
save_tibble_as_fasta_file <- function(t, fasta_filename) {
  testthat::expect_true(tibble::is_tibble(t))
  if (nrow(t) == 0) {
    readr::write_lines(x = c(), file = fasta_filename)
    return(invisible(NULL))
  }
  fasta_text <- rep(NA, nrow(t) * 2)
  fasta_text[seq(1, (nrow(t) * 2) - 1, by = 2)] <-
    paste0(">", unlist(dplyr::select(t, 1), use.names = FALSE))
  fasta_text[seq(2, (nrow(t) * 2) - 0, by = 2)] <-
    unlist(dplyr::select(t, 2), use.names = FALSE)
  readr::write_lines(x = fasta_text, file = fasta_filename)
}
