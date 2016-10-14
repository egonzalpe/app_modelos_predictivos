library(shiny)
library(shinythemes)
library(forecast)

shinyUI(fluidPage(theme = shinytheme("flatly"),
  
  titlePanel("Programa de Modelos Predictivos",windowTitle ="Programa de Modelos Predictivos" ),
  
  sidebarLayout(
    sidebarPanel(
      fileInput('file1', 'Importe set de datos',
                accept=c('text/csv', 
                         'text/comma-separated-values,text/plain', 
                         '.csv')),

      checkboxInput('header', 'Encabezado', TRUE),
      
      # radioButtons('sep', 'Separator',
      #              c(Coma=',',
      #                'Punto y coma'=';',
      #                Tabulador='\t'),
      #              ','),
      # radioButtons('quote', 'Quote',
      #              c(Ninguno='',
      #                'Comilla Doble'='"',
      #                'Comilla simple'="'"),
      #              '"'),
      
      tags$hr(),
      radioButtons('frecuencia_usuario', 'Frecuencia',
                   c('Mensual'=12,
                     'Trimestral'=4,'Cuatrimestral'=3,'Semestral'=2,'Anual'=1),
                   '12'),
      tags$hr(),
      radioButtons('t_suavizado', 'suavizado',
                   c('Exponencial Simple'=1,
                     'Exponencial Doble'=2,
                     'Exponencial Triple Aditiva'=3,
                     'Exponencial Triple Multiplicativas'=4),
                   '1'),
      tags$hr(),
      radioButtons('t_regresion', 'Regresion',
                   c('Simple'=1,
                     'Multiple'=2),
                   '1'),
      tags$hr(),
      sliderInput("n", "Periodos:",
                  min=0, max=12, value=6)
      
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Grafico",
                 plotOutput("plot1"),
                 plotOutput("plot2")
                 ), 
        
        

        tabPanel("Resumen", verbatimTextOutput("resumen"),verbatimTextOutput("error")), 
        tabPanel("Histograma", plotOutput("histograma"))
        #tabPanel("TablaFit", verbatimTextOutput("tablaFit"))
        
      )
    )
  )
)
)


prueba con esteban