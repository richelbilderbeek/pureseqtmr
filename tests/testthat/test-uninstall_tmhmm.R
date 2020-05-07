test_that("uninstall absent PureseqTM must throw", {
  skip("Cannot test with expiring download link")

  expect_error(
    uninstall_pureseqtm(folder_name = "absent"),
    "Cannot uninstall absent PureseqTM at"
  )
})
