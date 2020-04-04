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



vehiculos<-read.csv("https://www.datos.gov.co/api/views/x9pp-pcn5/rows.csv?accessType=DOWNLOAD")
#Sample
