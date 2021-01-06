#' Count the number of TMHs in a topology
#' @inheritParams default_params_doc
#' @examples
#' count_n_tmhs("00000000000000000000000000")
#' count_n_tmhs("00000000001111100000000000")
#' count_n_tmhs(c("0", "1"))
#' @export
count_n_tmhs <- function(topology_strs) {
  stringr::str_count(topology_strs, "01") +
    (substring(topology_strs, 1, 1) == "1")
}
