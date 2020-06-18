#' Is the line of text the name of a protein, as used within
#' a FASTA filename?
#' @param line line of text from a FASTA filename
#' @return \link{TRUE} if the line can be the name of a protein in a FASTA file
#' @examples
#' library(testthat)
#'
#' expect_true(is_protein_name_line(">5H2A_CRIGR"))
#' expect_false(is_protein_name_line("5H2A_CRIGR"))
#' expect_false(is_protein_name_line("000001111100000"))
#' expect_false(is_protein_name_line(NA))
#' expect_false(is_protein_name_line(NULL))
#' expect_false(is_protein_name_line(""))
#' @author Richèl J.C. Bilderbeek
#' @export
is_protein_name_line <- function(line) {
  if (!is.character(line)) return(FALSE)
  substr(line, 1, 1) == ">"
}
