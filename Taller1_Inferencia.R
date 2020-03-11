#Obtención de datos
graduados<-read.csv("https://www.datos.gov.co/api/views/ha9e-e48s/rows.csv?accessType=DOWNLOAD")

#Filtrado de datos por pregrado de ingenieria.
num_Ing<-grepl("INGENIERIA",graduados$NOMBRE_PROGRAMA)
datos <-data.frame("Nombre_Facultad" = graduados$NOMBRE_FACULTAD[num_Ing], "Nombre_Programa" = graduados$NOMBRE_PROGRAMA[num_Ing],"Sexo" = graduados$SEXO[num_Ing], "Promedio" = graduados$PACUMULADO[num_Ing] / 10)
num_Pos<-grepl("ESPECIALIZACION*|MAES*|DOCTORADO.*",datos$Nombre_Programa)
datos_ing<-data.frame("Nombre_Facultad" = datos$Nombre_Facultad[!num_Pos], "Nombre_Programa" = datos$Nombre_Programa[!num_Pos],"Sexo" = datos$Sexo[!num_Pos], "Promedio" = datos$Promedio[!num_Pos])

summary(datos_ing)

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
sex_prom<-table(datos_ing$Promedio,datos_ing$Sexo)
sex_prom
prog_prom<-table(datos_ing$Nombre_Programa, datos_ing$Promedio)
sex_nombre<-table(datos_ing$Sexo, datos_ing$Nombre_Programa)
#Tabla de frecuencia relativas marginales
prop.table(sex_prom)
#Para Filas
prop.table(sex_prom,1)
rowSums(prop.table(sex_prom,1))
#Para Columnas
prop.table(sex_prom,2)
colSums(prop.table(sex_prom,2))
