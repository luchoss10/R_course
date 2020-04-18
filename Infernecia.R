#Ejercicio OSO
no<-50
mo<-445
seo<-47.63
valor<-seo/sqrt(no);valor
re<-1.96*valor;re

#Ejercicio Encuesta
nen<-100;nen
p<-0.73
q=1-p
valor_en<-sqrt((p*q)/nen);valor_en
mar_pob<-1.96*valor_en;mar_pob
#Si encuestara la poblacion, encontraria una respuesa entre
#En el 95% de los encuestados

p-mar_pob
p+mar_pob

#Estimar Intervalo De Confianza
n_h<-50;n_h
x_h<-756;x_h
s_h<-35;s_h
#Se desea encontrar el intervalo de consumo promedio diario con 95% de confianza
val_int<- 1.96*(s_h/sqrt(n_h));val_int
linf<- x_h - val_int;linf
lsup<- x_h + val_int;lsup

#Amploar intervalo de confianza a 99%
alfa<-1-0.99;alfa
alfa_2<-alfa/2;alfa_2
z<-abs(qnorm(alfa_2));z
val_int_2<-z*(s_h/sqrt(n_h));val_int_2
#Con 99% de confianza el promedio del consumo estara entre:
linf_2<- x_h - val_int_2; linf_2
lsup_2<- x_h + val_int_2; lsup_2
