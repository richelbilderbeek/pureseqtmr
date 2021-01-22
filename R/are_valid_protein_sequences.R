#' Determine if these are all valid protein sequences
#'
#' Determine if these are all valid protein sequences,
#' as can be used in topology prediction
#' @inheritParams default_params_doc
#' @return TRUE if the protein sequence is valid
#' @export
are_valid_protein_sequences <- function(
  protein_sequences,
  verbose = FALSE
) {
  are_valid <- FALSE
  tryCatch({
    pureseqtmr::check_protein_sequences(protein_sequences)
    are_valid <- TRUE
  }, error = function(e) {
    if (verbose) {
      message(e$message)
    }
  })
  are_valid
}
