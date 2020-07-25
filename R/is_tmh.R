#' Determine if the protein sequence contains at least one
#' transmembrane helix.
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the protein sequence contains at least one
#' transmembrane helix
#' @examples
#' if (is_pureseqtm_installed()) {
#'   # This sequence is a TMH
#'   is_tmh("QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLM")
#'
#'   # This sequence is not a TMH
#'   is_tmh("VVIILTIRGNILVIMAVSLE")
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
is_tmh <- function(
  protein_sequence,
  folder_name = get_default_pureseqtm_folder()
) {
  pureseqtmr::check_pureseqtm_installation(folder_name)

  topology <- pureseqtmr::predict_topology_from_sequence(
    protein_sequence,
    folder_name
  )
  stringr::str_count(string = topology, pattern = "1") > 0
}
