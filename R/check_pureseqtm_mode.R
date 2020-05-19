#' Check if the PureseqTM is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing
#' @export
check_pureseqtm_mode <- function(mode) {
  if (length(mode) != 1) {
    stop("'mode' must be one element")
  }
  if (class(mode) != "character") {
    stop("'mode' must be of class 'character'")
  }
  if (!mode %in% c("proteome", "protein")) {
    stop("'mode' must be either 'proteome' or 'protein'")
  }
}
