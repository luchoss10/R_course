library(dplyr)

# Lectura de datos
data <- read.csv("https://www.datos.gov.co/api/views/ha9e-e48s/rows.csv?accessType=DOWNLOAD")

# Se separan las variables
facultad <- data$NOMBRE_FACULTAD
programa <- data$NOMBRE_PROGRAMA
sexo <- data$SEXO
calificacion <- data$PACUMULADO/10

# Se crea el dataframe
df <- data.frame(facultad, programa, sexo, calificacion)
levels(df$facultad)

# Se separan únicamente los datos de la facultad CIENCIAS DE LA SALUD
fac <- droplevels(filter(df, df$facultad == "CIENCIAS DE LA EDUCACION"))
levels(fac$programa)

# Tabla para ver cantidad de estudiantes de cada programa por género
tb <- table(fac$programa, fac$sexo); tb

# Se crea una nueva columna en el dataframe para evaluar el rendimiento
fac$rendimiento <- ""
fac$rendimiento[fac$calificacion < 3.5] <- "Bajo"
fac$rendimiento[fac$calificacion >= 3.5 & fac$calificacion < 4.0] <- "Medio"
fac$rendimiento[fac$calificacion >= 4.0 & fac$calificacion < 4.5] <- "Alto"
fac$rendimiento[fac$calificacion >= 4.5] <- "Sobresaliente"

# Se separan los datos de lic. Matemáticas
matematicas <- droplevels(filter(fac, fac$programa == "LICENCIATURA EN MATEMATICAS"))
matematicas

mat_tb <- table(matematicas$rendimiento, matematicas$sexo)
mat_tb

# Se agregan las sumas de los datos
addmargins(mat_tb)

# Se sacan las proporciones
prop_mat <- prop.table(mat_tb, 1)*100
prop_mat

prop_mat2 <- prop.table(mat_tb, 2)*100
prop_mat2

hist(matematicas$calificacion[matematicas$sexo == "F"],
     #breaks = 12,
     main = "ACUMULADO DE MUJERES EN LIC. EN MATEMÁTICAS",
     xlab = "Promedio acumulado",
     ylab = "Graduados",
     xlim = c(3.4,4.5),
     border = "black",
     col = "blue")

hist(matematicas$calificacion[matematicas$sexo == "M"],
     #breaks = 10,
     main = "ACUMULADO DE HOMBRES EN LIC. EN MATEMÁTICAS",
     xlab = "Promedio acumulado",
     ylab = "Graduados",
     xlim = c(3.4,4.5),
     border = "white",
     col = "red")

#----------------------------------------------------------------------------------------
#Programa 2

LIC_NAT_AMB <- droplevels(filter(fac, fac$programa == "LICENCIATURA  EN CIENCIAS NATURALES Y EDUCACION AMBIENTAL"))
LIC_NAT_AMB

AMB_TAB <- table(LIC_NAT_AMB$rendimiento, LIC_NAT_AMB$sexo)
AMB_TAB

# Se agregan las sumas de los datos
addmargins(AMB_TAB)

# Se sacan las proporciones
PROM_AMB <- prop.table(AMB_TAB, 1)*100
PROM_AMB

PROM_AMB2 <- prop.table(AMB_TAB, 2)*100
PROM_AMB2

#Media de promedios en Mujeres
mf <- mean(LIC_NAT_AMB$calificacion[LIC_NAT_AMB$sexo=="F"])
mf

#Media de promedios en Hombres
mh <- mean(LIC_NAT_AMB$calificacion[LIC_NAT_AMB$sexo=="M"])
mh

#Desviacion estandar
sd(LIC_NAT_AMB$calificacion[LIC_NAT_AMB$sexo=="F"])
sd(LIC_NAT_AMB$calificacion[LIC_NAT_AMB$sexo=="M"])

#Color de histogramas
c1 <- rgb(255,0,0,max = 255, alpha = 80, names = "lt.blue")
c2 <- rgb(0,0,255, max = 255, alpha = 80, names = "lt.pink")

#Histogramas de frecuenciaS
ha <- hist(LIC_NAT_AMB$calificacion[LIC_NAT_AMB$sexo == "F"],
           breaks = c(3.4, 3.5, 3.6, 3.7, 3.8, 3.9, 4.0),
           include.lowest = TRUE,
           main = "ACUMULADO DE MUJERES EN LIC. CIENCIAS NATURALES",
           xlab = "Promedio acumulado",
           ylab = "Graduados",
           # xlim = c(3.4,4.5),
           border = "white",
           col = "red")

hb <- hist(LIC_NAT_AMB$calificacion[LIC_NAT_AMB$sexo == "M"],
           breaks = c(3.4, 3.5, 3.6, 3.7, 3.8, 3.9, 4.0),
           include.lowest = TRUE,
           main = "ACUMULADO DE HOMBRES EN LIC. CIENCIAS NATURALES",
           xlab = "Promedio acumulado",
           ylab = "Graduados",
           # xlim = c(3.4,4.5),
           border = "white",
           col = "blue")

plot(ha, col = c1,
     main = "HISTOGRAMAS SOBREPUESTOS",
     xlab = "PROMEDIO ACUMULADO",
     ylab = "GRADUADOS")
plot(hb, col = c2, add = TRUE)

legend("topleft", legend=c("F", "M"), lwd=4, col=c(c1, c2))

#Mediana de calificaciones de mujeres
sort(LIC_NAT_AMB$calificacion[LIC_NAT_AMB$sexo=="F"])
median(LIC_NAT_AMB$calificacion[LIC_NAT_AMB$sexo=="F"])

#Mediana de calificaciones de hombres
sort(LIC_NAT_AMB$calificacion[LIC_NAT_AMB$sexo=="M"])
median(LIC_NAT_AMB$calificacion[LIC_NAT_AMB$sexo=="M"])


