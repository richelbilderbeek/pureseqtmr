test_that("use", {
  if (!is_pureseqtm_installed()) return()

  protein_sequence <- "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLMSLAIADMLLGFLVMPVSMLTILYGYRWP" # nolint indeed long
  locatome <- run_pureseqtm_on_sequence(protein_sequence)
  expect_equal(
    locatome,
      "00000000111111111111111111110000000000000111111111111111111111100000000" # nolint indeed long
    # "iiiiiiMMMMMMMMMMMMMMMMMMMMMMMooooooooooooooMMMMMMMMMMMMMMMMMMMMMMMiiiii" # nolint indeed long
    # This is the TMHMM result
  )
})
