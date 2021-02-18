#' Uninstall PureseqTM
#' @param folder_name name of the folder
#'   where the PureseqTM files are installed.
#'   The name of the PureseqTM binary file will be at
#'   \code{[folder_name]/PureseqTM_Package}
#' @return Nothing.
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_pureseqtm <- function(
  folder_name = get_default_pureseqtm_folder()
) {
  if (!pureseqtmr::is_pureseqtm_installed(folder_name = folder_name)
  ) {
    stop("Cannot uninstall absent PureseqTM at folder '", folder_name, "'")
  }
  # Remove extracted folder
  pureseqtm_folder <- file.path(folder_name, "PureseqTM_Package")
  if (dir.exists(pureseqtm_folder)) {
    unlink(pureseqtm_folder, recursive = TRUE, force = TRUE)
  }
  testthat::expect_false(dir.exists(pureseqtm_folder))
}
