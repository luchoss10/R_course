#n=40, ds=102, x_b=725, x_m=670
#Ha los mujeres ganan menos que los hombres miu_m < 725
#Ho los mujeres ganan igual o mas que los hombre  miu_m >= 725 
#Alfa del 95%, 1-0.95 = 0.05 Za(0.05)=1.64
za<-qnorm(0.05);za
#[1] -1.644854


#x_b - miu_h / (desv/raiz(40)) <= Za
#x_b <= miu_h + Za (desv / raiz(40))
z <- (725 - 670)/(102/sqrt(40)); z
#[1] 751.4493
#COndicion de aceptacion o rechazo
# Z>=1.64 Se rechaza Ho, acepta Ha mujeres ganan menos que los hombres
# Z<1.64 Se acepta Ho

miu_limite_muj <- 725 - (1.64*(102/sqrt(40)));miu_limite_muj
#[1] 698.5507

miu_m<-c(695,697,698,699,700);

z_g<-(725 - miu_m)/(102/sqrt(40));z_g

#valores = 1.860163 1.736152 1.674147 1.612142 1.550136
#Limie = 1.64
