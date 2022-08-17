#' Check if the topology string is valid.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} with a helpful error message if
#' the topology is invalid.
#' @examples
#' check_topology_str("0000000000000000000000000011111111111111111100000")
#' @author Richèl J.C. Bilderbeek
#' @export
check_topology_str <- function(topology_str) {
  testthat::expect_equal(1, length(topology_str))
  testthat::expect_true(is.character(topology_str))
  testthat::expect_true(stringr::str_detect(topology_str, "^[01]*$"))
  invisible(topology_str)
}
