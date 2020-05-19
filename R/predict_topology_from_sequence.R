#' Run PureseqTM directy on a protein sequence
#' @param protein_sequence a protein sequence, with
#'   the amino acids as capitals, for
#'   example `MEILCEDNTSLSSIPNSL`
#' @inheritParams default_params_doc
#' @return the locatome
#' @examples
#' library(testthat)
#'
#' if (is_pureseqtm_installed()) {
#'   protein_sequence <- paste0(
#'     "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLM",
#'     "SLAIADMLLGFLVMPVSMLTILYGYRWP"
#'   )
#'   topology <- predict_topology_from_sequence(protein_sequence)
#'   expect_equal(
#'     topology,
#'     "00000000111111111111111111110000000000000111111111111111111111100000000"
#'   )
#' }
#' @export
predict_topology_from_sequence <- function(
  protein_sequence,
  folder_name = get_default_pureseqtm_folder()
) {
  pureseqtmr::check_pureseqtm_installation(folder_name)

  filename <- tempfile()
  text <- c(">temp", protein_sequence)
  writeLines(text = text, con = filename)
  pureseqtmr::run_pureseqtm(filename)[3]
}
