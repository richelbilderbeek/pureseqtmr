test_that("use", {
  skip("WIP")
  if (!is_pureseqtm_installed()) return()

  fasta_filename <- system.file("extdata", "pureseqtm.fasta", package = "pureseqtm")
  text <- run_pureseqtm(fasta_filename)
  expect_true(length(text) >= 2)
})
