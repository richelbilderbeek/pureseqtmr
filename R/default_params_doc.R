#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param download_url the URL to download PureseqTM from
#' @param fasta_filename path to a FASTA file
#' @param fasta_file_text text of a FASTA file
#' @param folder_name superfolder of PureseqTM.
#'   The superfolder's name is \code{/home/[user_name]/.local/share}
#'   by default, as can be obtained by
#'   \link{get_default_pureseqtm_folder}
#' @param protein_sequence a protein sequence, with
#'   the amino acids as capitals, for
#'   example `MEILCEDNTSLSSIPNSL`.
#'   Use \link{check_protein_sequence} to check if
#'   a protein sequence is valid.
#' @param protein_sequences one ore more protein sequence,
#'   each sequence with the amino acids as capitals, for
#'   example `MEILCEDNTSLSSIPNSL`
#' @param pureseqtm_filename filename to write the PureseqTM results to
#' @param pureseqtm_proteome_text the output of a call
#'   to \code{PureseqTM_proteome.sh}
#' @param pureseqtm_result the result of a PureseqTM run
#' @param pureseqtm_url URL of the PureseqTM git repository
#' @param temp_fasta_filename temporary FASTA filename,
#'   which will deleted after usage
#' @param temp_folder_name path of a temporary folder.
#'   The folder does not need to exist.
#'   Files that are out in this folder are not automatically
#'   deleted, which is not a problem, as the default
#'   path given by \link{tempdir} is automatically cleaned
#'   by the operating system
#' @param topology the topology as a \link[tibble]{tibble}
#'   with the columns 'name' and 'topology',
#'   where the 'name' column hold all the proteins' names,
#'   and 'topology' contains the respective topologies as strings.
#' @param topology_filename name of the file to save a protein's
#'   topology to
#' @param topology_str the topology as a string,
#'   for example \code{000000111100000}
#' @param topology_strs the topologies as zero, one oor more strings,
#'   for example \code{c("0", "1")}
#' @param verbose set to TRUE for more output
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  download_url,
  fasta_filename,
  fasta_file_text,
  folder_name,
  protein_sequence,
  protein_sequences,
  pureseqtm_filename,
  pureseqtm_proteome_text,
  pureseqtm_result,
  pureseqtm_url,
  temp_fasta_filename,
  temp_folder_name,
  topology,
  topology_filename,
  topology_str,
  topology_strs,
  verbose
) {
  # Nothing
}
