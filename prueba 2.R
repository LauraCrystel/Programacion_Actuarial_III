setwd("/Users/Laura/Documents/Programacion_Actuarial_III/")
data<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
v1<-NA
v2<-NA
states<-data[,7]
for (i in 1:nrow(data)){
    if (states[i]=="TX"){
        a<-as.numeric(data[i,col])
        b<-as.character(data[i,2])
        v1<-c(v1,a)
        v2<-c(v2,b)
    }
}

d1<-data.frame(v1,v2)
d2<-d1[order(v1),]
d2
lau1<-NA
for (j in 1:nrow(d2)){
    if (is.na(d2[j,1])==F){
        lau<-as.character(d2[j,2])
        lau1 <- as.vector(c(lau1,lau))
    
    }
        
}
lau3<-lau1
lau3
lau2<-sort(factor(v1))
final<-tapply(lau3[2:length(lau3)], lau2, sort)
final2<-NA
for (g in 1:length(final)){
    for (h in 1:length(final[[g]])){
        final1<-final[[g]][h]
        final2<-c(final2,final1)
    }
}
final2[2]
final2[length(final2)]
final2[5]