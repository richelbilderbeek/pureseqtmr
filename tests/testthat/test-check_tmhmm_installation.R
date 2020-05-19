test_that("use", {
  if (!is_pureseqtm_installed()) return()

  # Locally, PureseqTM is expected to be installed
  expect_silent(check_pureseqtm_installation())

  if (!is_on_travis()) return()

  expect_error(
    check_pureseqtm_installation(folder_name = "nonsense"),
    "Cannot find the PureseqTM folder"
  )
})
