ui <- tabPanel(
  year <- selectInput("year", label = "Year",  choices = list("2020" = "2020")),
  plotOutput("point")
)