
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("German Tank Problem"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      p("This app solves the ",
        tags$a(href="https://en.wikipedia.org/wiki/German_tank_problem", "German Tank Problem"),
        " please enter the observed serial numbers (separated by commas):"),
      textInput("inputtext", label = h4("Observed serial numbers:"), 
                value = "2,6,7,14")
      #,submitButton("Submit")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      htmlOutput("text1")
      
    )
  )
))
