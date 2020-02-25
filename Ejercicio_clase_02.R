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

#datos <- data.frame(graduados$NOMBRE_FACULTAD, graduados$NOMBRE_PROGRAMA, graduados, programa)

#Solo datos de promedio de ingenierias y de pregrado
#Frecuencia Por Ingenieria, Tabla de contingencia 
num_Ing<-grepl("INGENIERIA",graduados$NOMBRE_PROGRAMA)

#which(datos$Nombre_Programa == "INGENIERIA", arr.ind = TRUE)
#prog_ing<-str_match(datos$Nombre_Programa, "INGENIERIA")
datos <-data.frame("Nombre_Facultad" = graduados$NOMBRE_FACULTAD[num_Ing], "Nombre_Programa" = graduados$NOMBRE_PROGRAMA[num_Ing],"Sexo" = graduados$SEXO[num_Ing], "Promedio" = graduados$PACUMULADO[num_Ing] / 10)
num_Pos<-grepl("ESPECIALIZACION*|MAES*|DOCTORADO.*",datos$Nombre_Programa)
datos_ing<-data.frame("Nombre_Facultad" = datos$Nombre_Facultad[!num_Pos], "Nombre_Programa" = datos$Nombre_Programa[!num_Pos],"Sexo" = datos$Sexo[!num_Pos], "Promedio" = datos$Promedio[!num_Pos])
table(datos_ing$Sexo,datos_ing$Promedio)
