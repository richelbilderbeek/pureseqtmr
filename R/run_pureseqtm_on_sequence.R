#' Run PureseqTM directy on a protein sequence
#' @param protein_sequence a protein sequence, with
#'   the amino acids as capitals, for
#'   example `MEILCEDNTSLSSIPNSL`
#' @return the locatome
#' @examples
#' library(testthat)
#'
#' if (1 == 2 && is_pureseqtm_installed()) {
#'   protein_sequence <- paste0(
#'     "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLM",
#'     "SLAIADMLLGFLVMPVSMLTILYGYRWP"
#'   )
#'   locatome <- run_pureseqtm_on_sequence(protein_sequence)
#'   expected_locatome <- paste0(
#'     "iiiiiiMMMMMMMMMMMMMMMMMMMMMMMoooooooooooooo",
#'     "MMMMMMMMMMMMMMMMMMMMMMMiiiii"
#'   )
#'   expect_equal(locatome, expected_locatome)
#' }
#' @export
run_pureseqtm_on_sequence <- function(protein_sequence) {
  check_pureseqtm_installation()

  filename <- tempfile()
  text <- c(">temp", protein_sequence)
  writeLines(text = text, con = filename)
  run_pureseqtm(filename)[3]
}
