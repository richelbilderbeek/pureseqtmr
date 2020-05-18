test_that("use", {
  if (!is_pureseqtm_installed()) return()

  fasta_filename <- system.file("extdata", "pureseqtm.fasta", package = "pureseqtmr")
  readLines(fasta_filename)
  filenames <- create_pureseqtm_files(fasta_filename)
  expect_equal(5, length(filenames))
  expect_true(all(file.exists((filenames))))
})
