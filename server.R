# 
# This is the server logic of the NPD Shiny web application. 
#
#





# Define server logic required to draw a histogram
server <- function(input, output, session) {
    

# observeEvent(input$select, {
#   inputSelect <-  myData %>%
#     select(input$select) %>%
#     as_vector()
#   print(inputSelect)
# })
#       

  
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
      addTiles() %>%
      addPolygons(
        data = myData,
        fillColor = ~pal(myData[[input$select]]),
        color = "black",
        fillOpacity = 1
        ,
        label = ~labels
      ) %>% 
      addLegend("bottomright",
        pal = pal,
        values = myData[[input$select]],
        title = colnames(myData[[input$select]]),
        opacity = 1
      )
  })


# Add nationwide summary statistics
output$sumUS <- renderPrint({

  inputSelect <- myData %>% 
    as_tibble() %>% 
    select(input$select) %>% 
    as_vector()
  
  myData %>% 
    as_tibble %>% 
    summarise(Mean = mean(inputSelect), SD = sd(inputSelect))
})

}
