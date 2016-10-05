hacer.potencia <- function(n){
  potencia <- function (x){
    x^n
  }
  potencia 
}

cubica <- hacer.potencia(3)
cuadrada <- hacer.potencia(2)
cubica(3)
cuadrada(2)
#¿qué es el entorno de una función?
ls(environment(cubica))
get("n", environment(cubica))

y <- 10
f <- function(x){
  y <-2
  y^2 +g(x)
}

g <- function(x){
  x*y
}
 
#Dates and Times
x <- as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))

date()
as.POSIXct(date())

#lapply
x <- list(a=1:5, b=rnorm(10000))
lapply (x, mean)
#Por los puntos suspensivos de lapply se pueden agregar argumentos que se necesiten
x <- 1:4
lapply(x, runif, max=15, min=5)

#sapply simplifica lo que hace apply
x <- list(a=3, b=rnorm(10,3), c=rnorm(10,3), d=rnorm(10,5))
sapply(x,mean,max=15, min=5)

#apply
x <-matrix(rnorm(200),20,10)
apply(x,2,mean) #argumento 2 que son las columnas
apply(x,1,sum) #argumento 1 que son los renglones

x <-matrix(rnorm(200),20,10)
apply(x,1,quantile,probs=c(.025,0.75))

a <-array(rnorm(2*2*10),c(2,2,10))
apply(a,c(1,2),mean)
rowMeans(a,dims=2)

#mapply es como apply multuvariable
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
mapply(rep,1:4,4:1)

#tapply
x <-c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10) #crea niveles, cuántos y cuántas veces u
f
tapply(x, f, mean)
tapply(x,f,mean,simplify=F)

#split
x <-c(rnorm(10),runif(10),rexpo(10))
f <-gl(3,10)
f
split(x,f)

library(datasets)
head(airquality)

s <- split(airquality,airquality$Month)
lapply(s,function(x)colMeans(x[,1:3])) #Función anónima 
sapply(s,function(x)colMeans(x[,1:4],na.rm = T))


