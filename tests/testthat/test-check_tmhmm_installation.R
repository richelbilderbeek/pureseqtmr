test_that("use", {
  skip("WIP")
  if (!is_pureseqtm_installed()) return()

  # Locally, PureseqTM is expected to be installed
  expect_silent(check_pureseqtm_installation())

  if (!is_on_travis()) return()

  expect_error(
    check_pureseqtm_installation(folder_name = "nonsense"),
    "PureseqTM binary not found at location '"
  )

  # Only bin
  folder_name <- tempdir()
  install_pureseqtm_bin(folder_name = folder_name)
  expect_error(
    check_pureseqtm_installation(folder_name = folder_name),
    "PureseqTM not set up completely"
  )
})
