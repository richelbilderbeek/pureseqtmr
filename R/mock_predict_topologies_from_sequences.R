#' Do a mock prediction directy on a protein sequence,
#' as can be useful in testing
#' Use \link{predict_topologies_from_sequences} for doing a real prediction.
#' @inheritParams default_params_doc
#' @return a topology as a string of zeroes and ones, where a one denotes
#' that the corresponding amino acid is located within the membrane.
#' @examples
#' protein_sequence <- paste0(
#'   "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLM",
#'   "SLAIADMLLGFLVMPVSMLTILYGYRWP"
#' )
#' mock_predict_topology_from_sequences(protein_sequence)
#' @author Richèl J.C. Bilderbeek
#' @export
mock_predict_topologies_from_sequences <- function(# nolint indeed a long function name
  protein_sequences
) {
  topologies <- rep("", times = length(protein_sequences))
  for (i in seq_along(protein_sequences)) {
    topologies[i] <- paste0(rep(0, times = nchar(protein_sequences[i])), collapse = "")
  }
  topologies
}
