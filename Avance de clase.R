#Clase del 25/08/2016

#Crear vectores con la funci??n vector 
x<- vector(mode="numeric",length= 5L)
x

# Crear vectores con la funci??n c
x <- c(0.5,0.6)
x
class(x)

x<- c(TRUE, FALSE, T, F)
x
class(x)

x <- 5:10
x
class(x)

x<- c(1+2i,5,3+9i,-4-5i)
x
class(x)

x <-c("a","b","d","e")
x
class(x)

# Mezcla de objeros en un vector
y <- c(1.7,a) #num??rico
y
class(y)

y <-c(True,2) #num??rico
y
class(y)

y <- c("a", TRUE) # caracter
y
class(y)

y<- c(TRUE, 10L, 8.5, 1+1i, "Nacho")
y 
class (y)

#Orden de coacci??n/coerci??n expl??cita
#1 Caracter
#2 Complex
#3 numeric
#4 Integer
#5 logical

# Coerci??n expl??cita
z <- 0:6
class(z)
as.numeric(z)
as.logical(z)
as.character(z)

z <- c(1+2i, 3+4i, 8, 0+3i,0)
as.logical(z)

z <- c("Programaci??n", "Actuarial" "III")
as.numeric(z)
as.logical(z)
as.complex(z)

#LISTAS (es como un vector, pero de vectores y cada uno tiene su propia clase)
x <- list(1,"a", TRUE, 1+4i)
x
class(x)

# MATRICES 
m <-matrix(nrow=2, ncol=3)
m
dim(m)
attributes(m)
#Cambio de dimesiones de 2x3 a 3x2
dim(m) <-c(3,2)
m
#Crear una matriz con datos
m <- matrix(1:6,3,2)
m

m <- matrix(1:6,3,2, TRUE)
m

m <- matrix(1:6,3,3, T)
m
class(m)
str(m)

dim(m) <- c(2,5) #Esto va a producir error 

x <- c(1,2,3)
y <- c("a", "b", "c")
z <- c(x,y)
z

m2 <-cbind(m,x)
m2

m3 <- rbind(m,y)
m3

m4 <- cbind(m,y)
m4

rbind(m1,y)
cbind(m2,y)
