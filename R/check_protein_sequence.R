#' Check one protein sequence
#'
#' Will \link{stop} if the protein sequence is invalid,
#' with a helpful error message.
#'
#' A protein sequence is invalid if:
#'  * it has zero, two or more sequences
#'  * the sequence contains zero, 1 or 2 amino acids
#'  * the sequence contains characters that are not in the
#'    amino acid uppercase alphabet,
#'    that is \code{ACDEFGHIKLMNPQRSTVWY}
#' @inheritParams default_params_doc
#' @return nothing.
#' Will \link{stop} if the protein sequence is invalid,
#' with a helpful error message.
#' @examples
#' check_protein_sequence("FAMILYVW")
#' @export
check_protein_sequence <- function(protein_sequence) {
  if (length(protein_sequence) != 1) {
    stop(
      "'protein_sequence' must be exactly one element\n",
      "protein_sequence: ", paste(protein_sequence, collapse = ","), "\n",
      "length(protein_sequence): ", length(protein_sequence)
    )
  }
  if (!is.character(protein_sequence)) {
    stop(
      "'protein_sequence' must be of type character\n",
      "protein_sequence: ", protein_sequence, "\n",
      "class(protein_sequences): ", class(protein_sequence)
    )
  }
  pureseqtmr::check_protein_sequences(
    protein_sequences = protein_sequence
  )
}
