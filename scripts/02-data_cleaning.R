#### Preamble ####
# Purpose: Cleans the raw water sample data submitted to the City of Toronto
# Author: Renfrew Ao-Ieong
# Date: 21 January 2024
# Contact: renfrew.aoieong@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
install.packages("janitor")

library(janitor)
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("inputs/data/toronto_water_lead_sample.csv")
head(raw_data)
lead_sample_clean <-
# Remove Sample Number column and convert lead_amount_ppm to numeric 
  clean_names(raw_data) |>
  mutate(lead_amount_ppm = as.numeric(lead_amount_ppm))

head(lead_sample_clean)



#### Save data ####
write_csv(cleaned_data, "outputs/data/cleaned_toronto_water_lead_sample.csv")
