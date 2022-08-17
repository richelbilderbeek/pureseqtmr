#' Calculate the the distance for each amino acid to the center
#' of the TMH
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the columns 'name'
#' and 'position' and 'distance_to_tmh_center'
#' @author Richèl J.C. Bilderbeek
#' @export
calc_distance_to_tmh_center_from_topology <- function(topology) {
  pureseqtmr::check_topology(topology)
}
