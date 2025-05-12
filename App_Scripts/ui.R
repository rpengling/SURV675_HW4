library(shiny)
library(shinydashboard)
library(tidyverse) 
library(vroom) 
library(plotly)



shinyUI(
  dashboardPage(skin = "blue",
    dashboardHeader(title = " ", titleWidth = 500, disable = FALSE), 
    
    
    dashboardSidebar(" ", collapsed = FALSE, disable = FALSE,
                     sidebarMenu( id = 'sidebarmenu', 
                       menuItem("tabBox", tabName = "charts", icon = icon("check")),
                       menuItem("box", tabName = "box", icon = icon("check")),
                                  #first menu item
                       menuItem(text = "About", tabName = "about", icon = icon("clipboard")), 
                       
                       #Second menu item with 2 submenus
                       menuItem('chart',
                         icon = icon('line-chart'), 
                         menuSubItem('chartmenusub1', 
                                     tabName = 'chart1', 
                                     icon = icon('line-chart')), 
                         menuSubItem('chartsubmenu2', 
                                     tabName = 'chart2',
                                     icon = icon('line-chart'))
                       ),
                       menuItem("Data", tabName = "data", icon = icon("database")), 
                       menuItem("Click for Github Repository", href = "https://github.com/rpengling/SURV675_HW4.git", icon = icon("code"))
                               )
                    ), 
    
    
    dashboardBody(" ",
                  tabItems(
                    tabItem(tabName = "IB", 
                            fluidRow(
                              infoBoxOutput("min_", width = 3), #"min_" is defined in server file
                              infoBoxOutput("max_", width = 3), #?validColors for list of color options
                              infoBoxOutput("sd_", width = 3), 
                              infoBoxOutput("mean_", width = 3)
                            )),
                    tabItem(tabName = "charts", 
                            fluidRow(
                              tabBox(id = "tabchart1", 
                                     tabPanel("Tab1", plotlyOutput("plot1")), 
                                     tabPanel("Tab2", plotlyOutput("plot2")), 
                                     tabPanel("Tab3", plotlyOutput("plot3")), 
                                     tabPanel("Tab4", plotlyOutput("plot4"))
                                     ), 
                              tabBox(id = "tabchart2", side = "right", 
                                     tabPanel("Tab1", "Tab 1 content"), 
                                     tabPanel("Tab2", "Tab 2 content"), 
                                     tabPanel("Tab3", "Tab 3 content")
                                     )
                            )),
                    tabItem(tabName = "box", 
                            #First row
                            fluidRow(box(title = "box with a plot", plotlyOutput("plot1", height = 250))), 
                            box(title = "Box with a plot", status = "primary", solidHeader = TRUE, plotlyOutput("plot2", height = 250)), 
                            #Second row 
                            fluidRow(box(title = "Box with datatable", tableOutput("data"), width = 8)), 
                            box(title = "Box with input widget", uiOutput("inputwidget"), width = 4)), #Total row width = 12. 
                    tabItem(tabName = "about", p(" "), p(" ")), 
                    tabItem(tabName = "data", dataTableOutput("mydatatable"))
                    )
                 )
  )
)
