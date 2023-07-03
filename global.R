library(bslib)          # themeing
library(htmltools)      # css styling
library(leaflet)        # maps
library(sf)             # spatial data helper
library(shiny)          # app
library(shinydashboard) # dash style (do I need this?)
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
       #   card_header("home"),
       "testing landing page"),
  card(full_screen = TRUE,
       #   card_header("maps"),
     #  plotOutput("heatMap")
     leafletOutput("heatMap")
     ),
  card(
    varSelectInput("select",
                   "Select Freedom Factor:",
                   myData %>% select(-c(1:14, geometry)))
    ),
  card(full_screen = T,
       tableOutput("sumUS")) # did not finish table
)

source("ui.R")
source("server.R")


shinyApp(ui = ui, server = server)
