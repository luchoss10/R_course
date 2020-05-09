lun <- c(45,43,43,66,91,53,35,45,29,64,56)

xl<-mean(lun);xl
nl<-length(lun);nl
sl<-sd(lun);sl
quantile(lun)
boxplot(lun)

lun2 <- c(45,43,43,66,53,35,45,29,64,56)

xl<-mean(lun2);xl
nl<-length(lun2);nl
sl<-sd(lun2);sl
quantile(lun2)
boxplot(lun2)

vie<-c(43,41,45,46,61,56,80,40,48,49,50,41)
xv<-mean(vie);xv
nv<-length(vie);nv
sv<-sd(vie);sv
quantile(vie)
boxplot(vie)

vie2<-c(43,41,45,46,56,40,48,49,50,41)
xv<-mean(vie2);xv
nv<-length(vie2);nv
sv<-sd(vie2);sv
quantile(vie2)
boxplot(vie2)

#LUNES
#valor t el lunes x +/- t_alfa(se)
se_l <-sl/sqrt(nl);se_l
#t_alfa para n = 10 es df = n-1 = 10-1 = 9 grados de libertad para intervalo 
#de confianza de 95%, alfa=0.05 y alfa/2 = 0.025
t_alfa<-qt(p = 0.95+0.05/2, df = 9, lower.tail = TRUE)
t_alfa
lim_sup<-xl+(t_alfa*se_l); lim_sup
lim_inf<-xl-(t_alfa*se_l); lim_inf


#VIERNES
#valor t el lunes x +/- t_alfa(se)
se_v <-sv/sqrt(nv);se_v
#t_alfa para n = 10 es df = n-1 = 10-1 = 9 grados de libertad para intervalo 
#de confianza de 95%, alfa=0.05 y alfa/2 = 0.025
t_alfa<-qt(p = 0.95+0.05/2, df = 8, lower.tail = TRUE)
t_alfa
lim_sup<-xv+(t_alfa*se_v); lim_sup
lim_inf<-xv-(t_alfa*se_v); lim_inf
