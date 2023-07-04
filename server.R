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


# Add nationwide summary 
output$sumUS <- renderPlot({
  
  ggplot() + 
    geom_histogram(data = myData,
                   aes(x = .data[[input$select]])) 
})
  

# Add state comparisons

# choose columns to display
# but don't display the selection
output$stateCompare <- renderPrint({invisible(input$state)})


selectedData <- reactive({
  myData %>% filter(name %in% input$state) %>% as.data.frame()
})


output$compareTable <- renderDataTable({
    
    myData1 <- selectedData()
    myData1

  })

}


