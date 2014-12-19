library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Shiny MPG Predictor"),
    sidebarPanel(
        h5("You can use this application to predict miles per gallon based on a vehicle's horsepower (HP) or weight."),        
        h6("Instructions"),
        p("1. Select which item you want to predict with: Horse Power (HP) or Weight."),
        p("2. Enter a value in the input box"),
        tags$ul(
            tags$li("For HP this can be a value between 1 and 440*."),
            tags$li("For weight this can be a between 1 and 7000 pounds.")
        ),
        p("3. Press the Submit button to get the predicted miles per gallon."),
        br(),
        p("*Limitations: The model stops working for HP above 440.")
    ),
    mainPanel(
        numericInput("ninput", "Enter a value",value = 1, min = 1, max = 7000),
        radioButtons("lmtype","Predict based on:",c("HP","Weight")),
        actionButton("submit","Submit"),
        br(),
        br(),
        h5('Prediction:'),
        h5(textOutput("prediction"))
    )
))

#predict MPG based on hp, weight or both

#tutorial
#http://shiny.rstudio.com/