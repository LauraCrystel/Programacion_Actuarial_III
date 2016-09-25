setwd("/Users/Laura/Documents/Programacion_Actuarial_III/specdata")
completos<-function(directorio,id=1:332){
  numCompletos<-0
  arrCompletos<-c("numeric")
  pos<-1
  dim<-id[length(id)]
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
    for(j in 1:nrow(data)){
      if(sum(is.na(data[j,]))==0){
        numCompletos<-numCompletos+1
      }
    }
    arrCompletos[pos]<-numCompletos
    numCompletos<-0
    pos<-pos+1
  }
  tabla<-data.frame(id=id,nobs=arrCompletos)
  print(tabla)
}
completos(getwd(),1:10)




