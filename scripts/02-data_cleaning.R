#### Preamble ####
# Purpose: Cleans the raw water sample data submitted to the City of Toronto
# Author: Renfrew Ao-Ieong
# Date: 21 January 2024
# Contact: renfrew.aoieong@utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
install.packages("janitor")

library(janitor)
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("inputs/data/toronto_water_lead_sample.csv")
# Remove Sample Number column
# 



#### Save data ####
write_csv(cleaned_data, "outputs/data/cleaned_toronto_water_lead_sample.csv")
