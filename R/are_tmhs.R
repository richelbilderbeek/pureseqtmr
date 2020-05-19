#' Are the sequences TMHs?
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' if (1 == 2 && is_pureseqtm_installed()) {
#'   sequences <- c(
#'     "VVIILTIAGNILVIMAVSLE",
#'     "VVIILTIRGNILVIMAVSLE"
#'   )
#'   expect_equal(c(TRUE, FALSE), are_tmhs(sequences))
#' }
#' @export
are_tmhs <- function(protein_sequences) {
  check_pureseqtm_installation()

  results <- rep(NA, length(protein_sequences))
  for (i in seq_along(protein_sequences)) {
    results[i] <- is_tmh(protein_sequences[i])
  }
  results
}
