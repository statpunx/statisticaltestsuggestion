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
