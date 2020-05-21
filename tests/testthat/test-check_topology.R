test_that("use", {
  expect_error(check_topology("nonsense"))
  expect_error(check_topology(""))
  expect_error(check_topology(NA))
  expect_error(check_topology(NULL))
  expect_error(check_topology(Inf))
  expect_error(check_topology(3.14))
  expect_error(
    check_topology(
      topology = tibble::tibble()
    )
  )
  expect_error(
    check_topology(
      topology = tibble::tibble(name = "X", nonsense = "Y")
    )
  )

})

test_that("use", {
  if (!is_pureseqtm_installed()) return()
  fasta_filename <- get_example_filename("1bhaA.fasta")
  topology <- predict_topology(fasta_filename)
  expect_silent(check_topology(topology))
})
