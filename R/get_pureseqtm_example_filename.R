#' Get the full path to a PureseqTM example files
#' @param filename name of the example file, without the path
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' expect_true(file.exists(get_pureseqtm_example_filename("1bhaA.fasta")))
#' expect_true(file.exists(get_pureseqtm_example_filename("human_20416.fasta")))
#' @seealso use \link{get_pureseqtm_example_filenames} to get all PureseqTM
#'   example filenames
#' @export
get_pureseqtm_example_filename <- function(
  filename,
  folder_name = get_default_pureseqtm_folder()
) {
  pureseqtmr::check_pureseqtm_installation(folder_name)
  pureseqtm_folder <- file.path(folder_name, "PureseqTM_Package")
  testthat::expect_true(dir.exists(pureseqtm_folder))
  pureseqtm_examples_folder <- file.path(pureseqtm_folder, "example")
  testthat::expect_true(dir.exists(pureseqtm_examples_folder))

  list.files(
    pattern = filename,
    pureseqtm_examples_folder,
    full.names = TRUE
  )
}
