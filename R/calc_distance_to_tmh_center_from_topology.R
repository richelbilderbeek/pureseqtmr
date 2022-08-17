#' Calculate the the distance for each amino acid to the center
#' of the TMH
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the columns 'name'
#' and 'position' and 'distance_to_tmh_center'
#' @author Richèl J.C. Bilderbeek
#' @export
calc_distance_to_tmh_center_from_topology <- function(topology) {
  pureseqtmr::check_topology(topology)
  distances_list <- list() # One element per protein
  n_rows <- nrow(topology)
  for (i in seq_len(n_rows)) {
    t <- calc_distance_to_tmh_center_from_topology_str(
      topology_str = topology$topology[i]
    )
    t$name  <- topology$name[i]
    distances_list[[i]] <- t
  }
  distances <- dplyr::bind_rows(distances_list)
  dplyr::select(distances, "name", "position", "distance_to_tmh_center")
}
