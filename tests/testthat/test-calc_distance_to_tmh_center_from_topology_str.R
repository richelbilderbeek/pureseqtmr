test_that("use", {
  return()
  # Issue
  topology_str <- "010"
  distances <- calc_distance_to_tmh_center_from_topology_str(topology_str)
  expect_true("position" %in% names(distances))
  expect_true("distance_to_tmh_center" %in% names(distances))
})
