#' Parse a FASTA file to a table
#' with a \code{name} and \code{sequence} column
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble}
#'   with a \code{name} and \code{sequence} column
#' @seealso use \link{load_fasta_file_as_tibble_cpp}
#'  to directly call the C++ function that does the actual
#'  work. Use \link{load_fasta_file_as_tibble_r} to call
#'  the (approx ten thousand times slower) R function
#' @export
load_fasta_file_as_tibble <- function(
  fasta_filename
) {
  if (!file.exists(fasta_filename)) {
    stop("FASTA file not found at path ", fasta_filename)
  }
  pureseqtmr::load_fasta_file_as_tibble_cpp(
    normalizePath(fasta_filename)
  )
}
