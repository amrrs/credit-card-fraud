output$a_transaction_box <- renderInfoBox({
  infoBox(
    "Transaction",
    paste0(count(sample)), 
    icon = icon("list"),
    color = "blue",fill = TRUE
  )
})


output$a_amount_box <- renderInfoBox({
  infoBox(
    "Amount",
    paste0(sum(sample$Amount)), 
    icon = icon("money"),
    color = "green",fill = TRUE
  )
})
output$a_fraud_box <- renderInfoBox({
  infoBox(
    "Alerts","67",
    icon = icon("bell", lib = "glyphicon"),
    color = "red", fill = TRUE
  )
})


output$a_genuine_box <- renderInfoBox({
  infoBox(
    "Genuine","6667",
    icon = icon("ok", lib = "glyphicon"),
    color = "green", fill = TRUE
  )
})



