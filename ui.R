#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Nick Powers Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          
          # selectInput(inputId = "state",
          #             label = "Select state",
          #             choices = unique(dat$State))
          # 
          # ,
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
)
