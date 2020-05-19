test_that("use", {
  expect_true(
    file.exists(get_pureseqtm_example_filename("1bhaA.fasta")))
  expect_true(
    file.exists(get_pureseqtm_example_filename("1bhaA.pdbtm")))
  expect_true(
    file.exists(get_pureseqtm_example_filename("1bhaA.tgt")))
  expect_true(
    file.exists(get_pureseqtm_example_filename("4j7cK.fasta")))
  expect_true(
    file.exists(get_pureseqtm_example_filename("4j7cK.top")))
  expect_true(
    file.exists(get_pureseqtm_example_filename("human_20416.fasta")))
  expect_true(
    file.exists(get_pureseqtm_example_filename("Q8TCT8.fasta")))
  expect_true(
    file.exists(get_pureseqtm_example_filename("test_proteome.fasta")))
})
