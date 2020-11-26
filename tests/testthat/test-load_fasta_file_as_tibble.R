test_that("SARS-CoV-2", {
  fasta_filename <- system.file(
    "extdata", "UP000464024.fasta",
    package = "pureseqtmr"
  )
  t <- load_fasta_file_as_tibble(fasta_filename)
  expect_true(tibble::is_tibble(t))
  expect_true("name" %in% names(t))
  expect_true("sequence" %in% names(t))
  expect_equal(14, nrow(t))
  expect_true(all(!is.na(t$sequence)))
})

test_that("detailed use", {
  text <- c(
    ">1",
    "A",
    ">2",
    "CG"
  )
  fasta_filename <- tempfile()
  readr::write_lines(x = text, file = fasta_filename)
  t <- load_fasta_file_as_tibble(fasta_filename)
  expect_true(tibble::is_tibble(t))
  expect_equal(t$name[1], "1")
  expect_equal(t$name[2], "2")
  expect_equal(t$sequence[1], "A")
  expect_equal(t$sequence[2], "CG")
})

test_that("fasta file -> tibble -> fasta file", {
  text <- c(
    ">1",
    "A",
    ">2",
    "CG"
  )
  fasta_filename_1 <- tempfile()
  fasta_filename_2 <- tempfile()
  readr::write_lines(x = text, file = fasta_filename_1)
  t <- load_fasta_file_as_tibble(fasta_filename_1)
  save_tibble_as_fasta_file(t = t, fasta_filename = fasta_filename_2)
  expect_equal(
    readr::read_lines(fasta_filename_1),
    readr::read_lines(fasta_filename_2)
  )
})

test_that("empy FASTA file", {
  text <- c()
  fasta_filename <- tempfile()
  readr::write_lines(x = text, file = fasta_filename)
  t <- load_fasta_file_as_tibble(fasta_filename)
  expect_true(tibble::is_tibble(t))
  expect_equal(0, nrow(t))
  expect_equal(2, ncol(t))
  expect_equal(names(t), c("name", "sequence"))
})

test_that("empty fasta file -> tibble -> empty fasta file", {
  text <- c()
  fasta_filename_1 <- tempfile()
  fasta_filename_2 <- tempfile()
  readr::write_lines(x = text, file = fasta_filename_1)
  t <- load_fasta_file_as_tibble(fasta_filename_1)
  save_tibble_as_fasta_file(t = t, fasta_filename = fasta_filename_2)
  expect_equal(
    readr::read_lines(fasta_filename_1),
    readr::read_lines(fasta_filename_2)
  )
})
