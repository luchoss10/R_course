bundles_1718 <- read.csv("https://www.football-data.co.uk/mmz4281/1920/D1.csv")
s_local <-  subset(bundles_1718, bundles_1718$HomeTeam == "Schalke 04")
s_visita <- subset(bundles_1718, bundles_1718$AwayTeam == "Schalke 04")
levels(bundles_1718$HomeTeam)

g_local<-s_local$FTHG
g_visita<-s_visita$FTAG
goles<-c(g_local, g_visita)
goles
frec_goles<-table(goles)
plot(frec_goles)
frec_goles

#Distribuicioon de probabilidad
prob <- prop.table(frec_goles)
prob

plot(prob, type = "h")
n_goles<- c(0:4)
p<-as.numeric(prob)
#esperanza
library(Weighted.Desc.Stat)
var<-w.var(n_goles, p)
sd<-w.sd(n_goles, p)
esperanza<-weighted.mean(n_goles, p)#esperanza
#valores acumulados
p_acum<-cumsum(prob)
p_acum

p_acum[3]

p_1<-p_acum[2]
p_1

p_3<-p_acum[4]
p_3

p_1a3<-p_3 - p_1
p_1a3

z<-qnorm(0.70)
x<- esperanza+(sd*z)
x


#rangos (0-150) (151-180) (181-220) (221-500) (501-adelante)
#            

#Probabilidad de encontrar una moticleta con un cilindraje 125 y 250
#Cual es el 
vehiculos<-read.csv("https://www.datos.gov.co/api/views/x9pp-pcn5/rows.csv?accessType=DOWNLOAD")
motos<-subset(vehiculos, vehiculos$CLASE == "MOTOCICLETA")
motos$clas_silindraje <- ""
motos$clas_silindraje[motos$CILINDRAJE <= 150] <- "0-150"
motos$clas_silindraje[motos$CILINDRAJE > 150 & motos$CILINDRAJE <= 180] <- "151-180"
motos$clas_silindraje[motos$CILINDRAJE > 180 & motos$CILINDRAJE <= 220] <- "181-220"
motos$clas_silindraje[motos$CILINDRAJE > 220 & motos$CILINDRAJE <= 500] <- "221-500"
motos$clas_silindraje[motos$CILINDRAJE > 500] <- "501-mas"

motos$TIPO[motos$CILINDRAJE <= 150] <- "0 - 150"
motos$TIPO[motos$CILINDRAJE > 150 & motos$CILINDRAJE <= 180] <- "150 - 180"
motos$TIPO[motos$CILINDRAJE > 180 & motos$CILINDRAJE <= 220] <- "180 - 220"
motos$TIPO[motos$CILINDRAJE > 220 & motos$CILINDRAJE <= 500] <- "220 - 500"
motos$TIPO[motos$CILINDRAJE > 500] <- "500 - más"

head(motos)
head(motos$TIPO)

frec_motos<-table(motos$TIPO)
frec_motos
p_cilindraje<-prop.table(frec_motos)
p_cilindraje
plot(frec_motos)
cumsum(p_cilindraje)

#Probabilidad de encontrar una moto entre 0 - 150 y 500 - mas
#p("0-150")

p1<-p_cilindraje["0 - 150"]
p2<-p_cilindraje["500 - más"]
p1;p2

p_acum<-cumsum(p_cilindraje)
p_acum
p1;p2
#Probabilidad de encontrar una moto en un rango de 0 a 150 o 500 a mas
p1+p2

#Cilindraje del 30%
#x = E+ ED Z
#Z = 30%
z_30<-qnorm(0.30)
#Esperanza 
l<-c(1:5)
E<-weighted.mean(l,p_cilindraje);E
#Desviacion estandar de la Esperanza
Ed<-w.sd(l,p_cilindraje);Ed
x = E + Ed*(z_30)
x;p_cilindraje
