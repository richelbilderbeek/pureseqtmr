#' Run PureseqTM on a proteome
#' @inheritParams default_params_doc
#' @return the topology of the proteome, using the same output as PureseqTM.
#' Use \link{predict_topology} to get the topology as a \link[tibble]{tibble}
#' @examples
#' library(testthat)
#'
#' if (is_pureseqtm_installed()) {
#'   fasta_filename <- get_example_filename("1bhaA.fasta")
#'   topology <- run_pureseqtm_proteome(fasta_filename)
#'
#'   expect_true(is_protein_name_line(topology[1]))
#'
#'   # Second line is the protein's amino acid sequence
#'   expect_equal(
#'     topology[2],
#'     paste0(
#'       "QAQITGRPEWIWLALGTALMGLGTLYFLVKGMGVS",
#'       "DPDAKKFYAITTLVPAIAFTMYLSMLLGYGLTMVPF"
#'     )
#'   )
#'   expect_true(is_topology_line(topology[3]))
#' }
#' @seealso
#' \itemize{
#'   \item{
#'     Use \link{predict_topology} to predict the topology
#'     of a proteome
#'   }
#'   \item{
#'     Use \link{create_pureseqtm_files} to only create the PureseqTM
#'     output files
#'   }
#' }
#' @author Richèl J.C. Bilderbeek
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
