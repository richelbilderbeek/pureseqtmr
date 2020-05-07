test_that("use", {
  skip("WIP")
  if (!is_pureseqtm_installed()) return()
  sequences <- c("VVIILTIAGNILVIMAVSLE", "VVIILTIRGNILVIMAVSLE")
  expect_equal(c(TRUE, FALSE), are_tmhs(sequences))
})
