library(shiny)
library(UsingR)
library(caret)

data(faithful)

# Create a model
model <- lm(eruptions ~ waiting, data=faithful)

getPredict <- function(waitTime) {
      z <- list(waiting=waitTime)
      newPredict <- predict(model, newdata=z)      #newPredict <- predict(model, newdata=waitTime)
      if (newPredict < 0) { newPredict <- 0 }
      return (newPredict)
}

shinyServer(
      function(input, output) {
            output$newPlot <- renderPlot({
                  wait <- input$wait
                  predict1 <- getPredict(input$wait)
                  plot(faithful$waiting, faithful$eruptions,pch=19,col="blue",xlab="Time Elapsed (minutes)",ylab="Geyser Duration (minutes)", main="Old Faithful - Time Elapsed v. Geyser Duration" )
                  abline(model, col="red")
                  points(input$wait,predict1,pch=19,lwd=4,col="magenta")
            })
            output$inputValue <- renderPrint({input$wait})
            output$outputValue <- renderPrint({getPredict(input$wait)[[1]]})  
      }
)

