library(tidyverse)
library(readxl)

# Read in the data.  Do some cleaning/verification
worldPopulation <- read_excel("data-raw/World_Population.xlsx", sheet = 'ESTIMATES', range="A17:BZ306")

WorldPopulation <- worldPopulation %>%
  select('Region, subregion, country or area *' | matches("\\d") | 'Type')

WorldPopulation <- filter(WorldPopulation, Type == "Country/Area") %>%
  select(-Type) %>%
  rename(CountryName = 'Region, subregion, country or area *')

# Save the data frame to the data/ directory as WorldPopulation.rda
usethis::use_data(WorldPopulation)
