test_that("Issue #8: calc_distance_to_tmh_center_from_topology", {
  topology <- tibble::tibble(
    name = "Fictional_1",
    topology = "00000000000000000000000000000000000000011111111111111111100000"
  )
  pureseqtmr::check_topology(topology)
  distances <- calc_distance_to_tmh_center_from_topology(topology)
  expect_true("name" %in% names(distances))
  expect_true("position" %in% names(distances))
  expect_true("distance_to_tmh_center" %in% names(distances))
})

test_that("Issue #8: calc_distance_to_tmh_center_from_topology", {
  fasta_filename <- system.file(
    "extdata", "100507436.topo", package = "pureseqtmr"
  )
  topology <- load_topology_file_as_tibble(fasta_filename)
  distances <- calc_distance_to_tmh_center_from_topology(topology)
  expect_true("name" %in% names(distances))
  expect_true("position" %in% names(distances))
  expect_true("distance_to_tmh_center" %in% names(distances))
})
