

test_that("ktag works", {

  # -- negative tests
  Sys.unsetenv("KTAG_PATH")
  expect_error(ktag(), "KTAG_PATH environment variable is not set or path argument is empty.")

  # -- set variable
  Sys.setenv("KTAG_PATH" = tempdir())
  expect_warning(ktag(), "At least what should be passed to ... argument - call is ignored.")
  expect_warning(ktag(what = ""), "What is either NULL or empty. Check for missing id on a component with class ktag - event is ignored.")
  expect_warning(ktag(what = NULL), "What is either NULL or empty. Check for missing id on a component with class ktag - event is ignored.")

  # -- basics
  ktag(who = "unkwn", what = "my_btn")
  expect_true(file.exists(file.path(tempdir(), "ktag.csv")))

})
