test_that("use", {
  if (!is_pureseqtm_installed()) return()
  sequences <- c(
    "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLM",
    "VVIILTIRGNILVIMAVSLE"
  )
  expect_equal(c(TRUE, FALSE), are_tmhs(sequences))
})
