#' Predict the topology of a proteome
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble}
#' @examples
#' library(testthat)
#'
#' fasta_filename <- get_example_filename("1bhaA.fasta")
#' topology <- predict_proteome_topology(fasta_filename)
#' expect_true("name" %in% names(topology))
#' expect_true("topology" %in% names(topology))
#' expect_equal(1, nrow(topology))
#' @author Richèl J.C. Bilderbeek
#' @export
predict_proteome_topology <- function(
  fasta_filename,
  folder_name = get_default_pureseqtm_folder(),
  topology_filename = tempfile(fileext = ".top")
) {
  filename <- pureseqtmr::create_pureseqtm_proteome_file(
    fasta_filename = fasta_filename,
    topology_filename = topology_filename,
    folder_name = folder_name
  )
  topology_text <- pureseqtmr::run_pureseqtm_proteome(
    fasta_filename,
    folder_name = get_default_pureseqtm_folder(),
    topology_filename = tempfile(fileext = ".top")
  )
  # Only select the lines that have a gene name and a topolgy
  n_lines <- length(topology_text)
  testthat::expect_equal(n_lines %% 3, 0)
  gene_line_indices <- seq(from = 1, to = n_lines, by = 3)
  topology_line_indices <- seq(from = 3, to = n_lines, by = 3)
  testthat::expect_equal(length(gene_line_indices), length(topology_line_indices))
  tibble::tibble(
    name = topology_text[gene_line_indices],
    topology = topology_text[topology_line_indices]
  )
}
