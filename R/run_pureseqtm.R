#' Run PureseqTM
#' @inheritParams default_params_doc
#' @return a character vector with the locatome
#' @author Richèl J.C. Bilderbeek
#' @examples
#' library(testthat)
#'
#' expect_true(is_pureseqtm_installed())
#' fasta_filename <- system.file("extdata", "pureseqtm.fasta", package = "pureseqtm")
#' locatome <- run_pureseqtm(fasta_filename)
#' cat(locatome, sep = "\n")
#' @export
run_pureseqtm <- function(
  fasta_filename,
  folder_name = get_default_pureseqtm_folder()
) {
  pureseqtm::check_pureseqtm_installation(folder_name = folder_name)

  pureseqtm_folder <- file.path(folder_name, "PureseqTM_Package-master")
  bin_filename <- file.path(pureseqtm_folder, "PureseqTM.sh")
  system2(
    command = bin_filename,
    args = c("-i", fasta_filename)
  )

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
