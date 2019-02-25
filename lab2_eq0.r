
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

# Cargar el token de QUANDL
Quandl.api_key("dN9QssXxzTxndaqKUQ_i")

# Funcion para descagar precios
Bajar_Precios <- function(Columns, Tickers, Fecha_In, Fecha_Fn) {
  
  # Funcion para descargar N cantidad de activos desde QUANDL
  # -- Dependencias: QUANDL
  # -- Columns : columnas a incluir : character : c("date", "adj_close", ... )
  # -- Tickers : Tickers o claves de pizarra de los activos : character : "TSLA"
  # -- Fecha_In : Fecha Inicial : character : "2017-01-02"
  # -- Fecha_Fn : Fecha Final : character : "2017-08-02"
  
  # Peticion para descargar precios
  Datos <- Quandl.datatable("WIKI/PRICES", qopts.columns=Columns,
                            ticker=Tickers,
                            date.gte=Fecha_In, date.lte=Fecha_Fn)
  return(Datos)
}

# Precios a solicitar con QUANDL
cs <- c("date", "open","high","low","close")

# Fechas para analizar este caso
fs <- c("2017-01-01", "2018-01-01")

# Leer archivo con informacion del ETF
Datos_ETF <- read.csv("Datos/IAK_holdings.csv", row.names=NULL, skip=10, stringsAsFactors=FALSE)
