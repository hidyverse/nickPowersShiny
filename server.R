# 
# This is the server logic of the NPD Shiny web application. 
#
#





# Define server logic required to draw a histogram
server <- function(input, output, session) {

  
output$heatMap <- renderLeaflet({
   

  
  pal <- colorNumeric(
     palette = c( "lightgreen", "darkgreen"),
     domain = myData[[input$select]]
   )
    
  labels <- sprintf(
    "<strong>%s</strong><br/>%g",
    myData$name, myData[[input$select]]
  ) %>% lapply(htmltools::HTML)
   
    leaflet() %>%
      addPolygons(
        data = myData,
        fillColor = ~pal(myData[[input$select]]),
        color = "black",
        fillOpacity = 1,
        weight = 1,
        label = ~labels
      ) %>% 
      addLegend("bottomright",
        pal = pal,
        values = myData[[input$select]],
        title = colnames(myData[[input$select]]),
        # labFormat = labelFormat(transform = function(x) sort(x, decreasing = TRUE)),
        opacity = 1
      ) %>%
      
      setMapWidgetStyle(list(background= "white"))
  })

# Boxes for highest and lowest state
### LOWEST 

lowestState <- reactive({
  myData %>% arrange(!! input$select) %>% slice_head(n = 1)
})

output$lowest<-renderImage({
  
  lowestStateDat <- lowestState()
  
  flagName <-  tolower(myData$name[myData$name == lowestStateDat$name])
  flagName <- gsub(" ", "_", flagName)
  

  srcFlag <- paste0("www/flags_of_US_states/",flagName,".png")

  list(
    src = srcFlag
    , width = "60"
    , height = "50"
  )

  
  }, deleteFile = FALSE)

output$lowestState <- renderText({
  lowestStateDat <- lowestState()
  
  flagName <-  myData$name[myData$name == lowestStateDat$name]
})
## HIGHEST

highestState <- reactive({
  myData %>% arrange(!! input$select) %>% slice_tail(n = 1)
})


output$highest <-renderImage({
  
  highestStateDat <- highestState()
  
  flagName <-  tolower(myData$name[myData$name == highestStateDat$name])
  flagName <- gsub(" ", "_", flagName)
  
  srcFlag <- paste0("www/flags_of_US_states/",flagName,".png")
  
  list(
    src = srcFlag
    , width = "60"
    , height = "50"
  )
  
  
}, deleteFile = FALSE)

output$highestState <- renderText({
  highestStateDat <- highestState()
  
  flagName <-  myData$name[myData$name == highestStateDat$name]
})

# Add nationwide summary 
output$sumUS <- renderPlotly({
  
  p <- ggplot() 
  p <- p + 
    geom_histogram(data = myData,
                   aes(x = .data[[input$select]]
                       , group = name),
                   fill = "lightgreen")
  
  ggplotly(p)
  
  
})
  

# Add state comparisons

# choose columns to display
# but don't display the selection
output$stateCompare <- renderPrint({invisible(input$state)})
output$columnShow <- renderPrint({invisible(input$showVars)})


selectedData <- reactive({
  myData %>% 
    filter(name %in% input$state) %>% 
    select(name, !! input$showVars) %>% 
    as.data.frame() %>% 
    select(-geometry)
})


output$compareTable <- renderDataTable({
    
    myData1 <- selectedData()
    myData1

  })

}


