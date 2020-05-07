#' Run PureseqTM
#' @inheritParams default_params_doc
#' @return a character vector with the locatome
#' @author Richèl J.C. Bilderbeek
#' @examples
#' library(testthat)
#'
#' if (1 == 2 && is_pureseqtm_installed()) {
#'   fasta_filename <- system.file(
#'     "extdata", "pureseqtm.fasta", package = "pureseqtm"
#'   )
#'   locatome <- run_pureseqtm(fasta_filename)
#'   cat(locatome, sep = "\n")
#' }
#' @export
run_pureseqtm <- function(
  fasta_filename,
  folder_name = get_default_pureseqtm_folder(),
  temp_folder_name = tempfile(pattern = "pureseqt_")
) {
  pureseqtm::check_pureseqtm_installation(folder_name = folder_name)
  pureseqtm_folder <- file.path(folder_name, "PureseqTM_Package-master")
  testthat::expect_true(dir.exists(pureseqtm_folder))
  bin_filename <- file.path(pureseqtm_folder, "PureseqTM.sh")
  testthat::expect_true(file.exists(bin_filename))

  # Work in  temporary folder
  cur_wd <- getwd()
  dir.create(
    temp_folder_name, showWarnings = FALSE, recursive = TRUE
  )
  expect_true(dir.exists(temp_folder_name))
  setwd(temp_folder_name)

  # /home/richel/.local/share/PureseqTM_Package-master/PureseqTM.sh -i   # /home/richel/GitHubs/pureseqtm/inst/extdata/pureseqtm.fasta
  x <- system2(
    command = bin_filename,
    args = c("-i", fasta_filename),
    stdout = TRUE,
    stderr = TRUE
  )
  x

  setwd(cur_wd)

  text <- system2(
    command = bin_filename,
    args = c(
      "-i", fasta_filename),
    stdout = TRUE,
    stderr = NULL
  )
  text <- text[text != ""]
  stringr::str_remove(string = text, pattern = "^\\?0 ")
}
