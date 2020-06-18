#' Get the full path to a PureseqTM example file.
#'
#' Get the full path to a PureseqTM example file.
#' If the filename specified is not a PureseqTM example file,
#' this function will \link{stop}
#' @param filename name of the example file, without the path
#' @inheritParams default_params_doc
#' @return the full path to a PureseqTM example file
#' @examples
#' library(testthat)
#'
#' if (is_pureseqtm_installed()) {
#'   expect_true(file.exists(get_example_filename("1bhaA.fasta")))
#' }
#' @seealso use \link{get_example_filenames} to get all PureseqTM
#'   example filenames
#' @author Richèl J.C. Bilderbeek
#' @export
get_example_filename <- function(
  filename,
  folder_name = get_default_pureseqtm_folder()
) {
  pureseqtmr::check_pureseqtm_installation(folder_name)
  pureseqtm_folder <- file.path(folder_name, "PureseqTM_Package")
  testthat::expect_true(dir.exists(pureseqtm_folder))
  pureseqtm_examples_folder <- file.path(pureseqtm_folder, "example")
  testthat::expect_true(dir.exists(pureseqtm_examples_folder))
  filename <- file.path(pureseqtm_examples_folder, filename)
  if (!file.exists(filename)) {
    stop(
      "'filename' not found.\n",
      "Value of 'filename': ", filename, "\n",
      "Tip: use 'get_example_filenames' to get a list of all possible filenames"
    )
  }
  filename
}
