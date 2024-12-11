#### Preamble ####
# Purpose: Create Bayesian regression model on cleaned data
# Author: Huayan Yu
# Email: huayan.yu@mail.utoronto.ca
# Date: December 2, 2024
# License: MIT
# Pre-requisites: R packages `dplyr`, `rstanarm`, and `arrow` loaded

#### Workspace setup ####
library(rstanarm) 
library(arrow) 
library(dplyr)

#### Read data ####
analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

#### Model data ####
# Build a Bayesian regression model 
bayesian_model <- stan_glm(
  formula = weightlbs ~ heightin + waist_circumference + thigh_circumference + age + component,
  data = analysis_data,
  family = gaussian(), # Specify a Gaussian family for continuous outcomes
  prior = normal(0, 1), # Use a normal prior with mean 0 and SD 1
  prior_intercept = normal(0, 1), # Use a normal prior for the intercept
  seed = 123 # Set a random seed for reproducibility
)

# Build a reduced model 
bayesian_model1 <- stan_glm(
  formula = weightlbs ~ age + component,
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

saveRDS(
  bayesian_model1,
  file = "models/bayesian_model_reduced.rds"
)

#### Model Selection ####
# Train-test split
set.seed(123)  # For reproducibility
train_indices <- sample(1:nrow(analysis_data), size = 0.8 * nrow(analysis_data))
train_data <- analysis_data[train_indices, ]
test_data <- analysis_data[-train_indices, ]

# Evaluate models
# Function to calculate RMSE
calculate_rmse <- function(actual, predicted) {
  sqrt(mean((actual - predicted)^2))
}

# Predictions and evaluation for full model
bayesian_preds <- posterior_predict(bayesian_model, newdata = test_data)
bayesian_preds_mean <- apply(bayesian_preds, 2, mean)  # Mean of posterior predictions
bayesian_rmse <- calculate_rmse(test_data$weightlbs, bayesian_preds_mean)

# Predictions and evaluation for reduced model
bayesian_preds1 <- posterior_predict(bayesian_model1, newdata = test_data)
bayesian_preds1_mean <- apply(bayesian_preds1, 2, mean)  # Mean of posterior predictions
bayesian_rmse1 <- calculate_rmse(test_data$weightlbs, bayesian_preds1_mean)

#Output comparison
cat("Full Bayesian Model RMSE:", bayesian_rmse, "\n")
cat("Reduced Bayesian Model RMSE:", bayesian_rmse1, "\n")



