#ejercicio 1----------------------------------------------
#Poisson media=12
#probabilidad para 14
ppois(14, lambda = 12)

#Para mas de 14
ppois(14, lambda = 12, lower.tail = FALSE)

#ppois acumulada
#dpois exacta

d<-data.frame('data' =  rpois(20,12))
hist(d$data)

#ejericio 2---------------------------------------------
#Probabilidad  de rechazo:  6 por dia
#x;4 rechazados
#lambda: 6 por dia
dpois(4,6)

#rechazar 9 transsacciones en dos dias consecutivos
#lambda: 6 * 2 = 12
#x:9 rfechazados
dpois(9,12)


#ejercicio 3----------------------------------------------
#nacimientos x=6
#lambda = 4.5
dpois(6,4.5)

library(ggplot2)
set.seed(2)

nac<-data.frame('data', rpois(365, 4.5))

ggplot(data = nac) + 
  geom_histogram(aes(x = data, 
                     y = stat(count / sum(count)),
                     fill =  data == 6),
                 binwidth = 1, 
                 color = 'black',)+
  scale_x_continuous(breaks = 0:10)+
  labs(x = 'Nacimientos por periodo', 
       y = 'Proporcion',
       title = 'Sim nacimientos con Pios(lambda = 4.5') +
  theme_bw()

library(dplyr)

nac %>% dplyr::summarize(nac_6=sum(nac$data==6)/n())
nac_6

