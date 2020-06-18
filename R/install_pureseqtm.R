#' Install PureseqTM to a local folder
#' @inheritParams default_params_doc
#' @return Nothing.
#' @examples
#' library(testthat)
#'
#' if (is_on_ci() && !is_pureseqtm_installed()) {
#'   install_pureseqtm()
#'   expect_true(is_pureseqtm_installed())
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_pureseqtm <- function(
  folder_name = get_default_pureseqtm_folder(),
  pureseqtm_url = get_pureseqtm_url()
) {
  if (pureseqtmr::is_pureseqtm_installed(folder_name = folder_name)) {
    stop("PureseqTMis already installed")
  }

  # Create the folder if needed, do not warn if it is already present
  dir.create(folder_name, showWarnings = FALSE, recursive = TRUE)

  # Check if already cloned
  pureseqtm_folder <- file.path(folder_name, basename(pureseqtm_url))
  if (!dir.exists(pureseqtm_folder)) {
    curwd <- getwd()
    on.exit(setwd(curwd))
    setwd(folder_name)
    system2(
      command = "git",
      args = c(
        "clone",
        paste0(pureseqtm_url, ".git")
      ),
      stdout = NULL,
      stderr = NULL
    )
    setwd(curwd)
  }
  testthat::expect_true(dir.exists(pureseqtm_folder))

  # Does the binary exist?
  bin_filename <- file.path(pureseqtm_folder, "PureseqTM.sh")
  testthat::expect_true(file.exists(bin_filename))

  # Binaries are made for Linux, recompile on other OSes
  if (rappdirs::app_dir()$os != "linux") {
    make_foldername <- file.path(pureseqtm_folder, "source_code")
    make_filename <- file.path(make_foldername, "Makefile")
    testthat::expect_true(file.exists(make_filename))
    curwd <- getwd()
    setwd(make_foldername)
    system2("make")
    setwd(curwd)
  }

  # binary file is executable
  testthat::expect_true(
    file.info(bin_filename)$mode != as.octmode("0600")
  )
}
