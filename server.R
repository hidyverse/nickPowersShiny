#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {
  
    dat <-read.csv("./data/NPD_Spreadsheet-2023-06-29.csv", skip = 2)[1:50, ] %>% 
      mutate(across(c(where(is.character), -c(State, "Abb.")), parse_number)) 
    
    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- dat$Total.Vehicle.Crash.Deahts
        bins <- seq(min(x, na.rm = T), max(x, na.rm = T), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        ggplot(dat) + 
          geom_histogram(aes(x, fill = `Abb.`), bins = input$bins)+
          labs(x = 'total deaths by vehicle crash',
               title = 'Histogram of Vehicle homocide')
        
        # hist(x, breaks = bins, col = 'darkgray', border = 'white',
        #      xlab = 'total deaths by vehicle crash',
        #      main = 'Histogram of Vehicle homocide')

    })

}
