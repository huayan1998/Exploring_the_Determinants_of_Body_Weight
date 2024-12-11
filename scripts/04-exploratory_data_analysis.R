#### Preamble ####
# Purpose: Runs exploratory data analysis using cleaned data
# Author: Huayan Yu
# Email: huayan.yu@mail.utoronto.ca
# Date: December 2, 2024
# License: MIT
# Pre-requisites: R packages `tidyverse` and `arrow` are loaded

#### Workspace setup ####
library(tidyverse)
library(arrow)

analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

ggplot(analysis_data, aes(x = weightlbs)) +
  geom_histogram(binwidth = 10, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Weight (lbs)", x = "Weight (lbs)", y = "Count") +
  theme_minimal()

ggplot(analysis_data, aes(x = heightin, y = weightlbs)) +
  geom_point(color = "darkblue", alpha = 0.7) +
  labs(title = "Height vs. Weight", x = "Height (inches)", y = "Weight (lbs)") +
  theme_minimal()

ggplot(analysis_data, aes(x = component, y = weightlbs, fill = component)) +
  geom_boxplot() +
  labs(title = "Weight Distribution by Component", x = "Component", y = "Weight (lbs)") +
  theme_minimal() +
  theme(legend.position = "none")

ggplot(analysis_data, aes(x = waist_circumference, y = thigh_circumference)) +
  geom_point(color = "darkgreen", alpha = 0.7) +
  labs(title = "Waist vs. Thigh Circumference", x = "Waist Circumference (inches)", y = "Thigh Circumference (inches)") +
  theme_minimal()

ggplot(analysis_data, aes(x = component)) +
  geom_bar(fill = "orange", color = "black") +
  labs(title = "Count of Observations by Component", x = "Component", y = "Count") +
  theme_minimal()
