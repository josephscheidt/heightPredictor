

library(shiny)
library(plotly)

shinyServer(function(input, output) {
      
      output$infCurvePlot <- renderPlotly({
            
            if(length(input$height) == 0) {
                  print("Please enter a height")
            } else {
            
            zScore <- (input$height * input$unit$value - 
                             infTable[sex==input$sex & age==input$age,]$mean)/
                             infTable[sex==input$sex & age==input$age,]$sd
            
            infTable$y <- (zScore * infTable$sd) + infTable$mean
            
            ggplot(infTable, aes(x = age, y = y / input$unit$value)) +
                  geom_point(color = "chartreuse") +
                  geom_smooth(color = "chartreuse") +
                  geom_point(x = input$height, color = "green") +
                  labs(title = "Infant Predicted Height by Age",
                       subtitle = "0 to 36 months",
                       x = "Age (in months)",
                       y = paste0("Predicted Height (in", input$unit$text, ")")
                  )
            
            }
            
            
      })
      
      output$infText <- renderText({
            paste("The child's predicted height at 36 months is", 
                  infTable[sex==input$sex & age == 36,]$mean)
      })
      
      output$childCurvePlot <- renderPlotly({
            
            if(length(input$height) == 0) {
                  print("Please enter a height")
            } else {
                  
                  zScore <- (input$height * input$unit$value - 
                                   childTable[sex==input$sex & age==input$age,]$mean)/
                        childTable[sex==input$sex & age==input$age,]$sd
                  
                  childTable$y <- (zScore * childTable$sd) + childTable$mean
                  
                  ggplot(childTable, aes(x = age / 12, y = y / input$unit$value)) +
                        geom_point(color = "chartreuse") +
                        geom_smooth(color = "chartreuse") +
                        geom_point(x = input$height, color = "green") +
                        labs(title = "Child Predicted Height by Age",
                             subtitle = "2 to 20 years",
                             x = "Age (in years)",
                             y = paste0("Predicted Height (in", input$unit$text, ")")
                        )
                  
            }
            
            
      })
      
      output$childText <- renderText({
            paste("The child's predicted height at 20 years is", 
                  infTable[sex==input$sex & age == 240,]$mean)
      })
  
})
