#' Determine if this a valid protein sequence
#'
#' Determine if this is a valid protein sequence,
#' as can be used in topology prediction
#' @inheritParams default_params_doc
#' @return TRUE if the protein sequence is valid
#' @export
is_valid_protein_sequence <- function(
  protein_sequence,
  verbose = FALSE
) {
  is_valid <- FALSE
  tryCatch({
    pureseqtmr::check_protein_sequence(protein_sequence)
    is_valid <- TRUE
  }, error = function(e) {
    if (verbose) {
      message(e$message)
    }
  })
  is_valid
}
