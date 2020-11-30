#' Parse the output of a call to \code{PureseqTM_proteome.sh}
#' @inheritParams default_params_doc
#' @export
parse_pureseqtm_proteome_text <- function(
pureseqtm_proteome_text
) {
  n_lines <- length(pureseqtm_proteome_text)
  testthat::expect_equal(n_lines %% 3, 0)
  gene_line_indices <- seq(from = 1, to = n_lines, by = 3)
  sequence_line_indices <- seq(from = 2, to = n_lines, by = 3)
  topology_line_indices <- seq(from = 3, to = n_lines, by = 3)
  testthat::expect_equal(
    length(gene_line_indices), length(sequence_line_indices)
  )
  testthat::expect_equal(
    length(gene_line_indices), length(topology_line_indices)
  )
  tibble::tibble(
    name = substring(pureseqtm_proteome_text[gene_line_indices], 2),
    sequence = pureseqtm_proteome_text[sequence_line_indices],
    topology = pureseqtm_proteome_text[topology_line_indices]
  )
}
