test_that("use", {
  if (!is_on_ci()) return()

  if (is_pureseqtm_installed()) {
    uninstall_pureseqtm()
    expect_false(is_pureseqtm_installed())
    install_pureseqtm()
    expect_true(is_pureseqtm_installed())
  } else  {
    expect_true(!is_pureseqtm_installed())
    install_pureseqtm()
    expect_true(is_pureseqtm_installed())
    uninstall_pureseqtm()
    expect_false(is_pureseqtm_installed())
  }

})

test_that("re-install must fails", {
  if (!is_pureseqtm_installed()) return()

  expect_error(
    install_pureseqtm(),
    "PureseqTMis already installed"
  )
})
