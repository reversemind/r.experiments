# ----------------
DIRECTORY <- "specdata"
SEPARATOR <- "/"

# ---------------
fileList <-list.files(DIRECTORY)

#---
print("Files:")
length(fileList)

a<-list()
for(i in 1:length(fileList)){
  print(paste("",i,"=",fileList[i], sep = ""))
  fileName <- paste(DIRECTORY,SEPARATOR,fileList[i], sep = "")
  aTmp<-read.csv(fileName)
  a[[i]]<-aTmp
  names(a[[i]])
}



length(a)
names(a[[1]])


length(a[[1]]$Date)
length(a[[2]]$Date)




class(a[[2]])

names(a[1])


length(a[1])
length(a[[1]])


class(a[[1]])

a<-list()
a1 = read.csv(paste(DIRECTORY,SEPARATOR,"331.csv", sep = ""))
a2 = read.csv(paste(DIRECTORY,SEPARATOR,"332.csv", sep = ""))

a<-c(a,"1" = a1)
a<-c(a,"2" = a2)

names(a)



a<-c(a,a1, "a2" = a2)
class("a2")

a<-data.frame()
a<-data.frame(a1,a2)


length(a)

names(a)
a[[2]]

m<-matrix(nrow=4,)




names(a[9])

names(a[8])

#----------------
for(i in 1:length(fileList)){
  print(paste("",i,"=",fileList[i], sep = ""))
  _a<-read.csv(paste(DIRECTORY,SEPARATOR,fileList[i], sep = ""))
  if(length(_a) >0){
    a<-c(a,paste("\"",i,"\"",sep = "")=_a)  
  }
}

air = read.csv(paste(DIRECTORY,SEPARATOR,"332.csv", sep = ""))


# Dates - experiments
x<-as.POSIXlt(Sys.time())
as.POSIXct(Sys.time())

p <- as.POSIXlt(x)
names(unclass(p))
p$sec








