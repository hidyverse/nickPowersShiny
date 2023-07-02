# This is the user-interface definition of the NPD Shiny application. 
# 30-07-23

### current goal: update to leaflet
 

# Define UI for application that draws a histogram
# ui <- fluidPage(
# 
# 
#     # Sidebar with a slider input for number of bins
#     sidebarLayout(
#         sidebarPanel(
#         
#           
#           selectInput(inputId = "select",
#                       label = "Select Freedom Factor:", 
#                       choices = myData %>% select(-c(lat,long,group)) %>% colnames())
#           
#           # selectInput(inputId = "state",
#           #             label = "Select state",
#           #             choices = unique(dat$State))
#           # 
#           # ,
#           #     sliderInput("bins",
#           #                 "Number of bins:",
#           #                 min = 1,
#           #                 max = 50,
#           #                 value = 30)
#           ),
# 
#         # Show a plot of the generated distribution
#         mainPanel(
#           # plotOutput("heatMap")
#          leafletOutput("heatMap")
#         )
#     )
# )

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "select", label = "Select variable:", choices = colnames(myData))
    ),
    mainPanel(
      leafletOutput(outputId = "heatMap")
    )
  )
)
