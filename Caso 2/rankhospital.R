setwd("/Users/Laura/Documents/Programacion_Actuarial_III/")
rankhospital <- function(estado, resultado, num){
    hospitalsData<-read.csv("hospital-data.csv")
    states<-levels(hospitalsData[,7])
    data<-read.csv("outcome-of-care-measures.csv")
    arrayOfPos<-c("character")
    arrayOfVals<-numeric(0)
    v1<-NA
    v2<-NA
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
    pos<-1
    for(i in 1:nrow(data)){
        if (data[i,7]==estado){
            if(data[i,col]!="Not Available"){
                arrayOfPos[pos]<-as.character(data[i,2])
                aux<-as.character(data[i,col])
                #print(aux)
                arrayOfVals[pos]<-as.numeric(aux)
                #print(arrayOfVals[pos])
                pos<-pos+1
            }
        }
    }
    result<-data.frame(nombre=arrayOfPos,valor=arrayOfVals)
    result<-result[with(result,order(valor,nombre)),]
    printable<-order(result$valor,result$nombre)
    #print(result)
    print(result[printable[num],])
    if (num=="mejor"){
     print(result[printable[1],])
    }else{
        if (num=="peor"){
            print(result[printable[length(printable)],])
        }
    }
    
}
rankhospital("TX","falla",4)