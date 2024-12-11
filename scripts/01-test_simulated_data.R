#### Preamble ####
# Purpose: Test the simulated dataset
# Author: Huayan Yu
# Email: huayan.yu@mail.utoronto.ca
# Date: December 2, 2024
# License: MIT
# Pre-requisites: R packages `tidyverse` and `testthat` are loaded

#### Workspace setup ####
library(tidyverse)
library(testthat)

simulated_data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Ensure `simulated_data` exists
if (exists("simulated_data")) {
  message("Test Passed: The simulated dataset was successfully generated.")
} else {
  stop("Test Failed: The simulated dataset could not be found.")
}

#### Test data ####

# Define the expected columns
expected_cols <- c(
  "weight", "height", "waist_circumference",
  "chest_circumference", "thigh_circumference",
  "biceps_circumference", "gender", "age",
  "ethnicity", "component"
)

# Test if the dataset contains all expected columns
test_that("The dataset contains all expected columns", {
  expect_true(all(colnames(simulated_data) %in% expected_cols),
              info = "The dataset does not contain the correct columns.")
})

# Test if the dataset has the expected number of rows (1000)
test_that("The dataset contains the expected number of rows", {
  expect_equal(nrow(simulated_data), 1000,
               info = "The dataset does not contain the expected number of rows (1000).")
})

# Test for no missing values in the dataset
test_that("The dataset contains no missing values", {
  expect_true(all(!is.na(simulated_data)),
              info = "The dataset contains missing values.")
})

# Test if the 'gender' column contains exactly two unique values
test_that("The 'gender' column contains exactly two unique values", {
  expect_equal(length(unique(simulated_data$gender)), 2,
               info = "The 'gender' column does not contain exactly two unique values.")
})

# Test if the 'age' column contains values within the range 18 to 60
test_that("The 'age' column contains values within the expected range (17-60)", {
  expect_true(all(simulated_data$age >= 17 & simulated_data$age <= 60),
              info = "The 'age' column contains values outside the expected range (17-60).")
})

# Test if there are no duplicate rows in the dataset
test_that("The dataset contains no duplicate rows", {
  expect_equal(nrow(simulated_data), nrow(distinct(simulated_data)),
               info = "The dataset contains duplicate rows.")
})
