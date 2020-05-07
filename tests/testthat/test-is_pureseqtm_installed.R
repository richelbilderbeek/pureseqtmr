test_that("use", {
  if (!is_on_travis()) return()

  if (is_pureseqtm_installed()) {
    uninstall_pureseqtm()
    expect_false(is_pureseqtm_set_up())
    expect_false(is_pureseqtm_installed())
    install_pureseqtm(download_url = get_pureseqtm_url())
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
    install_pureseqtm_bin(),
    "PureseqTM binary is already installed"
  )
})
