
# Load shiny library
library("shiny")
library('tidyverse')
library('dplyr')
library('ggplot2')
library('plotly')
library(stringr)
library(maps)


# Use source() to execute the `app_ui.R` and `app_server.R` files. These will
# define the UI value and server function respectively.

source("app_server.R")
source("app_ui.R")

# Create a new `shinyApp()` using the loaded `ui` and `server` variables
shinyApp(ui = ui, server = server)
