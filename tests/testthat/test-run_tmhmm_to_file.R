test_that("use", {
  skip("WIP")
  if (!is_pureseqtm_installed()) return()

  testthat::expect_true(is_pureseqtm_installed())
  pureseqtm_filename <- tempfile()
  run_pureseqtm_to_file(
    fasta_filename = system.file("extdata", "pureseqtm.fasta", package = "pureseqtm"),
    pureseqtm_filename = pureseqtm_filename
  )
  expect_true(file.exists(pureseqtm_filename))
  readLines(pureseqtm_filename)
})
