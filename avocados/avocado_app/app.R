###SETUP###
require("tidyverse")
require("shiny")
require("shinythemes")

#set working directory
#setwd("/Users/gai7612/OneDrive/Documents/Data Science Project/avocados")

#import data
avo <- read_csv("avocados_conventional.csv")

#shiny stuff
ui <- fluidPage(theme=shinytheme("simplex"),
                
                titlePanel("Avocados"),
                
                sidebarLayout(
                  
                  sidebarPanel(
                    
                    selectInput(inputId = "y", 
                                label = "Y axis:",
                                choices = c("Date", "Year" ,"AveragePrice", "TotalVolume", "SmallHass", 
                                            "LargeHass" , "XLHass"),
                                selected = "AveragePrice"
                                
                    ), 
                    
                    selectInput(inputId = "x", 
                                label = "X axis:",
                                choices = c("Date", "Year" ,"AveragePrice", "TotalVolume", "SmallHass", 
                                            "LargeHass" , "XLHass"),
                                selected = "Date"
                                
                    )
                    
                    # selectInput(inputId = "z", 
                    #             label = "Color by:",
                    #             choices = c("Type" , "Region"),
                    #             selected = "Region"
                    # )
                    
                  ),
                  
                  mainPanel(
                    plotOutput(outputId = "scatterplot")
                  )
                )
)


server <- function(input, output, session) {
  
  output$scatterplot <- renderPlot({
    ggplot(data = avo, aes_string(x = input$x, y = input$y,
                                  color = input$z)) +
      geom_point()
    
  })
  
}


shinyApp(ui = ui, server = server) 
