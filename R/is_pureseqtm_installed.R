#' Measure if PureseqTM is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is PureseqTM is installed locally,
#'   FALSE otherwise
#' @examples
#' library(testthat)
#'
#' is_installed <- is_pureseqtm_installed()
#' expect_true(is_installed == TRUE || is_installed == FALSE)
#' @author Richèl J.C. Bilderbeek
#' @export
is_pureseqtm_installed <- function(
  folder_name = get_default_pureseqtm_folder()
) {
  bin_file_path <- file.path(folder_name, "PureseqTM_Package", "PureseqTM.sh")
  file.exists(bin_file_path)
}
