#' Run PureseqTM directy on a protein sequence
#' @param protein_sequence a protein sequence, with
#'   the amino acids as capitals, for
#'   example `MEILCEDNTSLSSIPNSL`
#' @inheritParams default_params_doc
#' @return a topology as a string of zeroes and ones
#' @examples
#' library(testthat)
#'
#' if (is_pureseqtm_installed()) {
#'   protein_sequence <- paste0(
#'     "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLM",
#'     "SLAIADMLLGFLVMPVSMLTILYGYRWP"
#'   )
#'   topology <- predict_topology_from_sequence(protein_sequence)
#'   expect_true(is_topology_line(topology))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
predict_topology_from_sequence <- function(
  protein_sequence,
  folder_name = get_default_pureseqtm_folder()
) {
  pureseqtmr::check_pureseqtm_installation(folder_name)

  fasta_filename <- tempfile()
  text <- c(">temp", protein_sequence)
  writeLines(text = text, con = fasta_filename)
  pureseqtmr::predict_topology(fasta_filename)$topology
}
