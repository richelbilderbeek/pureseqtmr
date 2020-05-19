#' Count the number of TMHs in a topology
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the number of
#' TMHs per protein
#' @examples
#' library(testthat)
#'
#' if (is_pureseqtm_installed()) {
#'   topology <- predict_proteome_topology(
#'     get_example_filename("1bhaA.fasta")
#'   )
#'   tally <- tally_tmhs(topology)
#'   expect_true("name" %in% names(tally))
#'   expect_true("n_tmhs" %in% names(tally))
#'   expect_equal(nrow(topology), nrow(tally))
#'   expect_equal(1, nrow(tally))
#'   expect_equal(2, tally$n_tmhs[1])
#' }
#' @export
tally_tmhs <- function(
  topology
) {
  pureseqtmr::check_topology(topology)
  tally <- tibble::tibble(
    name = topology$name,
    n_tmhs = NA
  )
  n_rows <- nrow(tally)
  for (i in seq_len(n_rows)) {
    t <- topology$topology[i]
    n_tmhs <- stringr::str_count(t, "01")
    if (t[1] == "1") n_tmhs <- n_tmhs + 1
    tally$n_tmhs[i] <- n_tmhs
  }
  tally
}
