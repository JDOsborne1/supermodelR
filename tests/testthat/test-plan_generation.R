test_that("plan generation works", {
  test_plan <- smGenerateModellingPlan()
  expect_true(all(c("drake_plan", "tbl_df", "tbl", "data.frame") %in% class(test_plan)))
})
