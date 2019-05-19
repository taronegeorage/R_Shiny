library(shiny)
library(datasets)

movie=read.csv("Starlight.csv",header = T)
attach(movie)
g1=lm(BO.Global~IMDB.Rating+Rotten.Tomatoes.Rating+as.factor(Genres)+Budget+Run.Time.in.Minutes+Total.Number.of.Films+rate)



# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output, session) {
  input_1 <- reactive({
    input_1 <- data.frame(IMDB.Rating=input$imdb,Rotten.Tomatoes.Rating=input$rt,Genres=input$generes,Budget=input$budget,Run.Time.in.Minutes=input$time,Total.Number.of.Films=input$num,rate=input$rate)   
  })
  getInput_1 <- eventReactive(input$do, {
    predict(g1,input_1())
  })

  # Generate a summary of the dataset

  output$summary1 <- renderText({
    
    paste("$", getInput_1())
  })

  # Show the first "n" observations
  #output$view <- renderTable({
  #  head(datasetInput(), n = input$time)
  #})
})
