test_that("use", {
  if (!is_pureseqtm_installed()) return()
  fasta_filename <- get_example_filename("1bhaA.fasta")
  topology <- predict_proteome_topology(fasta_filename)
  expect_true("name" %in% names(topology))
  expect_true("topology" %in% names(topology))
  expect_equal(1, nrow(topology))
})

