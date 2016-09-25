setwd("/Users/Laura/Documents/Programacion_Actuarial_III/specdata")
mediacontaminante<-function(directorio,contaminante,id=1:332){
  z <- 0
  suma <- 0
  cont1 <- 0
  vacios <-0
  y <-0
  
  cotasup<-id[length(id)]
  cotainf<-id[1]
  for (i in cotainf:cotasup){
    if (i<10){ 
      x <- paste("00",i,".csv", sep="") } 
    else { 
      if (i>=10 && i<100){ 
        x <- paste("0",i,".csv", sep="") } 
      else { 
        x <- paste(i,".csv", sep="") } 
    }
    data <-read.csv(x)
    data <-data[,contaminante]
    z<-length(data)+z
    cont1<-length(data)
    y<-sum(data,na.rm=T)
    if (y>0){
      for (j in 1:cont1){
        if (is.na(data[j]))
          vacios<-vacios+1
        
      }
    }
    z<-z-vacios
    suma<-suma+y
    vacios <-0
  }
  
  
  resultado<-suma/z
  print(resultado)
}