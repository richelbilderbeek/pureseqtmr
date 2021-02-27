#' Parse a FASTA file to a table
#' with a \code{name} and \code{sequence} column
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble}
#'   with a \code{name} and \code{sequence} column
#' @export
load_fasta_file_as_tibble_cpp <- function(fasta_filename) {
  if (!file.exists(fasta_filename)) {
    stop("FASTA file not found at path ", fasta_filename)
  }
  dt <- load_fasta_file_as_tibble_cpp_raw(fasta_filename) # nolint internal function
  dt <- data.table::setalloccol(dt)
  tibble::as_tibble(dt)
}
