#### Preamble ####
# Purpose: Tests the structure and validity of the simulated anthropometric and demographic dataset
# Author: 
# Date: 
# Contact: 
# License: MIT
# Pre-requisites: 
# - The `tidyverse` and `testthat` packages must be installed and loaded.
# - The simulated dataset script must have been run to generate `simulated_data`.

#### Workspace setup ####
library(tidyverse)
library(testthat)

simulated_data <- read_csv("data/raw-data/simulated_ansur_female_data.csv")

# Ensure `simulated_data` exists
if (exists("simulated_data")) {
  message("Test Passed: The simulated dataset was successfully generated.")
} else {
  stop("Test Failed: The simulated dataset could not be found.")
}

#### Test data ####

# Test if the dataset has the correct number of rows and columns
expected_cols <- c(
  "weight", "height", "waist_circumference", 
  "chest_circumference", "thigh_circumference", 
  "biceps_circumference", "gender", "age", 
  "ethnicity", "component"
)

# Test column names
if (all(colnames(simulated_data) %in% expected_cols)) {
  message("Test Passed: The dataset contains all expected columns.")
} else {
  stop("Test Failed: The dataset does not contain the correct columns.")
}

# Test the number of rows (expecting 1000)
if (nrow(simulated_data) == 1000) {
  message("Test Passed: The dataset contains the expected number of rows (1000).")
} else {
  stop("Test Failed: The dataset does not contain the expected number of rows.")
}

# Test for missing values
if (all(!is.na(simulated_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Test for unique categories in `gender`
if (length(unique(simulated_data$gender)) == 2) {
  message("Test Passed: The 'gender' column contains two unique values.")
} else {
  stop("Test Failed: The 'gender' column does not contain the expected number of unique values.")
}

# Test for valid range of ages (should be between 18 and 60)
if (all(simulated_data$age >= 18 & simulated_data$age <= 60)) {
  message("Test Passed: The 'age' column contains valid values within the expected range (18-60).")
} else {
  stop("Test Failed: The 'age' column contains values outside the expected range.")
}

# Check for duplicate rows
if (nrow(simulated_data) == nrow(distinct(simulated_data))) {
  message("Test Passed: There are no duplicate rows in the dataset.")
} else {
  stop("Test Failed: The dataset contains duplicate rows.")
}

