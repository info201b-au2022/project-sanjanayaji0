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

hdi <- hdi %>%
  rename("1990" = hdi_1990, 
         "1991" = hdi_1991,
         "1992" = hdi_1992,
         "1993" = hdi_1993,
         "1994" = hdi_1994,
         "1995" = hdi_1995,
         "1996" = hdi_1996,
         "1997" = hdi_1997,
         "1998" = hdi_1998,
         "1999" = hdi_1999,
         "2000" = hdi_2000,
         "2001" = hdi_2001,
         "2002" = hdi_2002,
         "2003" = hdi_2003,
         "2004" = hdi_2004,
         "2005" = hdi_2005,
         "2006" = hdi_2006,
         "2007" = hdi_2007,
         "2008" = hdi_2008,
         "2009" = hdi_2009,
         "2010" = hdi_2010,
         "2011" = hdi_2011,
         "2012" = hdi_2012,
         "2013" = hdi_2013,
         "2014" = hdi_2014,
         "2015" = hdi_2015,
         "2016" = hdi_2016,
         "2017" = hdi_2017,
         "2018" = hdi_2018,
         "2019" = hdi_2019,
         "2020" = hdi_2020,
         "2021" = hdi_2021)

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
      select(country, input$yearSelect)
    
    #finding largest share of energy for each country
    energyGrid$Largest_Share<-colnames(energyGrid)[apply(energyGrid,1,which.max)]
    
    energyGrid <- energyGrid %>% select(-c(biofuel, coal, gas, hydro, 
                                           carbon, oil, nuclear, other))
    
    #Merge
    energyByhdi <- merge(energyGrid, hdiYear, by="country")

    #Plotting graph
    plot <- ggplot(energyByhdi) +
      geom_point(mapping = aes(x = Largest_Share, y = unlist(energyByhdi[3]), color = country)) +
      theme(plot.margin = margin(1, 1, 2, 2, "cm")) +
      labs(x = "Largest Share", y = "HDI", title = "Interactive Chart 2 - HDI and Largest Producer of Energy")
    
    ggplotly(plot)
  })
}


#UI CODE-------------------------------------------------------------------------

ui <- fluidPage(
  year <- selectInput("yearSelect", label = "Year",  choices = list("2020" = 2020, 
                                                                    "2019" = 2019,
                                                                    "2018" = 2018, 
                                                                    "2017" = 2017, 
                                                                    "2016" = 2016,
                                                                    "2015" = 2015,
                                                                    "2014" = 2014, 
                                                                    "2013" = 2013,
                                                                    "2012" = 2012,
                                                                    "2011" = 2011, 
                                                                    "2010" = 2010,
                                                                    "2009" = 2009, 
                                                                    "2008" = 2008, 
                                                                    "2007" = 2007,
                                                                    "2006" = 2006,
                                                                    "2005" = 2005, 
                                                                    "2004" = 2004,
                                                                    "2003" = 2003,
                                                                    "2002" = 2002,
                                                                    "2001" = 2001,
                                                                    "2000" = 2000,
                                                                    "1999" = 1999,
                                                                    "1998" = 1998,
                                                                    "1997" = 1997,
                                                                    "1996" = 1996,
                                                                    "1995" = 1995,
                                                                    "1994" = 1994,
                                                                    "1993" = 1993,
                                                                    "1992" = 1992,
                                                                    "1991" = 1991,
                                                                    "1990" = 1990), selected = "2004"),
  
  plotlyOutput("point")
)


