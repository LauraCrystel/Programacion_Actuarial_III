setwd("/Users/Laura/Documents/Programacion_Actuarial_III/")
rankingcompleto <- function(resultado,num){
    hospitalsData<-read.csv("hospital-data.csv")
    states<-levels(hospitalsData[,7])
    data<-read.csv("outcome-of-care-measures.csv")
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
    for (i in 1:nrow(data))
}