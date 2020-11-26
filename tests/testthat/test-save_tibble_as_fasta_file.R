test_that("use", {
  t <- tibble::tibble(
    name = c("1", "2"),
    sequence = c("A", "CG")
  )
  fasta_filename <- tempfile()
  save_tibble_as_fasta_file(t = t, fasta_filename = fasta_filename)
  text <- readr::read_lines(fasta_filename)
  expect_equal(text[1], ">1")
  expect_equal(text[2], "A")
  expect_equal(text[3], ">2")
  expect_equal(text[4], "CG")
})

test_that("tibble -> fasta file -> tibble", {
  t <- tibble::tibble(
    name = c("1", "2"),
    sequence = c("A", "CG")
  )
  fasta_filename <- tempfile()
  save_tibble_as_fasta_file(t = t, fasta_filename = fasta_filename)
  text <- readr::read_lines(fasta_filename)
  t_again <- load_fasta_file_as_tibble(fasta_filename = fasta_filename)
  expect_true(all(t == t_again))
})

test_that("empty tibble", {
  t <- tibble::tibble(
    name = character(0),
    sequence = character(0)
  )
  fasta_filename <- tempfile()
  save_tibble_as_fasta_file(t = t, fasta_filename = fasta_filename)
  text <- readr::read_lines(fasta_filename)
  expect_equal(length(text), 0)
})

test_that("empty tibble -> fasta file -> empty tibble", {
  t <- tibble::tibble(
    name = character(0),
    sequence = character(0)
  )
  fasta_filename <- tempfile()
  save_tibble_as_fasta_file(t = t, fasta_filename = fasta_filename)
  text <- readr::read_lines(fasta_filename)
  t_again <- load_fasta_file_as_tibble(fasta_filename = fasta_filename)
  expect_equal(names(t), names(t_again))
  expect_equal(nrow(t), nrow(t_again))
  expect_equal(ncol(t), ncol(t_again))
})
