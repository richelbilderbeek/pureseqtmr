#' Runs PureseqTM for one gene and returns the parsed results
#' @inheritParams default_params_doc
#' @return full path to the files created
#' @examples
#' library(testthat)
#'
#' if (is_pureseqtm_installed()) {
#'   fasta_filename <- get_example_filename("1bhaA.fasta")
#'   topology_text <- run_pureseqtm_proteome(fasta_filename)
#'   proteome_text <- readLines(fasta_filename)
#'   expect_equal(3, length(topology_text))
#'   expect_equal(proteome_text[1], topology_text[1])
#' }
#' @seealso
#' \itemize{
#'   \item{
#'     Use \link{create_pureseqtm_files} to only create the PureseqTM
#'     output files
#'   }
#'   \item{
#'     Use \link{run_pureseqtm_proteome} to run PureseqTM on multiple genes
#'   }
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
run_pureseqtm <- function(
  fasta_filename,
  folder_name = get_default_pureseqtm_folder(),
  temp_folder_name = tempfile(pattern = "pureseqt_")
) {
  pureseqtmr::check_pureseqtm_installation(folder_name)

  filenames <- create_pureseqtm_files(
    fasta_filename = fasta_filename,
    folder_name = folder_name,
    temp_folder_name = temp_folder_name
  )
  text_1 <- readLines(filenames[1])
  text_2 <- readLines(filenames[2])
  text_3 <- readLines(filenames[3])
  text_4 <- readLines(filenames[4])
  text_5 <- readLines(filenames[5])
  locatome <- readLines(filenames[5])
  readLines(filenames[5])
}
