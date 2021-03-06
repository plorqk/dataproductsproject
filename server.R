library(shiny)
library(datasets)
data(mtcars)

hpfit <- lm(mpg ~ hp,data=mtcars)
wtfit <- lm(mpg ~ wt,data=mtcars)

shinyServer(
    function(input, output) {
        output$prediction <- renderText({ 
            if(input$submit > 0) { #don't do anything until they click submit
                isolate({
                    if(input$lmtype == "HP") {
                        x <- predict(hpfit,data.frame(hp=input$ninput))
                    }
                    if(input$lmtype=="Weight") {
                        x <- predict(wtfit,data.frame(wt=input$ninput/1000))
                    }
                    if(x < 0) { #added for robustness; if the prediction predicts a negative value return 0
                        x <- 0
                    }
                    paste(round(x,1),"mpg")
                })
            }
        })
    }
)