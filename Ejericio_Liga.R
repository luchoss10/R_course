liga <- read.csv("http://www.football-data.co.uk/mmz4281/1920/E0.csv")
head(liga)
dim(liga)#Muestra la dimencion de los datos
datos<-liga[,c(1:24)]
levels(datos$HomeTeam)#Muestra datos sin repeticion en la columna

mean(datos$FTHG)#Media
sd(datos$FTHG)#Desviacion estandar
mean(datos$FTAG)
sd(datos$FTAG)

datos$HomeTeam
datos$FTHG

a_equipo <- as.array(datos$HomeTeam)
a_goles <- as.array(datos$FTHG)

#Datos tiros de esquina locales
a_tirosdeesquina<-as.array(datos$HC)
a_tirosdeesquina

a_equipo
a_goles
levels(a_equipo)
m<-data.frame(a_equipo,a_goles)
m

#tabla marginales
tab_local<- table(a_equipo, a_goles)#Tabla de frecuencia
tab_local

tab_tiros <- table(a_equipo,a_tirosdeesquina)
tab_tiros

plot(a_equipo, a_goles)#Grafica las tablas de bigotes
margin.table(tab_local)
tab_local[,1]
addmargins(tab_local)

margin.table(tab_tiros)
addmargins(tab_tiros)

#Proporcion 1 por filas, 2 por columna
prop_locales<-prop.table(tab_local,1)
prop_locales
#ajuste a porcentaje
per_locales<-prop_locales*100
per_locales

prop_tiros<-prop.table(tab_tiros,1)
prop_tiros

per_tiros<-prop_tiros*100
per_tiros

per_tiros[1,]

rownames(per_locales)

rownames(per_locales)[1]
per_locales[1,]

grafica <- barplot(tab_local[1,], main = "Cantidad de goles anotados como local Arsenal 2019-2020",
                   ylim = c(0,10), ylab = "Partidos", xlab = "Goles")
grafica
#text(grafica, tab_local[1,], pos = 3, format(tab_local[1,]), xpd = TRUE, col = "blue"))

#medidas de tendencia central

ars <- tab_local[1,]
ars
median(ars)
mean(ars)
#Encontrar la moda
valores<-table(tab_local[1,])
valores
valores[]
#0 1 2 3 4 5 8 
#1 5 5 1 0 0 0
moda <- sort(valores, decreasing = TRUE)
moda
rownames(moda[1])


