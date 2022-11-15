#Imports

library('tidyverse')
library('dplyr')
library('ggplot2')

#Recieving Data
hdi <- read.csv("https://hdr.undp.org/sites/default/files/2021-22_HDR/HDR21-22_Composite_indices_complete_time_series.csv")
View(hdi)

energyGridComp <- read.csv("https://nyc3.digitaloceanspaces.com/owid-public/data/energy/owid-energy-data.csv")
View(energyGridComp)

# Cleaning up data
energyGrid <- energyGridComp %>%
  select(country, year, biofuel_share_elec, coal_share_elec, gas_share_elec, hydro_share_elec, low_carbon_share_elec, oil_share_elec, nuclear_share_elec, other_renewables_share_elec) %>% 
  group_by(country) %>%
  filter(year == "2021") %>%
  drop_na() %>%
  select(-c(year))

#finding largest share of energy for each country
energyGrid$Largest_Share<-colnames(energyGrid)[apply(energyGrid,1,which.max)]

#Cleaning up data
hdi2021 <- hdi %>%
  select(country, hdi_2021)

energyGrid <- energyGrid %>% select(-c(biofuel_share_elec, coal_share_elec, gas_share_elec, hydro_share_elec, low_carbon_share_elec, oil_share_elec, nuclear_share_elec, other_renewables_share_elec))

View(energyGrid)
View(hdi2021)

energyByhdi <- merge(energyGrid, hdi2021, by="country")

#Plotting graph
chart3 <- ggplot(energyByhdi) +
  geom_point(mapping = aes(x = Largest_Share, y = hdi_2021))
  

