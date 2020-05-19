test_that("use", {
  skip("WIP")
  if (!is_pureseqtm_installed()) return()

  fasta_filename <- get_pureseqtm_example_filename("1bhaA.fasta")
  locatome <- run_pureseqtm(fasta_filename)
  expect_silent(plot_locatome(locatome))
})

test_that("use", {
  skip("WIP")
  if (!is_pureseqtm_installed()) return()

  fasta_filename <- get_pureseqtm_example_filename("1bhaA.fasta")
  locatome <- run_pureseqtm(fasta_filename)
  expect_silent(plot_locatome(locatome))
})
