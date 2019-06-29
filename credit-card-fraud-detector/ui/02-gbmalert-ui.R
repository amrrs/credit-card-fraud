tabItem(tabName = "gbmalert"
        ,
        
        fluidRow(column(
          width = 12,
          fluidRow(
            infoBoxOutput("gbm_transaction_box", width = 3),
            infoBoxOutput("gbm_amount_box", width = 3),
            infoBoxOutput("gbm_fraud_box", width = 3),
            infoBoxOutput("gbm_genuine_box", width = 3)
            
          ),
          fluidRow(
            box(DTOutput("gbm_datatable",
                         height = 500) %>%  withSpinner()),
            box(plotOutput("gbm_limeplot",
                           height = 500) %>% withSpinner())
          )
        )))
