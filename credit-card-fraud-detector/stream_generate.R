library(dplyr)
library(readr)
library(data.table)

data <- read_csv("/home/diwash/projeckt/credit_card_feaud/credit-card-fraud-detector/data/test_data.csv")

i = 0.05
while(i<=1){
  temp=sample_frac(data,i)
  i = i + 0.05
#  write.csv(temp, paste0("stream", gsub("[^0-9]","",Sys.time()),".csv"),
  fwrite(temp, "stream.csv",row.names = FALSE)
  Sys.sleep(7) # Suspend execution of R expressions. The time interval to suspend execution for, in seconds.

}
