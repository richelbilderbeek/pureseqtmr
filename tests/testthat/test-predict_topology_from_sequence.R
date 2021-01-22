test_that("use", {
  if (!is_pureseqtm_installed()) return()
  protein_sequence <-
    "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLMSLAIADMLLGFLVMPVSMLTILYGYRWP"
  topology <- predict_topology_from_sequence(
    protein_sequence = protein_sequence
  )
  expect_equal(
    topology,
      "00000000111111111111111111110000000000000111111111111111111111100000000"
  )
})

test_that("selenocysteine", {
  # Bug report at https://github.com/PureseqTM/PureseqTM_Package/issues/12
  expect_error(
    predict_topology_from_sequence(
      protein_sequence = "U"
    ),
    "Character 'U' is not a valid amino acid symbol"
  )
})

test_that("nonsense character", {
  # Bug report at https://github.com/PureseqTM/PureseqTM_Package/issues/14
  expect_error(
    predict_topology_from_sequence(
      protein_sequence = "$"
    ),
    "Character '\\$' is not a valid amino acid symbol"
  )
})

test_that("short", {
  # Bug report at https://github.com/PureseqTM/PureseqTM_Package/issues/13
  expect_error(
    predict_topology_from_sequence(
      protein_sequence = "VW"
    ),
    "A protein sequence must contain at least three amino acids"
  )
})
