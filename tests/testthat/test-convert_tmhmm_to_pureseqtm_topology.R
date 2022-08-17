test_that("use", {
  tmhmm_topo_filename <- system.file(
    "extdata", "UP000005640_9606_no_u.tmhmm", package = "pureseqtmr"
  )
  expect_true(file.exists(tmhmm_topo_filename))
  tmhmm_topology <- load_topology_file_as_tibble(tmhmm_topo_filename)
  topology <- convert_tmhmm_to_pureseqtm_topology(tmhmm_topology)
  expect_silent(check_topology(topology))
  expect_silent(Vectorize(check_topology_str)(topology$topology))
})
