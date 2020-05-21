test_that("single protein", {
  if (!is_pureseqtm_installed()) return()
  fasta_filename <- get_example_filename("1bhaA.fasta")
  topology <- predict_topology(fasta_filename)
  expect_true("name" %in% names(topology))
  expect_true("topology" %in% names(topology))
  expect_equal(1, nrow(topology))
})

test_that("multiple proteins", {
  if (!is_pureseqtm_installed()) return()
  fasta_filename <- get_example_filename("test_proteome.fasta")
  readLines(fasta_filename)
  topology <- predict_topology(fasta_filename)
  expect_true("name" %in% names(topology))
  expect_true("topology" %in% names(topology))
  expect_equal(3, nrow(topology))
})
