#' Get the URL of the PureseqTM source code
#' @return a URL as a character vector of one element
#' @examples
#' library(testthat)
#'
#' url <- get_pureseqtm_url()
#' expect_equal(1, length(url))
#' @author Richèl J.C. Bilderbeek
#' @export
get_pureseqtm_url <- function() {
  "https://github.com/PureseqTM/PureseqTM_Package"
}
