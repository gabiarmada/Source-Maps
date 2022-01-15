#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(fs)
library(here)
source("map_NEI.R")

# get data file paths 
data <- dir_ls(here("data"))

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Source Maps"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            helpText("Create Virginia emission source maps based on EPA National Emissions Inventory (NEI) data."), 
            
            selectInput("sector",
                        "Source Emissions Category",
                        choices = list("Total Emissions", "Waste Disposal", "Fuel Combustion",
                                       "Mobile", "Industrial Processes", "Fires", 
                                       "Solvents & Misc Non-Industrial NEC"
                                       )),
        
            selectInput("year", 
                        "Year",
                        choices = list("2011", "2014", "2017"))
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("emissPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$emissPlot <- renderPlot({
        data <- switch(input$year, 
                       "2011" = data[1], 
                       "2014" = data[2], 
                       "2017" = data[3])
        
        sector <- switch(input$sector, 
                         "Total Emissions" = "Total Emissions", 
                         "Waste Disposal" = "Waste Disposal", 
                         "Fuel Combustion" = "Fuel Comb",
                         "Mobile" = "Mobile",
                         "Industrial Processes" = "Industrial Processes", 
                         "Fires" = "Fires", 
                         "Solvents & Misc Non-Industrial NEC" = "Solvents & Misc Non-Industrial NEC")
        
        map_NEI(data = data, sector = sector)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
