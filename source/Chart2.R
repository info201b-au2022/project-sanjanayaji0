library(tidyverse)

# Creating the databases #
# I sourced all of the data used in this directly from BP #

energy_type <- c('Coal', 'Wind', 'Solar', 'Nuclear', 'Hydro')
energy_efficiency <-c('33', '30', '20', '35', '90')
data <- data.frame(energy_type, energy_efficiency)
View(data)

# Making the chart #

chart2 <- ggplot(data, aes(energy_type, energy_efficiency)) +
  ggtitle("Energy Sources and their Efficiency")+
  labs(y = "Energy Efficiency", x = "Energy Type")+
  geom_col()
chart2
