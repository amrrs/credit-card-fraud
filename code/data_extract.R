### Combine data sets

## load library
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(h2o)
library(lubridate)


order <- read_delim("data/order.csv", ";", 
                     escape_double = FALSE, trim_ws = TRUE)

cred_trans <- filter(trans, type == "PRIJEM")

order$k_symbol[is.na(order$k_symbol)] <- "none"