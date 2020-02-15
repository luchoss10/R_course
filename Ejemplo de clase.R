#Cntrl + enter para ejecutar la linea seleccionada.
5-5

var1 <- "Ejemplo"
r1 <- 34

rm(r1)
ls()

a<-6

ac<-as.character(a)

a

c_x <- "6"

n_x <- as.numeric(c_x)

n_x

valores <- c(3,4,7)

nombres <- c("Pedro","Jesus","Alex")

valores
nombres


nombres[c(2,3)]
valores[1]

#Elementos de comparacion

valores 

valores > 5

mayores_5 <- valores > 5

valores[mayores_5]# Se toman los valores verdaderos del indice mayores_5

valores + 5

valores[mayores_5] + 4

m1 <- matrix(1:20, byrow = TRUE, nrow = 5, ncol = 4)
m1
m2 <- matrix(1:20, byrow = FALSE, nrow = 5, ncol = 4)
m2
m3 <- matrix(1:20, byrow = TRUE, nrow = 4, ncol = 5)
m3
m4 <- matrix(1:10, byrow = FALSE, nrow = 4, ncol = 5)
m4

m1
m1[1,3]
m1[1,]
m1[,3]

#Factores
#Variables discretas. Categorias

estado_est <- c("estudiante", "no estudiante", "estudiante", "no estudiante")
estado_est
estado_est <- factor(estado_est)
estado_est


mtcars
#Tipo de datos class
class(mtcars)
#Cabeza muestra de primeros elementos
head(mtcars)
#Tailmuestra de los ultimos datos 
tail(mtcars)

planetas <- c("Mercurio", "Venus", "Tierra", "Marte", "Jupiter", "Saturno", "Urano", "Neptuno")
tipo <- c("solido", "solido", "solido", "solido", "gaseoso", "gaseoso", "gaseoso", "gaseoso")
diametro <- c(0.382, 0.949, 1, 0.532, 11.289, 9.449, 4.007, 3.883)
rotacion <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
anillos <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

planetas_df <- data.frame(planetas, tipo, diametro, rotacion, anillos)

planetas_df$planetas
planetas_df$diametor
planetas_df$anillos

vec_4 <- 1:10
vec_4

#Mean calcula la media de los datos de la variable
mean(vec_4)

mean(planetas_df$diametro)
sd(planetas_df$diametro)

