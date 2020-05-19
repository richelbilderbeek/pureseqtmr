test_that("use", {

  if (!is_pureseqtm_installed()) return()

  fasta_filename <- system.file(
    "extdata", "pureseqtm.fasta", package = "pureseqtmr"
  )
  locatome <- run_pureseqtm(fasta_filename)
  df <- locatome_to_df(locatome)
  expect_true("name" %in% names(df))
  expect_true("locatome" %in% names(df))
  expect_equal(1, nrow(df))
  expect_equal(2, ncol(df))
})
