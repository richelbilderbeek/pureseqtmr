test_that("use", {
  expect_true(is_valid_protein_sequence("FAMILY"))
  expect_false(is_valid_protein_sequence("UFAMILYU"))
  expect_false(is_valid_protein_sequence("???"))
  expect_false(is_valid_protein_sequence("FAMILY#VW"))
  expect_false(is_valid_protein_sequence("nonsense"))
  expect_false(is_valid_protein_sequence("VW"))
  expect_false(is_valid_protein_sequence(NULL))
  expect_false(is_valid_protein_sequence(Inf))
  expect_false(is_valid_protein_sequence(c()))
  expect_false(is_valid_protein_sequence(c("FAMILYVW", "FAMILYVW")))
  expect_false(is_valid_protein_sequence(NA))
})

test_that("verbose", {
  expect_message(
    is_valid_protein_sequence("UFAMILYU", verbose = TRUE),
    "Character 'U' is not a valid amino acid symbol"
  )
})
