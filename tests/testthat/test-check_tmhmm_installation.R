test_that("use", {
  if (is_pureseqtm_installed()) {
    expect_silent(check_pureseqtm_installation())
  } else {
    expect_error(check_pureseqtm_installation())
  }
})

test_that("use, check folder", {
  if (!is_pureseqtm_installed()) return()

  expect_error(
    check_pureseqtm_installation(folder_name = "nonsense"),
    "Cannot find the PureseqTM folder"
  )
})

test_that("use, check binary", {
  if (!is_pureseqtm_installed()) return()

  folder_name <- tempfile()
  expect_silent(install_pureseqtm(folder_name = folder_name))
  expect_silent(check_pureseqtm_installation(folder_name = folder_name))

  # Be nasty: delete the binary
  pureseqtm_folder <- file.path(folder_name, "PureseqTM_Package")
  bin_filename <- file.path(pureseqtm_folder, "PureseqTM.sh")
  expect_true(file.exists(bin_filename))
  file.remove(bin_filename)

  expect_error(
    check_pureseqtm_installation(folder_name = folder_name),
    "Cannot find the PureseqTM binary"
  )
})
