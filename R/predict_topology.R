#' Predict the topology of proteins
#'
#' Predict the topology of zero, one or more proteins,
#' of which the names and sequences are stored in the FASTA format
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the columns 'name'
#' and 'topology', where the 'name' column hold all the proteins' names,
#' and 'topology' contains all respective topologies.
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

  if (1 == 1) {
    # Use the tibble with the correctly ordered genes
    HIERO
    t_fasta <- pureseqtmr::load_fasta_file_as_tibble(fasta_filename)
    t_topology <- tibble::tibble(
      name = t_fasta$name,
      topology = NA
    )
    for (i in seq_len(nrow(t_fasta))) {
      # Create a FASTA file only for the sequence
      fasta_filename
      topology_text <- pureseqtmr::run_pureseqtm_proteome(
        fasta_filename,
        folder_name = get_default_pureseqtm_folder(),
        topology_filename = tempfile(fileext = ".top")
      )

      t_topology$topology[i] <-
        pureseqtmr::predict_topology_from_sequence(
          t_fasta$sequence[i]
        )
    }
  } else {
    # Workaround, abandoned approach
    topology_text <- pureseqtmr::run_pureseqtm_proteome(
      fasta_filename,
      folder_name = get_default_pureseqtm_folder(),
      topology_filename = tempfile(fileext = ".top")
    )
    # Only select the lines that have a gene name and a topolgy
    n_lines <- length(topology_text)
    testthat::expect_equal(n_lines %% 3, 0)
    gene_line_indices <- seq(from = 1, to = n_lines, by = 3)
    topology_line_indices <- seq(from = 3, to = n_lines, by = 3)
    testthat::expect_equal(
      length(gene_line_indices), length(topology_line_indices)
    )

    t_topology <- tibble::tibble(
      name = substring(topology_text[gene_line_indices], 2),
      topology = topology_text[topology_line_indices]
    )
    # PureseqTM does not preserve the order of genes in the FASTA file.
    # This is bug in PureseqTM, reported at
    # https://github.com/PureseqTM/PureseqTM_Package/issues/11
    #
    # Up until then, pureseqtmr needs to correct for this
    t_topology_sorted <- pureseqtmr::sort_topology_in_fasta_order(
      fasta_filename = fasta_filename,
      t_topology = t_topology
    )
    # Checking if order is the same, need to delete later
    t_fasta <- pureseqtmr::load_fasta_file_as_tibble(fasta_filename)
    testthat::expect_equal(nrow(t_fasta), nrow(t_topology))

    t_topology <- t_topology_sorted
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
