rankingcompleto <- function(resultado,num="mejor"){
    setwd("/Users/Laura/Documents/Programacion_Actuarial_III/")
    data <- read.csv("outcome-of-care-measures.csv")
    
    if (resultado=="ataque"){
        col <- 11
        }else{
        if (resultado=="falla"){
            col <- 17
            }else{
            if (resultado=="neumonia"){
                col <- 23} else{ 
                stop("Resultado inv??lido")
            }
        }
    }
    
    est <- data$State
    states <- levels(as.factor(est))
    
    num2<-num[1]
    
    if (length(num)==1){
        
        if(num2=="mejor"){num <-1}
        
        final <- vector("character")
        datos <- data.frame(data$Hospital.Name,data$State,data[,col])
        
        for (estadoo in states) {
            y<-subset(datos,datos$data.State==estadoo)
            z <- y
            for (i in 1:length(z[,3])) {
                if(z[i,3]=="Not Available"){z[i,3]<-NA}
            }
            Mortalidad<- as.numeric(as.character(z[,3]))
            x<-data.frame(z$data.Hospital.Name,Mortalidad)
            
            if(num2=="peor"){
                maxi<- max(x[,2],na.rm = TRUE)
                x2 <- subset(x,x[,2]==maxi)
                x3 <- rev(sort.default(x2[,1]))
                resul <- as.character(x3[1])
                final<- c(final,resul)
            }else{
                ordenar<- sort.default(x[,2],na.last = TRUE)
                head(ordenar,10)
                selec<-ordenar[num]
                x2 <- subset(x,x[,2]==selec)
                x4 <- subset(x,x[,2]<selec)
                resta <- nrow(x4)
                selec2 <- num-resta
                x3 <- sort.default(x2[,1])
                resul <- as.character(x3[selec2])
                final<- c(final,resul)
            }
        }
        tabla <- data.frame(hospital=final,estado=states)
        tabla
    } else { stop("N??mero invalido")}
}