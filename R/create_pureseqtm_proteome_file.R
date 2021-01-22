#' Create the output file of a PureseqTM proteome run
#' @inheritParams default_params_doc
#' @return the filename
#' @examples
#'
#' if (is_pureseqtm_installed()) {
#'   fasta_filename <- get_example_filename("1bhaA.fasta")
#'   create_pureseqtm_proteome_file(fasta_filename)
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
create_pureseqtm_proteome_file <- function(
  fasta_filename,
  topology_filename = tempfile(fileext = ".top"),
  folder_name = get_default_pureseqtm_folder()
) {
  if (!file.exists(fasta_filename)) {
    stop("FASTA file '", fasta_filename, "' not found")
  }
  # We need to check for PureseqTM,
  # as PureseqTM accepts and ignores garbage.
  # See https://github.com/PureseqTM/PureseqTM_Package/issues/14
  t_sequences <- pureseqtmr::load_fasta_file_as_tibble(
    fasta_filename = fasta_filename
  )
  pureseqtmr::check_protein_sequences(t_sequences$sequence)

  pureseqtmr::check_pureseqtm_installation(folder_name)


  pureseqtm_folder <- file.path(folder_name, "PureseqTM_Package")
  testthat::expect_true(dir.exists(pureseqtm_folder))
  bin_filename <- file.path(pureseqtm_folder, "PureseqTM_proteome.sh")
  testthat::expect_true(file.exists(bin_filename))
  cmds <- c(
    bin_filename,
    "-i", fasta_filename,
    "-o", topology_filename
  )
  result <- NA
  suppressWarnings({
    result <- system2(
      command = cmds[1],
      args = cmds[-1],
      stdout = TRUE,
      stderr = TRUE
    )
  })
  status <- attr(x = result, which = "status")
  if (!is.null(status) && status  != 0) {
    stop(
      "PureseqTM error when running commands '",
      paste(cmds, collapse = " "), "'\n",
      "PureseqTM error message: ", result
    )
  }
  testthat::expect_true(file.exists(topology_filename))
  topology_filename
}
