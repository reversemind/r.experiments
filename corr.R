corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  dt<-complete(directory)
  
}

##
#
#
vectorByFileNameByColumnNameOnlyNOBs<-function(csvFileName, columnName) {
  temp<-read.csv(csvFileName)
  
  result<-vector()
  if(tolower(columnName) == "sulfate"){
    for(i in 1:length(temp$sulfate)){
      counter<-0L
      if(!is.na(temp[[1]][i])){
        counter<-counter+1
      }  
      if(!is.na(temp[[2]][i])){
        counter<-counter+1
      }  
      if(!is.na(temp[[3]][i])){
        counter<-counter+1
      }  
      if(!is.na(temp[[4]][i])){
        counter<-counter+1
      }  
      if(counter == 4L){
        result<-c(result,temp$sulfate[i])
      }  
    }
  }
  
  if(tolower(columnName) == "nitrate"){
    for(i in 1:length(temp$nitrate)){
      counter<-0L
      if(!is.na(temp[[1]][i])){
        counter<-counter+1
      }  
      if(!is.na(temp[[2]][i])){
        counter<-counter+1
      }  
      if(!is.na(temp[[3]][i])){
        counter<-counter+1
      }  
      if(!is.na(temp[[4]][i])){
        counter<-counter+1
      }  
      if(counter == 4L){
        result<-c(result,temp$nitrate[i])
      }  
    }
  }
  
  result
}




##
#
#
vectorSulfateNitrateByFileNameByColumnNameOnlyNOBs<-function(csvFileName) {
  temp<-read.csv(csvFileName)
  
  sulfate<-vector()
  nitrate<-vector()
  
  for(i in 1:length(temp$sulfate)){
    counter<-0L
    if(!is.na(temp[[1]][i])){
      counter<-counter+1
    }  
    if(!is.na(temp[[2]][i])){
      counter<-counter+1
    }  
    if(!is.na(temp[[3]][i])){
      counter<-counter+1
    }  
    if(!is.na(temp[[4]][i])){
      counter<-counter+1
    }  
    if(counter == 4L){
      sulfate<-c(sulfate,temp$sulfate[i])
      nitrate<-c(nitrate,temp$nitrate[i])
    }  
  }
  
  result<-data.frame(sulfate,nitrate)
  result
}
