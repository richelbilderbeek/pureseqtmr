test_that("use", {
  skip("WIP")
  if (!is_pureseqtm_installed()) return()

  fasta_filename <- get_example_filename("1bhaA.fasta")
  topology <- run_pureseqtm_proteome(fasta_filename)
  expect_silent(plot_topology(topology))
})

test_that("use", {
  skip("WIP")
  if (!is_pureseqtm_installed()) return()

  fasta_filename <- get_example_filename("1bhaA.fasta")
  topology <- run_pureseqtm_proteome(fasta_filename)
  expect_silent(plot_topology(topology))
})
