x<-c(1,2,3,4)
y<-c(0.1,0.3,0.4,0.2)
plot(x, y, type="h", col="dark blue")

x2<-c(0,1,2,3,4,5)
ocu<-c(63,51,36,9,3,0)

y2<-ocu/162
y2

cumsum(y2)
barplot(ocu, x2)

liga<-read.csv("https://www.football-data.co.uk/mmz4281/1819/I1.csv")
summary(liga)
datos<-liga[,c(1:24)]
head(datos)

juv<- filter(datos, datos$HomeTeam == "Juventus")
head(juv)

x<-c(0:5)
x

y<-c(0.18,0.39,0.24,0.14,0.04,0.01)
y

library(Weighted.Desc.Stat)

mean(x)
weighted.mean(x,y)
var(y)
w.var(x,y)


x3<-c(0:4)
y3<-c(2,4,7,8)
fy<-c(0.2,0.3,0.4,0.1)
weighted.mean(y3,fy)
w.var(y3,fy)
w.sd(y3,fy)