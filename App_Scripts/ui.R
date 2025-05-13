library(shiny)
library(shinydashboard)
library(tidyverse) 
library(vroom) 
library(plotly)
library(DT)



shinyUI(
  dashboardPage(skin = "blue",
    dashboardHeader(title = "World Value Study: Wave '06 Data Exploration", titleWidth = 500, disable = FALSE), 
    
    
    dashboardSidebar(collapsed = FALSE, disable = FALSE,
                     sidebarMenu( id = 'sidebarmenu', 
                                  
                       
            #About Page                      
                       menuItem(text = "About", tabName = "about", icon = icon("earth-americas")), 
                       
            
            #charts          
                       menuItem("Graphs & Tables", tabName = "charts", icon = icon("square-poll-vertical")),
            
 
            
            #Data         
                       menuItem("Data", tabName = "data", icon = icon("database")), 
                       

               
            #Github        
                       menuItem("Click for Github Repository", href = "https://github.com/rpengling/SURV675_HW4.git", icon = icon("link"))
                      )
    ), 
    
    
    
    
    
    
    
    dashboardBody(
                  tabItems(
                    
            #About        
                    tabItem(tabName = "about", p("Quote1"), p("Quote2"),
                            ),
                    
           
            #Charts(Graphs)         
                    tabItem(tabName = "charts", 
                            fluidRow(
                              box(title = "Box with input widget", status = "primary", solidHeader = T, uiOutput("inputwidget"), width = 4)),
                              
                              
                            fluidRow(
                              tabBox(id = "tabchart1", title = "Graphs",
                                     tabPanel("Attitudes Towards Democracy", plotlyOutput("dem")), 
                                     tabPanel("News Consumption", plotlyOutput("new")), 
                                     tabPanel("Attitudes Towards Science", plotlyOutput("sci"))
                                    ), 
                              tabBox(id = "tabchart3", side = "right", title = "Tables",
                                     tabPanel("Attitudes Towards Democracy", DT::dataTableOutput("demo")), 
                                     tabPanel("News Consumption", DT::dataTableOutput("news")),
                                     tabPanel("Attitudes Towards Science", DT::dataTableOutput("science"))
                                    )
                            ),
                            
                            fluidRow(
                              tabBox(id = "tabchart2", title = "All Countries",
                                     tabPanel("Attitudes Towards Democracy", DT::dataTableOutput("bigdem")), 
                                     tabPanel("News Consumption", DT::dataTableOutput("bignew")), 
                                     tabPanel("Attitudes Towards Science", DT::dataTableOutput("bigsci"))
                                    )
                              )
                              
                            
                            
                            
                            
                            
                            
                            ),
                    

            #Data
                    tabItem(tabName = "data", DT::dataTableOutput("mydatatable"))
                    
                    
                    )
                 )
  )
)
