#' Set up PureseqTM
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
set_up_pureseqtm <- function(
  folder_name = get_default_pureseqtm_folder()
) {
  bin_filename <- file.path(folder_name, "pureseqtm-2.0c", "bin", "pureseqtm")
  if (!file.exists(bin_filename)) {
    stop(
      "PureseqTM binary file absent at path '", bin_filename, "'.\n",
      "\n",
      "Tip: from R, run 'pureseqtm::install_pureseqtm()'\n",
      "  with a (non-expired) download URL\n"
    )
  }
  testthat::expect_true(file.exists(bin_filename))
  lines <- readLines(bin_filename)
  if (lines[1] == "#!/usr/local/bin/perl") {
    # Peregrine by default
    lines[1] <- "#!/software/software/Perl/5.26.1-GCCcore-6.4.0/bin/perl"
    if (Sys.getenv("HOSTNAME") != "peregrine.hpc.rug.nl") {
      lines[1] <- "#!/usr/bin/perl"
    }
  }
  writeLines(text = lines, con = bin_filename)

  options_filename <- file.path(
    folder_name, "pureseqtm-2.0c", "lib", "PureseqTM2.0.options"
  )
  testthat::expect_true(file.exists(options_filename))
  lines <- readLines(options_filename)
  lines[which(lines == "PrintNumbers")] <- "#PrintNumbers #for pureseqtm"
  lines[which(lines == "PrintScore")] <- "#PrintScore #for pureseqtm"
  lines[which(lines == "PrintStat")] <- "#PrintStat #for pureseqtm"
  lines[which(lines == "PrintSeq")] <- "#PrintSeq #for pureseqtm"
  writeLines(text = lines, con = options_filename)
}
