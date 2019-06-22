library(shinydashboard)
library(shinythemes)
library(shinydashboardPlus)
library(ggplot2)
library(readr)
library(dplyr)
library(shiny)
library(gridExtra)
library(h2o)
library(highcharter)
library(data.table)
library(DT)


## create a dataframe to add the simulated real time data and use in visualization and infocards

h2o.init()

model <- h2o.loadModel("/home/diwash/projeckt/credit_card_feaud/model/GBM_model_R_1558482610633_2")
#test_df <- read_csv("/home/diwash/projeckt/credit_card_feaud/new_data.csv")
#test.h2o <- as.h2o(test_df)

#sample <- sample_frac(test_df, .1)
