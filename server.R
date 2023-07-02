# 
# This is the server logic of the NPD Shiny web application. 
#
#





# Define server logic required to draw a histogram
server <- function(input, output, session) {
    
    
   
      
output$heatMap <- renderPlot({
       
      inputSelect <- myData %>% 
        select(input$select) %>% 
        as_vector()
        
      ggplot() + 
        geom_polygon( data= myData, aes(x=long
                                     , y=lat
                                     , group=group
                                     , fill = inputSelect)) +
                       
        scale_fill_continuous(name=input$select
                              , low = "lightgreen"
                              , high = "darkgreen"
                              # ,limits = c(0,4000)
                              ,  na.value = "grey50") +
        
        labs(title=input$select)
    })

}
