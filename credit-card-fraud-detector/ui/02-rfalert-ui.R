tabItem(tabName = "rfalert"
        ,
        
        fluidRow(column(
          width = 12,
          fluidRow(
            infoBoxOutput("rf_transaction_box", width = 3),
            infoBoxOutput("rf_amount_box", width = 3),
            infoBoxOutput("rf_fraud_box", width = 3),
            infoBoxOutput("rf_genuine_box", width = 3)
            
          ),
          fluidRow(
            box(DTOutput("rf_datatable",
                         height = 500) %>%  withSpinner()),
            box(plotOutput("rf_limeplot",
                           height = 500) %>% withSpinner())
          )
        )))
