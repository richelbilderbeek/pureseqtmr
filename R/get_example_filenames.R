#' Get the full path to all PureseqTM example files
#' @inheritParams default_params_doc
#' @return a character vector with all PureseqTM example files
#' @examples
#' library(testthat)
#'
#' if (is_pureseqtm_installed()) {
#'   filenames <- get_example_filenames()
#'   expect_true(all(file.exists(filenames)))
#' }
#' @seealso use \link{get_example_filename} to get the full
#'   path to a PureseqTM example file
#' @author Richèl J.C. Bilderbeek
#' @export
get_example_filenames <- function(
  folder_name = get_default_pureseqtm_folder()
) {
  pureseqtmr::check_pureseqtm_installation(folder_name)
  pureseqtm_folder <- file.path(folder_name, "PureseqTM_Package")
  testthat::expect_true(dir.exists(pureseqtm_folder))
  pureseqtm_examples_folder <- file.path(pureseqtm_folder, "example")
  testthat::expect_true(dir.exists(pureseqtm_examples_folder))
  list.files(
    pureseqtm_examples_folder,
    full.names = TRUE
  )
}
