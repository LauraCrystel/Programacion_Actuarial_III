setwd("C:/Users/Usuario/Downloads/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/")

analizarArchivo <- function(ruta) {
  featuresName <- read.table(paste(getwd(), "/features.txt", sep=""))[,2]
  #wanted1 <- grepl("mean", featuresName)
  #wanted2 <- grepl("std", featuresName)
  wanted <- grepl('-(mean|std)\\(', featuresName)
  
  data <- read.table(ruta)
  colnames(data) <- featuresName
  
  resultData <- subset(data, select=wanted)
  
  return (resultData)
}

agregarActividades <- function(mergedData) {
  actTest <- read.table(paste(getwd(), "/test/y_test.txt", sep=""))
  actTrain <- read.table(paste(getwd(), "/train/y_train.txt", sep="")) 
  
  activities <- rbind(actTest, actTrain)[,1]
  labels <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING",
              "LAYING")
  activities <- labels[activities]
  data <- cbind(Actividad = activities, mergedData)
  
  return(data)
}

agregarSujetos <- function(mergedData) {
  subjTest <- read.table(paste(getwd(), "/test/subject_test.txt", sep=""))
  subjTrain <- read.table(paste(getwd(), "/train/subject_train.txt", sep=""))
  
  subjects <- rbind(subjTest, subjTrain)[,1]
  data <- cbind(Sujeto = subjects, mergedData)
  
  return(data)
}

generarArchivo <- function(mergedData) {
  library(dplyr)
  data <- mergedData %>% group_by(Sujeto, Actividad) %>% summarise_each(funs(mean))
  write.table(data, row.name = FALSE, file = "clearData.txt")
}

data1 <- analizarArchivo(paste(getwd(), "/test/X_test.txt", sep=""))
data2 <- analizarArchivo(paste(getwd(), "/train/X_train.txt", sep=""))

mergedData <- rbind(data1, data2)

colnames(mergedData) <- gsub("mean", "Media", colnames(mergedData))
colnames(mergedData) <- gsub("std", "STD", colnames(mergedData))
colnames(mergedData) <- gsub("t", "Tiempo", colnames(mergedData))
colnames(mergedData) <- gsub("f", "Frecuencia", colnames(mergedData))
colnames(mergedData) <- gsub("BodyBody", "Cuerpo", colnames(mergedData))
colnames(mergedData) <- gsub("Body", "Cuerpo", colnames(mergedData))

mergedData <- agregarActividades(mergedData)
mergedData <- agregarSujetos(mergedData)


generarArchivo(mergedData)