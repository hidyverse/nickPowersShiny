#
# This is the user-interface definition of the NPD Shiny application. 
# 30-07-23

### current goal: create US heatmap and column dropdown

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Nick Powers Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          
          selectInput("variable","Select Freedom Factor:",
                      choices = c("Rule of Law"= "pf_rol",
                                  "Homicides Reported" = "pf_ss_homicide")
          )
          
          
          # selectInput(inputId = "state",
          #             label = "Select state",
          #             choices = unique(dat$State))
          # 
          # ,
          #     sliderInput("bins",
          #                 "Number of bins:",
          #                 min = 1,
          #                 max = 50,
          #                 value = 30)
          ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
)