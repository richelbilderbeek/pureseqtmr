#' Checks the installation of PureseqTM.
#' Throws a helpful error message if incomplete,
#' else does nothing
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} with a helpful error message if
#' PureseqTM is not installed.
#' @examples
#' if (is_pureseqtm_installed()) {
#'   check_pureseqtm_installation()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
check_pureseqtm_installation <- function(
  folder_name = get_default_pureseqtm_folder()
) {
  pureseqtm_folder <- file.path(folder_name, "PureseqTM_Package")
  if (!dir.exists(pureseqtm_folder)) {
    stop(
      "Cannot find the PureseqTM folder '", pureseqtm_folder, "'\n",
      "\n",
      "Tip: from R, run 'install_pureseqtm()'\n"
    )
  }
  testthat::expect_true(dir.exists(pureseqtm_folder))

  # Does the binary exist?
  bin_filename <- file.path(pureseqtm_folder, "PureseqTM.sh")
  if (!file.exists(bin_filename)) {
    stop(
      "Cannot find the PureseqTM binary at '", bin_filename, "'\n",
      "\n",
      "Tip: from R, run 'install_pureseqtm()'\n"
    )
  }
  testthat::expect_true(file.exists(bin_filename))

  # binary file is executable
  testthat::expect_true(
    file.info(bin_filename)$mode != as.octmode("0600")
  )
}
