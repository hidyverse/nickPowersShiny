# 
# This is the server logic of the NPD Shiny web application. 
#
#





# Define server logic required to draw a histogram
server <- function(input, output, session) {

  
output$heatMap <- renderLeaflet({
   

  
  pal <- colorNumeric(
     palette = c("lightgreen", "darkgreen"),
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
        opacity = 1
      ) %>%
      
      setMapWidgetStyle(list(background= "white"))
  })

# Boxes for highest and lowest state
### LOWEST 

lowestState <- reactive({
  myData %>% arrange(!! input$select) %>% slice_head(n = 1)
})

output$lowest<-renderPlot({
  
  lowestStateDat <- lowestState()
  
  flagName <-  tolower(myData$name[myData$name == lowestStateDat$name])
  flagName <- gsub(" ", "_", flagName)
  
  print(flagName)
  
  srcFlag <- paste0("www/flags_of_US_states/",flagName,".png")
  
  print(srcFlag)
  # flag <- readPNG(source = srcFlag)
  # print(flag)
  
  # # Download the image file and store it in a temporary directory
  # grid.raster(flag, interpolate = F,height=unit(.1, "npc"), width=unit(.1, "npc"))
  
  png(srcFlag,
      width = unit(.1, "npc"),
      height = unit(.1, "npc"))

  dev.off()
  
 
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


