setwd("/Users/Laura/Documents/Programacion_Actuarial_III/")
data<-read.csv("outcome-of-care-measures.csv")
states<-levels(data[,7])
#print(states)

mejor <- function(estado, resultado){
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
    aux<-nrow(hospitals)
    cont<-9000 #cualquier n??mero m??s grande
    r<-1
    for (j in 1:aux){
        if(!is.na(hospitals[j,col]) && hospitals[j,7]==estado){
            if(as.numeric(hospitals[j,col])<=cont){
                r<-j
                cont<-as.numeric(hospitals[j,col])
                #print(as.numeric(hospitals[j,col]))
            }
        }
    }
    #x <- hospitals[r,2]
    x <- hospitals$Hospital.Name[r]
    #print(x)
    y<- sort.default(x)
    y <-as.vector(y)
    print(y)
}
mejor("TX","ataque")