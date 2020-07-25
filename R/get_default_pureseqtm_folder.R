#' Get the path to the folder where this package installs
#' PureseqTM by default
#' @return the path to the folder where this package installs
#'   PureseqTM by default
#' @examples
#' get_default_pureseqtm_folder()
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_pureseqtm_folder <- function() {
  rappdirs::user_data_dir()
}
