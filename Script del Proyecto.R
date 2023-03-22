# Base De Datos en R
#Leyendo las librerias
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

#limpiar
#rm(list = ls())

#Directorio de Trabajo
#setwd("~/ESPOL/4TO/Ingeniería de Datos/Proyecto/Proyecto en R")
datos <- read_excel("~/ESPOL/4TO/Ingeniería de Datos/Proyecto de Ingeniería de Datos/Infosexo_concantidad.xls")
#View(datos)
#Conección vía ODBC
#con <- dbConnect(odbc(), "Proyecto", Database = "Proyecto Ingeniería de Datos")
#sql = "select * from info_del_sexo_concantidad"        

#obteniendo los datos y visualizandolos
#(datos <- dbGetQuery(con, sql))
#View(datos)        

#Exploración de Datos
#summary(datos)

#Importando libreria Tidyverse
library(tidyverse) 

#Diagrama de cajas
#boxplot(datos[,3:5] , frame=FALSE, col = rainbow(5), horizontal = TRUE )


#?boxplot
#Diagrama de Cajas
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


##HACIENDO INTERACTIVO LOS BAR CHART
# Edad Máxima

datos %>%
  hchart("column", hcaes(x=tipo_sexo, y = Edad_Maxima, color = c("green", "orange", "yellow"))) 
  


#ggplot(data=datos, aes(x=tipo_sexo, y=Edad_Maxima, fill=tipo_sexo)) + geom_bar(stat="identity")

# Edad Promedio
datos %>%
  hchart(
    "column", hcaes(x=tipo_sexo, y = Edad_Promedio, color = c("orange", "red", "green"))
  )

#ggplot(data=datos, aes(x=tipo_sexo, y=Edad_Promedio, fill=tipo_sexo)) + geom_bar(stat="identity")

#ggplot(datos, aes(x= tipo_sexo, y = Edad_Promedio)) + geom_histogram()

# Edad Mínima
datos %>%
  hchart(
    "column", hcaes(x=tipo_sexo, y = Edad_Minima, color = c("orange", "brown", "green"))
  )

#ggplot(data=datos, aes(x=tipo_sexo, y=Edad_Minima, fill=tipo_sexo)) + geom_bar(stat="identity")

#CUENTA
datos %>%
  hchart(
    "column", hcaes(x=tipo_sexo, y = Cuenta, color = c("orange", "brown", "green"))
  )
#ggplot(data=datos, aes(x=tipo_sexo, y= Cuenta, fill=tipo_sexo)) + geom_bar(stat="identity")

#DATOS PARA EL NUEVO MODELO

#Conección vía ODBC

#con <- dbConnect(odbc(), "Proyecto", Database = "Proyecto Ingeniería de Datos")
#sql1 = "select * from modelo_final"   
datos1 <- read.csv("C:/Users/USUARIO/Pictures/Proyecto de Ingeniería de Datos/Modelo_final.csv")
#(datos1 <- dbGetQuery(con, sql1))
#View(datos1)

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

#View(datos1)

#Analisis de corrrespondencia múltiple

#library("FactoMineR")
#MCA <- MCA(datos1)
#MCA
#install.packages("ca")
library("ca")
acm <- mjca(datos1)
#acm

acm_s_col <- summary(acm)$columns
#acm_s_col

coord <- data.frame(acm_s_col[,5], acm_s_col[,8])


variables <- data.frame(acm_s_col$name)

variables$GRUPO[str_sub(variables$acm_s_col.name,1,10) == 'tipo_sexo:'] <- 'Sexo'
variables$GRUPO[str_sub(variables$acm_s_col.name,1,10) == 'tipo_naci:'] <- 'Nacionalidad'
variables$GRUPO[str_sub(variables$acm_s_col.name,1,9) == 'tipo_mov:'] <- 'Movimiento'
variables$GRUPO[str_sub(variables$acm_s_col.name,1,21) == 'tipo_mediotransporte:'] <- 'Medio Transporte'
variables$GRUPO[str_sub(variables$acm_s_col.name,1,11) == 'rango_edad:'] <- 'Rango de Edad'
variables$GRUPO[str_sub(variables$acm_s_col.name,1,7) == 'motivo:'] <- 'Motivo de Viaje'

unlist_categorias <- unlist(str_split(variables$acm_s_col.name,":"))
n <- 1:(length(unlist_categorias)/2)
categorias <- unlist_categorias[2*n]

df_coordenadas <- data.frame(coord, categorias, variables$GRUPO )
#View(df_coordenadas)
library(highcharter)

highchart_plot <- highchart() %>%
  hc_title(text = 'Análisis de Correspondencia Múltiple') %>%
  hc_add_series(df_coordenadas, type = 'scatter', hcaes(x = acm_s_col...5., y = acm_s_col...8., name = categorias, group = variables$GRUPO),
                dataLabels = list(format = "{point.name}", enabled = TRUE),
                tooltip = list(pointFormat = "{point.name}")) %>%
  hc_xAxis(title = list(text = 'd1'), plotLines = list(list(value=0,color='lightblue',width=2,zIndex=4))) %>%
  hc_yAxis(title = list(text = 'd2'), plotLines = list(list(value=0,color='lightblue',width=2,zIndex=4)))

highchart_plot

library(factoextra)

eig.val <- get_eigenvalue(acm)
#eig.val

## Scree plot
fviz_screeplot(acm, addlabels = TRUE)
#acm_s_col



