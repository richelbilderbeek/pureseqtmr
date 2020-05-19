#' pureseqtmr: estimate the topoplogy of membrane proteins
#'
#' Proteins reside in either the cell plasma of in the
#' cell membrane. A membrane protein goes through the
#' membrane at least once. There are multiple ways to span this
#' hydrophobic layer. One common structure is the transmembrane (alpha)
#' helix (TMH). Given the amino acid sequence of a membrane protein, this
#' package predicts which parts of the protein are TMHs
#'
#' @examples
#' library(testthat)
#'
#' if (1 == 2 && is_pureseqtm_installed()) {
#'   fasta_filename <- get_example_filename("1bhaA.fasta")
#'   locatome <- run_pureseqtm(fasta_filename)
#'
#'   # Show as text
#'   cat(locatome, sep = "\n")
#'
#'   # Show as plot
#'   plot_locatome(locatome)
#' }
#' @author Richèl J.C. Bilderbeek
#' @docType package
#' @name pureseqtmr
NULL
