#' Do a mock prediction of the topology of proteins
#'
#' Uses \link{predict_topology} for doing a real prediction
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the columns 'name'
#' and 'topology', where the 'name' column hold all the proteins' names,
#' and 'topology' contains all respective topologies.
#' @examples
#' fasta_filename <- tempfile()
#' save_tibble_as_fasta_file(
#'   t = tibble::tibble(
#'     name = c("A", "B"),
#'     sequence = c("FAMILY", "VW")
#'   ),
#'   fasta_filename = fasta_filename
#' )
#' mock_predict_topology(fasta_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
mock_predict_topology <- function(
  fasta_filename
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
  t_fasta <- pureseqtmr::load_fasta_file_as_tibble(fasta_filename)
  t_topology <- tibble::tibble(
    name = t_fasta$name,
    topology = NA
  )
  # Go through the sequence one-by-one due to PureseqTM quirk
  for (i in seq_len(nrow(t_fasta))) {
    t_topology$topology[i] <-
      paste0(rep("0", times = nchar(t_fasta$sequence[i])), collapse = "")
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
