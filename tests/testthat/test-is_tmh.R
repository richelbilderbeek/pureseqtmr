test_that("use", {
  if (!is_pureseqtm_installed()) return()

  expect_true(is_tmh("QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLM"))
  expect_false(is_tmh("VVIILTIRGNILVIMAVSLE"))
})
