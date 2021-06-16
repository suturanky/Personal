#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Vulcano plot"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("threshold",
                  "Select log2Fold threshold:",
                  min = 1,
                  max = 10,
                  value = 2)
    ),
     
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
    
    )
  )
))