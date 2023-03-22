library(shiny)
library(shinythemes)
#install.packages("tidyverse")
library(tidyverse)
library(readr)
library(corrplot)
library(flexdashboard)
library(DBI)
library(odbc)
library(FactoMineR)
library(factoextra)
library(highcharter)
library("corrplot")
library(ggplot2)
#install.packages("plotly")
library(plotly)
#install.packages("gganimate")
library(gganimate)
library(readxl)
#install.packages("ca")
library("ca")
#install.packages("openxlsx")
library(openxlsx)
library(readxl)
#install.packages("dplyr")
library(dplyr)
#install.packages("plotly")
library(plotly)
library("ca")
#install.packages("highcharter")
library(highcharter)
library(shiny)
library(shinydashboard)

datos <- read_excel("~/ESPOL/4TO/Ingeniería de Datos/Proyecto de Ingeniería de Datos  Mejorado/Infosexo_concantidad.xls")

#Coneccion via ODBC
#con <- dbConnect(odbc(), "Proyecto", Database = "Proyecto Ingeniería de Datos")
#sql = "select * from info_del_sexo_concantidad"

#obteniendo los datos y visualizandolos
#(datos <- dbGetQuery(con, sql))
#View(datos)

#Datos para el Modelo
datos1 <- read.csv("~/ESPOL/4TO/Ingeniería de Datos/Proyecto de Ingeniería de Datos  Mejorado/Modelo_final.csv")


# Define UI for application that draws a histogram
ui <- dashboardPage(skin="purple",
                    #NOMBRE DEL PANEL
                    dashboardHeader(title = "Proyecto"),
                    ## Contenido Sidebar, PANEL IZQUIERDO 
                    dashboardSidebar(
                      sidebarMenu(
                        
                        menuItem("PRESENTACIÓN DEL PROYECTO",tabName ="prese-pro",icon =icon("house")),
                        menuItem("CREACIÓN DEL MODELO", tabName = "crea-model",icon = icon("atom")),
                        menuItem("TABLA RESULTANTE",tabName = "vis-resul",icon=icon("table")),
                        menuItem("ANÁLISIS EXPLORATORIO", tabName = "an-exp",icon = icon("bar-chart")),
                        menuItem("REALIZANDO EL MODELO", tabName = "haci-model",icon = icon("diagram-project"),
                                 menuSubItem("MODELO FINAL", tabName = "con-sql"),
                                 menuSubItem("GRÁFICOS DEL MODELO", tabName = "gra-model")))),
                    #CUERPO
                    #CONTENIDO DE LA PRESENTACION DEL PROYECTO -----------------
                    dashboardBody(tabItems( 
                      tabItem(tabName = "prese-pro",h2("PRESENTACION DEL PROYECTO",align="center"),
                              fluidPage(
                                navbarPage(tabPanel("ENBLANCO"),
                                           tabPanel("INFORMACIÓN DE LA DATA",div(tags$img(src = "https://i.postimg.cc/vBSS3kJ7/imagen-2022-08-01-222740591.png", height = "600px", width="1050"), style="text-align: center;")),
                                           tabPanel("FUENTE DE LA BASE DE DATOS", div(tags$img(src = "https://i.postimg.cc/4x97dc4X/imagen-2022-08-01-223235295.png", height = "600px", width="1050px"), style="text-align: center;")),
                                           tabPanel("VARIABLES EN LA BASE DE DATOS", div(tags$img(src = "https://i.postimg.cc/zfMqRtxM/imagen-2022-08-01-223534666.png", height = "600px", width="950px"), style="text-align: center;"))
                                           ))),
                      # CONTENIDO DE LA CREACIÓN DEL MODELO EN SQL --------------
                      tabItem(tabName = "crea-model",
                              h2("CREACIÓN DEL MODELO CON SQL",align="center"),
                              fluidPage(
                                navbarPage(tabPanel("EN BLANCO"),
                                           tabPanel("USANDO DATA WAREHOUSE",div(tags$img(src = "https://i.postimg.cc/tR8Dmhcj/imagen-2022-08-01-224556722.png", height = "600px", width="1050px"), style="text-align: center;")),
                                           tabPanel("AGREGANDO LOS CSV", div(tags$img(src = "https://i.postimg.cc/13sGLMcL/imagen-2022-08-01-224721539.png", height = "600px", width="1050px"), style="text-align: center;")),
                                           tabPanel("MODELO ENTIDAD-RELACIÓN", div(tags$img(src = "https://i.postimg.cc/ZKF3Fptj/imagen-2022-08-01-224911304.png", height = "600px", width="950px"), style="text-align: center;"))))),
                      # CONTENIDO DE LA VISUALIZACIÓN DE LA TABLA RESULTANTE---------
                      tabItem(tabName = "vis-resul",
                              h2("VISUALIZACIÓN DE LA TABLA RESULTANTE",align="center"),
                              fluidPage(
                                navbarPage(tabPanel("EN BLANCO"),
                                           tabPanel("CONSULTA HECHA EN SQL",div(tags$img(src = "https://i.postimg.cc/4y7VWpcN/infosexo-screenshot.png", height = "300px", width="1550"), style="text-align: center;")),
                                           tabPanel("RESULTADO EN LA TABLA",dataTableOutput("viewdatos"))))),
                      # CONTENIDO DEL ANÁLISIS EXPLORATORIO--------------
                      tabItem(tabName = "an-exp",
                              h2("DIAGRAMAS DE BARRAS SEGÚN EL SEXO",align="center"),
                              fluidPage(
                                navbarPage(tabPanel("EN BLANCO"),
                                           tabPanel("EDAD MÁXIMA SEGÚN EL SEXO",highchartOutput("hist1")),
                                           tabPanel("EDAD PROMEDIO SEGÚN EL SEXO",highchartOutput("hist2")),
                                           tabPanel("EDAD MÍNIMA SEGÚN EL SEXO",highchartOutput("hist3")),
                                           tabPanel("CANTIDAD DE CADA SEXO",highchartOutput("hist4")),
                                           tabPanel("Diagrama de Cajas",plotlyOutput("boxplot1"))))),
                      # CONTENIDO DEL MODELO CON UNA CONSULTA HECHA EN SQL
                      tabItem(tabName = "con-sql",
                              h2("REALIZANDO EL MODELO CON SQL",align="center"),
                              fluidPage(
                                navbarPage(tabPanel("EN BLANCO"),
                                           tabPanel("CONSULTA HECHA EN SQL",div(tags$img(src = "https://i.postimg.cc/d1Dy0G4m/modelo-final.png", height = "400px", width="1050px"), style="text-align: center;")),
                                           tabPanel("TABLA RESULTANTE",dataTableOutput("viewdatos2")),
                                           tabPanel("AGREGANDO UN RANGO DE EDAD",dataTableOutput("viewdatos3"))
                                           ))),
                      # CONTENIDO DE LOS GRÁFICOS DEL MODELO
                      tabItem(tabName = "gra-model",
                              h2("ANALISIS INFERENCIALES",align="center"),
                              fluidPage(
                                navbarPage(tabPanel("EN BLANCO"),
                                           tabPanel("ANÁLISIS DE CORRESPONDENCIA MÚLTIPLE", highchartOutput("hc_acm")),
                                           tabPanel("GRÁFICO DE CODO", plotOutput("grafcodo")))))
                    )))

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$hist1 <- renderHighchart({
    datos %>%
      hchart("column", hcaes(x=tipo_sexo, y = Edad_Maxima, color = c("green", "orange", "yellow")))
    
  })
  output$hist2 <- renderHighchart({
    datos %>%
      hchart(
        "column", hcaes(x=tipo_sexo, y = Edad_Promedio, color = c("orange", "red", "green"))
      )
    
  })
  output$hist3 <- renderHighchart({
    datos %>%
      hchart(
        "column", hcaes(x=tipo_sexo, y = Edad_Minima, color = c("orange", "brown", "green"))
      )
    
  })
  output$hist4 <- renderHighchart({
    datos %>%
      hchart(
        "column", hcaes(x=tipo_sexo, y = Cuenta, color = c("orange", "brown", "green"))
      )
    
  })
  output$viewdatos <- renderDataTable({
    datos
  })
  output$viewdatos2 <- renderDataTable({
    datos1
  })
  output$viewdatos3 <- renderDataTable({
    datos1 <- datos1 %>%
      mutate(rango_edad = case_when(edad <= 10 ~ 'Edad entre 0 y 10 años',
                                    between(edad, 11,20) ~ 'Edad entre 11 y 20 años',
                                    between(edad, 21,30) ~ 'Edad entre 21 y 30 años',
                                    between(edad, 31,40) ~ 'Edad entre 31 y 40 años',
                                    between(edad, 41,50) ~ 'Edad entre 41 y 50 años',
                                    between(edad, 51,60) ~ 'Edad entre 51 y 60 años',
                                    between(edad, 61,70) ~ 'Edad entre 61 y 70 años',
                                    between(edad, 71,80) ~ 'Edad entre 71 y 80 años',
                                    between(edad, 81,90) ~ 'Edad entre 81 y 90 años',
                                    edad >= 90 ~ 'Edad mayor a 90 años'  
      )) %>%
      mutate(rango_edad = as_factor(rango_edad))
    #Para eliminar datos
    datos1 <- datos1 %>%
      select(!edad)
    ##
    datos1$tipo_sexo <- as.factor(datos1$tipo_sexo)
    datos1$tipo_naci <- as.factor(datos1$tipo_naci)
    datos1$tipo_mov <- as.factor(datos1$tipo_mov)
    datos1$tipo_mediotransporte <- as.factor(datos1$tipo_mediotransporte)
    datos1$rango_edad <- as.factor(datos1$rango_edad)
    datos1$motivo <- as.factor(datos1$motivo)
    
    levels(datos1$tipo_mediotransporte) <- c('Via Aerea', 'Via Fluvial', 'Via Martima', 'Via Terrestre')
    datos1
  })
  output$hc_acm <- renderHighchart({
    highchart_plot <- highchart() %>%
      hc_title(text = 'Análisis de Correspondencia Múltiple') %>%
      hc_add_series(df_coordenadas, type = 'scatter', hcaes(x = acm_s_col...5., y = acm_s_col...8., name = categorias, group = variables$GRUPO),
                    dataLabels = list(format = "{point.name}", enabled = TRUE),
                    tooltip = list(pointFormat = "{point.name}")) %>%
      hc_xAxis(title = list(text = 'd1'), plotLines = list(list(value=0,color='lightblue',width=2,zIndex=4))) %>%
      hc_yAxis(title = list(text = 'd2'), plotLines = list(list(value=0,color='lightblue',width=2,zIndex=4)))
    
    highchart_plot
  })
  output$boxplot1 <- renderPlotly({
    fig <- plot_ly(type = 'box')
    fig <- fig %>% add_boxplot(y = datos$Edad_Maxima, jitter = 0.3, pointpos = -1.8, boxpoints = 'all',
                               marker = list(color = 'rgb(7,40,89)'),
                               line = list(color = 'rgb(7,40,89)'),
                               name = "Edad Maxima")
    fig <- fig %>% add_boxplot(y = datos$Edad_Minima, name = "Edad Minima", boxpoints = "all",
                               marker = list(color = 'rgb(9,56,125)'),
                               line = list(color = 'rgb(9,56,125)'))
    fig <- fig %>% add_boxplot(y = datos$Edad_Promedio, name = "Edad Promedio", boxpoints = 'all',
                               marker = list(color = 'rgb(8,81,156)',
                                             outliercolor = 'rgba(219, 64, 82, 0.6)',
                                             line = list(outliercolor = 'rgba(219, 64, 82, 1.0)',
                                                         outlierwidth = 2)),
                               line = list(color = 'rgb(8,81,156)'))
    fig <- fig %>% layout(title = "Diagrama de Cajas de la Edad según su sexo")
    
    fig
  })
  output$grafcodo <- renderPlot({
    eig.val <- get_eigenvalue(acm)
    #eig.val
    ## Scree plot
    fviz_screeplot(acm, addlabels = TRUE)
  })
  output$summaryfit1 <- renderPrint({
    acm_s_col <- summary(acm)$columns
    acm_s_col
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
