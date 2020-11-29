test_that("use", {
  skip("ABANDON THIS APPROACH")
  # The FASTA filename
  fasta_filename <- system.file("extdata", "5728.fasta", package = "pureseqtmr")
  testthat::expect_true(file.exists(fasta_filename))
  t_fasta  <- pureseqtmr::load_fasta_file_as_tibble(fasta_filename)

  topo_filename <- system.file("extdata", "5728.topo", package = "pureseqtmr")
  testthat::expect_true(file.exists(topo_filename))
  t_topology  <- readr::read_csv(
    topo_filename,
    col_types = readr::cols(
      name = readr::col_character(),
      topology = readr::col_character()
    )
  )

  # Unsorted undeed
  expect_false(
    all(t_fasta$name == t_topology$name)
  )
  expect_false(
    all(nchar(t_fasta$sequence) == nchar(t_topology$topology))
  )

  t_topology_sorted <- sort_topology_in_fasta_order(
    fasta_filename = fasta_filename,
    t_topology = t_topology
  )

  expect_true(
    all(t_fasta$name == t_topology_sorted$name)
  )
  expect_true(
    all(nchar(t_fasta$sequence) == nchar(t_topology_sorted$topology))
  )

})
