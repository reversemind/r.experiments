# ----------------
DIRECTORY <- "specdata"
SEPARATOR <- "/"

# ---------------
fileList <-list.files(DIRECTORY)

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


class(length(a[[shortestIndex]]))



length(a)
names(a[[1]])

length(a[[1]]$Date)
class(a[[2]]$Date[1])

a[[1]]$Date[2]

# All values
a[[shortestIndex]]$sulfate










# Dates - experiments
x<-as.POSIXlt(Sys.time())
as.POSIXct(Sys.time())

p <- as.POSIXlt(x)
names(unclass(p))
p$sec








