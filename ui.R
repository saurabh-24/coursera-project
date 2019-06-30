#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Summarize your article"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      textAreaInput("caption", h4("Paste your text"), value = "", width = "450px",
                    height = "400px", cols = NULL, rows = NULL, placeholder = NULL,
                    resize = NULL),
      textInput("Number",h4("Number of sentence")),
      actionButton("letsgo","go")
      
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      
      h2("Summary",h4(textOutput("value"))),
      h1("Sentence Network"),
      plotOutput("here",width = "100%",height = "700px")
    )
  )
))
