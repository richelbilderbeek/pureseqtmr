test_that("uninstall absent PureseqTM must throw", {
  expect_error(
    uninstall_pureseqtm(folder_name = "absent"),
    "Cannot uninstall absent PureseqTM at"
  )
})
