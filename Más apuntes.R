#Manejo de errores
rm(x)
mean(x)
traceback()
lm(y~x)
traceback()
debug(lm)
lm(y~x)
#Simulaci??n
str(str)
str(lm)
str(ls)
x <- rnorm(100)
str(x)
summary(x)
f<- gl(40,10) #creaci??n del factor
str(f)
summary(f)
str(airquality)
m <- matrix(rnorm(100),10,10)
str(m)
s <- split(airquality,arquiality$mounth)
str(s)
x <- rnorm(10)
x
y <- rnorm(10,50,5)
y
summary(x)
summary(y)
set.seed(1)
set.seed(1) #semilla para n??meros aleatorios
set.seed(2)
rnorm(5)
set.seed(1)
rnorm(5)
normal1 <- rnorm(10000)
normal2 <- rnorm(10000,10,5)
hist(normal1)
summary(normal1)
hist(normal2)
summary(normal2)
rpois(10,1)
poisson1 <- rpois(10000,1)
poisson2 <- rpois(10000,10)
hist(poisson1)
hist(poisson2)
ppois(2,2)
ppois(4,2)
ppois(6,2)
hist(rpois(10000,2))
for (i in 0:11){print(dpois(1,2))}
hist(runif(10000,10,20))
#Supongamos que vamos a asimilar el siguente modelo lineal y=B0+B1x+e
#donde e~N(0,2^2) y se asume que x~N(0,1^2)
set.seed(20)
x <- rnorm(100,0,1)
e <- rnorm(100,0,2)
y <- 0.5+ 2*x+e
plot(x,y)

z <- 0.5 + 2 * x
plot(x,z)
plot(z,y)

set.seed(10)
x <- rbinom(100,1,0.5)#N??mero de ??xitos que puede tener en n intentos
e <- rnorm(100,0,2)
y <- 0.5 + 2*x + e
summary(y)
plot(x,y, main = "Modelo Lineal", col="dark red")

set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3*x
y <- rpois(100,exp(log.mu))
summary(y)
plot(x,y, main = "Modelo Poisson", col="forestgreen")