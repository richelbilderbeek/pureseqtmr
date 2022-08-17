test_that("Issue #8: calc_distance_to_tmh_center_from_topology", {
  return()
  # Issue
  t_distances <- pureseqtmr::calc_distance_to_tmh_center_from_topology(t_topology)
  testthat::expect_true("name" %in% names(t_distances))
  testthat::expect_true("position" %in% names(t_distances))
  testthat::expect_true("distance_to_tmh_center" %in% names(t_distances))

})
