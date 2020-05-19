#' Runs PureseqTM and returns the parsed results
#' @inheritParams default_params_doc
#' @return full path to the files created
#' @author Richèl J.C. Bilderbeek
#' @examples
#' library(testthat)
#'
#' if (1 == 2 && is_pureseqtm_installed()) {
#'   fasta_filename <- system.file(
#'     "extdata", "pureseqtm.fasta", package = "pureseqtmr"
#'   )
#'   locatome <- run_pureseqtm(fasta_filename)
#'   cat(locatome, sep = "\n")
#' }
#' @seealso use \link{create_pureseqtm_files} to
#'   only create the PureseqTM output files
#' @export
run_pureseqtm <- function(
  fasta_filename,
  mode = "proteome",
  folder_name = get_default_pureseqtm_folder(),
  temp_folder_name = tempfile(pattern = "pureseqt_")
) {
  pureseqtmr::check_pureseqtm_installation(folder_name = folder_name)
  pureseqtmr::check_pureseqtm_mode(mode = mode)

  filenames <- create_pureseqtm_files(
    fasta_filename = fasta_filename,
    folder_name = folder_name,
    temp_folder_name = temp_folder_name,
    mode = mode
  )
  text_1 <- readLines(filenames[1])
  text_2 <- readLines(filenames[2])
  text_3 <- readLines(filenames[3])
  text_4 <- readLines(filenames[4])
  text_5 <- readLines(filenames[5])
  locatome <- readLines(filenames[5])
  readLines(filenames[5])
}
