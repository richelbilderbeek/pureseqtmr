#' Run PureseqTM directy on a protein sequence
#'
#' Will \link{stop} if the protein sequence is shorter than three
#' amino acids.
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
  folder_name = get_default_pureseqtm_folder(),
  temp_fasta_filename = tempfile(fileext = ".fasta")
) {
  pureseqtmr::check_protein_sequence(protein_sequence)
  pureseqtmr::predict_topologies_from_sequences(
    protein_sequences = protein_sequence,
    folder_name = folder_name,
    temp_fasta_filename = temp_fasta_filename
  )
}
