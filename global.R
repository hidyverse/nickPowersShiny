### NPD Shiny app

## library
library(leaflet)
library(sf)
library(shiny)
library(tidyverse)


## data
myData <-  read_csv("data/NPDClean.csv") 
myData_sf <- st_as_sf(myData, coords = c("long", "lat"), crs = 4326)

source("ui.R")
source("server.R")


## run app <3
shinyApp(ui = ui, server = server)
