library(shiny)

# setwd("E:/R/ShinyStuff/FinalProject/")
# runApp()

shinyUI(pageWithSidebar(
      headerPanel('Old Faithful Geyser Duration Predictor'),
      sidebarPanel(
            h3('Use slider to select the amount of time waited'),
            sliderInput('wait', 'Wait in minutes', value=70, min=45, max=100, step=1,)
      ),
      mainPanel(
            plotOutput('newPlot'),
            h4('You entered: '),
            verbatimTextOutput("inputValue"),
            h4('Predicted Geyser Duration: '),
            verbatimTextOutput("outputValue")
      )
))