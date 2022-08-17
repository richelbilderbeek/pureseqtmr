#' Parse a topology (`.topo`) file to a table
#' with a \code{name} and \code{topology} column
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble}
#' with a \code{name} and \code{topology} column,
#' as can be checked by \link{check_topology}
#' @examples
#' topology_filename <- system.file(
#'  "extdata", "100507436.topo", package = "pureseqtmr"
#' )
#' load_topology_file_as_tibble(topology_filename)
#' @export
load_topology_file_as_tibble <- function(
    topology_filename
) {
  topology <- pureseqtmr::load_fasta_file_as_tibble_cpp(
    normalizePath(topology_filename)
  )
  testthat::expect_equal(names(topology), c("name", "sequence"))
  names(topology) <- c("name", "topology")
  testthat::expect_equal(names(topology), c("name", "topology"))
  topology
}
