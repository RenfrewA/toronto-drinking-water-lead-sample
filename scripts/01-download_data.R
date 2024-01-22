#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto (open.toronto.ca)
# Author: Renfrew Ao-Ieong
# Date: 21 January 2024
# Contact: renfrew.aoieong@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
install.packages("opendatatoronto")
install.packages("tidyverse")

library(opendatatoronto)
library(tidyverse)

#### Download data ####
# We download the dataset called Non Regulated Lead Sample and save it to a csv file

toronto_water_lead_sample <-
  # Each package is associated with a unique id  found in the "For 
  # Developers" tab of the relevant page from Open Data Toronto
  # https://open.toronto.ca/dataset/non-regulated-lead-sample/
  list_package_resources("8171f7ab-364e-46a7-8a62-08f073ca6d96") |>
  # We want to download the data in csv format
  filter(name == 
           "Non Regulated Lead Samples.csv") |>
  get_resource()

#### Save data ####
write_csv(toronto_water_lead_sample, "inputs/data/toronto_water_lead_sample.csv") 

         
