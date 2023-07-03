
library(bslib)     # themeing
library(leaflet)   # maps
library(sf)        # spatial data helper
library(shiny)
library(shinydashboard) 
library(tidyverse)

myData <-  read_csv("data/NPDClean.csv")
# myData_sf <- st_as_sf(myData, coords = c("long", "lat"), crs = 4326)

cards <- list(
  card(full_screen = TRUE,
       #   card_header("home"),
       "testing landing page"),
  card(full_screen = TRUE,
       #   card_header("maps"),
       plotOutput("heatMap")),
  card(full_screen = T,
    varSelectInput("select",
                   "Select Freedom Factor:",
                   myData)),
  card(full_screen = T,
       tableOutput("sumUS")) # did not finish table
)

source("ui.R")
source("server.R")


shinyApp(ui = ui, server = server)
