library(shiny)
library(datasets)

movie=read.csv("Starlight.csv",header = T)
attach(movie)
  g2=lm(BO.Global~as.factor(Genres)+Budget+Run.Time.in.Minutes+Total.Number.of.Films+rate)


# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output, session) {

  input_2 <- reactive({
    input_2 <- data.frame(Genres=input$generes,Budget=input$budget,Run.Time.in.Minutes=input$time,Total.Number.of.Films=input$num,rate=input$rate)   
  })
  getInput_2 <- eventReactive(input$do1, {
    
    predict(g2,input_2())
  })



  # Generate a summary of the dataset

  output$summary1 <- renderText({
    
    paste("$", getInput_2())
  })

  # Show the first "n" observations
  #output$view <- renderTable({
  #  head(datasetInput(), n = input$time)
  #})
})
