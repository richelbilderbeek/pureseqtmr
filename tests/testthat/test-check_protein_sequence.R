test_that("use", {
  expect_silent(check_protein_sequence(protein_sequence = "FAMILY"))

  # I assume PureseqTM ignores selenocysteines,
  # better to give an error message,
  # than to give half-baked results.
  # See https://github.com/PureseqTM/PureseqTM_Package/issues/12
  expect_error(
    check_protein_sequence("UFAMILYU"),
    "Character 'U' is not a valid amino acid symbol"
  )
  expect_error(
    check_protein_sequence("???"),
    "Character '\\?' is not a valid amino acid symbol"
  )
  expect_error(
    check_protein_sequence("FAMILY#VW"),
    "Character '#' is not a valid amino acid symbol"
  )
  expect_error(
    check_protein_sequence("nonsense"),
    "Character 'n' is not a valid amino acid symbol"
  )
  expect_error(
    check_protein_sequence("VW"),
    "A protein sequence must contain at least three amino acids"
  )
  expect_error(
    check_protein_sequence(NULL),
    "'protein_sequence' must be exactly one element"
  )
  expect_error(check_protein_sequence(Inf))
  expect_error(
    check_protein_sequence(c()),
    "'protein_sequence' must be exactly one element"
  )
  expect_error(
    check_protein_sequence(c("FAMILYVW", "FAMILYVW")),
    "'protein_sequence' must be exactly one element"
  )
  expect_error(
    check_protein_sequence(protein_sequence = NA),
    "'protein_sequence' must be of type character"
  )
})
