# ----------------
DIRECTORY <- "specdata"
SEPARATOR <- "/"

# ---------------
fileList <-list.files(DIRECTORY, full.names = TRUE)

fileIndex<-as.vector(1:length(fileList))
fileIndex<-1:length(fileList)

fileIndex<-vector()
fileIndex[1]<-"specdata/332.csv"
fileIndex[2]<-"specdata/331.csv"

length(fileIndex)


#---
print("Files:")
length(fileList)


N <- length(fileList)

a<-list()
for(i in 1:N){
  print(paste("",i,"=",fileList[i], sep = ""))
  
  fileName <- paste(DIRECTORY,SEPARATOR,fileList[i], sep = "")
  
  aTmp<-read.csv(fileName)
  
  a[[i]]<-aTmp
  names(a[[i]])
}


index<-1
value<-length(a[[index]]$Date)

for(i in 1:N){
  if(length(a[[i]]$Date)<value){
    value<-length(a[[i]]$Date)
    index<-i
  }
}


shortestIndex<-index
print(paste("Min Length in:",shortestIndex,sep = ""))


# All values
a[[shortestIndex]]$sulfate


mean(a[[shortestIndex]]$sulfate, na.rm=TRUE)




m1<-mean(a[[1]]$sulfate, na.rm=TRUE)
m2<-mean(a[[2]]$sulfate, na.rm=TRUE)
m31<-mean(c(m1,m2))


typeof(a[[1]]$sulfate)

mean(c(a[[1]]$sulfate,a[[2]]$sulfate),na.rm=TRUE)
























class(length(a[[shortestIndex]]))



length(a)
names(a[[1]])

length(a[[1]]$Date)
class(a[[2]]$Date[1])

a[[1]]$Date[2]












# Dates - experiments
x<-as.POSIXlt(Sys.time())
as.POSIXct(Sys.time())

p <- as.POSIXlt(x)
names(unclass(p))
p$sec











i<-1:322




source("pollutantmean.R")
csvFileName=paste(DIRECTORY,SEPARATOR,"001.csv", sep = "")