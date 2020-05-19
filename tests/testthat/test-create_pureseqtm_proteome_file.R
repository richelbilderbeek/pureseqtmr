test_that("use", {
  if (!is_pureseqtm_installed()) return()

  fasta_filename <- get_example_filename("1bhaA.fasta")
  readLines(fasta_filename)
  filename <- create_pureseqtm_proteome_file(fasta_filename)
  expect_equal(1, length(filename))
  expect_true(file.exists((filename)))
})
