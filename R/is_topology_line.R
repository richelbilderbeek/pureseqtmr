#' Is the line of text the topology, as used within
#' a FASTA filename?
#'
#' Is the line of text the topology, as used within
#' a FASTA filename? In this context, a topology is a string of zeroes
#' and ones, in which a one denotes that that amino acid is within
#' the membrane.
#' @param line line of text from a FASTA filename
#' @return \link{TRUE} if the line can be the text of a topology in a
#' FASTA file.
#' @examples
#' library(testthat)
#'
#' expect_true(is_topology_line("000010101011"))
#' expect_false(is_topology_line(">5H2A_CRIGR"))
#' expect_false(is_topology_line("5H2A_CRIGR"))
#' expect_false(is_topology_line(NA))
#' expect_false(is_topology_line(NULL))
#' expect_false(is_topology_line(""))
#' @author Richèl J.C. Bilderbeek
#' @export
is_topology_line <- function(line) {
  if (!is.character(line)) return(FALSE)
  if (nchar(line) == 0) return(FALSE)
  stringr::str_count(line, pattern = "(0|1)") == nchar(line)
}
