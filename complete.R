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