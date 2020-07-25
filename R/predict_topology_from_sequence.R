#' Run PureseqTM directy on a protein sequence
#' @param protein_sequence a protein sequence, with
#'   the amino acids as capitals, for
#'   example `MEILCEDNTSLSSIPNSL`
#' @inheritParams default_params_doc
#' @return a topology as a string of zeroes and ones, where a one denotes
#' that the corresponding amino acid is located within the membrane.
#' @examples
#' if (is_pureseqtm_installed()) {
#'   protein_sequence <- paste0(
#'     "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLM",
#'     "SLAIADMLLGFLVMPVSMLTILYGYRWP"
#'   )
#'   predict_topology_from_sequence(protein_sequence)
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
