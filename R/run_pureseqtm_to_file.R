#' Creates a FASTA-like file, that has the locations
#' of the amino acids.
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' if (is_pureseqtm_installed()) {
#'   pureseqtm_filename <- tempfile()
#'   run_pureseqtm_to_file(
#'     fasta_filename = get_example_filename("1bhaA.fasta"),
#'     pureseqtm_filename = pureseqtm_filename
#'   )
#'   expect_true(file.exists(pureseqtm_filename))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
run_pureseqtm_to_file <- function(
  fasta_filename,
  pureseqtm_filename,
  folder_name = get_default_pureseqtm_folder()
) {
  writeLines(
    text = run_pureseqtm(
      fasta_filename = fasta_filename,
      folder_name = folder_name
    ),
    con = pureseqtm_filename
  )
}
