library(bslib)          # themeing
library(DT)             # fancy table
library(htmltools)      # css styling
library(leaflet)        # maps
library(leaflet.extras) # pretty maps
library(sf)             # spatial data helper
library(shiny)          # app
# library(thematic)     # bslib theme to ggplot
library(tidyverse)      # happy place
library(USAboundaries) # USA polygons
avail <- requireNamespace("USAboundariesData", quietly = TRUE)

usa <- us_states()

myData <-  right_join(usa,
                      read_csv("data/NPDClean.csv"),
                      by = c("name" = "State")) %>% 
  filter(name != c("Hawaii", "Alaska")) 


cards <- list(

  card(full_screen = TRUE,
     leafletOutput("heatMap")
     ),
  card(
    varSelectInput("select",
                   "Select Freedom Factor:",
                   myData %>% select(-c(1:14, geometry)))
    ),
  card(full_screen = T,
    card_body(
       DTOutput("sumUS"),
       width = "100%") 
))

myTheme <- bs_add_variables(
  bs_theme(bootswatch = "sketchy", primary = "#000000"),
  "body-bg" = "#FFFFFF",
  "color" = "#000000",
  "base-font" = "Proxima Nova – Semibold",
  "font-size-base" = "1.4rem",
  "btn-padding-y" = ".16rem",
  "btn-padding-x" = "2rem"
)


source("ui.R")
source("server.R")


shinyApp(ui = ui, server = server)
