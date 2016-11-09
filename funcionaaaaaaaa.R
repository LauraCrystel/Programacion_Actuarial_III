setwd("/Users/Laura/Documents/Programacion_Actuarial_III/")
data<-read.csv("hospital-data.csv")
states<-levels(data[,7])
#print(states)

mejor <- function(estado, resultado){
    data<-read.csv("hospital-data.csv")
    states<-levels(data[,7])
    hospitals<-read.csv("outcome-of-care-measures.csv")
    if (estado %in% states==F){
        stop("Estado invalido")
    }
    if(resultado=="ataque"){
        col<-11
    }
    else{
        if(resultado=="falla"){
            col<-17
        }
        else{
            if(resultado=="neumonia"){
                col<-23
            }
            else{
                stop("Resultado invalido")
            }
        }
    }
    col2<- subset(hospitals,hospitals[,col]!="Not Available" & hospitals[,7]==estado)
    col2[,col] <- as.numeric(as.character(col2[,col]))
    mini <-min(col2[,col])
    name <- subset(col2[,2],col2[,col]==mini)
    name<- sort(name)
    print(name[1])
    
}
mejor("TX","ataque")