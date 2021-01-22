test_that("single protein", {
  if (!is_pureseqtm_installed()) return()

  fasta_filename <- get_example_filename("1bhaA.fasta")
  topology_filename <- create_pureseqtm_proteome_file(fasta_filename)
  expect_equal(1, length(topology_filename))
  expect_true(file.exists((topology_filename)))
  expect_equal(0, length(readLines(topology_filename)) %% 3)
})

test_that("multiple proteins", {
  if (!is_pureseqtm_installed()) return()

  fasta_filename <- get_example_filename("test_proteome.fasta")
  topology_filename <- create_pureseqtm_proteome_file(fasta_filename)
  expect_equal(1, length(topology_filename))
  expect_true(file.exists((topology_filename)))
  expect_equal(0, length(readLines(topology_filename)) %% 3)
})

test_that("no proteins", {
  if (!is_pureseqtm_installed()) return()

  fasta_filename <- tempfile()
  readr::write_lines(x = c(), file = fasta_filename)
  expect_error(
    create_pureseqtm_proteome_file(fasta_filename),
    "'protein_sequences' must have at least one element"
  )
})

test_that("selenoproteins give an error", {
  fasta_filename <- system.file(
    "extdata", "human_selenoproteins.fasta", package = "pureseqtmr"
  )
  expect_error(
    create_pureseqtm_proteome_file(fasta_filename),
    "Character 'U' is not a valid amino acid symbol"
  )
})

test_that("two-amino acid protein gives an error", {
  fasta_filename <- system.file(
    "extdata", "short.fasta", package = "pureseqtmr"
  )
  expect_error(
    create_pureseqtm_proteome_file(fasta_filename),
    "A protein sequence must contain at least three amino acids"
  )
})

test_that("garbage gives an error", {
  fasta_filename <- system.file(
    "extdata", "garbage.fasta", package = "pureseqtmr"
  )
  expect_error(
    create_pureseqtm_proteome_file(fasta_filename),
    "Character '!' is not a valid amino acid symbol"
  )
})
