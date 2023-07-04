#
# This is the user-interface definition of the NPD Shiny application.
# 30-07-23

### current goal: add nationwide summary table


# Define UI for application that draws a histogram
ui <-
  
  page_navbar(
    title = "NPD Dashboard BS Test"
    ,
    theme = bs_theme(bootswatch = "sketchy")
    ,
    nav_panel("Home", layout_columns(
     # cards[[1]]
      column(6,
        includeMarkdown("www/homePage.qmd")
      )
    ))
    ,
    nav_panel(
      "Maps"
      ,
      layout_column_wrap(
        width = 1 / 2,
        style = css(grid_template_columns = "3fr 1fr"),
        navset_card_tab(nav_panel("Heat Maps",
                                  cards[[1]]),
                        nav_panel("Summary",
                                  cards[[3]])),
        cards[[2]]
      )
    )
  )
