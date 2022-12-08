## loading all libraries
library('tidyverse')
library('dplyr')
library('ggplot2')
library('plotly')
library(stringr)
library(maps)
#chart1 data loading 
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


# chart 2 data loading 
energy_type <- c('Coal', 'Wind', 'Solar', 'Nuclear', 'Hydro')
energy_efficiency <-c('33', '30', '20', '35', '90')
data <- data.frame(energy_type, energy_efficiency)

# chart 3 data loading 
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


energyByhdi <- merge(energyGrid, hdi2021, by="country")

# Make introductory page with text: 
introduction <- "Our main question is: How can a developed national energy grid impact the quality of living of 
its citizens? This question is important since energy production and consumption have become one of the most 
significant geopolitical factors influencing a nation’s welfare."

question1 <- "1) How can a developed national energy grid impact the quality of living of 
its citizens?"
question2 <- "2) Which form of energy promises the most grid efficiency?" 
question3 <- "3) Which form of energy consistently delivers improvements in HDI?" 

data_explain <- "To address our questions, we analyzed various overlapping data sets which will be presenting.
We analyzed 30 years worth of global data. For all countries we could find data on, we chose to analyze
HDI (human development index), Energy Grid Composition, Economic Growth, Energy Exports, and Energy Emissions. We compared
these factors with each other to answer our reserach questions and find conclusions, we will be presenting."

## Description Chart 1
desc1 <- "To answer our question we chose to highlight countries on a scale of their HDI and what source of 
energy holds the largest share in their country. Each dot on the chart represents a country and the 
higher the HDI on the graph, the better a country is doing both socially and economically. 
By hovering the cursor over each dot, one can see the country name as well as GDP and largest 
share of energy used. You can also isolate a country's data by double clicking the country 
from the legend. The importance of this graph is to highlight the trend of which sources of 
energy provide the best HDI. Energy is vital in a country's development and through analyzing 
its source, one can make conclusions on the impact the source has on a country's development. 
From this chart, we can conclude that countries with higher HDI have the largest share of coal and 
carbon as their sources of energy."

## Description Chart 2
desc2_1 <- "We have chosen to present our information in two ways. First we have a map showing a 
world map of the HDI concnetration as well as the energy generation globally. 
If there were to be a positive correlation between electrcity produced and HDI, 
the graphs would look pretty similar, however we see many color discrepancies. We 
do however see an overlap in central African Countries such as Chad and Niger, though 
these are anomalies. This tells us that it is hard to draw a correlation between HDI
and energy grid. "

desc2_2 <-  "We have also chosen to show this as a plot graph so it is easy to see comparisons between 
HDI and electricity grid. This graph shows the correlation between how much electricity is 
being produced or how developed a nation's electricity grid is and how that relates to 
the overall HDI of the area. Each dot on the graph represents a country. 
The actual country doesn't matter in this graph, as we are only looking to find a correlation between HDI, 
and Electricity generated, though we have chosen to include a legend with the
countries. You are able to isolate countries by double 
clicking the country of interest from the legent. 
We can see pnce again that the graph doesn't really show a correlation between the 
development of a national power grid and the overall HDI of the area. 
Since we are using HDI as a measure of quality of life, and this chart 
shows that there isn't really a correlation between the amount of energy being produced, 
we can conclude that a developed energy grid doesn't seem impact the quality of life for citizens."

## Summary Takeaways

q1_sum <- "1. Countries with higher HDI have the largest share of coal and 
carbon as their sources of energy. This answers our research question of: Which form 
of energy consistently delivers improvements in HDI. We came to this conclusion from our 
first interactive chart that showed that countries with a greater HDI mostly centered themselves around 
carbon and coal. This includes Switzerland and Australia. While Carbon has the maximum HDI, countries 
whose largest energy share is coal have a consistenly high HDI, though not the maximum."

q2_sum <- "2. It is difficult to draw a correlation between HDI and a developed national 
energy grid. We found there to be little correlation between the two variables. This addresses our research 
question of: How can a developed national energy grid impact the quality of living of 
its citizens? Though we were expecting to find that countries with a more developed national enery grid
had a better quality of life, we were disproven."

q3_sum <- "3. Hydro power delivers the best results with 90% output. 
This graph addresses our second research question of: Which form of energy promises the most grid efficiency? 
Hydro power promises the most grid efficiency. This conclusion major has real world implications, 
as knowledge that hydro power is the most efficient can help countries in developing their energy grid, 
as energy efficiency is a huge global concern. It also answers the question of which energy source countries 
should implement for maximum energy efficiency. Below is a graph representing this conclusion. "

# Server
server <- function(input, output) {
### INTRO PAGE 
  output$intro <- renderText({
    intro_str <- introduction
    intro_str
  })
  
  output$question1_str <- renderText({
    str1 <- question1
    str1
  })
  
  output$question2_str <- renderText({
    str2 <- question2
    str2
  })
  
  output$question3_str <- renderText({
    str3 <- question3
    str3
  })
  
  output$explain <- renderText({
    explain_data <- data_explain
    explain_data
  })
  
  ## CHART 1
  output$point <- renderPlotly({
    chart1 <- ggplot(energyByhdi) +
      geom_point(mapping = aes(x = Largest_Share, y = hdi_2021, color = country)) + 
      ggtitle("Largest Share of Energy vs HDI") + 
      theme(plot.margin = margin(1, 1, 2, 2, "cm"))
    chart1
  })
  
  ## chart 1 description 
  output$chart1_description <- renderText({
    description_chart1 <- desc1
    description_chart1
  })
  
  ## Chart 2
  output$map <- renderPlotly({
    plain <- theme(
      axis.text = element_blank(),
      axis.line = element_blank(), 
      axis.ticks = element_blank(), 
      panel.border = element_blank(), 
      panel.grid = element_blank(), 
      axis.title = element_blank(),
      panel.background = element_rect(fill = factor("white")), 
      plot.title = element_text(hjust = 0.5)
    )
    worldHDI <- ggplot(data = total_data, mapping = aes(x = long, y = lat, group = group)) +
      coord_fixed(1.3) + 
      geom_polygon(aes(fill = .data[[input$measure]])) + 
      scale_fill_distiller(palette = "Set3", direction = -1) + 
      ggtitle(paste("Global", input$measure)) + 
      plain 
    worldHDI
  })
  
  output$chart2_1_description <- renderText({
    description_chart_2_1 <- desc2_1
    description_chart_2_1
  })
  
  output$chart <- renderPlotly({
    chart1 <- ggplot(data = thing, aes(hdi_2021, electricity_generation, color = region)) +
      ggtitle("Electricity Generation v. Human Development Index") +
      labs(y= "Electricity Generated", x = "HDI") +
      geom_point()
    chart1
  })
  
  output$chart2_2_description <- renderText({
    description_chart2_2 <- desc2_2
    description_chart2_2
  })
  
  ### Summary Takeaways Page
  output$q1_sum_str <- renderText({
    question1_sum <- q1_sum
    question1_sum
  })
  
  output$q2_sum_str <- renderText({
    question2_sum <- q2_sum
    question2_sum
  })
  
  output$q3_sum_str <- renderText({
    question3_sum <- q3_sum
    question3_sum
  })
  
  output$q3_chart <- renderPlotly({
    chart2 <- ggplot(data, aes(energy_type, energy_efficiency)) +
      ggtitle("Energy Sources and their Efficiency")+
      labs(y = "Energy Efficiency (%)", x = "Energy Type")+
      geom_col()
    chart2
  })
  
}