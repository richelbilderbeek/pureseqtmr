#' Get the PureseqTM version
#' @author Richèl J.C. Bilderbeek
#' @inheritParams default_params_doc
#' @return a version number as a character vector of one element,
#'   for example \code{v0.10}
#' @examples
#' if (is_pureseqtm_installed()) {
#'   get_pureseqtm_version()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_pureseqtm_version <- function(
  folder_name = get_default_pureseqtm_folder()
) {
  pureseqtmr::check_pureseqtm_installation(folder_name)
  pureseqtm_folder <- file.path(folder_name, "PureseqTM_Package")
  testthat::expect_true(dir.exists(pureseqtm_folder))
  bin_filename <- file.path(pureseqtm_folder, "PureseqTM_proteome.sh")
  testthat::expect_true(file.exists(bin_filename))
  text <- NA
  suppressWarnings(
    text <- system2(
      command = bin_filename,
      stdout = TRUE,
      stderr = FALSE
    )
  )
  line <- text[1]
  stringr::str_match(
    string = line,
    pattern = "v[[:digit:]]\\.[[:digit:]]{1,2}"
  )[1, 1]
}
