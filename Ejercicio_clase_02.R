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
summary(datos_ing)
summary(datos2)
#Datos Proemdio de notas Ingenieria -------------------------------------------------------------------------------------
#Media
mean(datos_ing$Promedio)
#Desviacion Estandar
sd(datos_ing$Promedio)
#Mediana 
sort(datos_ing$Promedio)
median(datos_ing$Promedio)
#Frecuencia
frecuencia_promedio<-table(datos_ing$Promedio)
frecuencia_promedio
#Moda
moda_promedio<-sort(frecuencia_promedio, decreasing = TRUE)
moda_promedio
rownames(moda_promedio)[1];
#Grafica
barplot(moda_promedio, xlab = "Notas", ylab = "Frecuencia", main = "Frecuencia de notas Ingenierias")

#Datos Sexo Ingenieria --------------------------------------------------------------------------------------------------
#Media
#mean(datos_ing$Sexo)
#Desviacion Estandar
#sd(datos_ing$Sexo)
#Mediana 
#sort(datos_ing$Sexo)
#median(datos_ing$Sexo)
#Frecuencia
frecuencia_sexo<-table(datos_ing$Sexo)
frecuencia_sexo
#Moda
moda_sexo<-sort(frecuencia_sexo, decreasing = TRUE)
moda_sexo
rownames(moda_sexo)[1];
#Grafica
barplot(moda_sexo, xlab = "Sexo", ylab = "Frecuencia", main = "Frecuencia de sexo en Ingenierias")


#Datos Sexo Nombre Programa --------------------------------------------------------------------------------------------------
#Media
#mean(datos_ing$Nombre_Programa)
#Desviacion Estandar
#sd(datos_ing$Nombre_Programa)
#Mediana 
#sort(datos_ing$Nombre_Programa)
#median(datos_ing$Nombre_Programa)
#Frecuencia
frecuencia_programa<-table(datos_ing$Nombre_Programa)
frecuencia_programa
#Moda
moda_programa<-sort(frecuencia_programa, decreasing = TRUE)
moda_programa
rownames(moda_programa)[1];
#Grafica
barplot(moda_programa, xlab = "Programa", ylab = "Frecuencia", main = "Frecuencia de Ingenierias")

#Tabla COntingencia ------------------------------------------------------------------------------------------------------
table(datos_ing$Sexo,datos_ing$Promedio)
table(datos_ing$Nombre_Programa)
prop.table(datos_ing$Nombre_Programa)


