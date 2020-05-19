#' Create the output file of a PureseqTM proteome run
#' @inheritParams default_params_doc
#' @return the filename
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

  text <- system2(
    command = bin_filename,
    args = c(
      "-i", fasta_filename,
      "-o", topology_filename
    ),
    stdout = TRUE,
    stderr = TRUE
  )

  if (text != "0\r") {
    stop("Warning or error: '", text, "'")
  }
  topology_filename
}
