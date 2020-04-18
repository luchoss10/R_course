#Probabilidad muestral binomial

n<-36;n
p<-0.4;p
p_bar<-0.5;p_bar
q=1-p
den<- sqrt((p*q)/n); den #Seindo este Den la desviacion estandar de la muestra
z<-(p_bar-p)/den;z
#p(z>0.5)
pnorm(z)
1-pnorm(z)
