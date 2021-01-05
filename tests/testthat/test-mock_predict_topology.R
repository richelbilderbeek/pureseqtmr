test_that("single protein", {
  fasta_filename <- get_example_filename("1bhaA.fasta")
  topology <- mock_predict_topology(fasta_filename)
  expect_true("name" %in% names(topology))
  expect_true("topology" %in% names(topology))
  expect_equal(1, nrow(topology))
})

test_that("multiple proteins", {
  fasta_filename <- get_example_filename("test_proteome.fasta")
  readLines(fasta_filename)
  topology <- mock_predict_topology(fasta_filename)
  expect_true("name" %in% names(topology))
  expect_true("topology" %in% names(topology))
  expect_equal(3, nrow(topology))
})

test_that("no proteins", {
  fasta_filename <- tempfile()
  readr::write_lines(x = c(), file = fasta_filename)
  topology <- mock_predict_topology(fasta_filename)
  expect_true("name" %in% names(topology))
  expect_true("topology" %in% names(topology))
  expect_equal(0, nrow(topology))
})

test_that("Names should be in the same order", {

  # This is bug in PureseqTM, reported at
  # https://github.com/PureseqTM/PureseqTM_Package/issues/11
  #
  # Up until then, pureseqtmr needs to correct for this

  # The FASTA filename
  fasta_filename <- system.file("extdata", "5728.fasta", package = "pureseqtmr")
  testthat::expect_true(file.exists(fasta_filename))
  t_fasta  <- pureseqtmr::load_fasta_file_as_tibble(fasta_filename)

  # Predict the topology
  t_topology <- pureseqtmr::mock_predict_topology(fasta_filename = fasta_filename)
  expect_equal(
    t_fasta$name,
    t_topology$name
  )
  expect_equal(
    nchar(t_fasta$sequence),
    nchar(t_topology$topology)
  )
})