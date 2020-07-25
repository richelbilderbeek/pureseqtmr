test_that("use", {
  if (!is_pureseqtm_installed()) return()

  expect_equal(get_pureseqtm_version(), "v0.10")
})
