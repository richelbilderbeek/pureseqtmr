#' Create a \link{pureseqtmr} report, to be used when reporting bugs
#' @inheritParams default_params_doc
#' @return Nothing.
#' @examples
#' pureseqtmr_report()
#' @author Richèl J.C. Bilderbeek
#' @export
pureseqtmr_report <- function(
  folder_name = get_default_pureseqtm_folder()
) {
  kat <- function(x) cat(x, sep = "\n")
  kat("**************")
  kat("* pureseqtmr *")
  kat("**************")
  kat(paste0("OS: ", rappdirs::app_dir()$os))
  kat("*************")
  kat("* PureseqTM *")
  kat("*************")
  kat(
    paste0(
      "Is PureseqTM installed: ",
      pureseqtmr::is_pureseqtm_installed(folder_name = folder_name)
    )
  )
  if (pureseqtmr::is_pureseqtm_installed(folder_name = folder_name)) {
    kat(
      paste0(
        "PureseqTM version: ",
        pureseqtmr::get_pureseqtm_version(folder_name = folder_name)
      )
    )
  }
  kat("***************")
  kat("* sessionInfo *")
  kat("***************")
  print(utils::sessionInfo())
}
