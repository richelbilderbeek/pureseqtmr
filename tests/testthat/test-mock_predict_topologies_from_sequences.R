test_that("use", {
  protein_sequences <- c(
    "FAMILYVWFAMILYVW",
    "FAMILYVWFAMILY"
  )
  topologies <- mock_predict_topologies_from_sequences(
    protein_sequences = protein_sequences
  )
  expect_equal(length(protein_sequences), length(topologies))
  expect_equal(nchar(protein_sequences), nchar(topologies))
})
