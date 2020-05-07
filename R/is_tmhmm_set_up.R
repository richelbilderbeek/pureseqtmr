#' Determine if PureseqTM is set up
#' @inheritParams default_params_doc
#' @return TRUE if PureseqTM is set up, FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @export
is_pureseqtm_set_up <- function(
  folder_name = get_default_pureseqtm_folder()
) {
  bin_filename <- file.path(folder_name, "pureseqtm-2.0c", "bin", "pureseqtm")

  if (!file.exists(bin_filename)) return(FALSE)
  lines <- readLines(bin_filename)
  if (lines[1] == "#!/usr/local/bin/perl") return(FALSE)

  options_filename <- file.path(
    folder_name, "pureseqtm-2.0c", "lib", "PureseqTM2.0.options"
  )
  testthat::expect_true(file.exists(options_filename))
  lines <- readLines(options_filename)
  if (any(lines == "PrintNumbers")) return(FALSE)
  if (any(lines == "PrintScore")) return(FALSE)
  if (any(lines == "PrintStat")) return(FALSE)
  if (any(lines == "PrintSeq")) return(FALSE)
  TRUE
}
