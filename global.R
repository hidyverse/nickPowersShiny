
library(shiny)
library(tidyverse)

myData <-  read_csv("data/NPDClean.csv")

source("ui.R")
source("server.R")



shinyApp(ui = ui, server = server)
