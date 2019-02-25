
# -- ----------------------------------------------------------------------------------------- -- #
# -- Laboratorio 2: Administracion Activa ---------------------------------------------------- -- #
# -- Carrera: Ingenieria Financiera ITESO ---------------------------------------------------- -- #
# -- Materia: Microestructura y Sistemas de trading ------------------------------------------ -- #
# -- Desarrolla: Francisco Munoz -- franciscome@iteso.mx ------------------------------------- -- #
# -- ----------------------------------------------------------------------------------------- -- #

# Remover todos los objetos del "Environment"
rm(list = ls())

# los 0s aceptados antes de expresas una cifra en notacion cientifica
# options("scipen"=100, "digits"=4)

# Cargas librerias a utilizar
suppressMessages(library(plotly)) # Graficas interactivas
suppressMessages(library(Quandl)) # Descargar Precios
suppressMessages(library(ROI))    # Optimizacion para portafolio
suppressMessages(library(knitr))  # Opciones de documentacion + codigo
suppressMessages(library(openxlsx))           # Leer archivos XLSx
suppressMessages(library(kableExtra))         # Tablas en HTML
suppressMessages(library(PortfolioAnalytics)) # Teoria Moderna de Portafolios

options(knitr.table.format = "html")
