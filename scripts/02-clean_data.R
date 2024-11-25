#### Preamble ####
# Purpose: Cleans the raw ANSUR II Female Dataset for analysis
# Author: 
# Date: 
# License: MIT
# Pre-requisites: Raw ANSUR II Female data must be available in the specified directory.

#### Workspace setup ####
library(tidyverse)
library(janitor) # For clean_names()
library(tidyr)   # For drop_na()

#### Clean data ####
# Load the raw data
raw_data <- read_csv("data/raw-data/ansur_female_data.csv")

# Clean and prepare the data
cleaned_data <- 
  raw_data |>
  janitor::clean_names() |>  # Standardize column names
  select( weightlbs, heightin, waistcircumference, 
         thighcircumference, age, component) |>  # Select relevant variables
  drop_na() |>  # Remove rows with missing values
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
write_csv(cleaned_data, "data/analysis-data/ansur_female_data.csv")
write_parquet(cleaned_data, "data/analysis-data/ansur_female_data.parquet")

