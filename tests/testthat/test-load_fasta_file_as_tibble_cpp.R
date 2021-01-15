test_that("SARS-CoV-2", {
  fasta_filename <- system.file(
    "extdata", "UP000464024.fasta",
    package = "pureseqtmr"
  )
  t <- load_fasta_file_as_tibble_cpp(fasta_filename)
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
  t <- load_fasta_file_as_tibble_cpp(fasta_filename)
  expect_true(tibble::is_tibble(t))
  expect_equal(t$name[1], "1")
  expect_equal(t$name[2], "2")
  expect_equal(t$sequence[1], "A")
  expect_equal(t$sequence[2], "CG")
})

test_that("allow empty lines", {
  text <- c(
    ">1",
    "A",
    ">2",
    ""
  )
  fasta_filename <- tempfile()
  readr::write_lines(x = text, file = fasta_filename)
  t <- load_fasta_file_as_tibble_cpp(fasta_filename)
  expect_true(tibble::is_tibble(t))
  expect_equal(t$name[1], "1")
  expect_equal(t$name[2], "2")
  expect_equal(t$sequence[1], "A")
  expect_equal(t$sequence[2], "")
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
  t <- load_fasta_file_as_tibble_cpp(fasta_filename_1)
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
  t <- load_fasta_file_as_tibble_cpp(fasta_filename)
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
  t <- load_fasta_file_as_tibble_cpp(fasta_filename_1)
  save_tibble_as_fasta_file(t = t, fasta_filename = fasta_filename_2)
  expect_equal(
    readr::read_lines(fasta_filename_1),
    readr::read_lines(fasta_filename_2)
  )
})

test_that("Allow empty sequences", {
  fasta_filename <- system.file(
    "extdata", "100507436.topo",
    package = "pureseqtmr"
  )
  t <- load_fasta_file_as_tibble_cpp(fasta_filename)
  expect_true(tibble::is_tibble(t))
  expect_true("name" %in% names(t))
  expect_true("sequence" %in% names(t))
  expect_equal(12, nrow(t))
  expect_true(all(!is.na(t$sequence)))
})

test_that("FASTA file with empty sequences -> tibble -> FASTA file", {
  fasta_filename <- system.file(
    "extdata", "100507436.topo",
    package = "pureseqtmr"
  )
  t <- load_fasta_file_as_tibble_cpp(fasta_filename)
  fasta_filename_2 <- tempfile()
  save_tibble_as_fasta_file(t = t, fasta_filename = fasta_filename_2)
  expect_equal(
    readr::read_lines(fasta_filename),
    readr::read_lines(fasta_filename_2)
  )
})

test_that("tibble with empty sequences -> FASTA file -> tibble", {
  t <- tibble::tibble(
    name = c("A", "B"),
    sequence = c("", "")
  )
  fasta_filename <- tempfile()
  save_tibble_as_fasta_file(t = t, fasta_filename = fasta_filename)
  t_again <- load_fasta_file_as_tibble_cpp(fasta_filename = fasta_filename)
  expect_equal(t$name, t_again$name)
  expect_equal(t$sequence, t_again$sequence)
})

test_that("error on two consecutive names", {
  text <- c(
    ">1",
    ">2",
    "A"
  )
  fasta_filename <- tempfile()
  readr::write_lines(x = text, file = fasta_filename)
  expect_error(
    load_fasta_file_as_tibble_cpp(fasta_filename),
    "Invalid FASTA file: second consecutive line starting with '>' in line 2"
  )
})

test_that("error on start with sequence", {
  text <- c(
    "A",
    ">1",
    "A"
  )
  fasta_filename <- tempfile()
  readr::write_lines(x = text, file = fasta_filename)
  expect_error(
    load_fasta_file_as_tibble_cpp(fasta_filename),
    "Invalid FASTA file: expected a line starting with '>' in line 1"
  )
})

test_that("Compare speed", {
  # load_fasta_file_as_tibble_cpp is approx 10k times faster
  skip("Run locally")
  fasta_filename <- system.file(
    "extdata", "UP000464024.fasta",
    package = "pureseqtmr"
  )

  profvis::profvis({
    for (i in seq_len(10)) {
      t <- load_fasta_file_as_tibble_cpp(fasta_filename)
      t <- load_fasta_file_as_tibble(fasta_filename)
    }
  })
})
