#' Creates a FASTA-like file, that has the locations
#' of the amino acids.
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' if (1 == 2 && is_pureseqtm_installed()) {
#'   pureseqtm_filename <- tempfile()
#'   run_pureseqtm_to_file(
#'     fasta_filename = get_pureseqtm_example_filename("1bhaA.fasta"),
#'     pureseqtm_filename = pureseqtm_filename
#'   )
#'   expect_true(file.exists(pureseqtm_filename))
#' }
#' @export
run_pureseqtm_to_file <- function(
  fasta_filename,
  pureseqtm_filename
) {
  writeLines(
    text = run_pureseqtm(fasta_filename = fasta_filename),
    con = pureseqtm_filename
  )
}
