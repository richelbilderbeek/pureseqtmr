test_that("simple use", {
  pureseqtm_proteome_text <- c(
    ">1bhaA",
    "QAQITGRPEWIWLALGTALMGLGTLYFLVKGMGV",
    "0000000000111111111111111111100000"
  )
  t <- parse_pureseqtm_proteome_text(
    pureseqtm_proteome_text = pureseqtm_proteome_text
  )
  expect_true(tibble::is_tibble(t))
  expect_true("name" %in% names(t))
  expect_true("sequence" %in% names(t))
  expect_true("topology" %in% names(t))
  expect_equal(nrow(t), 1)
  expect_equal(t$name[1], "1bhaA")
  expect_equal(t$sequence[1], "QAQITGRPEWIWLALGTALMGLGTLYFLVKGMGV")
  expect_equal(t$topology[1], "0000000000111111111111111111100000")
})

test_that("use output of run_pureseqtm_proteome", {
  if (!is_pureseqtm_installed()) return()
  expect_silent(
    parse_pureseqtm_proteome_text(
      pureseqtm_proteome_text = run_pureseqtm_proteome(
        fasta_filename = get_example_filename("1bhaA.fasta")
      )
    )
  )
})
