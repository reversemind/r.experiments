
##
# Ranking hospitals by outcome in state
#
rankhospital <- function(state, outcome, num = "best"){
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
  
  # load data
  data <- read.csv("outcome-of-care-measures.csv", colClass="character")
  
  # get particular state
  byState <- data[c(data$State == state),]
  
  # if satte is not correct stop running a function
  if(nrow(byState) <= 0){
    stop("invalid state")  
  }
  
  byState[byState == "Not Available"] <- NA
  byState[,indexOutcome] <- as.numeric(byState[,indexOutcome])
  
  # delete NA values - from sorted matrix
  byState <- na.omit(byState)
  
  # sort matrix by column
  orderedByState <- byState[ order(byState[,indexOutcome], byState[,3], na.last = TRUE, decreasing=FALSE), ]
  
  # default result
  result <- NA
  
  if(nrow(orderedByState) > 0){
    rankIndex <- -1L
    
    topIndex <- 1L
    bottomIndex <- nrow(orderedByState)
    
    if(tolower(num) == "best"){
      rankIndex <- 1L
    }else if(tolower(num) == "worst"){
      rankIndex <- nrow(orderedByState)
    }else if((topIndex <= as.numeric(num)) & (as.numeric(num) <= bottomIndex)){
      rankIndex <- as.numeric(num)
    } 
    
    #print(rankIndex)
    
    if(rankIndex != -1L){      
    #  for(i in 1:rankIndex){
    #    print(orderedByState$Hospital.Name[i])
    #  }
    #  print("----------------------------------------------")
      result <- orderedByState$Hospital.Name[rankIndex]
    }
  }
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  
  result
}