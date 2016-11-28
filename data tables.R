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

DT <- data.table(x=rep(letters[1:3],each=100),y=rnorm(300))
setkey(DT,x)
DT['a']#llamar library(data.table)
DT1 <- data.table(x=c('a','a','b','dt1'),y=1:4)
DT2 <- data.table(x=c('a','b','dt2'),z=5:7)
setkey(DT2,x);setkey(DT2,x)
merge(DT1,DT2)#uniones de tablas, crea registros completos a partir de los que tiene, es "intersectarlas"

#Lectura r??pida
set.seed(1)
df_gde <- data.frame(x=rnorm(1E6),y=rnorm(1E6))
file <- tempfile()
write.table(df_gde,file=file,row.names = F,col.names = T,sep="\t",quote=F)
system.time(fread(file))
system.time(read.table(file,header = T,sep="\t"))


#MySQL esto se va a correr despu??s de toda la instalaci??n 
library(RMySQL)
install.packages("RMySQL",dependencies = T)
ucscDb <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;")
dbDisconnect(ucscDb)
result

#conectar a hg19 y listado de tablas
hg19 <- dbConnect(MySQL(),user="genome",db="hg19",host="genome-mysql.cse.ucsc.edu")
tablas <- dbListTables(hg19)
length(tablas)
tablas[1:3]
#Seleccionar un subconjunto espec??fico 
query <- dbSendQuery(hg19,"select * ")
#para desconectarse 
dbDisconnect(hg19)