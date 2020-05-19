test_that("use", {
  if (!is_pureseqtm_installed()) return()

  pureseqtm_filename <- tempfile()
  run_pureseqtm_to_file(
    fasta_filename = get_pureseqtm_example_filename("1bhaA.fasta"),
    pureseqtm_filename = pureseqtm_filename
  )
  expect_true(file.exists(pureseqtm_filename))
  expect_true(length(readLines(pureseqtm_filename)) > 1)
})
