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
  title = "ABC Bank "
)


sidebar <-  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Alert", tabName = "alert", icon = icon("bell")),
      menuItem("Alerts", tabName = "rfalert", icon = icon("bell"),
               collapsible = TRUE,
               menuSubItem("Random Forest",tabName = "rfalert"),
               menuSubItem("XGBoost", tabName = "xgalert"),
               menuSubItem("GBM", tabName = "gbmalert"))
    )
  )

body <-  dashboardBody(
    tabItems(
      source("ui/01-dashboard-ui.R", local= TRUE)$value,
    # Second tab content
    source("ui/02-alert-ui.R", local= TRUE)$value,
    source("ui/02-rfalert-ui.R", local= TRUE)$value,
    source("ui/02-xgalert-ui.R", local= TRUE)$value,
    source("ui/02-gbmalert-ui.R", local= TRUE)$value
    )
  )

dashboardPagePlus(header,sidebar,body, skin = "black")