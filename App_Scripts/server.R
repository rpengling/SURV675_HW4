library(shiny)
library(shinydashboard)
library(tidyverse) 
library(vroom) 
library(plotly)
library(DT)


shinyServer(function(input, output, session){
  
  #Datatable
  output$mydatatable <- DT::renderDT({
    head(Dat)
  })


#Graphs
  
  
  #Dem by Country 
  output$dem <- renderPlotly({
    Dem %>%
      dplyr::filter(Country == input$selected) %>%
      dplyr::select(-Country) %>%
      summarise_all(~ round(mean(.x, na.rm = TRUE), 2)) %>%
      pivot_longer(cols = everything(), names_to = "Variable", values_to = "Average_Rating") %>% 
      mutate(Variable = stringr::str_remove(Variable, "^[DNS]_")) %>%
      plot_ly(
        x = ~Variable, 
        y = ~Average_Rating, 
        type = "bar"
      )
  })
    

  
  #News by Country 
  output$new <- renderPlotly({
    plot_data <- News %>%
      dplyr::filter(Country == input$selected) %>%
      dplyr::select(-Country) %>%
      pivot_longer(
        cols = everything(), 
        names_to = "Variable", 
        values_to = "Response") %>%
      group_by(Variable, Response) %>%
      summarise(Proportion = n() / nrow(News)) %>%
      mutate(
        Variable = stringr::str_remove(Variable, "^[N]_"))
    plot_ly(
      data = plot_data,
      x = ~Variable,                
      y = ~Proportion,              
      color = ~factor(Response),    
      type = "bar", 
      name = ~factor(Response)      
    ) %>%
      layout(
        barmode = "stack",           
        xaxis = list(title = "Variables"),
        yaxis = list(title = "Proportion")
      )
  })
  
  #Science 
  output$sci <- renderPlotly({
    Sci %>% 
      dplyr::filter(Country == input$selected) %>%
      dplyr::select(-Country) %>%
      summarise_all(~ round(mean(.x, na.rm = TRUE), 2)) %>%
      pivot_longer(cols = everything(), names_to = "Variable", values_to = "Average_Rating") %>% 
      mutate(Variable = stringr::str_remove(Variable, "^[DNS]_")) %>%
      plot_ly(
        x = ~Variable, 
        y = ~Average_Rating, 
        type = "bar") 
      
  })
  
  
  
  
  
  
  
  
  
  
#Tables 

    output$demo <- DT::renderDT({
    Dem %>% 
      dplyr::filter(Country == input$selected) %>% 
      dplyr::select(-Country) %>% 
      summarise_all(mean, na.rm = TRUE) %>% 
      round(2) %>% 
      rename_with(~ stringr::str_remove(., "^[DNS]_")) %>%
      DT::datatable(options = list(scrollX = T))
  })
  
  output$news <- DT::renderDT({
    News %>% 
      dplyr::filter(Country == input$selected) %>% 
      dplyr::select(-Country) %>% 
      summarise_all(mean, na.rm = TRUE) %>% 
      round(2) %>% 
      rename_with(~ stringr::str_remove(., "^[DNS]_")) %>%
      DT::datatable(options = list(scrollX = T))
  })
  
  output$science <- DT::renderDT({
    Sci %>% 
      dplyr::filter(Country == input$selected) %>% 
      dplyr::select(-Country) %>% 
      summarise_all(mean, na.rm = TRUE) %>% 
      round(2) %>% 
      rename_with(~ stringr::str_remove(., "^[DNS]_")) %>%
      DT::datatable(options = list(scrollX = T))
  })

  
  #Full data
  output$bigdem <- DT::renderDT({
    Dem %>% 
      group_by(Country) %>%
      summarise_all(~ round(mean(.x, na.rm = TRUE), 2)) %>% 
      rename_with(~ stringr::str_remove(., "^[DNS]_")) %>%
      DT::datatable(options = list(scrollX = T))
  })
  
  
  output$bignew <- DT::renderDT({
    PropNews%>%
      rename_with(~ stringr::str_remove(., "^[DNS]_")) %>%
      DT::datatable(options = list(scrollX = TRUE)) 
  })
  
  
  output$bigsci <- DT::renderDT({
    Sci %>% 
      group_by(Country) %>%
      summarise_all(~ round(mean(.x, na.rm = TRUE), 2)) %>% 
      rename_with(~ stringr::str_remove(., "^[DNS]_")) %>%
      DT::datatable(options = list(scrollX = T))
  })
  
  
  
  
  #Input widget 
  output$inputwidget <- renderUI({
    selectInput(inputId = "selected", label = "Select a Country", choices = unique(Dat$Country))
  })


}
)




