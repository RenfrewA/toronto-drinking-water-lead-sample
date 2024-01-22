#### Preamble ####
# Purpose: Simulates the Toronto Non Regulated Lead Sample data set
# Author: Renfrew Ao-Ieong
# Date: 21 January 2024
# Contact: renfrew.aoieong@mail.utoronto.ca
# License: MIT
# Pre-requisites: none
# Data set simulated: https://open.toronto.ca/dataset/non-regulated-lead-sample/


#### Workspace setup ####
install.packages("tidyverse")
install.packages("knitr")
library(tidyverse)
library(knitr)

#### Simulate data ####

set.seed(158)

# Simulate sample identifier number, date of sample, and amount of lead in water sample
# Use 1 to 365 to represent the sample id number
sim_sample_id <- seq(1, 365, by=1)

# Simulate that a sample was obtained every day of the year
sim_date <- rep(x = as.Date("2023-01-01") + c(0:364))

# We don't know much about the actual data, so we estimate it to be from
# a normal distribution and choose mean to be 0.005 which is the maximum
# acceptable concentration in mg/L for lead in drinking water
# Source: https://www.canada.ca/en/health-canada/programs/consultation-lead-drinking-water/document.html#a1
sim_lead_amount = rnorm(n = 365, mean = 0.005, sd = 0.0005)

# Simulate data for a single year of collecting samples and measuring for lead amount
simulated_data <-
  tibble(
    sample_id = sim_sample_id,
    date = sim_date,
    lead_amount = sim_lead_amount
  )

# Simulate samples taken over 5 years with the assumption that each year
# the lead amount decreases due to people replacing old pipes over time
sim_sample_id_5_year = seq(1, 365*5, by=1)

sim_date_5_year <-
  rep(x = as.Date("2019-01-01") + c(0:1824))

sim_lead_amount_5_year <- 
  rnorm(n = 365, mean = 0.005, sd = 0.0005) |>
  append(rnorm(n = 365, mean = 0.0045, sd = 0.0005)) |>
  append(rnorm(n = 365, mean = 0.004, sd = 0.0005)) |>
  append(rnorm(n = 365, mean = 0.0035, sd = 0.0005)) |>
  append(rnorm(n = 365, mean = 0.003, sd = 0.0005))

simulated_data_5_year <-
  tibble(
    sample_id = sim_sample_id_5_year,
    date = sim_date_5_year,
    lead_amount = sim_lead_amount_5_year
  )

summary_simulated_data_5_year <-
  mutate(simulated_data_5_year, sample_year = year(date)) |>
  arrange(year(date)) |> 
  summarise(mean_lead_amount = mean(lead_amount),
            .by = sample_year)

#### Graph simulated data ####

summary_simulated_data_5_year |>
  ggplot(aes(x=sample_year, y=mean_lead_amount)) +
  ggtitle("Amount of Lead Present in Toronto's Drinking Water by Year") +
  geom_bar(stat='identity') +
  theme_minimal() +
  labs(x = "Year", y = "Lead Present in Drinking Water in mg/L") + 
  theme(plot.title = element_text(hjust = 0.5))


#### Test data ####

# Check that the dates are valid
# Adapted code from https://stackoverflow.com/questions/18178451/is-there-a-way-to-check-if-a-column-is-a-date-in-r
# Checks whether an argument has datatype Date
is.date <- function(x) inherits(x, 'Date')

all(sapply(sim_date, is.date))
all(sapply(sim_date_5_year, is.date))


# Check that the lead amount is a number
all(sapply(simulated_data$lead_amount, is.numeric))
all(sapply(simulated_data_5_year$lead_amount, is.numeric))
