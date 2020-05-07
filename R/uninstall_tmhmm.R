#' Uninstall PureseqTM
#' @param folder_name name of the folder
#'   where the PureseqTM files are installed.
#'   The name of the PureseqTM binary file will be at
#'   \code{[folder_name]/PureseqTM_Package}
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_pureseqtm <- function(
  folder_name = get_default_pureseqtm_folder()
) {
  if (!is_pureseqtm_installed(folder_name = folder_name)
  ) {
    stop("Cannot uninstall absent PureseqTM at folder '", folder_name, "'")
  }
  # Remove extracted folder
  pureseqtm_folder <- file.path(folder_name, "PureseqTM_Package")
  if (dir.exists(pureseqtm_folder)) {
    unlink(pureseqtm_folder, recursive = TRUE, force = TRUE)
  }
  testthat::expect_false(dir.exists(pureseqtm_folder))
  if (1 == 2) {
    # Download zip if needed
    zip_filename_path <- file.path(folder_name, "PureseqTM_Package.zip")
    if (file.exists(zip_filename_path)) {
      file.remove(zip_filename_path)
    }
    testthat::expect_false(file.exists(zip_filename_path))
  }
}
