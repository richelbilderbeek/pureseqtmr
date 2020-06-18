#' Predict the topology of a proteome
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the columns 'name'
#' and 'topology', where the 'name' column hold all the proteins' names,
#' and 'topology' contains all respective topologies.
#' @examples
#' library(testthat)
#'
#' if (is_pureseqtm_installed()) {
#'   fasta_filename <- get_example_filename("1bhaA.fasta")
#'   topology <- predict_topology(fasta_filename)
#'   expect_true("name" %in% names(topology))
#'   expect_true("topology" %in% names(topology))
#'   expect_equal(1, nrow(topology))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
predict_topology <- function(
  fasta_filename,
  folder_name = get_default_pureseqtm_folder(),
  topology_filename = tempfile(fileext = ".top")
) {
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
  testthat::expect_equal(
    length(gene_line_indices), length(topology_line_indices)
  )


  tibble::tibble(
    name = substring(topology_text[gene_line_indices], 2),
    topology = topology_text[topology_line_indices]
  )
}
