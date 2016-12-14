if(!dir.exists("data")){dir.create("data")}

url<-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accesType=DOWNLOAD"
download.file(url,"./data/restaurantes.csv")
data<-read.csv("./data/restaurantes.csv")

table(data$zipCode,useNA="ifany")
table(data$councilDistrict,data$zipCode)

sum(is.na(data$councilDistrict))
any(is.na(data$councilDistrict))#evalua un o entre todos los elementos del vector 
all(!is.na(data$councilDistrict))
all(data$zipCode >0)#revisi??n de datos 
colSums(is.na(data)) 
all(colSums(is.na(data))==0)#doble porque me refiero a si el valor fue igual a cero y compara cada uno 

#Valores con caracter??sticas especiales
table(data$zipCode %in% c("21212"))
table(data$zipCode %in% c("21212","21213"))
data[data$zipCode %in% c("21212","21213"),]

#Tablas cruzadas
data("UCBAdmissions")
DF = as.data.frame(UCBAdmissions)
summary(DF)
xt <- xtabs(Freq~Gender+Admit,data=DF) 
xt

#Tablas planas
warpbreaks$replicate <- rep(1:9,len=54)
xt = xtabs(breaks~.,data=warpbreaks)
xt
ftable(xt)#pone los dato a modo de red, flat table 

#tama??o de una tabla 
fakeData = rnorm(1e5)
object.size(fakeData) #los 40 extra son los metadatos 
print(object.size(fakeData),units="Mb")

#Crear secuencias 
s1 <-seq(1,10,by=2);s1
s2 <- seq(1,10,by=3);s2
x <- c(1,3,8,25,100);seq(along=x)

#Subconjunyo de variables
data$cerca <- data$neighborhood %in% c("Roland Park","Homeland")
table(data$cerca)
head(data)

#Variables binarias
data$zipError <- ifelse(data$zipCode < 0, TRUE,FALSE)
data[data$zipError,]
table(data$zipError,data$zipCode < 0)

#Variables categ??ricas
data$zipGrupo <- cut(data$zipCode, breaks = quantile(data$zipCode))
table(data$zipGrupo)
table(data$zipGrupo,data$zipCode)

#Corte simplificado
install.packages("Hmisc")
library(Hmisc)
data$zipGrupo <- cut2(data$zipCode,g=4)
table(data$zipGrupo)

#Crear factores de variables
data$zcf <- factor(data$zipCode)
data$zcf[1:10]
class(data$zcf)
data$zipCode[1:10]
class(data$zipCode)

#Niveles de los factores
set.seed(1)
yesno <- sample(c("si","no"), size=10, replace=TRUE)
yesnofac <- factor(yesno,levels = c("si","no"))
yesno
yesnofac
relevel(yesnofac,ref="no")#reasigna el nivel (ahora no es "principal")
as.numeric(yesnofac)
as.numeric(relevel(yesnofac,ref="no"))
#Hacer cortes produce factores
#Funci??n mutate
library(Hmisc); library(plyr)
data2 <- mutate(data,zipGrupo=cut2(zipCode,g=4))#tomo mi df origila y le pego una columna adicional
table(data2$zipGrupo)
