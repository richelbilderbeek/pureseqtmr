test_that("Issue #8: calc_distance_to_tmh_center_from_topology", {
  return()
  # Issue
  topology <- tibble::tibble(
    name = "Fictional_1",
    topology = "00000000000000000000000000000000000000011111111111111111100000"
  )
  pureseqtmr::check_topology(topology)
  distances <- calc_distance_to_tmh_center_from_topology(topology)
  testthat::expect_true("name" %in% names(t_distances))
  testthat::expect_true("position" %in% names(t_distances))
  testthat::expect_true("distance_to_tmh_center" %in% names(t_distances))
})

test_that("Issue #8: calc_distance_to_tmh_center_from_topology", {
  return()
  # Issue
  fasta_filename <- system.file(
    "extdata", "100507436.topo", package = "pureseqtmr"
  )
  topology <- load_topology_file_as_tibble(fasta_filename)
  # Simplify to one with a known TMH
  topology <- topology[8, ]
  pureseqtmr::check_topology(topology)
  topology$topology


  t_distances <- calc_distance_to_tmh_center_from_topology(topology)
  testthat::expect_true("name" %in% names(t_distances))
  testthat::expect_true("position" %in% names(t_distances))
  testthat::expect_true("distance_to_tmh_center" %in% names(t_distances))

})

test_that("Issue #8: calc_distance_to_tmh_center_from_topology", {
  return()
  # Issue
  fasta_filename <- system.file(
    "extdata", "100507436.topo", package = "pureseqtmr"
  )
  topology <- load_topology_file_as_tibble(fasta_filename)
  pureseqtmr::check_topology(topology)

  t_distances <- calc_distance_to_tmh_center_from_topology(topology)
  testthat::expect_true("name" %in% names(t_distances))
  testthat::expect_true("position" %in% names(t_distances))
  testthat::expect_true("distance_to_tmh_center" %in% names(t_distances))

})
