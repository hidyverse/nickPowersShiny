#
# This is the user-interface definition of the NPD Shiny application. 
# 30-07-23

### current goal: update to leaflet
 

# Define UI for application that draws a histogram
ui <-
  
  page_navbar(
    title = "NPD Dashboard BS Test"
    ,
    theme = bs_theme(bootswatch = "sketchy")
    ,
   # sidebar = "test info here"
    # sidebarMenu(
    # menuItem("Home", tabName = "home", icon = icon("th")),
    # menuItem("Heatmaps of the US", tabName = "maps", icon = icon("dashboard")))
    
    nav_panel("Home", cards[[1]])
    ,
    nav_panel("Maps"
    ,
    layout_column_wrap(
      width = 1/2, 
      style = css(grid_template_columns = "3fr 1fr"),
      navset_card_tab(
        nav_panel(
          "Heat Maps",
      # layout_column_wrap(
      #   width = 1 / 2,
      #   style = css(grid_template_columns = "3fr 1fr"),
          cards[[2]]),
        nav_panel(
        # layout_column_wrap(
        #   width = 1,
        #   row_heights = c(1, 4),
        #   heights_equal = "row",
          "Summary",
          cards[[4]]
        )
      ),
    cards[[3]]
    )))
    # did not finish layout)

 # dashboardPage(
 #    dashboardHeader(title = "NPD Dashboard Test"),
 #    
 #    
 #    dashboardSidebar(
 #      sidebarMenu(
 #      menuItem("Home", tabName = "home", icon = icon("th")),
 #      menuItem("Heatmaps of the US", tabName = "maps", icon = icon("dashboard"))
 #    )),
 #    
 #    dashboardBody(
 #      
 #      tabItems(
 #        tabItem(tabName = "home",
 #                "testing home"
 #                ),
 #        
 #        tabItem(tabName = "maps",
 #          fluidRow(
 #            s,
 #            card(full_screen = T,
 #               plotOutput("heatMap")
 #          ))
 #      )))
  
  
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
    
