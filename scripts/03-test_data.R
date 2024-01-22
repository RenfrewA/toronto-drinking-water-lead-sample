#### Preamble ####
# Purpose: Tests the cleaned Toronto Non Regulated Lead Sample data set
# Author: Renfrew Ao-Ieong
# Date: 22 January 2024
# Contact: renfrew.aoieong@mail.utoronto.ca
# License: MIT
# Pre-requisites: none


#### Workspace setup ####
library(tidyverse)
library(knitr)

#### Test data ####

# Read cleaned dataset
clean_dataset <- read_csv("outputs/data/cleaned_toronto_water_lead_sample.csv")

# Check that the dates are valid
# Adapted code from https://stackoverflow.com/questions/18178451/is-there-a-way-to-check-if-a-column-is-a-date-in-r
# Checks whether an argument has datatype Date
is.date <- function(x) inherits(x, 'Date')

all(sapply(clean_dataset$sample_date, is.date))

# Check that all the lead amounts are numbers
all(sapply(clean_dataset$lead_amount_ppm, is.numeric))