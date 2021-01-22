test_that("use", {
  expect_silent(check_protein_sequences(protein_sequences = "FAMILY"))
  expect_silent(check_protein_sequences(c("FAMILYVW", "FAMILYVW")))

  # I assume PureseqTM ignores selenocysteines,
  # better to give an error message,
  # than to give half-baked results.
  # See https://github.com/PureseqTM/PureseqTM_Package/issues/12
  expect_error(
    check_protein_sequences(protein_sequences = c("FAMILYVW", "U")),
    "Character 'U' is not a valid amino acid symbol"
  )
  expect_error(
    check_protein_sequences("???"),
    "Character '\\?' is not a valid amino acid symbol"
  )
  expect_error(
    check_protein_sequences("FAMILY#VW"),
    "Character '#' is not a valid amino acid symbol"
  )
  expect_error(
    check_protein_sequences("nonsense"),
    "Character 'n' is not a valid amino acid symbol"
  )
  expect_error(
    check_protein_sequences("VW"),
    "A protein sequence must contain at least three amino acids"
  )
  expect_error(
    check_protein_sequences(NULL),
    "'protein_sequences' must have at least one element"
  )
  expect_error(check_protein_sequences(Inf))
  expect_error(
    check_protein_sequences(c()),
    "'protein_sequences' must have at least one element"
  )
  expect_error(
    check_protein_sequences(NA),
    "'protein_sequences' must be of type character"
  )
})
