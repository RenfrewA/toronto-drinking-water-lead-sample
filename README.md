# Analysis of Lead Concentration in Toronto's Drinking Water

## Overview

This paper analyzes the trend in lead concentration in Toronto's drinking water since 2014 with drinking water samples gathered from the residents of Toronto and submitted for testing to Toronto Public Health.
We used the Non Regulated Lead Sample dataset obtained from [The City of Toronto’s Open Data Portal](https://open.toronto.ca/dataset/non-regulated-lead-sample/)

## File Structure

The repo is structured as:

-   `input/data` contains the data sources used in analysis including the raw data.
-   `outputs/data` contains the cleaned dataset that was constructed.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

## How to Run
### 1. Install required R packages:
  - `opendatatoronto`
  - `tidyverse`
  - `janitor`
  - `knitr`
  - `here`

### 2. Code Execution
  1. Run `scripts/01-download_data.R` to download raw data
  2. Run `scripts/02-data_cleaning.R` to generate clean data as a csv file
  3. Render `outputs/paper/lead_concentration.qmd` to generate a PDF of the paper

## Statement on LLM usage

No LLMs were used for any aspect of this work.
