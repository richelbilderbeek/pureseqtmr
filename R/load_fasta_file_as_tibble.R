#' Parse a FASTA file to a table
#' with a \code{name} and \code{sequence} column
#' @inheritParams default_params_doc
#' @param check_if_equal set if the C++ and R version
#'   of this algorithm is compared to obtain the same results
#' @return a \link[tibble]{tibble}
#'   with a \code{name} and \code{sequence} column
#' @seealso use \link{load_fasta_file_as_tibble_cpp}
#'  to directly call the C++ function that does the actual
#'  work. Use \link{load_fasta_file_as_tibble_r} to call
#'  the (approx tenthousand times slower) R function
#' @export
load_fasta_file_as_tibble <- function(
  fasta_filename,
  check_if_equal = TRUE
) {
  t_r <- pureseqtmr::load_fasta_file_as_tibble_r(fasta_filename)
  t_cpp <- pureseqtmr::load_fasta_file_as_tibble_cpp(fasta_filename)
  testthat::expect_true(dplyr::all_equal(t_r, t_cpp))
  t_r
}
