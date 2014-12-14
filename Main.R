# Part 2
source("complete.R")
complete("specdata", 1)


# Part 1
source("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)























# ----------------
DIRECTORY <- "specdata"
SEPARATOR <- "/"

# ---------------
# get ordered list of file names
fileList <-list.files(DIRECTORY, full.names = TRUE)
fileIndex<-vector()
for(i in 1:length(fileList)){
  fileIndex[i]<-fileList[i]
}


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


# Part #2 - create function
#---------------------
source("pollutantmean.R")

csvFileName=paste(DIRECTORY,SEPARATOR,"001.csv", sep = "")

ff<-vectorOfIndexedFileNames(DIRECTORY)


# vectorByFileNameByColumnName<-function(csvFileName, columnName) {
gg<-vectorByFileNameByColumnName(ff[1],"sulfate")



h<-"VALUE"

if(h == toupper("value")){
  print(1)
}else{
  print(2)
}

q<-all.equal(h,toupper("value"))


V<-c(1,3,5)
Vg<-vector()
for(i in 1:length(V)){
  print(V[i])
  g<-vectorByFileNameByColumnName(ff[V[i]],"sulfate")
  
  if(length(g)){
    Vg<-c(Vg,g)  
  }
  
}



gg1<-vectorByFileNameByColumnName(ff[1],"sulfate")
gg2<-vectorByFileNameByColumnName(ff[3],"sulfate")
gg3<-vectorByFileNameByColumnName(ff[5],"sulfate")
mean(gg, , na.rm=TRUE)

gAll<-vector()
gAll<-c(gAll,gg1)
gAll<-c(gAll,gg2)
gAll<-c(gAll,gg3)

(length(gg1)+length(gg2)+length(gg3))
length(gAll)






source("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
