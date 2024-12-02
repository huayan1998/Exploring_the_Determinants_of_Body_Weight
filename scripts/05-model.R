#### Preamble ####
# Purpose: Create Bayesian regression model on cleaned data
# Author: Huayan Yu
# Email: huayan.yu@mail.utoronto.ca
# Date: December 2, 2024
# License: MIT
# Pre-requisites: R packages are loaded

#### Workspace setup ####
library(rstanarm) # Load the rstanarm package for Bayesian modeling
library(arrow) # Load the arrow package to read Parquet files
library(dplyr)

#### Read data ####
analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

#### Model data ####
# Build a Bayesian regression model using stan_glm
bayesian_model <- stan_glm(
  formula = weightlbs ~ heightin + waist_circumference + thigh_circumference + age + component,
  data = analysis_data,
  family = gaussian(), # Specify a Gaussian family for continuous outcomes
  prior = normal(0, 1), # Use a normal prior with mean 0 and SD 1
  prior_intercept = normal(0, 1), # Use a normal prior for the intercept
  seed = 123 # Set a random seed for reproducibility
)

#### Save model ####
saveRDS(
  bayesian_model,
  file = "models/bayesian_model.rds"
)
