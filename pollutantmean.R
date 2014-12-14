##
# 
#
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  
  # get ordered list of file names
  fileNameIndex<-vectorOfIndexedFileNames(directory)
  
  # load data from files according to 'id' vector
  fullData<-vector()
  for(i in 1:length(id)){
    nPart<-vectorByFileNameByColumnName(fileNameIndex[id[i]],pollutant)
    
    if(length(nPart)>0){
      fullData<-c(fullData,nPart)  
    }  
  }
  
  mean(fullData, na.rm=TRUE)
}


##
# Get vector of data from: csvFileName and columnt name: columnName
#
vectorByFileNameByColumnName<-function(csvFileName, columnName) {
  temp<-read.csv(csvFileName)
  
  result<-vector()
  if(tolower(columnName) == "sulfate"){
    result<-temp$sulfate  
  }
  
  if(tolower(columnName) == "nitrate"){
    result<-temp$nitrate  
  }
  
  result
}


##
# Get ordered list of file names in directory
# default directory is a local directory 
#
vectorOfIndexedFileNames<-function(Directory = ".") {
  # Get ordered list of file names
  fileList <-list.files(DIRECTORY, full.names = TRUE)
  fileIndex<-vector()
  for(i in 1:length(fileList)){
    fileIndex[i]<-fileList[i]
  }
  fileIndex
}
