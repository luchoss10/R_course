#Obtención de datos
graduados<-read.csv("https://www.datos.gov.co/api/views/ha9e-e48s/rows.csv?accessType=DOWNLOAD")
#Seleccion de columnas
estrato<-graduados$ESTRATO
promedio<-graduados$PACUMULADO
programa<-graduados$NOMBRE_PROGRAMA
facultad<-graduados$NOMBRE_FACULTAD
#Estandarizacion de los datos para decimales en las notas del promedio
promedio<-promedio/10

#Muestra las primeras variables de las columnas 
head(estrato)
head(programa)
head(promedio)

#Caracteristicas de los datos
summary(promedio)
summary(estrato)
#summary(programa) No se puede usar summary con variables categoricas solo con numericas 
levels(programa)

library(stringr)

#Para instalar la libreria
#install.packages("stringr")

posgrados <- str_detect(programa,"MAES*|DOCTORADO*|ESPECIALIZACION.*")
pregrado<-programa[!posgrados]
notas_pregrado<-programa[!posgrados]
length(pregrado)
length(programa)
length(notas_pregrado)
table(pregrado)

datos <- data.frame(graduados$NOMBRE_FACULTAD, graduados$NOMBRE_PROGRAMA, graduados, programa)
#Solo datos de promedio de ingenierias y de pregrado
#Frecuencia Por Ingenieria, Tabla de contingencia 
