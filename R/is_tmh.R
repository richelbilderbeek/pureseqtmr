#' Determine if the protein sequence contains at least one TMH.
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' if (1 == 2) {
#'   expect_true(is_tmh("VVIILTIAGNILVIMAVSLE"))
#'   expect_false(is_tmh("VVIILTIRGNILVIMAVSLE"))
#' }
#' @export
is_tmh <- function(protein_sequence) {
  pureseqtm::check_pureseqtm_installation()

  locatome <- pureseqtm::run_pureseqtm_on_sequence(protein_sequence)
  stringr::str_count(string = locatome, pattern = "(M|m)") > 0
}

