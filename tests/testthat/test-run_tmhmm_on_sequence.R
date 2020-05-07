test_that("use", {
  skip("WIP")
  if (!is_pureseqtm_installed()) return()

  protein_sequence <- "QEKNWSALLTAVVIILTIAGNILVIMAVSLEKKLQNATNYFLMSLAIADMLLGFLVMPVSMLTILYGYRWP" # nolint indeed long
  locatome <- run_pureseqtm_on_sequence(protein_sequence)
  expect_equal(
    locatome,
    "iiiiiiMMMMMMMMMMMMMMMMMMMMMMMooooooooooooooMMMMMMMMMMMMMMMMMMMMMMMiiiii" # nolint indeed long
  )
})
