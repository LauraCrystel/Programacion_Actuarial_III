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

#Factores
x <- factor(c("si","no","si","si","no","si","no"))
x
table(x)
unclass(x) 
x <- factor(c("si","no","si","si","no","si","no"), levels=c("si","no"))
unclass(x)

x <- factor(c("azul", "azul", "rojo", "azul", "amarillo", "verde", "azul"))
x
table(x)

#Valores faltantes
x <- c(1,2,NA,10,3)
is.na(x)
is.nan(x)
x <- c(1,2,NA,10,3)
is.na(x)
is.nan(x)

#Data Frames
x <- data.frame(Erick= 1:4, Lori =c(T,T,F,F))
row.names(x) <- c("Primero", "Segundo", "Tercero","Cuarto")
x
nrow(x)
ncol(x)
attributes(x)
names(x)<- c("Yarely","Karen")
x

#Los nombres no son exclusivos de los Data Frames
x <- 1:3
names(x) #NULL
names(x) <- c("Hugo", "Paco", "Luis")
x

x <- list(a=1:10,b=100:91,c=51:60)
x
names(x) <- c("Seq1", "SEQ2", "sEq3")
x

m <- matrix(1:4, 2,2)
m
attributes(m)
dimnames(m) <- list(c("fil1", "fil2"),c("col1","col2"))
m

hoja <- matrix(data=NA,5,6,dimnames = list(c(1:5),c("A","B","C","D","E","F")))
hoja

#Lectura de datos
getwd()
setwd("/Users/Laura/Documents/Programacion_Actuarial_III")
data <- read.csv("table.csv")
data <- read.table("table.csv",T,",",nrows=100,skip=5)#Actividad
clases <-sapply(data,class)
data <- read.table("table.csv",T,",",colClasses = clases)
data

##Pruebas
columnas <- ncol(data)
columnas
renglones <-nrow(data)
renglones
read.table
tabla <-matrix(data=data, nrow=renglones,ncol=columnas)
tabla
matriz <-data.matrix("table.csv",rownames.force = NA)
matriz

# Uso de dput y dget
y <- data.frame(a=1,b="a")
dput(y)
dput(y,file="y.R")
nueva.y <-dget("y.R")
y
nueva.y

x <- "Programaci??n Actuarial III"
y <- data.frame(a=1, b="a")
dump(c("x","y"),file= "data.R")

bla <-head(airquality)
dput(bla,file="airquality.R")

con <- url("http://www.fcfm.buap.mx/","r")
x <- readLines(con,7)
x

#Creamos un vector 
x<- c("a","b","c","c","d","e")
#Veamos el vector
x
#Extraemos elementos con []
x[1]
x[2]
#Tambi??n podemos extraer una secuencia de elementos 
x[1:4]
#Es posible extraer una secuencia de elementos que cumplen una restricci??n
x[x>"b"]
#De manera equivalente se spuede obtener un vector l??gico
u <- x == "c"
u
x[u]

#Creamos una lista
x <- list(foo= 1:4, bar= 0.6)
#Extraemos el primer elemento de la lista
#este elemento es una lista que contiene una secuencia 
x[1]
#Extraemos nuevamente el primer elemento de la lista,
#ahora el elemento es la secuencia en s?? 
x[[1]]
#Extraemos un elemento por nombre
x$bar
x[["bar"]]
x["bar"]
x$foo[2]

x <- list(foo= 1:4, bar= 0.6, baz= "Hola")
x[c(1,3)]
x[[c(1,3)]]

#Se pueden extraer elementos de los elementos extra??dos 
x <- list(a=list(10,12,14), b=list(3.14,2.81))
x[[c(1,3)]]
x[[1]][[3]]

x[[c(2,1)]]

x <- matrix(1:6,2,3)
x
#EL resultado es un vector
x[1,2]
x[1,]
x[,2]
#Con drop= False, se mantiene la dimensi??n y el resultado ser?? una matriz
x[1,2,drop=FALSE]
#Si dejamos solamente el espacio, el resultado ser?? un vector
x[1,]
#Si usamos drop= FALSE, el resultado ser?? un matriz
x[1, ,drop=FALSE]

#R puede encontrar el nombre de algunos objetos de manera pacial con $, tambi??n puede hacerlo con [[]] pero
#necesitar??amos decir de manera expl??cita que queremos una coiuncidencia parcial
x <- list(aasdfsa =1:5)
x$a
x[["a"]]
x[["a", exact=FALSE]]

#Valores Faltantes
airquality[1:6,]
completos <- complete.cases(airquality)
completos
airquality[completos,]
airquality[completos,][1:6,]
airquality[1:6,][completos,]

#Muchas operaciones de R est??n pensadas para trabajar con vectores, lo que evita el uso de demasiados ciclos
x <- 1:4; y <- 6:9
x + y
x > 2
x >=2
y == 8
x * y
x / y
#Para matrices
x <- matrix(1:4,2,2); y <- matrix(rep(10,4),2,2)
x*y
x/y
x %*% y #Para multiplicar matrices


##estructuras de control
x <- (c("a","b","c","d"))
for (i in 1:4){ print (x[i])}
for (i in seq_along(x)){ print(x[i])} #cells.count
for (letra in x){print (letra)}
for (i in 1:4) print(x[i])

x <- matrix(1:6,2,3)
x
for (i in seq_len(nrow(x)))
{for(j in seq_len(ncol(x))){
       print(x[i,j])
    }
}
