#' Measure if PureseqTM is installed locally
#' @inheritParams default_params_doc
#' @return \link{TRUE} is PureseqTM is installed locally,
#'   \link{FALSE} otherwise
#' @examples
#' is_pureseqtm_installed()
#' @author Richèl J.C. Bilderbeek
#' @export
is_pureseqtm_installed <- function(
  folder_name = get_default_pureseqtm_folder()
) {
  bin_file_path <- file.path(folder_name, "PureseqTM_Package", "PureseqTM.sh")
  file.exists(bin_file_path)
}
