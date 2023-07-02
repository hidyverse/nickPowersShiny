# This is the server logic of the NPD Shiny web application. 


# Define server logic required to draw a map
# server <- function(input, output, session) {
#     
# # define the map's fill      
# output$heatMap <- renderPlot({
#        
#     # select data from ui choice  
#       inputSelect <- myData %>% 
#         select(input$select) %>% 
#         as_vector()
#         
#       ggplot() + 
#         geom_polygon( data= myData, aes(x=long
#                                      , y=lat
#                                      , group=group
#                                      , fill = inputSelect)) +
#                        
#         scale_fill_continuous(name=input$select
#                               , low = "lightgreen"
#                               , high = "darkgreen"
#                               # ,limits = c(0,4000)
#                               ,  na.value = "grey50") +
#         
#         labs(title=input$select)
#     })
# 
# }


# Define server logic required to draw a heatmap
server <- function(input, output, session) {
  
  output$heatMap <- renderLeaflet({
    pal <- colorNumeric(
      palette = c("lightgreen", "darkgreen"),
      domain = myData[[input$select]]
    )
    
    leaflet() %>%
      addTiles() %>%
      addPolygons(
        data = myData_sf,
        fillColor = ~pal(myData[[input$select]]),
        color = "black",
        fillOpacity = 0.7,
        label = ~paste("Group:", group, "<br>",
                       input$select, ":", myData[[input$select]])
      ) %>%
      addLegend(
        position = "bottomright",
        pal = pal,
        values = ~myData[[input$select]],
        title = input$select,
        opacity = 1
      )
  })
}