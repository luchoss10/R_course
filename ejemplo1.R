#Tipos de asignamiento
x<-c(1.4,5.6,3.1,6.4,21.7)
x
assign("j", c(1.4,5.6,3.1,6.4,21.7))
j
c(1.4,5.6,3.1,6.4,21.7) -> v
v

#Se aplican las operaciones a todos los elementos del vector
1/x

#Se concatenan los elementos como las listas/tuplas de python
y<-c(x,0,x)
y

#Al operar vectores de diferentes tamañaos se repiten los terminos de estos para realizar las 
#Operaciones.
l<-2*x+y+1
l

#mean es la media y en este caso se calcula la varianza
sum((x-mean(x))^2)/(length(x)-1)

#Se pueden operar elementos imaginarios en este caso se genera un warning y varios Nan
sqrt(-17)

#Si se especifica genera el resultado correcto.
sqrt(-17+0i)

s3 <- seq(-5,5,by = .2)
s3

s4 <- seq(legend=51,from = -5,by = 0.2)
s4

s5 <- rep(x, times = 5)
s5


