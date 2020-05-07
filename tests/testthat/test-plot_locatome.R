test_that("use", {
  skip("WIP")
  if (!is_pureseqtm_installed()) return()

  fasta_filename <- system.file("extdata", "pureseqtm.fasta", package = "pureseqtm")
  locatome <- run_pureseqtm(fasta_filename)
  expect_silent(plot_locatome(locatome))
})

test_that("use", {
  skip("WIP")
  if (!is_pureseqtm_installed()) return()

    fasta_filename <- system.file("extdata", "example_2.fasta", package = "pureseqtm")
  locatome <- run_pureseqtm(fasta_filename)
  expect_silent(plot_locatome(locatome))
})
