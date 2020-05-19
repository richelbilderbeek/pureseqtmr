test_that("one protein with two TMHs", {
  topology <- predict_proteome_topology(
    get_example_filename("1bhaA.fasta")
  )
  tally <- tally_tmhs(topology)
  expect_true("name" %in% names(tally))
  expect_true("n_tmhs" %in% names(tally))
  expect_equal(nrow(topology), nrow(tally))
  expect_equal(1, nrow(tally))
  expect_equal(2, tally$n_tmhs[1])
})

test_that("three non-TMHs", {
  topology <- predict_proteome_topology(
    get_example_filename("test_proteome.fasta")
  )
  tally <- tally_tmhs(topology)
  expect_true("name" %in% names(tally))
  expect_true("n_tmhs" %in% names(tally))
  expect_equal(nrow(topology), nrow(tally))
})
