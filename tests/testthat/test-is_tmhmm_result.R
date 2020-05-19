test_that("use, positive", {
  skip("WIP")
  if (!is_pureseqtm_installed()) return()

  fasta_filename <- get_example_filename("1bhaA.fasta")
  pureseqtm_result <- run_pureseqtm(fasta_filename)
  expect_true(is_pureseqtm_result(pureseqtm_result))
  expect_true(is_pureseqtm_result(pureseqtm_result[1:2]))
  expect_false(is_pureseqtm_result(pureseqtm_result[1]))
  expect_false(is_pureseqtm_result(pureseqtm_result[2]))
})
