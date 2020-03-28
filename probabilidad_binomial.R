#Probabilidad de victoria como local
liga_esp<-read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")
head(liga_esp)
levels(liga_esp$HomeTeam)

Mallorca <- subset(liga_esp, liga_esp$HomeTeam == "Mallorca")
n<- length(Mallorca[,1]);n
nrow(Mallorca)
Mallorca_v<- subset(Mallorca, Mallorca$FTR == "H")
n_v <- length(Mallorca_v[,1]);n_v

prob_v <- n_v / n; prob_v

#CUal es la probabilidad de ganar en 19 partidos si la probabilida dde victoria
# es de 0.4285714

x<- c(0:19);x
prob_victoria <- dbinom(x,n,prob_v)
plot(prob_victoria)

esperanza <- n*prob_v; esperanza
Va <- n*prob_v*(1-prob_v); Va

getwd()
direccion<- "C:/Users/LuisMiguel/Desktop"
setwd(direccion)
getwd()
covid<-read.csv("Casos1.csv")
head(covid)

g<-table(covid$Sexo); g

g['M']

p = 278/539; p

table(covid$Ciudad.de.ubicación)
cov_Bog<-subset(covid, covid$Ciudad.de.ubicación == "Bogotá")
g <- table(cov_Bog$Sexo); g

p=114/223; p

#Casos Nacionales
#Casos de Bogot� (b)
#Fuera Bogot� (Q)
#P casos en bogota/Casos Nacionales, Q casos Fuera de Bogota
#n Numero de ensayos

n <-100; n
b <-nrow(cov_Bog); b

p<-b/nrow(covid);p

x<-c(0:100)

dBogota<-dbinom(x, n, p)
plot(dBogota)

Es<-p*n; Es
n-Es

cov_Pereira_Dosque<-subset(covid, covid$Ciudad.de.ubicación == "Pereira") #& covid$Ciudad.de.ubicación == "Dosquebradas")
p_d <- nrow(cov_Pereira_Dosque); p_d
