ui <- fluidPage(
  titlePanel("Statistical Test Suggestion"),
  sidebarLayout(
    sidebarPanel(
      selectInput("variable_type", "Select variable type:",
                  c("Continuous", "Categorical", "Count")),
      selectInput("hypothesis_type", "Select hypothesis type:",
                  c("Difference", "Relationship")),
      actionButton("submit", "Submit")
    ),
    mainPanel(
      h5("Recommended statistical test:"),
      textOutput("result")
    )
  )
)

library(statisticaltestsuggestion)

server <- function(input, output, session) {
  observeEvent(input$submit, {
    var_type <- switch(input$variable_type,
                       "Continuous" = "continuous",
                       "Categorical" = "categorical",
                       "Count" = "count")
    hyp_type <- switch(input$hypothesis_type,
                       "Difference" = "difference",
                       "Relationship" = "relationship")
    result <- suggest_statistical_test(var_type, hyp_type)
    output$result <- renderText(result)
  })
}
