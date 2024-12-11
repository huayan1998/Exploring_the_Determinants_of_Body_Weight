#### Preamble ####
# Purpose: Simulates the dataset
# Author: Huayan Yu
# Email: huayan.yu@mail.utoronto.ca
# Date: December 3, 2024
# License: MIT
# Pre-requisites: R package `tidyverse` are loaded

#### Workspace setup ####
library(tidyverse)
set.seed(123) # Set seed for reproducibility

#### Simulate data ####

# Define the number of observations
n <- 1000

# Simulate data with dependencies
simulated_data <- tibble(
  height = rnorm(n, mean = 165, sd = 10), # Height in cm
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
  ),
  # Weight depends on height and gender
  weight = rnorm(n, mean = 70 + 0.3 * (height - 165) + ifelse(gender == "Male", 5, 0), sd = 15),
  # Waist circumference depends on weight and gender
  waist_circumference = rnorm(n, mean = 85 + 0.4 * (weight - 70) + ifelse(gender == "Male", 5, -3), sd = 10),
  # Chest circumference depends on weight and gender
  chest_circumference = rnorm(n, mean = 95 + 0.3 * (weight - 70) + ifelse(gender == "Male", 5, -2), sd = 10),
  # Thigh circumference depends on weight
  thigh_circumference = rnorm(n, mean = 55 + 0.2 * (weight - 70), sd = 7),
  # Biceps circumference depends on gender and weight
  biceps_circumference = rnorm(n, mean = 30 + 0.1 * (weight - 70) + ifelse(gender == "Male", 2, -1), sd = 5)
)

write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")
