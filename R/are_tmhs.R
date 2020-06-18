#' Are the sequences transmembrance helices?
#' @inheritParams default_params_doc
#' @return a vector of booleans of the same length as the
#'   number of sequences. The ith element is \link{TRUE} if
#'   the ith protein sequence is a transmembrane helix
#' @examples
#' library(testthat)
#'
#' if (is_pureseqtm_installed()) {
#'   sequences <- c(
#'     "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLM",
#'     "VVIILTIRGNILVIMAVSLE"
#'   )
#'   expect_equal(c(TRUE, FALSE), are_tmhs(sequences))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
are_tmhs <- function(
  protein_sequences,
  folder_name = get_default_pureseqtm_folder()
) {
  pureseqtmr::check_pureseqtm_installation(folder_name)

  results <- rep(NA, length(protein_sequences))
  for (i in seq_along(protein_sequences)) {
    results[i] <- pureseqtmr::is_tmh(protein_sequences[i])
  }
  results
}
