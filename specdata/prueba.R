mediacontaminante<-function(directorio,contaminante,id=1:332){
  z<-0
  suma<-0
  cont1<-0
  cont<-0
  divisor<-0
  dim<-length(id)+id[1]-1
  d<-id[1]
  for (i in d:dim){
    if (i<10){ 
      x <- paste("00",i,".csv", sep="") } 
    else { 
      if (i>=10 && i<100){ 
        x <- paste("0",i,".csv", sep="") } 
      else { 
        x <- paste(i,".csv", sep="") } 
    }
    data<-read.csv(x)
    data<-data[,contaminante]
    z<-length(data)+z
    cont1<-length(data)
    y<-sum(data,na.rm=T)
    if (y>0){
      for (j in 1:cont1){
        if (is.na(data[j]))
          cont<-cont+1
      }
    }
    z<-z-cont
    suma<-suma+y
    divisor <- divisor + z
  }
  
  
  resultado<-suma/z
  
  resultado
}