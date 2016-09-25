setwd("/Users/Laura/Documents/Programacion_Actuarial_III/specdata")
corr<-function(directorio,horizonte=0){
  numCompletos<-0
  arrCompletos<-c("numeric")
  arrIDs<-c("numeric")
  arrCorrelaciones<-c("numeric")
  pos<-1
  for (i in 1:332){
    if (i<10){ 
      x <- paste("00",i,".csv", sep="") } 
    else { 
      if (i>=10 && i<100){ 
        x <- paste("0",i,".csv", sep="") } 
      else { 
        x <- paste(i,".csv", sep="") } 
    }
    data<-read.csv(x)
    numCompletos<-complete.cases(data)
    if(numCompletos>=horizonte){
      arrCorrelaciones[pos]<-cor(data[,2],data[,3],use="complete")
      pos<-pos+1
    }
    
    numCompletos<-0
    #print(data[1,])
  }
  if(pos==0){
    arrCorrelaciones<-0
  }
  print(arrCorrelaciones)
}
corr(getwd(),5000)