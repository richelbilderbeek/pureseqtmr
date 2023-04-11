#' Check one or more protein sequences
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
#' Will \link{stop} at the first invalid protein sequence,
#' with a helpful error message.
#' @examples
#' check_protein_sequences(c("FAMILYVW", "FAMILYVW"))
#' @export
check_protein_sequences <- function(protein_sequences) {
  if (length(protein_sequences) == 0) {
    stop(
      "'protein_sequences' must have at least one element\n",
      "protein_sequences: ", paste(protein_sequences, collapse = ","), "\n",
      "length(protein_sequences): ", length(protein_sequences)
    )
  }
  if (!is.character(protein_sequences)) {
    stop(
      "'protein_sequences' must be of type character\n",
      "protein_sequences: ", protein_sequences, "\n",
      "class(protein_sequences): ", class(protein_sequences)
    )
  }
  alphabet <- Peptides::aaList()
  pattern <- paste0(alphabet, collapse = "")
  matches <- stringr::str_locate(
    string = protein_sequences,
    pattern = paste0("[^", pattern, "]")
  )
  invalid_rows <- which(!is.na(matches[, 1]))
  if (length(invalid_rows) > 0) {
    first_invalid_row <- invalid_rows[1]
    invalid_pos <- matches[first_invalid_row, 1]
    protein_sequence <- protein_sequences[first_invalid_row]
    invalid_character <- stringr::str_sub(
      protein_sequence,
      invalid_pos,
      invalid_pos
    )
    stop(
      "Sequence ", first_invalid_row, " is invalid:\n",
      "Character '", invalid_character, "' is not a valid amino acid symbol\n",
      "Valid amino acid symbols: ", pattern, "\n",
      "Protein sequence: ", protein_sequence, "\n",
      "Position: ", invalid_pos
    )
  }
  invalid_rows <- which(nchar(protein_sequences) < 3)
  if (length(invalid_rows) > 0) {
    first_invalid_row <- invalid_rows[1]
    protein_sequence <- protein_sequences[first_invalid_row]
    stop(
      "Sequence ", first_invalid_row, " is invalid:\n",
      "A protein sequence must contain at least three amino acids\n",
      "Protein sequence: ", protein_sequence
    )
  }
}
