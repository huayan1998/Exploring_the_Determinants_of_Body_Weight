#### Preamble ####
# Purpose: Downloads and saves the data 
# Author:
# Date:
# Contact:
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(tidyverse)
library(arrow)


#### Download data ####
ansur_female_data <-
  read_csv(
    here::here("data/raw-data/ANSUR_II_FEMALE_Public.csv"),
    show_col_types = FALSE
  )
#### Save data ####
write_parquet(ansur_female_data, "data/raw-data/ansur_female_data.parquet")
write_csv(ansur_female_data, "data/raw-data/ansur_female_data.csv")

