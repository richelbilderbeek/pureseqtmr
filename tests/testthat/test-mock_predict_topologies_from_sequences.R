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

test_that("garbage", {
  expect_error(
    mock_predict_topologies_from_sequences(
      protein_sequences = c("FAMILYVWF", "!@#$%^&*()")
    ),
    "Character '!' is not a valid amino acid symbol"
  )
})

test_that("selenoprotein", {
  expect_error(
    mock_predict_topologies_from_sequences(
      protein_sequences = c("FAMILYVWF", "U")
    ),
    "Character 'U' is not a valid amino acid symbol"
  )
})

test_that("too short", {
  expect_error(
    mock_predict_topologies_from_sequences(
      protein_sequences = c("FAMILYVWF", "EI")
    ),
    "A protein sequence must contain at least three amino acids"
  )
})
