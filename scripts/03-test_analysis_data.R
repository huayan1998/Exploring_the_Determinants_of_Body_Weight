#### Preamble ####
# Purpose: Test the analysis dataset
# Author: Huayan Yu
# Email: huayan.yu@mail.utoronto.ca
# Date: December 2, 2024
# License: MIT
# Pre-requisites: R packages `tidyverse`, `testthat` and `arrow` are loaded

#### Workspace setup ####
library(tidyverse)
library(testthat)
library(arrow)

analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}

#### Test data ####

# Define the expected columns
expected_cols <- c(
  "weightlbs", "heightin", "waist_circumference",
  "thigh_circumference", "age", "component"
)

# Test if the dataset contains all expected columns
test_that("The dataset contains all expected columns", {
  expect_true(all(colnames(analysis_data) %in% expected_cols),
              info = "The dataset does not contain the correct columns.")
})

# Test if the dataset has the expected number of rows (1986)
test_that("The dataset contains the expected number of rows", {
  expect_equal(nrow(analysis_data), 1986,
               info = "The dataset does not contain the expected number of rows (1986).")
})

# Test for no missing values in the dataset
test_that("The dataset contains no missing values", {
  expect_true(all(!is.na(analysis_data)),
              info = "The dataset contains missing values.")
})

# Test if the 'age' column contains values within the range 17 to 60
test_that("The 'age' column contains values within the expected range (17-60)", {
  expect_true(all(analysis_data$age >= 17 & analysis_data$age <= 60),
              info = "The 'age' column contains values outside the expected range (17-60).")
})

# Test if there are no duplicate rows in the dataset
test_that("The dataset contains no duplicate rows", {
  expect_equal(nrow(analysis_data), nrow(distinct(analysis_data)),
               info = "The dataset contains duplicate rows.")
})
