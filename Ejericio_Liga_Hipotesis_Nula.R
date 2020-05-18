liga <- read.csv("https://www.football-data.co.uk/mmz4281/1920/E0.csvv")
head(liga)
#my_data %>% filter(Sepal.Length > 7)
equipo<- liga[liga$HomeTeam == "Arsenal",]

goles_local = equipo$FTHG;goles_local

xg<-mean(goles_local);xg
ng<-length(goles_local);ng
sg<-sd(goles_local);sg
quantile(goles_local)
boxplot(goles_local)

#Podra el equipo anotar mas de 2 goles en promedio por partido
#Significancia del 95%

#Ho u <= 2
#Ha u > 2
u=2
t<-(xg-u)/(sg/sqrt(ng));t
#grados de libertad para n = 15 df = 15-1 = 14
#Significancia del 95% por ende Alfa = 0.05
t_alfa=qt(0.05, df = 14, lower.tail = FALSE);t_alfa

#Como t_alfa es 1.76 > que t = -1, cae en la sona de aceptacion de Ha y se rechaza Ho