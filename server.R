library(shiny)
library(datasets)
data(ToothGrowth)

# Define server logic for random distribution application
shinyServer(function(input, output) {
      
  # generate the plot
  output$plot <- renderPlot({
    validate(
      need(input$mode, 'Check at least one mode'),   
      need(input$dose %in% c(0.5,1,2), 'Please select a valid range')
    )
    doseR <- seq(input$dose[1],input$dose[2], 0.5)
    subset <- ToothGrowth[with(ToothGrowth, supp %in% input$mode & dose %in% doseR),]
    x <- input$xAxis
    xlabel <- if(x=="supp") "mode" else "dose"
    subset$dose <- as.factor(subset$dose)
    plot(if(x=="supp") subset$supp else subset$dose, subset$len, 
         main = paste("Boxplot of length vs. ",xlabel),
         xlab = xlabel, ylab = "length")    
  })
    
  # Generate a summary of the data
  output$summary <- renderPrint({
    validate(
      need(input$mode, 'Check at least one mode'),
      need(input$dose %in% c(0.5,1,2), 'Please select a valid range')
    )
    doseR <- seq(input$dose[1],input$dose[2], 0.5)
    subset <- ToothGrowth[with(ToothGrowth, supp %in% input$mode & dose %in% doseR),]
    summary(subset)
  })
  
  # Generate an HTML table view of the data
  output$table <- renderTable({
    validate(
      need(input$mode, 'Check at least one mode'),
      need(input$dose %in% c(0.5,1,2), 'Please select a valid range')
    )
    doseR <- seq(input$dose[1],input$dose[2], 0.5)
    ToothGrowth[with(ToothGrowth, supp %in% input$mode & dose %in% doseR),]    
  })
  
})