#
# This is the user-interface definition of the NPD Shiny application.
# 30-07-23


# Define UI for application that draws a histogram
ui <-
  
  
  
  page_navbar(
    title = tags$img(src='TikTok-icon.png', height = '60', width ='60')
    ,
    theme = myTheme
    ,
    bg = "#FFFFFF"
    ,
    
    nav_panel("Home", layout_columns(
      column(
        6,
        includeMarkdown("www/homePage.qmd")
      )))
    ,
    nav_panel(
      "Maps"
      ,
      layout_column_wrap(
        width = 1 / 2,
        style = css(grid_template_columns = "5fr 1fr"),
        navset_card_tab(
          nav_panel(
            "Heat Maps",
            cardsHeatMaps[[1]],
            layout_column_wrap(width = 1 / 2,
                               height = "100px",
                               cardsState[[1]],
                               cardsState[[2]])
          ),
          nav_panel("Summary",
                    cardsSummary)
        ),
        cardsHeatMaps[[2]]
      )
    )
    ,
    nav_panel(
      "State comparisons",
      layout_column_wrap(
        width = 1 / 2,
        height = "100px",
        style = css(grid_template_columns = "1fr 9fr"),
        cardsComparisons[[1]],
        cardsComparisons[[2]]
       )
     ,
     cardsComparisons[[3]]
    )
  )
