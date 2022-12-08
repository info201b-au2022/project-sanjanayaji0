library(tidyverse)

# Creating the databases #
# I sourced all of the data used in this directly from BP #

energy_type <- c('Coal', 'Wind', 'Solar', 'Nuclear', 'Hydro')
energy_efficiency <-c('33', '30', '20', '35', '90')
data <- data.frame(energy_type, energy_efficiency)

# Making the chart #


