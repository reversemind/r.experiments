
# load data


outcome <- read.csv("outcome-of-care-measures.csv", colClass="character")
names(outcome)


#
# Trying to set a particular class for column during the reading a file
# headset <- read.csv("outcome-of-care-measures.csv", header = TRUE, nrows = 10)
# classes <- sapply(headset, class)

# classes[names(classes)] <- "character"

# classes[names(classes) %in% c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")] <- "number"
# classes[names(classes) %in% c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")] <- "number"
# classes[names(classes) %in% c("Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")] <- "number"

# dataset <- read.csv("outcome-of-care-measures.csv", header = TRUE, colClasses = classes)


#
# --- 

head(outcome)
# Detect class names
classes <- sapply(outcome, class)

str(outcome)

# number of columns
ncol(outcome)


# select only BARNES JEWISH HOSPITAL
# barnesJewishHospital <- outcome[grep("BARNES JEWISH HOSPITAL", outcome$Hospital.Name, ignore.case = T),]

# Get hospitals by State
# less restricted
# byState <- outcome[grep("TX", outcome$State, ignore.case = T),]

# replace all values "Not Available" on NA
outcome[outcome == "Not Available"] <- NA

# Convert specified columns from character into numeric class
outcome[,11] <- as.numeric(outcome[,11])
outcome[,17] <- as.numeric(outcome[,17])
outcome[,23] <- as.numeric(outcome[,23])


byState <- outcome[c(outcome$State == "MD"),]
ncol(byState)
nrow(byState)


indexOutcome <- 17
orderedByState <- byState[order(byState[,indexOutcome], na.last = TRUE, decreasing=FALSE),]

# Hospital name with 
orderedByState$Hospital.Name[1]











# Recode values for the particular column by NA value
# --- 
ff <- orderedByState[!is.na(orderedByState[,indexOutcome]),]

# replace value "Not Available" -- by NA
orderedByState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure[orderedByState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure == "Not Available"] <- NA


orderedByState[orderedByState == "Not Available"] <- NA

library(car)
orderedByState[,11]<-recode(orderedByState[,11],"'Not Available'=NA")








################################################
#
# 1 Plot the 30-day mortality rates for heart attack
#
heartAttack <- as.numeric(outcome[,11])
hist(heartAttack)


ha <- as.numeric(byState[,11])
hist(ha)


################################################
#
# 2 Finding the best hospital in a state
#

# 
# sort matrix by column 
df<-matrix(data=c(12,11,10,NA,8,7,6,NA,4,3,2,1), ncol=2)
df

# by second column
df[order(df[,2], na.last = TRUE, decreasing=FALSE),]

# by the first column
df[order(df[,1],df[,2], na.last = TRUE,decreasing=TRUE),]



# Find correct index in matrix for particular outcome
#
# String for desease
#
# "heart attack"    # 11
# "heart failure"   # 17
# "pheumonia"       # 23

source("best.R")

best("TX","heart attack")
best("TX","heart failure")

best("MD","heart attack")
best("MD","pheumonia")

best("BB","heart attack")
best("NY","hert attack")

