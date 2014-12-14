complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  # get ordered list of file names
  fileNameIndex<-vectorOfIndexedFileNames(directory)
  
  
  nobs<-vector()
  
  for(i in 1:length(id)){
    dFrame<-dataFrameByFileName(fileNameIndex[id[i]])
    
    globalCounter<-0L
    
    
    for(i in 1:length(dFrame[[1]])){
      counter<-0L
      if(!is.na(dFrame[[1]][i])){
        counter<-counter+1
      }  
      if(!is.na(dFrame[[2]][i])){
        counter<-counter+1
      }  
      if(!is.na(dFrame[[3]][i])){
        counter<-counter+1
      }  
      if(!is.na(dFrame[[4]][i])){
        counter<-counter+1
      }  
      if(counter == 4L){
        globalCounter<-globalCounter+1L
      }  
    }# for
    nobs<-c(nobs,globalCounter)
    
  }# for - global
  
  result<-data.frame(id,nobs)
  
  result
}


##
#
#
dataFrameByFileName<-function(csvFileName) {
  temp<-read.csv(csvFileName)
  temp
}


##
# Get ordered list of file names in directory
# default directory is a local directory 
#
vectorOfIndexedFileNames<-function(Directory = ".") {
  # Get ordered list of file names
  fileList <-list.files(Directory, full.names = TRUE)
  fileIndex<-vector()
  for(i in 1:length(fileList)){
    fileIndex[i]<-fileList[i]
  }
  fileIndex
}