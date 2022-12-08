library(shiny)
library(ggplot2)
library(plotly)

# Ui Code To be added to mainpanel of tab

measures <- total_data %>%
  select(electricity_generation, hdi_2021)

measure_input <- selectInput(
  "measure",
  label = "Choose Measurement (HDI or Energy Generation)", 
  choices = colnames(measures)
)

page <- mainPanel(
  tabsetPanel(id = "mainPanel", 
              type = "tabs",
              tabPanel("Introduction", 
                       h2("Introduction"), 
                       textOutput(outputId = "intro"), 
                       h3("We Seek to Answer These Questions: "), 
                       textOutput(outputId = "question1_str"), 
                       textOutput(outputId = "question2_str"),
                       textOutput(outputId = "question3_str"), 
                       h3("The Data: "),
                       textOutput("explain"), 
                       h5(""),
                       img("", src = "https://images.renewableenergyworld.com/wp-content/uploads/2015/12/REW_GLobalRenewableEnergyIsStatusPositive.png", 
                           height = "50%", width = "50%", align = "left"),), 
              tabPanel("Interactive Visual 1", 
                       h3("Which form of energy consistently delivers improvements in HDI?"),
                       plotlyOutput("point"), 
                       h5(""),
                       textOutput(outputId = "chart1_description")), 
              tabPanel("Interactive Visual 2",
                       h3("How can a developed national energy grid impact the quality of living of its citizens?"),
                       measure_input,
                       plotlyOutput("map"), 
                       h5(""),
                       textOutput(outputId = "chart2_1_description"), 
                       h5(""),
                       plotlyOutput("chart"), 
                       h5(""),
                       textOutput(outputId = "chart2_2_description")),
              tabPanel("Summary Takeaways", 
                       h4("There are 3 main takeaways from this dataset: "), 
                       textOutput("q1_sum_str"), 
                       h4(""),
                       textOutput("q2_sum_str"), 
                       h4(""),
                       textOutput("q3_sum_str"),
                       h4(""),
                       plotlyOutput("q3_chart")),
              tabPanel("Project Report", 
                       htmltools::includeMarkdown("index.Rmd")
              )
              
              
  )
)



ui <- fluidPage (
  includeCSS("style.css"),
  titlePanel("Energy Sources and the Quality of Life: A Global Exploration"), 
  page
)


