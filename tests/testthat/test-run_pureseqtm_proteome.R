test_that("use", {
  if (!is_pureseqtm_installed()) return()
  fasta_filename <- get_example_filename("1bhaA.fasta")
  topology_text <- run_pureseqtm_proteome(fasta_filename)
  proteome_text <- readLines(fasta_filename)
  expect_equal(3, length(topology_text))
  expect_equal(proteome_text[1], topology_text[1])
})

test_that("cannot use on human selenoproteins", {
  fasta_filename <- system.file(
    "extdata", "human_selenoproteins.fasta",
    package = "pureseqtmr"
  )
  expect_error(
    run_pureseqtm_proteome(fasta_filename),
    "Character 'U' is not a valid amino acid symbol"
  )
})

test_that("cannot use on short protein", {
  fasta_filename <- system.file(
    "extdata", "short.fasta",
    package = "pureseqtmr"
  )
  expect_error(
    run_pureseqtm_proteome(fasta_filename),
    "A protein sequence must contain at least three amino acids"
  )
})
