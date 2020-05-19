#' Run PureseqTM on a proteome
#' @inheritParams default_params_doc
#' @return the topology of the proteome
#' @author Richèl J.C. Bilderbeek
#' @examples
#' library(testthat)
#'
#' if (is_pureseqtm_installed()) {
#'   fasta_filename <- get_example_filename("1bhaA.fasta")
#'   topology <- run_pureseqtm_proteome(fasta_filename)
#'   cat(topology, sep = "\n")
#' }
#' @seealso
#' \itemize{
#'   \item{
#'     Use \link{create_pureseqtm_files} to only create the PureseqTM
#'     output files
#'   }
#'   \item{
#'     Use \link{run_pureseqtm} to run PureseqTM on one gene in more detail
#'   }
#' }
#' @export
run_pureseqtm_proteome <- function(
  fasta_filename,
  folder_name = get_default_pureseqtm_folder(),
  topology_filename = tempfile(fileext = ".top")
) {
  pureseqtmr::check_pureseqtm_installation(folder_name)

  filename <- pureseqtmr::create_pureseqtm_proteome_file(
    fasta_filename = fasta_filename,
    topology_filename = topology_filename,
    folder_name = folder_name
  )
  readLines(filename)
}
