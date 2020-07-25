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
#' if (is_pureseqtm_installed()) {
#'   # Obtain an example filename
#'   fasta_filename <- get_example_filename("1bhaA.fasta")
#'
#'   # Get the topology as a tibble
#'   topology <- predict_topology(fasta_filename)
#'
#'   # show the topology
#'   plot_topology(topology)
#' }
#' @author Richèl J.C. Bilderbeek
#' @docType package
#' @name pureseqtmr
NULL
