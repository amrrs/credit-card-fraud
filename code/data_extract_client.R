### Combine data sets

## load library
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(h2o)
library(lubridate)
library(stringi)


## Working on client data
client <- read_csv("data/client.csv")

client$birth_number <-  as.character(client$birth_number) 
  
# client$birth_number<-  as.Date(client[["birth_number"]], "%y%m%d")

#client$birth_number <- ymd(client$birth_number)


client$month <- substr(client$birth_number,3,4)

client$month <- as.numeric(client$month)
client <- mutate(client, female = (month - 50 >= 0))

client$month[client$female == TRUE] <- client$month[client$female == TRUE] - 50 

client$year <- substr(client$birth_number,1,2)

client$day <- substr( client$birth_number,5,6)


client <- unite(client,new_date,year,month,day,sep="", remove = FALSE)
#client$new_date <- as.Date(client$birth_number, format = "%Y/%m/%d")

client$month <- stri_pad_left(client$month,2,pad ="0")
client$year <- stri_pad_left(client$year,3,pad = "9")
client$year <- stri_pad_left(client$year,4,pad = "1")


client$new_date <- paste(client$year,client$month,client$day, sep ="")
client$new_date <- as.character(client$new_date)

client$new_date <- ymd(client$new_date)
write_csv(client, "./data/client.csv")