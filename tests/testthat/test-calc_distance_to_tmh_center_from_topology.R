test_that("Issue #8: calc_distance_to_tmh_center_from_topology", {
  return()
  # Issue
  get_example_filenames()
  fasta_filename <- system.file("extdata", "100507436.topo", package = "pureseqtmr")
  topology <- load_topology_file_as_tibble(fasta_filename)
  expect_true(tibble::is_tibble(topology))
  expect_true("name" %in% names(topology))
  expect_true("sequence" %in% names(topology))
  pureseqtmr::check_topology(topology)


  t_distances <- calc_distance_to_tmh_center_from_topology(topology)
  testthat::expect_true("name" %in% names(t_distances))
  testthat::expect_true("position" %in% names(t_distances))
  testthat::expect_true("distance_to_tmh_center" %in% names(t_distances))

})
