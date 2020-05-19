test_that("use", {
  expect_true(is_topology_line("0001001010101"))
  expect_false(is_topology_line(">5H2A_CRIGR"))
  expect_false(is_topology_line("5H2A_CRIGR"))
  expect_false(is_topology_line(NA))
  expect_false(is_topology_line(NULL))
  expect_false(is_topology_line(""))
})
