test_that("use", {
  expect_true(
    grepl(
      "/home/[A-Za-z0-9_]*/.local/share/pureseqtm-2.0c/bin/pureseqtm", # nolint really test for absolute path
      get_default_pureseqtm_bin_path()
    )
  )
})
