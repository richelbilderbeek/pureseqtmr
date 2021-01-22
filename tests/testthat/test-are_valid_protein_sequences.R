test_that("use", {
  expect_true(are_valid_protein_sequences(protein_sequences = "FAMILY"))
  expect_true(are_valid_protein_sequences(c("FAMILYVW", "FAMILYVW")))
  expect_false(are_valid_protein_sequences(protein_sequences = c("FAMILYVW", "U")))
  expect_false(are_valid_protein_sequences("???"))
  expect_false(are_valid_protein_sequences("FAMILY#VW"))
  expect_false(are_valid_protein_sequences("nonsense"))
  expect_false(are_valid_protein_sequences("VW"))
  expect_false(are_valid_protein_sequences(NULL))
  expect_false(are_valid_protein_sequences(Inf))
  expect_false(are_valid_protein_sequences(c()))
  expect_false(are_valid_protein_sequences(NA))
})

test_that("verbose", {
  expect_message(
    are_valid_protein_sequences(
      protein_sequences = c("FAMILYVW", "U"),
      verbose = TRUE
    ),
    "Character 'U' is not a valid amino acid symbol"
  )
})
