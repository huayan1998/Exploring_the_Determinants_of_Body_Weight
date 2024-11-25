#### Preamble ####
# Purpose: Tests the structure and validity of the cleaned ANSUR II Female dataset
# Author: [Your Name] [...UPDATE THIS...]
# Date: [Today's Date] [...UPDATE THIS...]
# Contact: [Your Contact Information] [...UPDATE THIS...]
# License: MIT
# Pre-requisites: 
# - The `tidyverse` and `testthat` packages must be installed and loaded.
# - 03-clean_data.R must have been run.
# Any other information needed? Make sure you are in the correct R project directory.

#### Workspace setup ####
library(tidyverse)
library(testthat)

analysis_data <- read_csv("data/analysis-data/ansur_female_data.csv")


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

