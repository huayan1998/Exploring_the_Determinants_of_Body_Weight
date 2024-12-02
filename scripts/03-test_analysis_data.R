#### Preamble ####
# Purpose: Test the analysis dataset
# Author: Huayan Yu
# Email: huayan.yu@mail.utoronto.ca
# Date: December 2, 2024
# License: MIT
# Pre-requisites: R packages are loaded

#### Workspace setup ####
library(tidyverse)
library(testthat)
library(parquet)

analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")


# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}

#### Test data ####

# Test if the dataset has the correct number of columns (10 expected)

# Test if there are any missing values in the dataset
if (all(!is.na(analysis_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Test that `component` column contains at least 2 unique values
if (length(unique(analysis_data$component)) >= 2) {
  message("Test Passed: The 'component' column contains at least 2 unique values.")
} else {
  stop("Test Failed: The 'component' column does not contain at least 2 unique values.")
}

# Check for duplicate rows
if (nrow(analysis_data) == nrow(distinct(analysis_data))) {
  message("Test Passed: There are no duplicate rows in the dataset.")
} else {
  stop("Test Failed: The dataset contains duplicate rows.")
}
