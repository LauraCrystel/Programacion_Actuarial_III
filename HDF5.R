#Paquete R HDF5 guarda la informaci??n como si fueran carpetas
source("http://bioconductor.org/biocLite.R")#instala script
biocLite("rhdf5")
library(rhddf5)
created= h5createFile("example.h5")
created

set.seed(13435)
x <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
x <- x[sample(1:5),]
x$var2[c(1,3)]=NA #hace caso a la posici??n 
x[,1]
x[,"var1"]
x$var2[c(1,2)]
x[1:2,"var2"] #extracciones 
#dos extracciones
subset(x,x$var1<=3 & x$var3>11)
x[x$var1<=3 & x$var3>11,]
x[x$var1<=3 && x$var3>11,]#con doble asume un vector de tama??o 1

wich(x$var2>8)
x[wich(x$var2>8)]

sort(x$var1)
sort(x$var1,decreasing=T)

sort(x$var2)
sort(x$var2,decreasing=T)

sort(x$var2,na.last = F)
sort(x$var2,decreasing=T,na.last = T)

order(x$var1)
x[order(x$var1),]#x ordenenado respecto al orden de la variable 1
x[order(x$var2,decreasing = T,na.last = F),]

library(plyr)
arrange(x,var1)
arrange(x,desc(var1))

x$var4 <-rnorm(5)#para crear otra columna 
x
cbind(x,rnorm(5))

