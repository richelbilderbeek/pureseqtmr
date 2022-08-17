#' Calculate the the distance for each amino acid to the center
#' of the TMH
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the columns
#' 'position' and 'distance_to_tmh_center'
#' @author Richèl J.C. Bilderbeek
#' @export
calc_distance_to_tmh_center_from_topology_str <- function(
  topology_str
) {
  pureseqtmr::check_topology_str(topology_str)
  distance_to_tmh_center <-
      calc_distance_to_tmh_center_from_topology_str_cpp_stl(
    topology_str
  )
  if (length(distance_to_tmh_center) == 0) {
    return(
      tibble::tibble(
        position = numeric(0),
        distance_to_tmh_center = numeric(0)
      )
    )
  }
  tibble::tibble(
    position = seq(1, length(distance_to_tmh_center)),
    distance_to_tmh_center = distance_to_tmh_center
  )
}
