test_that("use", {
  if (!is_pureseqtm_installed()) return()
  skip("WIP")
  fasta_filename <- system.file("extdata", "pureseqtm.fasta", package = "pureseqtmr")
  proteome_text <- readLines(fasta_filename)
  pureseqtm_text <- run_pureseqtm(fasta_filename)
  expect_equal(2, length(pureseqtm_text))
  expect_equal(proteome_text[1], pureseqtm_text[1])
})
