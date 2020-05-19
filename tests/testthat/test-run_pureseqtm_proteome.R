test_that("use", {
  if (!is_pureseqtm_installed()) return()
  skip("WIP")
  fasta_filename <- get_pureseqtm_example_filename("1bhaA.fasta")
  topology_text <- run_pureseqtm_proteome(fasta_filename)
  proteome_text <- readLines(fasta_filename)
  expect_equal(2, length(topology_text))
  expect_equal(proteome_text[1], topology_text[1])
})
