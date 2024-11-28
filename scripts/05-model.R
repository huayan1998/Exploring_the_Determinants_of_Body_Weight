#### Preamble ####
# Purpose: Create Bayesian regression model on cleaned ANSUR II Female data
# Author:
# Date: 
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(rstanarm) # Load the rstanarm package for Bayesian modeling
library(arrow) # Load the arrow package to read Parquet files
library(dplyr)

#### Read data ####
cleaned_ansur_female_data <- read_parquet("data/analysis-data/ansur_female_data.parquet")

#### Model data ####

# Random sampling if needed
set.seed(123)
sampled_ansur_data <- cleaned_ansur_female_data %>%
  sample_n(1000) 

# Build a Bayesian regression model using stan_glm
ansur_bayesian_model <- stan_glm(
  formula = weightlbs ~ heightin + waist_circumference + thigh_circumference + age + component,
  data = sampled_ansur_data,
  family = gaussian(), # Specify a Gaussian family for continuous outcomes
  prior = normal(0, 1), # Use a normal prior with mean 0 and SD 1
  prior_intercept = normal(0, 1), # Use a normal prior for the intercept
  seed = 123 # Set a random seed for reproducibility
)

#### Save model ####
saveRDS(
  ansur_bayesian_model,
  file = "models/ansur_bayesian_model.rds"
)

