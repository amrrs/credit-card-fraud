tabItem(tabName = "xgalert"
        ,
        
        fluidRow(column(
          width = 12,
          fluidRow(
            infoBoxOutput("xg_transaction_box", width = 3),
            infoBoxOutput("xg_amount_box", width = 3),
            infoBoxOutput("xg_fraud_box", width = 3),
            infoBoxOutput("xg_genuine_box", width = 3)
            
          ),
          fluidRow(
            box(DTOutput("xg_datatable",
                         height = 500) %>%  withSpinner()),
            box(plotOutput("xg_limeplot",
                           height = 500) %>% withSpinner())
          )
        )))
