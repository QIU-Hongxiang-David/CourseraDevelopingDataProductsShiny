library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Normal Distribution Claculator"),
    sidebarPanel(
        selectInput("kind","Kind of unknown",
                      c("Probability"=1,
                        "Density"=2,
                        "Quantile"=3)),
        textInput("mu","Mean","0"),
        textInput("sd","Standard deviation","1"),
        textInput("known","Known","0"),
        actionButton("button","Calculate!")
        ),
    mainPanel(
        p("This app does calculation with respect to normal distribution.
          Given the parameters (mean and standard deviation) of a normal
          distribution and a number Known, you can calculate the probability
          of X<Known, the density at Known, or the quantile with respect to
          Known, depending on which kind of unknown you want to calculate.
          It also plots the normal distribution density function and put a
          verticle line denoting the x value for your question."),
        p("Unreasonable input (for example, a negative standard deviation)
          can lead to error."),
        h3("You entered"),
        h5("Kind of parameter"),
        verbatimTextOutput("okind"),
        h5("Mean"),
        verbatimTextOutput("omu"),
        h5("Standard deviation"),
        verbatimTextOutput("osd"),
        h5("Known"),
        verbatimTextOutput("oknown"),
        h3("Result"),
        verbatimTextOutput("oresult"),
        h3("Normal Distribution Plot"),
        plotOutput("plot")
        )
    )
)