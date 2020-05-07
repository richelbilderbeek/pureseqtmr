#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param download_url the URL to download PureseqTM from
#' @param fasta_filename path to a FASTA file
#' @param folder_name superfolder of PureseqTM.
#'   The superfolder's name is \code{/home/[user_name]/.local/share}
#'   by default, as can be obtained by
#'   \link{get_default_pureseqtm_folder}
#' @param locatome text similar to a FASTA file, with protein names
#'   and the locations of its amino acids
#' @param protein_sequence a protein sequence
#' @param protein_sequences one or more protein sequences
#' @param pureseqtm_filename filename to write the PureseqTM results to
#' @param pureseqtm_result the result of a PureseqTM run
#' @param verbose set to TRUE for more output
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  download_url,
  fasta_filename,
  folder_name,
  locatome,
  protein_sequence,
  protein_sequences,
  pureseqtm_filename,
  pureseqtm_result,
  verbose
) {
  # Nothing
}
