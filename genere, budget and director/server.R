library(shiny)
library(datasets)

movie=read.csv("Starlight.csv",header = T)
attach(movie)
g3=lm(BO.Global~as.factor(Genres)+Budget+rate)


# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output, session) {
  input_3 <- reactive({
    input_3 <- data.frame(Genres=input$generes,Budget=input$budget,rate=input$rate)   
  })
  getInput_3 <- eventReactive(input$do2, {
    predict(g3,input_3())
  })


  # Generate a summary of the dataset

  output$summary1 <- renderText({
    
    paste("$", getInput_3())
  })

  # Show the first "n" observations
  #output$view <- renderTable({
  #  head(datasetInput(), n = input$time)
  #})
})
