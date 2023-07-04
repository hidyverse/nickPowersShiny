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
  
  
  # inputSelect <- myData %>% 
  #   select(input$select) %>% 
  #   as_vector()
  
  ggplot() + 
    geom_histogram(data = myData,
                   aes(x = .data[[input$select]])) 
})

}
  
