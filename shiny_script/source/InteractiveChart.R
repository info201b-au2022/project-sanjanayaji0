# Server Code
# Getting the data set and cleaning it up

library(tidyverse)

data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-sanjanayaji0/main/data/energy.csv", stringsAsFactors = FALSE)

data <- data %>% 
  select(Entity, Year, Primary.energy.consumption..TWh.) %>% 
  drop_na() %>% 
  group_by(Entity) %>% 
  filter(Year > '1979') %>% 
  filter(Year < '2020')









