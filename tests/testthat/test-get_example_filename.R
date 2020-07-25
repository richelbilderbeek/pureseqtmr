test_that("use", {
  if (!is_pureseqtm_installed()) return()

  fasta_filename <- "1bhaA.fasta"
  full_path <- get_example_filename(fasta_filename)
  expect_true(file.exists(full_path))
})

test_that("abuse", {
  expect_error(
    get_example_filename("nonsense"),
    "'filename' not found"
  )
})
