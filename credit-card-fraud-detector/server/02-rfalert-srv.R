## Render the infobox
output$rf_transaction_box <- renderInfoBox({
  infoBox(
    "Transaction",
    paste0(count(sampled_data())),
    icon = icon("list"),
    color = "blue",
    fill = TRUE
  )
})


output$rf_amount_box <- renderInfoBox({
  real_data <- sampled_data() %>% na.omit()
  infoBox(
    "Amount",
    paste0(sum(real_data$Amount)),
    icon = icon("money"),
    color = "green",
    fill = TRUE
  )
})
output$rf_fraud_box <- renderInfoBox({
  real_data <-
    predict_fraudrf() %>% group_by(predict) %>% tally(name = "count") %>% filter(predict == 1)
  infoBox(
    "Alerts",
    paste0(real_data$count),
    icon = icon("bell", lib = "glyphicon"),
    color = "red",
    fill = TRUE
  )
})


output$rf_genuine_box <- renderInfoBox({
  real_data <-
    predict_fraudrf() %>% group_by(predict) %>% tally(name = "count") %>% filter(predict == 0)
  infoBox(
    "Genuine",
    paste0(real_data$count),
    icon = icon("ok", lib = "glyphicon"),
    color = "green",
    fill = TRUE
  )
})

## Render the fraud transaction table
output$rf_datatable <- renderDataTable({
  data <-
    predict_fraudrf() %>% group_by(predict) %>% filter(predict == 1)
  fwrite(data, "fraud_transaction.csv", row.names = FALSE)
  DT::datatable(data,
                selection = "single",
                options = list(searching = FALSE, scrollX = TRUE))
})

## render the lime plots
output$rf_limeplot <- renderPlot({
  #  input$run_model                                 # button input
  validate(
    need(input$datatable_rows_selected, 'Click on a Row from the Table'))
  index <- input$datatable_rows_selected
  #  index <- isolate(input$datatable_rows_selected)             # use isolate to run model only on button press
  data <-
    predict_fraudrf() %>% group_by(predict) %>% filter(predict == 1)
  #  plot(data$V1,data$V5)
  #  plot(iris$Sepal.Length,iris$Petal.Width)
  plot_features(explain(
    data[index, 1:32],
    explainer,
    n_labels = 1,
    n_features = 5
  )) + ggtitle("Model Explanation")
})
