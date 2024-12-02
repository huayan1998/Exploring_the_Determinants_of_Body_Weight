#### Preamble ####
# Purpose: Simulates the dataset
# Author: Huayan Yu
# Email: huayan.yu@mail.utoronto.ca
# Date: December 2, 2024
# License: MIT
# Pre-requisites: R packages are loaded

#### Workspace setup ####
library(tidyverse)
set.seed(123) # Set seed for reproducibility

#### Simulate data ####

# Define the number of observations
n <- 1000

# Simulate data
simulated_data <- tibble(
  weight = rnorm(n, mean = 70, sd = 15), # Weight in kg (normal distribution)
  height = rnorm(n, mean = 165, sd = 10), # Height in cm
  waist_circumference = rnorm(n, mean = 85, sd = 15), # Waist circumference in cm
  chest_circumference = rnorm(n, mean = 95, sd = 10), # Chest circumference in cm
  thigh_circumference = rnorm(n, mean = 55, sd = 7), # Thigh circumference in cm
  biceps_circumference = rnorm(n, mean = 30, sd = 5), # Biceps circumference in cm
  gender = sample(c("Male", "Female"), size = n, replace = TRUE, prob = c(0.5, 0.5)), # Gender
  age = sample(18:60, size = n, replace = TRUE), # Age in years (uniform distribution)
  ethnicity = sample(
    c("Asian", "Black", "Hispanic", "White", "Other"),
    size = n,
    replace = TRUE,
    prob = c(0.25, 0.15, 0.2, 0.3, 0.1) # Ethnicity probabilities
  ),
  component = sample(
    c("Regular Army", "Reserves", "National Guard"),
    size = n,
    replace = TRUE,
    prob = c(0.6, 0.3, 0.1) # Military component probabilities
  )
)

write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")
