#### Preamble ####
# Purpose: Cleans the raw water sample data submitted to the City of Toronto
# Author: Renfrew Ao-Ieong
# Date: 21 January 2024
# Contact: renfrew.aoieong@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(janitor)
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("inputs/data/toronto_water_lead_sample.csv")
lead_sample_clean <-
# Clean the column names using clean_names
# There is a value "<0.00005" which can't be converted to numeric directly,
# We decide to convert it to 0.00005
# We aren't going to be using the partial_postal_code column so we don't include
# it in our cleaned data
  clean_names(raw_data) |>
  mutate(lead_amount_ppm = case_when(
    lead_amount_ppm == "<0.00005" ~ as.numeric("0.00005"),
    lead_amount_ppm != "<0.00005" ~ as.numeric(lead_amount_ppm))) |>
  select(sample_number, sample_date, lead_amount_ppm)

#### Save data ####
write_csv(lead_sample_clean, "outputs/data/cleaned_toronto_water_lead_sample.csv")
