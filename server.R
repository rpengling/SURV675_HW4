library(shiny)
library(shinydashboard)
library(tidyverse) 
library(vroom)


shinyServer(function(input, output, session){
  
  output$mydatatable <- renderDataTable({
    head(dat.clean)
  })
  
  #Plotly Scatter Plot 
  output$plot1 <- renderPlotly({
    plot_ly(data = dat.clean, 
            x = ~Country, 
            y = ~N_TV, 
            type = "scatter", 
            mode = "markers")
  })
  
  #Histogram 
  output$plot2 <- renderPlotly({
    plot_ly(
      data = dat.clean, 
      x = ~Country, 
      y = ~N_TV, 
      type = "histogram")
  })
  
  
  #Input widget 
  output$inputwidget <- renderUI({
    selectInput(inputId = "in", "select a variable", choices = names(dat.clean))
  })
}
)




