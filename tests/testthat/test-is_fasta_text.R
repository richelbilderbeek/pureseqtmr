test_that("1 gene", {

  text <- c(
    ">gene",
    "000001111"
  )
  expect_true(is_fasta_text(text))
})
