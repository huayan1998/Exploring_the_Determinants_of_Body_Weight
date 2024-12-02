#### Preamble ####
# Purpose: Cleans the raw dataset for analysis
# Author: Huayan Yu
# Email: huayan.yu@mail.utoronto.ca
# Date: December 2, 2024
# License: MIT
# Pre-requisites: Raw data must be downloaded.

#### Workspace setup ####
library(tidyverse)
library(janitor) # For clean_names()
library(tidyr) # For drop_na()

#### Clean data ####
# Load the raw data
raw_data <- read_csv("data/01-raw_data/raw_data.csv")

# Clean and prepare the data
cleaned_data <-
  raw_data |>
  janitor::clean_names() |> # Standardize column names
  select(
    weightlbs, heightin, waistcircumference,
    thighcircumference, age, component
  ) |> # Select relevant variables
  drop_na() |> # Remove rows with missing values
  mutate(
    # Convert character columns to appropriate types if necessary
    component = as.factor(component),
    age = as.numeric(age),
    waistcircumference = waistcircumference / 10,
    thighcircumference = thighcircumference / 10
  ) |>
  rename(
    waist_circumference = waistcircumference,
    thigh_circumference = thighcircumference,
  )

#### Save data ####
write_parquet(cleaned_data, "data/02-analysis_data/analysis_data.parquet")
