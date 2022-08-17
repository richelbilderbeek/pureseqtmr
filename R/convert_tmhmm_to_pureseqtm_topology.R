convert_tmhmm_to_pureseqtm_topology <- function(tmhmm_topology) {
  pureseqtmr::check_topology(tmhmm_topology)
  tmhmm_topology$topology <- stringr::str_replace_all(
    tmhmm_topology$topology,
    pattern = "m|M",
    replacement = "1"
  )
  tmhmm_topology$topology <- stringr::str_replace_all(
    tmhmm_topology$topology,
    pattern = "i|I|o|O",
    replacement = "0"
  )
  tmhmm_topology
}
