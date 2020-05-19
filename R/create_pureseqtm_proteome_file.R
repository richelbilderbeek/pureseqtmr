#' Create the output file of a PureseqTM proteome run
#' @inheritParams default_params_doc
#' @return the filename
#' @examples
#' library(testthat)
#'
#' fasta_filename <- get_example_filename("test_proteome.fasta")
#' topology_filename <- create_pureseqtm_proteome_file(fasta_filename)
#' expect_equal(1, length(topology_filename))
#' expect_true(file.exists((topology_filename)))
#' expect_equal(0, length(readLines(topology_filename)) %% 3)
#' @author Richèl J.C. Bilderbeek
#' @export
create_pureseqtm_proteome_file <- function(
  fasta_filename,
  topology_filename = tempfile(fileext = ".top"),
  folder_name = get_default_pureseqtm_folder()
) {
  pureseqtmr::check_pureseqtm_installation(folder_name)
  pureseqtm_folder <- file.path(folder_name, "PureseqTM_Package")
  testthat::expect_true(dir.exists(pureseqtm_folder))
  bin_filename <- file.path(pureseqtm_folder, "PureseqTM_proteome.sh")
  testthat::expect_true(file.exists(bin_filename))

  #dir.create(
  #  dirname(topology_filename), showWarnings = FALSE, recursive = TRUE
  #)

  system2(
    command = bin_filename,
    args = c(
      "-i", fasta_filename,
      "-o", topology_filename
    ),
    stdout = NULL,
    stderr = NULL
  )
  topology_filename
}
