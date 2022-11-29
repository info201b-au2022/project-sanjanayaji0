#Imports

library('tidyverse')
library('dplyr')
library('ggplot2')
library('plotly')

#Recieving Data
hdi <- read.csv("https://hdr.undp.org/sites/default/files/2021-22_HDR/HDR21-22_Composite_indices_complete_time_series.csv")

energyGridComp <- read.csv("https://nyc3.digitaloceanspaces.com/owid-public/data/energy/owid-energy-data.csv")

energyGridComp <- energyGridComp %>%
  rename(biofuel = biofuel_share_elec, 
         coal = coal_share_elec, 
         gas = gas_share_elec, 
         hydro = hydro_share_elec,
         carbon = low_carbon_share_elec, 
         oil = oil_share_elec,
         nuclear = nuclear_share_elec, 
         other = other_renewables_share_elec)

# Cleaning up data
energyGrid <- energyGridComp %>%
  select(country, year, biofuel, coal, gas, hydro, carbon, oil, nuclear, other) %>% 
  group_by(country) %>%
  filter(year == "2021") %>%
  drop_na() %>%
  select(-c(year))

#finding largest share of energy for each country
energyGrid$Largest_Share<-colnames(energyGrid)[apply(energyGrid,1,which.max)]

#Cleaning up data
hdi2021 <- hdi %>%
  select(country, hdi_2021)

energyGrid <- energyGrid %>% select(-c(biofuel, coal, gas, hydro, 
                                       carbon, oil, nuclear, other))


View(energyGrid)
View(hdi2021)

energyByhdi <- merge(energyGrid, hdi2021, by="country")

#Plotting graph
chart3 <- ggplot(energyByhdi) +
  geom_point(mapping = aes(x = Largest_Share, y = hdi_2021, color = country)) + 
  theme(plot.margin = margin(1, 1, 2, 2, "cm"))

chart3 <- ggplotly(chart3)




  
  

