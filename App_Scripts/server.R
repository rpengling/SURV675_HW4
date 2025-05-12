library(shiny)
library(shinydashboard)
library(tidyverse) 
library(vroom) 
library(plotly)


shinyServer(function(input, output, session){
  
  #First row + first infobox
  output$min_ <- renderInfoBox({
    infoBox(title = "Minm", 
            value = min(dat.clean$N_TV), 
            subtitle = "Minimum value for TV in the dataset", 
            fill = TRUE)
  })
  
  #First row + second infobox
  output$min_ <- renderInfoBox({
    infoBox(title = "Maxm", 
            value = max(dat.clean$N_TV), 
            subtitle = "Maximum value for TV in the dataset", 
            fill = TRUE, 
            color = "yellow")
  })
  
  #First row + third infobox
  output$min_ <- renderInfoBox({
    infoBox(title = "SD", 
            value = sd(dat.clean$N_TV), 
            subtitle = "Standard deviation value for TV in the dataset", 
            fill = TRUE, 
            icon("arrow-up"))
  })
  
  #First row + fourth infobox
  output$min_ <- renderInfoBox({
    infoBox(title = "Mean", 
            value = mean(dat.clean$N_TV), 
            subtitle = "Mean value for TV in the dataset", 
            fill = TRUE, 
            color = "yellow")
  })
  
  
  
  
  
  
  #Datatable
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




