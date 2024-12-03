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
set.seed(123) # Ensure reproducibility

simulated_data <- tibble(
  # Weight and Waist Circumference with a correlation
  weight = rnorm(n, mean = 70, sd = 15), # Weight in kg
  waist_circumference = weight * 0.4 + rnorm(n, mean = 0, sd = 5), # Correlation with weight
  
  # Height independent of weight/waist
  height = rnorm(n, mean = 165, sd = 10), # Height in cm
  
  # Chest circumference proportional to height, with some noise
  chest_circumference = height * 0.55 + rnorm(n, mean = 0, sd = 7), # Adding interaction
  
  # Thigh circumference weakly proportional to height
  thigh_circumference = height * 0.33 + rnorm(n, mean = 0, sd = 3),
  
  # Gender-based biceps circumference
  gender = sample(c("Male", "Female"), size = n, replace = TRUE, prob = c(0.5, 0.5)),
  biceps_circumference = if_else(
    gender == "Male",
    rnorm(n, mean = 32, sd = 5), # Males have a higher mean
    rnorm(n, mean = 28, sd = 4)  # Females have a lower mean
  ),
  
  # Age uniformly distributed
  age = sample(18:60, size = n, replace = TRUE),
  
  # Ethnicity probabilities
  ethnicity = sample(
    c("Asian", "Black", "Hispanic", "White", "Other"),
    size = n,
    replace = TRUE,
    prob = c(0.25, 0.15, 0.2, 0.3, 0.1)
  ),
  
  # Military component probabilities
  component = sample(
    c("Regular Army", "Reserves", "National Guard"),
    size = n,
    replace = TRUE,
    prob = c(0.6, 0.3, 0.1)
  )
)

# Save simulated data
write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")
