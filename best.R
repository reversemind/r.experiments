##
# Return hospital name in that state with lowest 30-day death rate
#
best <- function(state, outcome){
  ## Read outcome data
  
  
  ## Check that state and outcome are valid
  
  indexOutcome <- -1L
  
  # Find correct index in matrix for particular outcome
  #
  # string for outcome
  #
  # "heart attack"    # 11
  # "heart failure"   # 17
  # "pheumonia"       # 23
  
  if(tolower(outcome) == "heart attack"){
    indexOutcome <- 11
  }
  
  if(tolower(outcome) == "heart failure"){
    indexOutcome <- 17
  }
  
  if(tolower(outcome) == "pheumonia"){
    indexOutcome <- 23
  }
  
  if(indexOutcome < 0){
    stop("invalid outcome")
  }
  
  
  
  data <- read.csv("outcome-of-care-measures.csv", colClass="character")
  byState <- data[c(data$State == state),]
  
  # is correct the state
  if(nrow(byState) <= 0){
    stop("invalid state")  
  }
  
  byState[byState == "Not Available"] <- NA
  byState[,indexOutcome] <- as.numeric(byState[,indexOutcome])
  
  # sort matrix by column
  orderedByState <- byState[order(byState[,indexOutcome], na.last = TRUE, decreasing=FALSE),]
  
  
  orderedByState$Hospital.Name[1]
  ## Return hospital name in that state with lowest 30-day death rate
}