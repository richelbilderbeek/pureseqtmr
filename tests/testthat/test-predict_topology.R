test_that("single protein", {
  if (!is_pureseqtm_installed()) return()
  fasta_filename <- get_example_filename("1bhaA.fasta")
  t_topology <- predict_topology(fasta_filename)
  expect_true("name" %in% names(t_topology))
  expect_true("topology" %in% names(t_topology))
  expect_equal(1, nrow(t_topology))

  t_fasta <- load_fasta_file_as_tibble(fasta_filename)
  expect_equal(nrow(t_fasta), nrow(t_topology))
  expect_equal(
    t_fasta$name,
    t_topology$name
  )
  expect_equal(
    nchar(t_fasta$sequence),
    nchar(t_topology$topology)
  )
})

test_that("multiple proteins", {
  if (!is_pureseqtm_installed()) return()
  fasta_filename <- get_example_filename("test_proteome.fasta")
  t_topology <- predict_topology(fasta_filename)
  expect_true("name" %in% names(t_topology))
  expect_true("topology" %in% names(t_topology))
  expect_equal(3, nrow(t_topology))

  t_fasta <- load_fasta_file_as_tibble(fasta_filename)
  expect_equal(nrow(t_fasta), nrow(t_topology))
  expect_equal(
    t_fasta$name,
    t_topology$name
  )
  expect_equal(
    nchar(t_fasta$sequence),
    nchar(t_topology$topology)
  )
})

test_that("no proteins", {
  fasta_filename <- tempfile()
  readr::write_lines(x = c(), file = fasta_filename)
  t_topology <- predict_topology(fasta_filename)
  expect_true("name" %in% names(t_topology))
  expect_true("topology" %in% names(t_topology))
  expect_equal(0, nrow(t_topology))

  t_fasta <- load_fasta_file_as_tibble(fasta_filename)
  expect_equal(nrow(t_fasta), nrow(t_topology))
  expect_equal(
    t_fasta$name,
    t_topology$name
  )
  expect_equal(
    nchar(t_fasta$sequence),
    nchar(t_topology$topology)
  )
})

test_that("Names should be in the same order", {

  if (!is_on_ci()) return()
  if (!is_pureseqtm_installed()) return()
  # This is bug in PureseqTM, reported at
  # https://github.com/PureseqTM/PureseqTM_Package/issues/11
  #
  # Up until then, pureseqtmr needs to correct for this

  # The FASTA filename
  fasta_filename <- system.file("extdata", "5728.fasta", package = "pureseqtmr")
  expect_true(file.exists(fasta_filename))
  t_fasta  <- load_fasta_file_as_tibble(fasta_filename)

  # Predict the topology
  t_topology <- predict_topology(fasta_filename = fasta_filename)
  expect_equal(
    t_fasta$name,
    t_topology$name
  )
  expect_equal(
    nchar(t_fasta$sequence),
    nchar(t_topology$topology)
  )
})

test_that("Cannot do selenoproteins", {

  fasta_filename <- system.file(
    "extdata", "human_selenoproteins.fasta",
    package = "pureseqtmr"
  )
  expect_error(
    predict_topology(fasta_filename = fasta_filename),
    "Character 'U' is not a valid amino acid symbol"
  )
})

test_that("Cannot do garbage", {

  fasta_filename <- system.file(
    "extdata", "garbage.fasta",
    package = "pureseqtmr"
  )
  expect_error(
    predict_topology(fasta_filename = fasta_filename),
    "Character '!' is not a valid amino acid symbol"
  )
})

test_that("Cannot do too short proteins", {

  fasta_filename <- system.file(
    "extdata", "short.fasta",
    package = "pureseqtmr"
  )
  expect_error(
    predict_topology(fasta_filename = fasta_filename),
    "A protein sequence must contain at least three amino acids"
  )
})
