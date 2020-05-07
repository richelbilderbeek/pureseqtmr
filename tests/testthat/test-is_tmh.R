test_that("use", {
  skip("WIP")
  if (!is_pureseqtm_installed()) return()

  expect_true(is_tmh("VVIILTIAGNILVIMAVSLE"))
  expect_false(is_tmh("VVIILTIRGNILVIMAVSLE"))
})
