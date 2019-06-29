library(shinydashboard)
library(shinythemes)
library(shinydashboardPlus)
library(shinycssloaders)
library(ggplot2)
library(readr)
library(dplyr)
library(shiny)
library(gridExtra)
library(h2o)
library(highcharter)
library(data.table)
library(DT)
library(lime)


## Intialize the h2o
h2o.init()

## Load saved model
model <- h2o.loadModel("/home/diwash/projeckt/credit_card_feaud/model/GBM_model_R_1558482610633_2")
#model <- h2o.loadModel("/home/diwash/projeckt/credit_card_feaud/credit-card-fraud-detector/model/DRF_model_R_1561701961587_2")
modelrf <- h2o.loadModel("/home/diwash/projeckt/credit_card_feaud/credit-card-fraud-detector/model/DRF_model_R_1561701961587_2")
modelxg <- h2o.loadModel("/home/diwash/projeckt/credit_card_feaud/credit-card-fraud-detector/model/XGBoost_model_R_1561701961587_884")
modelgb <- h2o.loadModel("/home/diwash/projeckt/credit_card_feaud/credit-card-fraud-detector/model/GBM_model_R_1558482610633_2")
## For LIME
train <- fread("/home/diwash/projeckt/credit_card_feaud/train.csv")
explainer <- lime(train, model, n_bins = 5)