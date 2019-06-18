# Define server logic
# Server will work on the data reading,data passing to model and passing data to ui section for visualization
## calling real time file reading
# source("server/00-datacreator-srv.R", local = TRUE)
data <- read_csv("/home/diwash/projeckt/credit_card_feaud/credit-card-fraud-detector/data/data.csv")

IsThereNewFile <- function() { #  cheap function whose values over time will be tested for equality;
  #  inequality indicates that the underlying value has changed and needs to be
  #  invalidated and re-read using valueFunc
  filenames <- list.files(pattern = "*.csv", full.names = TRUE)
  length(filenames)
}

ReadAllData <- function() { # A function that calculates the underlying value
  filenames <- list.files(pattern = "*.csv", full.names = TRUE)
  read_csv(filenames[length(filenames)])
}



shinyServer(server <- function(input, output, session) {
  values <- reactiveValues()
 observe({
   isolate({
     sampled_data <- reactivePoll(3000, session, IsThereNewFile, ReadAllData)
       values$data <- rbind(values$data, sampled_data())
   })

 })
  ## read the files in 3 second difference



  observe({
    
    print(values$data)
  }) 
  source("server/01-dashboard-srv.R", local = TRUE)
  source("server/02-alert-srv.R", local = TRUE)
})