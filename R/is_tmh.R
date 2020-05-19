#' Determine if the protein sequence contains at least one TMH.
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' if (is_pureseqtm_installed()) {
#'   expect_true(is_tmh("QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLM"))
#'   expect_false(is_tmh("VVIILTIRGNILVIMAVSLE"))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
is_tmh <- function(
  protein_sequence,
  folder_name = get_default_pureseqtm_folder()
) {
  check_pureseqtm_installation(folder_name)

  topology <- predict_topology_from_sequence(
    protein_sequence,
    folder_name
  )
  stringr::str_count(string = topology, pattern = "1") > 0
}
