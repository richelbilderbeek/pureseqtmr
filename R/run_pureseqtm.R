#' Run PureseqTM
#' @inheritParams default_params_doc
#' @return full path to the files created
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
  pureseqtm_folder <- file.path(folder_name, "PureseqTM_Package")
  testthat::expect_true(dir.exists(pureseqtm_folder))
  bin_filename <- file.path(pureseqtm_folder, "PureseqTM.sh")
  testthat::expect_true(file.exists(bin_filename))

  dir.create(
    temp_folder_name, showWarnings = FALSE, recursive = TRUE
  )
  testthat::expect_true(dir.exists(temp_folder_name))

  text <- system2(
    command = bin_filename,
    args = c(
      "-i", fasta_filename,
      "-o", temp_folder_name
    ),
    stdout = TRUE,
    stderr = TRUE
  )

  if (length(text) != 0) {
    stop("Warning or error: '", text, "'")
  }
  list.files(temp_folder_name, recursive = TRUE, full.names = TRUE)
}
