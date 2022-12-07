# Server Code
# Getting the data set and cleaning it up

data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-sanjanayaji0/main/data/energy.csv", stringsAsFactors = FALSE)
View(data)

data <- data %>% 
  select(Entity, Year, Primary.energy.consumption..TWh.) %>% 
  drop_na() %>% 
  group_by(Entity) %>% 
  filter(Year > '1979') %>% 
  filter(Year < '2020')

View(data)


# Setting up the server

server <- function(input, output){
  output$line <- renderPlotly({
    
    # Render title
    title <- paste0("Energy Consumption in ", input$y_value)
    # Extra data frame i needed
    thing <- data %>% 
      filter(Entity == input$y_value) %>% 
      filter(Year < 1 + input$time)
    # Render the line graph 
    graph <- ggplot(thing)+
      geom_line(mapping = aes(x = thing$Year, y = thing$Primary.energy.consumption..TWh.))+
      labs(x = "Year", y = paste0("Energy Consumption (TwH) ", input$y_value), title = title)
    graph
  })
}



# Ui Code To be added to mainpanel of tab
list <- data.frame(unique(data$Entity))

country <- selectInput(
  "y_value",
  label = "Choose a Country",
  choices = list,
  selected = "display"
)

year <- sliderInput(
  "time",
  label = paste0("Choose a Time Range"),
  min = 1990,
  max = 2019,
  value = 1990
)
