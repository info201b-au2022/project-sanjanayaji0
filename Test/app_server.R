#Imports
library("shiny")
library("ggplot2")
library("dplyr")
library("plotly")
library("tidyr")

#Recieving Data
hdi <- read.csv("https://hdr.undp.org/sites/default/files/2021-22_HDR/HDR21-22_Composite_indices_complete_time_series.csv")

energyGridComp <- read.csv("https://nyc3.digitaloceanspaces.com/owid-public/data/energy/owid-energy-data.csv")

#Cleaning up data
energyGridComp <- energyGridComp %>%
  rename(biofuel = biofuel_share_elec, 
         coal = coal_share_elec, 
         gas = gas_share_elec, 
         hydro = hydro_share_elec,
         carbon = low_carbon_share_elec, 
         oil = oil_share_elec,
         nuclear = nuclear_share_elec, 
         other = other_renewables_share_elec)

energyGrid <- energyGridComp %>%
  select(country, year, biofuel, coal, gas, hydro, carbon, oil, nuclear, other) %>%
  drop_na()

#energyGrid$year = as.character(as.numeric(energyGrid$year))

# Setting up server
server <- function(input, output) {
  output$point <- renderPlotly({
    #Cleaning up data
    energyGrid <- energyGrid %>%
      filter(year == input$yearSelect) %>%
      select(-c(year))
      
   
    
    hdiYear <- hdi %>%
      select(country, starts_with(input$yearSelect))
    
    #finding largest share of energy for each country
    energyGrid$Largest_Share<-colnames(energyGrid)[apply(energyGrid,1,which.max)]
    
    energyGrid <- energyGrid %>% select(-c(biofuel, coal, gas, hydro, 
                                           carbon, oil, nuclear, other))
    
    #Merge
    energyByhdi <- merge(energyGrid, hdiYear, by="country")
    
    #Plotting graph
    plot <- ggplot(energyByhdi) +
      geom_point(mapping = aes(x = Largest_Share, y = input$yearSelect, color = country)) +
      theme(plot.margin = margin(1, 1, 2, 2, "cm"))
    
    ggplotly(plot)
  })
}    
