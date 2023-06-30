# 
# This is the server logic of the NPD Shiny web application. 
#
#


library(shiny)
library(maps)


# Define server logic required to draw a histogram
function(input, output, session) {
    
   # usMapDat <- map_data("state")
  
    dat <-read.csv("./data/NPD_Spreadsheet-2023-06-29.csv", skip = 2)[1:50, ] %>% 
      mutate(across(c(where(is.character), -c(State, "Abb.")), parse_number)) %>% 
      mutate(State = tolower(State)) %>% 
      full_join(map_data("state"), by = join_by(State == region)) 
    
    data <- reactive({
      dat
    })
    
    
    output$distPlot <- renderPlot({
        picker = names(data)
        if (!is.null(input$select)) {
          picker = input$select
        }
        # # generate bins based on input$bins from ui.R
        # x    <- dat$Total.Vehicle.Crash.Deahts
        # bins <- seq(min(x, na.rm = T), max(x, na.rm = T), length.out = input$bins + 1)
        # 
        # # draw the histogram with the specified number of bins
        # ggplot(dat) + 
        #   geom_histogram(aes(x, fill = `Abb.`), bins = input$bins)+
        #   labs(x = 'total deaths by vehicle crash',
        #        title = 'Histogram of Vehicle homocide')
      ggplot() + 
        geom_polygon( data= dat, aes(x=long
                                     , y=lat
                                     , group=group
                                     , fill = picker)) + 
        scale_fill_continuous(name="Total Vehicle Homocides"
                              , low = "lightgreen"
                              , high = "darkgreen"
                              ,limits = c(0,4000),  na.value = "grey50") +
        
        labs(title="Deaths by Vehicle in the Mainland United States")
    })

}
