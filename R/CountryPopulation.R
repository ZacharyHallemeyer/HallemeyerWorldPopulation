library(tidyverse)
library(ggplot2)


CountryPopulation <- function(country) {



  graphData <- WorldPopulation %>%
    filter(CountryName == country)

  if (nrow(graphData) <= 0) {
    stop("Country not found")
  }

  graphData <- pivot_longer(graphData, cols = -CountryName,
                            names_to = "Year", values_to = "Population")

  graphData$Year <- as.numeric(graphData$Year)
  graphData$Population <- as.numeric(graphData$Population)


  ggplot(graphData, aes(x = Year, y = Population)) +
    geom_point() +
    labs(x = "Year", y = "Population") +
    ggtitle(country)
}
