#Probabilidad de muestra
n<-36
ux<-75
sx<-12/sqrt(n)

#media muestral exceda 80
z<-(80-ux)/sx;z

#Probabilidad P(x>=80)=P(z>2.5)=1-P(Z)

pnorm(z)
1-pnorm(z)

#Hallar probabilidad que la media muestral este entre 70 y 72
z70<-(70-ux)/sx;z70
z72<-(72-ux)/sx;z72
(pnorm(z72)-pnorm(z70)) * 100

#Ejemplo de alzheimer
#Probabilidad de x barra menor a 7

miu <- 8
ds<-4
n<-30
xb<-7
ds_xb<-ds/sqrt(n);ds_xb
z<-(xb-miu)/ds_xb
ds_xb;z
#P(x<7)=P(z<7)=P(z<-1.36)
pnorm(z)
pnorm(z) * 100

1- pnorm(z) 

#Probabilidad para 7 y 9 (no mas de un aa de la media prob.8)
xb<-9
z2<-(xb-miu)/ds_xb;z2
#P(7<x<9)=P(7<z<9)=P(z<)
pnorm(z2)-pnorm(z)
(pnorm(z2)-pnorm(z))*100

#Ejercicio arboles
miu<-2.5
ds<-0.25
xb<-2.6
n<-36
ds_xb<-ds/sqrt(n);ds_xb


z<-(xb-miu)/ds_xb;z

pnorm(z)

1- pnorm(z)
(1- pnorm(z))*100

#Sample
sample(1:10,4,replace = T)
sample(50:100,10,replace = F)
runif(5, min = 4, max = 5)
runif(5,3,4)

vehiculos<-read.csv("https://www.datos.gov.co/api/views/x9pp-pcn5/rows.csv?accessType=DOWNLOAD")
auto_moviles<-subset(vehiculos, vehiculos$CLASE == "AUTOMOVIL")
muestra1<-auto_moviles[sample(nrow(auto_moviles), 1500, replace = F),1:6]
muestra2<-auto_moviles[sample(nrow(auto_moviles), 1500, replace = F),1:6]

#---------------Población--------------
n=1500
ux_P<-mean(auto_moviles$MODELO);ux
sd_P=sd(auto_moviles$MODELO);sd

#----------------Muestra 1---------------

x1<-mean(muestra1$MODELO);ux
S1=sd_P/sqrt(n);sd
z1<-(2017-ux_P)/S1;z1
z1_1<-(2014-ux_P)/S1;z1_1
(1-pnorm(z1))*100

(pnorm(z1)-pnorm(z1_1))*100

#----------------Muestra 2---------------

x2<-mean(muestra2$MODELO);ux
S2=sd_P/sqrt(n);sd
z2<-(2017-ux_P)/S2;z2
z2_2<-(2014-ux_P)/S2;z2_2
(1-pnorm(z2))*100

(pnorm(z2)-pnorm(z2_2))*100

