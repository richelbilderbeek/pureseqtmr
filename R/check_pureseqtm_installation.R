#' Checks the installation of PureseqTM.
#' Throws a helpful error message if incomplete,
#' else does nothing
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#'   install_pureseqtm()
#'   check_pureseqtm_installation()
#' @author Richèl J.C. Bilderbeek
#' @export
check_pureseqtm_installation <- function(
  folder_name = get_default_pureseqtm_folder()
) {
  # Download zip if needed
  zip_filename_path <- file.path(folder_name, "PureseqTM_Package.zip")
  if (!file.exists(zip_filename_path)) {
    stop(
      "Cannot find PureseqTM zip file at '", zip_filename_path, "'\n",
      "\n",
      "Tip: from R, run 'pureseqtm::install_pureseqtm()'\n"
    )
  }
  testthat::expect_true(file.exists(zip_filename_path))

  # Extract zip if needed
  pureseqtm_folder <- file.path(folder_name, "PureseqTM_Package-master")
  if (!dir.exists(pureseqtm_folder)) {
    stop(
      "Cannot find the PureseqTM folder '", pureseqtm_folder, "'\n",
      "\n",
      "Tip: from R, run 'pureseqtm::install_pureseqtm()'\n"
    )
  }
  testthat::expect_true(dir.exists(pureseqtm_folder))

  # Does the binary exist?
  bin_filename <- file.path(pureseqtm_folder, "PureseqTM.sh")
  if (!file.exists(bin_filename)) {
    stop(
      "Cannot find the PureseqTM binary at '", bin_filename, "'\n",
      "\n",
      "Tip: from R, run 'pureseqtm::install_pureseqtm()'\n"
    )
  }
  testthat::expect_true(file.exists(bin_filename))

  # binary file not executable?
  if (file.info(bin_filename)$mode == as.octmode("0600")) {
    stop(
      "PureseqTM binary disallowed to execute.\n",
      "PureseqTM binary pathe: '", bin_filename, "'.\n",
      "\n",
      "Tip: from R, run 'pureseqtm::install_pureseqtm()'\n"
    )
  }
  expect_true(file.info(bin_filename)$mode != as.octmode("0600"))
}
