

library(shiny)

shinyServer(function(input, output) {
      
      output$infCurvePlot <- renderPlot({
                      
            converter <- ifelse(input$unit1=="cm", 1, 2.54)
                      
            zScore <- (as.numeric(input$height1) * converter - 
                 infTable[infTable$sex==input$sex1 & 
                              infTable$age==as.numeric(input$age1),]$mean)/
                 infTable[infTable$sex==input$sex1 & 
                              infTable$age==as.numeric(input$age1),]$sd
                      
            infTable$y <- (zScore * infTable$sd) + infTable$mean
                      
            ggplot(infTable[infTable$sex==input$sex1,], 
                   aes(x = age, y = y / converter)) +
                  geom_point(color = "chartreuse") +
                  labs(title = "Infant Predicted Height by Age",
                       subtitle = "0 to 36 months",
                       x = "Age (in months)",
                       y = paste0("Predicted Height (in ", input$unit1, ")")
                  )
            
            
      })
      
      output$infText <- renderText({
          converter <- ifelse(input$unit1=="cm", 1, 2.54)
          
          zScore <- (as.numeric(input$height1) * converter - 
                         infTable[infTable$sex==input$sex1 & 
                                      infTable$age==as.numeric(input$age1),]$mean)/
              infTable[infTable$sex==input$sex1 & 
                           infTable$age==as.numeric(input$age1),]$sd
          
          paste(round(
              (zScore * infTable[infTable$sex==input$sex1 & infTable$age == 36,]$sd +
                    infTable[infTable$sex==input$sex1 & infTable$age == 36,]$mean)/
                    converter, 3),
              input$unit1
          )
      })
      
      output$childCurvePlot <- renderPlot({
          
          converter <- ifelse(input$unit2=="cm", 1, 2.54)
          
          childAge <- as.numeric(input$yrs2) * 12 + as.numeric(input$mos2)
          
          zScore <- (as.numeric(input$height2) * converter - 
                         childTable[childTable$sex==input$sex2 & 
                                      childTable$age==childAge,]$mean)/
              childTable[childTable$sex==input$sex2 & 
                           childTable$age==childAge,]$sd
          
          childTable$y <- (zScore * childTable$sd) + childTable$mean
          
          ggplot(childTable[childTable$sex==input$sex1,], 
                 aes(x = age / 12, y = y / converter)) +
              geom_point(color = "chartreuse") +
              labs(title = "Child Predicted Height by Age",
                   subtitle = "2 to 20 years",
                   x = "Age (in years)",
                   y = paste0("Predicted Height (in ", input$unit2, ")")
              )
          
          
      })
      
      output$childText <- renderText({
          converter <- ifelse(input$unit2=="cm", 1, 2.54)
          
          childAge <- as.numeric(input$yrs2) * 12 + as.numeric(input$mos2)
          
          zScore <- (as.numeric(input$height2) * converter - 
                         childTable[childTable$sex==input$sex2 & 
                                        childTable$age==childAge,]$mean)/
              childTable[childTable$sex==input$sex2 & 
                             childTable$age==childAge,]$sd
          
          paste(round(
              (zScore * childTable[childTable$sex==input$sex2 & 
                                       childTable$age == 240,]$sd +
                   childTable[childTable$sex==input$sex2 & 
                                  childTable$age == 240,]$mean)/
                  converter, 3),
              input$unit2
          )
      })
  
})
