#' Create the five PureseqTM output files, by running PureseqTM.
#' @inheritParams default_params_doc
#' @return full path to the files created
#' @examples
#' library(testthat)
#'
#' if (is_pureseqtm_installed()) {
#'   fasta_filename <- get_pureseqtm_example_filename("1bhaA.fasta")
#'   filenames <- create_pureseqtm_files(fasta_filename)
#'   expect_equal(5, length(filenames))
#"   expect_true(all(file.exists((filenames))))
#' }
#' @seealso use \link{run_pureseqtm} to received
#'   also the parsed output
#' @author Richèl J.C. Bilderbeek
#' @export
create_pureseqtm_files <- function(
  fasta_filename,
  folder_name = get_default_pureseqtm_folder(),
  temp_folder_name = tempfile(pattern = "pureseqt_")
) {
  pureseqtmr::check_pureseqtm_installation(folder_name = folder_name)
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
  list.files(
    temp_folder_name,
    recursive = TRUE,
    full.names = TRUE
  )
}