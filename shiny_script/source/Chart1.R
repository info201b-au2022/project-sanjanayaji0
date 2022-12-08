library('tidyverse')
library('dplyr')
library('ggplot2')
library('plotly')
library(stringr)
library(maps)
# Setting up the data frames #

hdi_by_year <- read.csv("https://hdr.undp.org/sites/default/files/2021-22_HDR/HDR21-22_Composite_indices_complete_time_series.csv") %>%
  mutate(country = recode(str_trim(country), "Russian Federation" = "Russia", 
                          "Bolivia (Plurinational State of)" = "Bolivia", 
                          "Tanzania (United Republic of)" = "Tanzania", 
                          "Venezuela (Bolivarian Republic of)" = "Venezuela"))

country_energy <- read.csv("https://nyc3.digitaloceanspaces.com/owid-public/data/energy/owid-energy-data.csv") 

# Cleaning them up for the chart #

country_energy_20_years <- country_energy %>% 
  select(country, year, electricity_generation) %>% 
  group_by(country) %>%
  filter(year == 2018)

hdi_by_year <- hdi_by_year %>% 
  select(country, hdi_2021)

# Creating the last dataframe to be made into a chart #
# China, the u.s, and India have to be ommited from this because they make the graph scale too large for the other places#

thing <- merge(hdi_by_year, country_energy_20_years, by="country")

# Making the chart 
world <- map_data("world")
head(world)

thing <- thing %>%
  rename(region = country) %>%
  mutate(region = recode(str_trim(region), "United States" = "USA",
                         "United Kingdom" = "UK",
                         "Korea (Rep.)" = "South Korea",
                         "Congo" = "Democratic Republic of the Congo"))
total_data <- inner_join(thing, world)




