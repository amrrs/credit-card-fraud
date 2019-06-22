output$a_transaction_box <- renderInfoBox({
  
  infoBox(
    "Transaction",
    paste0(count(sampled_data())), 
    icon = icon("list"),
    color = "blue",fill = TRUE
  )
})


output$a_amount_box <- renderInfoBox({
  real_data <- sampled_data() %>% na.omit()
  infoBox(
    "Amount",
    paste0(sum(real_data$Amount)), 
    icon = icon("money"),
    color = "green",fill = TRUE
  )
})
output$a_fraud_box <- renderInfoBox({
  real_data <- predict_fraud()%>%group_by(predict) %>% tally(name = "count") %>% filter(predict == 1)
  infoBox(
    "Alerts",paste0(real_data$count),
    icon = icon("bell", lib = "glyphicon"),
    color = "red", fill = TRUE
  )
})


output$a_genuine_box <- renderInfoBox({
  real_data <- predict_fraud()%>%group_by(predict) %>% tally(name = "count") %>% filter(predict == 0)
  infoBox(
    "Genuine",paste0(real_data$count),
    icon = icon("ok", lib = "glyphicon"),
    color = "green", fill = TRUE
  )
})

output$datatable <- renderDataTable(
  DT::datatable(predict_fraud()%>%group_by(predict) %>% filter(predict == 1),options = list(searching = FALSE,scrollX = TRUE))
)


