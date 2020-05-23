#n=40, ds=102, x_b=725, x_m=670
#Ha los mujeres ganan menos que los hombres miu_m < 725
#Ho los mujeres ganan igual o mas que los hombre  miu_m >= 725 
#Alfa del 95%
za<-qnorm(0.05);za
#[1] -1.644854


#x_b - miu_h / (desv/raiz(40)) <= Za
#x_b <= miu_h + Za (desv / raiz(40))
x_b <- 725 - (-1.64)*(102/sqrt(40)); x_b
#[1] 751.4493

