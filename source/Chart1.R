library('tidyverse')
library('dplyr')
library('ggplot2')

# Setting up the data frames #

hdi_by_year <- read.csv("https://hdr.undp.org/sites/default/files/2021-22_HDR/HDR21-22_Composite_indices_complete_time_series.csv")
View(hdi_by_year)

country_energy <- read.csv("https://nyc3.digitaloceanspaces.com/owid-public/data/energy/owid-energy-data.csv")
View(country_energy)

# Cleaning them up for the chart #

country_energy_20_years <- country_energy %>% 
  select(country, year, electricity_generation) %>% 
  drop_na() %>% 
  group_by(country) %>% 
  filter(year == "2021")

View(country_energy_20_years)

hdi_by_year <- hdi_by_year %>% 
  select(country, hdi_2021) %>% 
  drop_na()

# Creating the last dataframe to be made into a chart #
# China, the u.s, and inda have to be ommited from this because they make the graph scale too large for the other places#

thing <- merge(hdi_by_year, country_energy_20_years, by="country")
thing <- thing %>%  filter(!row_number() %in% c(88, 16, 85, 32))
View(thing)

# Making the chart #

chart1 <- ggplot(data = thing, aes(hdi_2021, electricity_generation)) +
  ggtitle("Electricity Generation v. Human Development Index") +
  labs(y= "Electricity Generated", x = "HDI") +
  geom_point()

chart1
