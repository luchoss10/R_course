#Datos
gr<-c(50,100,200,300)
peso<-c(50,70,70,95)

#Calculamos 
#r=suma(zx zy)/n-1
#z=(x-promedio(x)/s)

prom_gr<-mean(gr)
s_gr<-sd(gr)
z_gr<-(gr-prom_gr)/s_gr

prom_peso<-mean(peso)
s_peso<-sd(peso)
z_peso<-(peso-prom_peso)/s_peso

zx_zy<-z_gr*z_peso#Z combinado

#Coeficiente de pearson
#Lo usamso para determinar la correlacion de dos datos
#el resultado de r esta entre -1 y 1 
#valores negativos(-) son inversamente proporcionales los datos a correlacionar
#valores positivos(+) son directamente proporcionales los datos a correlacionar
#Correlacion debil [0,0.5]
#Correlacion fuerte [0.5,1.0]
#valor 0 no existe correlacion entre los datos
#No explica causas

r<-sum(zx_zy)/(length(zx_zy)-1)
r