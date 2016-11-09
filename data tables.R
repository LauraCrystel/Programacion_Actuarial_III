#Data table
library(data.table)
DF=data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF,3)
DT =data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)
tables()
#Subconjuntos de filas
DT[2,]
DT[DT$y=="a",]


DT[c(2,3)]
DT[,c(2,3)]

#Subconjunto de columnas
#Declaraci??n por expresiones, despu??s de la coma son las expresiones que va a evaluar
DT[,list(mean(x),sum(z))]
DT[,w:=z^2]
DT
#Agregar nuevas columnas
DT2 <- DT#Trabajan de manera vinculada
DT[,y:=2]
DT
DT[,m:={tmp <-(x+y); log2(tmp+5)}]
DT

set.seed(123)
DT<-data.table(x=sample(letters[1:3],1E5,TRUE))
DT[,.N,by=x]
a<- data.ta

DT



