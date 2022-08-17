test_that("use", {
  topo_filename <- system.file(
    "extdata", "100507436.topo", package = "pureseqtmr"
  )
  expect_true(file.exists(topo_filename))
  topology <- load_topology_file_as_tibble(topo_filename)
  expect_silent(check_topology(topology))
})
