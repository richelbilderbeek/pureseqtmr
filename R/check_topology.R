#' Check if the topology is valid.
#'
#' Check if the argument is of the same type as a predicted topology,
#' as can be created with \link{predict_topology}.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} with a helpful error message if
#' the topology is invalid.
#' @examples
#' library(testthat)
#'
#' if (is_pureseqtm_installed()) {
#'   fasta_filename <- get_example_filename("1bhaA.fasta")
#'   topology <- predict_topology(fasta_filename)
#'   expect_silent(check_topology(topology))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
check_topology <- function(topology) {
  if (!tibble::is_tibble(topology)) {
    stop("'topology' must be a tibble")
  }
  expected_names <- c("name", "topology")
  if (length(names(topology)) != length(expected_names)) {
    stop("'topology' must have the correct number of columns")
  }

  if (!all(names(topology) %in% expected_names)) {
    stop("'topology' must have columns 'name' and 'topology'")
  }
}
