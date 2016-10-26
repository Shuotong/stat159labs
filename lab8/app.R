library(shiny)

dataset <- read.csv("Advertising.csv")

ui <- fluidPage(
  headerPanel('Scatterplots of Sales VS. different advertising channels'),
  sidebarPanel(
    selectInput('x', 'X Variable', colnames(dataset)[2:4]),
    selectInput('y', 'Y Variable', colnames(dataset)[5])
  ),
  mainPanel(
    plotOutput('plot1')
  )
)

server <- function(input, output) {
  output$plot1 <- renderPlot({
    plot(dataset[,input$x], dataset$y,
      xlab = input$x,
      ylab = "Sales",
      main = sprintf("Scatterplot between %s and sales", input$x))
  })
}
shinyApp(ui = ui, server = server)
