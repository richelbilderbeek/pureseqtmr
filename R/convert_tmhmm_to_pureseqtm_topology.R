#' Convert a TMHMM topology to a PureseqTM topology
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with column names
#' `name` and `topology`, as can be checked by \link{check_topology}
#' @examples
#' tmhmm_topo_filename <- system.file(
#'   "extdata", "UP000005640_9606_no_u.tmhmm", package = "pureseqtmr"
#' )
#' tmhmm_topology <- load_topology_file_as_tibble(tmhmm_topo_filename)
#' convert_tmhmm_to_pureseqtm_topology(tmhmm_topology)
#' @author Richèl J.C. Bilderbeek
#' @export
convert_tmhmm_to_pureseqtm_topology <- function(tmhmm_topology) {
  pureseqtmr::check_topology(tmhmm_topology)
  tmhmm_topology$topology <- stringr::str_replace_all(
    tmhmm_topology$topology,
    pattern = "m|M",
    replacement = "1"
  )
  tmhmm_topology$topology <- stringr::str_replace_all(
    tmhmm_topology$topology,
    pattern = "i|I|o|O",
    replacement = "0"
  )
  tmhmm_topology
}
