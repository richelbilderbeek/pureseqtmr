#' Count the number of TMHs in a topology
#' @inheritParams default_params_doc
#' @examples
#' count_n_tmhs("00000000000000000000000000")
#' count_n_tmhs("00000000001111100000000000")
#' @export
count_n_tmhs <- function(topology_str) {
  n_tmhs <- stringr::str_count(topology_str, "01")
  if (substring(topology_str, 1, 1) == "1") n_tmhs <- n_tmhs + 1
  n_tmhs
}
