#' Run PureseqTM directy on a protein sequence
#' @inheritParams default_params_doc
#' @return a topology as a string of zeroes and ones, where a one denotes
#' that the corresponding amino acid is located within the membrane.
#' @seealso use \link{mock_predict_topologies_from_sequences}
#' to mock the prediction of protein sequences, as can be useful
#' in testing
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
predict_topologies_from_sequences <- function(# nolint indeed a long function name
  protein_sequences,
  folder_name = get_default_pureseqtm_folder(),
  temp_fasta_filename = tempfile(fileext = ".fasta")
) {
  pureseqtmr::check_protein_sequences(protein_sequences)
  pureseqtmr::check_pureseqtm_installation(folder_name)
  t_sequences <- tibble::tibble(
    name = paste0("protein_", seq_along(protein_sequences)),
    sequence = protein_sequences
  )
  save_tibble_as_fasta_file(
    t = t_sequences,
    fasta_filename = temp_fasta_filename
  )
  t_topologies <- pureseqtmr::predict_topology(temp_fasta_filename)
  file.remove(temp_fasta_filename)
  t_topologies$topology
}
