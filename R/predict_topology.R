#' Predict the topology of proteins from file
#'
#' Predict the topology of zero, one or more proteins,
#' of which the names and sequences are stored in the FASTA format
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the columns 'name'
#' and 'topology', where the 'name' column hold all the proteins' names,
#' and 'topology' contains all respective topologies.
#' @seealso use \link{mock_predict_topology} to do a mock prediction,
#'   as can be useful in testing
#' @examples
#' if (is_pureseqtm_installed()) {
#'   fasta_filename <- get_example_filename("1bhaA.fasta")
#'   predict_topology(fasta_filename)
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
predict_topology <- function(
  fasta_filename,
  folder_name = get_default_pureseqtm_folder(),
  topology_filename = tempfile(fileext = ".top")
) {
  # Empty FASTA file returns an empty tibble
  if (length(readr::read_lines(fasta_filename)) == 0) {
    return(
      tibble::tibble(
        name = character(0),
        topology = character(0)
      )
    )
  }
  # PureseqTM does not preserve the order of genes in the FASTA file.
  # This is bug in PureseqTM, reported at
  # https://github.com/PureseqTM/PureseqTM_Package/issues/11
  #
  # Up until then, pureseqtmr needs to correct for this:
  #
  # Use the tibble with the correctly ordered genes
  # Contains the protein names and sequences
  t_fasta <- pureseqtmr::load_fasta_file_as_tibble(fasta_filename)
  # Contains the protein names and topologies in the same
  # sequence as t_fasta
  t_topology <- tibble::tibble(
    name = t_fasta$name,
    topology = NA
  )

  # Go through the sequence one-by-one due to PureseqTM quirk
  for (i in seq_len(nrow(t_fasta))) {
    # Create a FASTA file only for the sequence
    this_fasta_filename <- tempfile(
      pattern = paste0("pureseqtmr_", i, "_"),
      fileext = ".fasta"
    )
    save_tibble_as_fasta_file(
      t = t_fasta[i, ],
      fasta_filename = this_fasta_filename
    )
    pureseqtm_proteome_text <- pureseqtmr::run_pureseqtm_proteome(
      fasta_filename = this_fasta_filename,
      folder_name = folder_name,
      topology_filename = topology_filename
    )
    t_this_topology <- pureseqtmr::parse_pureseqtm_proteome_text(
      pureseqtm_proteome_text
    )
    testthat::expect_equal(1, nrow(t_this_topology))
    t_topology$topology[i] <- t_this_topology$topology[1]
  }
  testthat::expect_equal(nrow(t_fasta), nrow(t_topology))
  testthat::expect_equal(
    t_fasta$name,
    t_topology$name
  )
  testthat::expect_equal(
    nchar(t_fasta$sequence),
    nchar(t_topology$topology)
  )
  t_topology
}
