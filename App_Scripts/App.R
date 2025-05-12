# SURV675 HW4

library(shiny)
library(shinydashboard)
library(tidyverse) 
library(vroom)





shinyUI(
  dashboardPage(
    dashboardHeader(title = " ", titleWidth = 500, disable = FALSE), 
    dashboardSidebar(" ", collapsed = FALSE, disable = FALSE ), 
    dashboardBody(" ")
  )
)

















ui <- fluidPage(
  
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)




#Your app has only one input: the country. It should have four sections or tabs:

#Sections b, c and d all have three things inside:
#1. plot the averages (proportions by category for news) of the questions in that section for the country selected (i.e., if they select Algeria shows the graph just for Algeria)
#2. a table with the averages (proportions by category for news) of the questions in that section for the country selected
#3. a similar table as above but with the information on the entire WVS sample

#The results in sections b, c and d should change depending on the country input (except the last table in each section which is the same for all the countries).



##A. Overview: here you can say what is the aim of the app and guide the user in how to navigate it 



##B. Exploring attitudes to democracy (V228A-V228I) 



##C. Exploring news consumption (V217-V224) 



##D. Exploring attitudes to science (V192-197) 








