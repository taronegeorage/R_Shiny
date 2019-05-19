library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Movie Prediction"),

  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(
    selectInput("generes", "Choose the generes of the movie:",
                choices = c("Action", "Adventure", "Animation","Biography","Black Comedy","Comedy","Crime","Documentary","Drama","Family","Fantasy","History","Horror","Musical","Mystery","Romance","Sci-Fi","Sport","Thriller","Western")),
    numericInput("budget", "The movie's budget:", 10000000),
    numericInput("time", "The run time of the movie:", 90),
    numericInput("num", "The number of films", 5),
    numericInput("rate", "The rate", 5.00),
    actionButton("do1", "     No rates provided     ")
  ),
  

  # Show a summary of the dataset and an HTML table with the requested
  # number of observations
  mainPanel(
    verbatimTextOutput("summary1")
  #   tableOutput("view")
  )

))



