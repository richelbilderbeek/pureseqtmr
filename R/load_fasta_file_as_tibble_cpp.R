# Keep the next three lines for RCpp
#' @useDynLib pureseqtmr
#' @importFrom Rcpp sourceCpp
NULL

#' Parse a FASTA file to a table
#' with a \code{name} and \code{sequence} column
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble}
#'   with a \code{name} and \code{sequence} column
#' @export
load_fasta_file_as_tibble_cpp <- function(fasta_filename) {
  dt <- load_fasta_file_as_tibble_cpp_raw(fasta_filename) # internal function
  dt <- data.table::setalloccol(dt)
  tibble::as_tibble(dt)
}
