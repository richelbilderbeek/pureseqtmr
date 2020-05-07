#' Install PureseqTM to a local folder
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' if (1 == 2) {
#'   install_pureseqtm()
#'   expect_true(is_pureseqtm_installed())
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_pureseqtm <- function(
  folder_name = get_default_pureseqtm_folder()
) {
  if (is_pureseqtm_installed()) {
    stop("PureseqTMis already installed")
  }

  # Extract zip if needed
  pureseqtm_folder <- file.path(folder_name, "PureseqTM_Package")
  if (!dir.exists(pureseqtm_folder)) {
    curwd <- getwd()
    setwd(folder_name)
    system2(
      command = "git",
      args = c(
        "clone",
        "https://github.com/PureseqTM/PureseqTM_Package.git"
      )
    )
    setwd(curwd)
  }
  testthat::expect_true(dir.exists(pureseqtm_folder))

  # Does the binary exist?
  bin_filename <- file.path(pureseqtm_folder, "PureseqTM.sh")
  if (!file.exists(bin_filename)) {
    make_foldername <- file.path(pureseqtm_folder, "source_code")
    make_filename <- file.path(make_foldername, "Makefile")
    testthat::expect_true(file.exists(make_filename))
    system2("make", make_filename)
  }
  testthat::expect_true(file.exists(bin_filename))

  # Is the binary file executable?
  if (1 == 2 && file.info(bin_filename)$mode == as.octmode("0600")) {
    Sys.chmod(bin_filename, mode = as.octmode("0700"))
  }
  testthat::expect_true(file.info(bin_filename)$mode != as.octmode("0600"))

  other_bin_paths <- c(
    "util/Verify_FASTA",
    "util/AA_to_CODE",
    "bin/gmtkJT",
    "util/Proc_runJT",
    "util/pureseq_dump",
    "bin/DeepCNF_FeatMake",
    "util/TM2_Trans",
    "util/GnuPlot_Script"
  )
  if (1 == 2) {
    for (rel_filename in other_bin_paths) {
      filename <- file.path(pureseqtm_folder, rel_filename)
      testthat::expect_true(file.exists(filename))
      if (file.info(filename)$mode == as.octmode("0600")) {
        Sys.chmod(filename, mode = as.octmode("0700"))
      }
    }
  }
}
