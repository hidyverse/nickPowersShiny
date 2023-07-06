  ### Free little library
  
  library(bslib)          # themeing
  library(DT)             # fancy table
  library(grid)           # print png 
  library(htmltools)      # css styling
  library(leaflet)        # maps
  library(leaflet.extras) # pretty maps
  library(plotly)         # interactive ggplot
  library(png)            # read png
  library(sf)             # spatial data helper
  library(shiny)          # app
  library(thematic)       # bslib theme to ggplot
  library(tidyverse)      # happy place
  library(USAboundaries) # USA polygons
  avail <- requireNamespace("USAboundariesData", quietly = TRUE)
  
  ### Data Bank
  usa <- us_states()
  
  myData <-  right_join(usa,
                        read_csv("data/NPDClean.csv"),
                        by = c("name" = "State")) %>% 
    filter(name != c("Hawaii", "Alaska")) 
  
  myDataSelections <- names(myData %>% select(`Size  Sq Miles`, `Population`, 33:270))
    
  mySelections <- names(myData %>% select(`name`, `Size  Sq Miles`, `Population`, `MedianWage HR`))
    
  ### Hallmark 
  cardsHeatMaps <- list(
    
    # main map
    card(full_screen = TRUE,
       leafletOutput("heatMap")
       ),
  
    # selection input
    card(
      varSelectInput("select",
                     "Select Freedom Factor:",
                     myData %>% select(-c(1:14, geometry)))
      ))
  
  cardsSummary <- card(full_screen = T,
                       card_body(
                         plotlyOutput("sumUS"),
                         width = "100%") 
  )
  
  
  cardsState <- list(
    
    # highest state
    card(card_header("Highest"),
         card_body(
           layout_column_wrap(
             width = 1/2,
             imageOutput("highest")
             ,span(textOutput("highestState"), style = "color:darkgreen; font-size:30px; font-style:italic"))    
           )),
    
    # lowest state
    card(
      card_header("Lowest"),
      card_body(
        layout_column_wrap(
          width = 1/2,
          imageOutput("lowest"),
          span(textOutput("lowestState"), style = "color:lightgreen; font-size:30px; font-style:italic"))
      , full_screen = T
    ))
    )
  
  cardsComparisons <- list(
    card(
      verbatimTextOutput('stateCompare'),
      selectizeInput('state', 'Select two states to compare:', myData$name, multiple=TRUE, options = list(maxItems = 2))
    ),
    card(
      checkboxGroupInput("showVars", "Columns to show:",
                         myDataSelections, selected = mySelections)
    ),
    card(
      card_body(
    dataTableOutput("compareTable"),
    width = "100%"
    ))
  )
  
  ### Theming
  myTheme <- bs_add_variables(
    bs_theme(bootswatch = "sketchy", primary = "#000000"),
    "body-bg" = "#FFFFFF",
    "color" = "#000000",
    "base-font" = "Proxima Nova – Semibold",
    # "font-size-base" = "1.4rem",
    "btn-padding-y" = ".16rem",
    "btn-padding-x" = "2rem"
  )
  
  ggplot2::theme_set(ggplot2::theme_minimal())
  thematic_shiny(font = "auto")
  
  ### Run it
  source("ui.R")
  source("server.R")
  
  
  shinyApp(ui = ui, server = server)
