#' Internal function
#'
#' Sorts the rows of the topology tibble, as returned
#' by \link{run_pureseqtm_proteome} in the order of names
#' as the corresponding FASTA file.
#'
#' PureseqTM does not preserve the order of genes in the FASTA file.
#' This is bug in PureseqTM, reported at
#' https://github.com/PureseqTM/PureseqTM_Package/issues/11
#'
#' Up until then, pureseqtmr needs to correct for this
#' @inheritParams default_params_doc
#' @export
sort_topology_in_fasta_order <- function(
    fasta_filename,
    t_topology
) {
  stop("ABANDON THIS APPROACH")
  t_fasta <- pureseqtmr::load_fasta_file_as_tibble(fasta_filename)
  testthat::expect_equal(nrow(t_fasta), nrow(t_topology))


  testthat::expect_true(all(t_topology$name %in% t_fasta$name))
  testthat::expect_true(all(t_fasta$name %in% t_topology$name))
  names(t_fasta)
  names(t_topology)
  unique(t_fasta$name)

  t_topology_sorted <- dplyr::left_join(
    t_fasta,
    t_topology,
    by = "name",
    keep = FALSE
  )
  t_topology_sorted

}
