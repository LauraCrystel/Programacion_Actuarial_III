mediacontaminante <- function(directorio,contaminante, id=1:332){
  x <- vector("numeric")
  suma <- 0 
  
  for (a in id){
    if(a<10){
      x <- paste("00",a,".csv", sep="")}
      datos <- read.csv(x)
      if (a>=10 && a<100){
        x<- paste("0",a, ".csv", sep="")
        datos <- read.csv(x)
      }
      else {
        x <- paste(a, ".csv", sep="")
        datos <- read.csv(x)
      }
      y<-c(datos[,contaminante])
      otrovector <- c(y,na.rm=TRUE)
      media <- mean(otrovector)
      suma <- media + suma 
    }
  resultado <- suma/length(id)
  resultado
}


   