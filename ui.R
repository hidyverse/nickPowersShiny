#
# This is the user-interface definition of the NPD Shiny application. 
# 30-07-23

### current goal: create dashboard
 

# Define UI for application that draws a histogram
ui <- 
  
  dashboardPage(
    dashboardHeader(title = "NPD Dashboard Test"),
    
    
    dashboardSidebar(
      sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("th")),
      menuItem("Heatmaps of the US", tabName = "maps", icon = icon("dashboard"))
    )),
    
    
    dashboardBody(
      
    
      tabItems(
        tabItem(tabName = "home",
                "testing home"
                ),
        
        
        tabItem(tabName = "maps",
          fluidRow(
            box(
              varSelectInput("select",
                             "Select Freedom Factor:", 
                             myData
                    )
                  )
                ),
            card(full_screen = T,
               plotOutput("heatMap")
          ))
      )
    )
  )
  
  
  
  
  
    # 
    # page_sidebar(
    #   sidebar = sidebar(
    #     varSelectInput("select",
    #                    "Select Freedom Factor:", 
    #                    colnames(myData))
    #     ),
    #   card(full_screen = T,
    #       plotOutput("heatMap")
    #       )
    # )

    # Sidebar with a slider input for number of bins
    # sidebarLayout(
    #     sidebarPanel(
    #     
    #       
    #       selectInput(inputId = "select",
    #                   label = "Select Freedom Factor:", 
    #                   choices = colnames(myData)))
    #       

        # Show a plot of the generated distribution
        # mainPanel(
        #     plotOutput("heatMap")
        # )
    
