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
