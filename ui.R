#
# This is the user-interface definition of the NPD Shiny application. 
# 30-07-23

### current goal: update to leaflet
 

# Define UI for application that draws a histogram
ui <-
  
  page_navbar(
    title = "NPD Dashboard BS Test"
    ,
    theme = bs_theme(bootswatch = "sketchy")
    ,
   # sidebar = "test info here"
    # sidebarMenu(
    # menuItem("Home", tabName = "home", icon = icon("th")),
    # menuItem("Heatmaps of the US", tabName = "maps", icon = icon("dashboard")))
    
    nav_panel("Home", cards[[1]])
    ,
    nav_panel("Maps"
    ,
    layout_column_wrap(
      width = 1/2, 
      style = css(grid_template_columns = "3fr 1fr"),
      navset_card_tab(
        nav_panel(
          "Heat Maps",
      # layout_column_wrap(
      #   width = 1 / 2,
      #   style = css(grid_template_columns = "3fr 1fr"),
          cards[[2]]),
        nav_panel(
        # layout_column_wrap(
        #   width = 1,
        #   row_heights = c(1, 4),
        #   heights_equal = "row",
          "Summary",
          cards[[4]]
        )
      ),
    cards[[3]]
    )))
   