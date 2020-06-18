test_that("single protein", {
  if (!is_pureseqtm_installed()) return()
  fasta_filename <- get_example_filename("1bhaA.fasta")
  topology <- predict_topology(fasta_filename)
  expect_silent(plot_topology(topology))
})

test_that("three proteins", {
  if (!is_pureseqtm_installed()) return()
  if (!is_on_ci()) return()
  fasta_filename <- get_example_filename("test_proteome.fasta")
  topology <- predict_topology(fasta_filename)
  expect_silent(plot_topology(topology))
})
