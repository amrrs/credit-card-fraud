#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram

header <- dashboardHeader(
  title = "ABC Bank Dashboard"
)


sidebar <-  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Alert", tabName = "alert", icon = icon("bell"))
    )
  )

body <-  dashboardBody(
    tabItems(
      source("ui/01-dashboard-ui.R", local= TRUE)$value,
    # Second tab content
    source("ui/02-alert-ui.R", local= TRUE)$value
    )
  )

dashboardPagePlus(header,sidebar,body, skin = "black")