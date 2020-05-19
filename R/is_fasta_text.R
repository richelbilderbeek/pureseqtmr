#' Is the text a FASTA file text?
#' @inheritParams default_params_doc
#' @export
is_fasta_text <- function(fasta_file_text) {
  if (class(fasta_file_text) != "character") return(FALSE)
  # Must alternate between lines with '>' and a sequence of iMo
  n_lines <- length(fasta_file_text)
  state <- "need_name"
  for (i in seq(1, n_lines)) {
    line <- fasta_file_text[i]
    if (state == "need_name") {
      if (!is_protein_name_line(line)) return(FALSE)
      state <- "need_sequence"
    } else if (state == "need_sequence") {
      if (!is_locatome_line(line)) {
        return(FALSE)
      }
      state <- "need_name_or_sequence"
    } else if (state == "need_name_or_sequence") {
        if (is_protein_name_line(line)) {
          state <- "need_sequence"
        } else if (is_locatome_line(line)) {
          # Just continue
        } else {
          return(FALSE)
        }
    }
  }
  state == "need_name_or_sequence"
}
